Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9FB65B15E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jan 2023 12:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjABLn1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Jan 2023 06:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235915AbjABLnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2023 06:43:06 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2755664FE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jan 2023 03:42:36 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 78so18174005pgb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jan 2023 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3NxDkPISCJjTuluRf4/RdKCngDCSCy11ZKk5Yg+D4LY=;
        b=zGKtqxAwTh2aGqI58vPyZKlqQ6YuHmDyg0FjYnlzyL2GlK54F9BcFEzpia+bUXx1l0
         jlAyA8tZSrYXZNkJ13dtQmHmem/za0zIxJ83tDX6OMc2gStndwq6pTCV2ASGeZLTYwDK
         c/JPa5aGJZlA6XyL9DDVTbbrsM9MwgbzmMIA6347AihyUCkFJ1vus6Huv1cUP0d9vnSP
         ZZLs/t+/wC32rx2IrmhSInDZ/YlaMIwW0hP2tOXVx/S7orBr4wT1LW8yVY1r3Lx3jtx3
         sG6Eosz5CY35d9Nx4hRULF0lsZbqZZbGgUE4VLjzhJvg6TnRh+z+gnNItMgQkY4cVerq
         8IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NxDkPISCJjTuluRf4/RdKCngDCSCy11ZKk5Yg+D4LY=;
        b=tXft2TeO3jwHt7fjBnNGGhDcHaA7DEp8VJQr4ylT856XsF4V4p4K+CTYM17J2r/dJe
         uagrDmz4MVO7l0nkUaJYMUioDpy0KZseGEbqSNgFX44CaCVbGLZay8TuE7BRmfazxtL9
         9huLELYhmSP8cW+IpbNwdilb9rMeHuYPLbfyGGzQdZIYPYS6LNkAuv9QmEbepEwbdaY7
         ymBIsi81zx/eIHAc+SP30CdU9MVsZC5unl98x5V5X8EUQo9dd5T6HK8I1de2ERtexSDU
         8qv7M5fWvzTSOkVcLYVnGO770Br88ksl5mYqFEFMDzuOGwsErdjm8dhruyNBC3lsnaSC
         NRrQ==
X-Gm-Message-State: AFqh2koMPYIr2Lb/Wp9PumTW7diPQxZ+hcbnbWNk8cKfCdsqfxSLRe4y
        /e6tOi0sUpgiVjTXYdcl6qOXIidDbJlHYFRLR9Y=
X-Google-Smtp-Source: AMrXdXtckXGMOtNlLqa3OsdPIOzzsHxbSODeL9vT/09HCfJSTyfWjiXg8pTOQUspUm74TWcFIjDmDw==
X-Received: by 2002:a62:f211:0:b0:581:68ea:50 with SMTP id m17-20020a62f211000000b0058168ea0050mr22319417pfh.26.1672659755823;
        Mon, 02 Jan 2023 03:42:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u64-20020a626043000000b0056ba6952e40sm964025pfb.181.2023.01.02.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:42:35 -0800 (PST)
Message-ID: <63b2c32b.620a0220.14675.1096@mx.google.com>
Date:   Mon, 02 Jan 2023 03:42:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-02-v6.2-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 16 runs,
 4 regressions (renesas-devel-2023-01-02-v6.2-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 16 runs, 4 regressions (renesas-devel-2023-01-02-v6=
.2-rc2)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-02-v6.2-rc2/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-02-v6.2-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b61285fe1d0f3d98f4780d0889af30b13655c32e

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63b2adf37a4c39844b4eee43

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
b2adf47a4c39844b4eee54
        failing since 139 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3b2adf47a4c39844b4eee56
        failing since 139 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2023-01-02T10:11:42.660029  / # =

    2023-01-02T10:11:42.665215  =

    2023-01-02T10:11:42.766969  / # #
    2023-01-02T10:11:42.772229  #
    2023-01-02T10:11:42.873263  / # export SHELL=3D/bin/sh
    2023-01-02T10:11:42.879422  export SHELL=3D/bin/sh
    2023-01-02T10:11:42.981442  / # . /lava-8546098/environment
    2023-01-02T10:11:42.987545  . /lava-8546098/environment
    2023-01-02T10:11:43.089448  / # /lava-8546098/bin/lava-test-runner /lav=
a-8546098/0
    2023-01-02T10:11:43.094984  /lava-8546098/bin/lava-test-runner /lava-85=
46098/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63b2b543fb581fe7e44eee59

  Results:     5 PASS, 2 FAIL, 11 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
b2b543fb581fe7e44eee69
        failing since 139 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2023-01-02T10:43:05.013571     =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3b2b543fb581fe7e44eee6b
        failing since 139 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2023-01-02T10:43:03.948709  / # =

    2023-01-02T10:43:03.952053  =

    2023-01-02T10:43:04.060902  / # #
    2023-01-02T10:43:04.064525  #
    2023-01-02T10:43:04.065491  =

    2023-01-02T10:43:04.168339  / # export SHELL=3D/bin/sh
    2023-01-02T10:43:04.171503  export SHELL=3D/bin/sh
    2023-01-02T10:43:04.275685  / # . /lava-8546383/environment
    2023-01-02T10:43:04.276567  <6>[   29.894634] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2023-01-02T10:43:04.279355  . /lava-8546383/environment =

    ... (13 line(s) more)  =

 =20
