# docker-ctf
Dockerfile containing a prepared environment for CTFs.

## Usage
Clone repository and build the docker image:

```
git clone https://github.com/phlipse/docker-ctf.git

docker build . -t docker-ctf -f Dockerfile
```

Spawn a container whenever you need it:

```
docker run --rm \
    -it \
    -v $PWD:/ctf \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    -p 127.0.0.1:5555:5555 \
    -i docker-ctf \
    /bin/bash
```

**Parameters:**

*$PWD:/ctf* to map current working directory to /ctf within the container.

*SYS_PTRACE* to add SYS_PTRACE capability to container to be able to use ptrace.

*seccomp=unconfined* to disable sandbox to run gdb without it.

*127.0.0.1:5555:5555* to map port 5555 for gdbserver access to container.

### Where to find ...

*/tools* contains multiple tools that don't exist in PATH variable.

## License
[Apache License](https://github.com/phlipse/docker-ctf/blob/master/LICENSE).
