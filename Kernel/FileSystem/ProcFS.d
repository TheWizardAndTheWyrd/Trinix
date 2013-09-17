module FileSystem.ProcFS;

import System.Convert;
import System.DateTime;
import VFSManager.FSNode;
import VFSManager.FileNode;
import VFSManager.Partition;
import VFSManager.DirectoryNode;
import VFSManager.FileSystemProto;

import TaskManager.Task;


class ProcFS : FileSystemProto {
	this() { }

	static ProcFS Mount(DirectoryNode mountPoint) {
		if (mountPoint && !mountPoint.Mountpointable())
			return null;

		ProcFS ret = new ProcFS();
		ret.isWritable = true;
		ret.rootNode = new DirectoryNode("/", ret);
		ret.Identifier = "ProcFS";
		ret.rootNode.SetParent(mountPoint);

		mountPoint.Mount(ret.rootNode);
		return ret;
	}

	override bool Unmount() { return true; }
	override Partition GetPartition() { return null; }

	override bool SetName(FSNode node, string name) { return false; }
	override bool SetPermissions(FSNode node, uint perms) { return false; }
	override bool SetUID(FSNode node, ulong uid) { return false; }
	override bool SetGID(FSNode node, ulong gid) { return false; }
	override bool SetParent(FSNode node, DirectoryNode parent) { return false; }

	override bool SetCreatedTime(FSNode node, DateTime time) { return false; }
	override bool SetModifiedTime(FSNode node, DateTime time) { return false; }
	override bool SetAccessedTime(FSNode node, DateTime time) { return false; }

	override FileNode CreateFile(DirectoryNode parent, string name) { return null; }
	override DirectoryNode CreateDirectory(DirectoryNode parent, string name) { return null; }
	override bool Remove(DirectoryNode parent, FSNode node) { return false; }


	override bool LoadContent(DirectoryNode dir) {
		if (dir is rootNode) {
			//foreach (x; Task.GetAllThreads) {
				//foreach (y; dir.Childrens) {
					//string name = Convert.ToString(x.ID);
					//if (y.Name != name)
					//	{}//dir.AddNode(new DirectoryNode(name, this));
				//}
			//}
		}

		return true;
	}

	override long Read(FileNode file, ulong offset, byte[] data) {
		return 0;
	}

	override long Write(FileNode file, ulong offset, byte[] data) {
		return 0;
	}
}