node-yarn
=========

This Docker image comes with [yarn][yarn] installed on top of [mhart/alpine-node][an].

It provides the following environment and makes (or makes not) those assumptions:

- `WORKDIR` is `/app`
- start command is `yarn start`
- you need to `EXPOSE` the port you serve at
- it does not provide an `ONBUILD` to install your dependencies

# Example Dockerfile for your node project

As this is only an extension of [mhart/alpine-node][an], this is an adopted version of the example docker-file from there, leveraging [yarn][yarn] instead of [npm][npm] (which obviously is also still there, should you need it).

    FROM makii42/node-yarn:6

    ADD . .
    # If you have native dependencies, you'll need extra tools
    # RUN apk add --no-cache make gcc g++ python

    # Have yarn install dependencies
    # RUN yarn

    EXPOSE 3000
    CMD ["yarn", "start"]




[yarn]: https://yarnpkg.com/
[an]: https://github.com/mhart/alpine-node
[npm]: https://github.com/npm/npm
