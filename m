Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913AA59D17A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 08:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239852AbiHWGuK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 02:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239904AbiHWGuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 02:50:10 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D7B32BA9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 23:50:09 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso16285285pjl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=FAPJnlsHB2uhRwpWYkX+9SVJRhY+KJ2q94nKIfLpJzs=;
        b=tH1oR4wjj7wYa0DcjHW7GukpHw8Jc9kCehGdhjMz7D35lv7ZVq0S3U9dtdU4LFlYQ9
         /Yn4L+DBe36lnUxuHSOOMxjpRUjKjlVdMgfolJg/uLFG2rx928l+ILEh6sN5gzJNEI8l
         rW8tKhuQS0dGopqXmF7+gOTQ0nSSNbScTyXANDjkcrsG9c/okxXQ1CLiP/PSQ5VOoqhj
         GnJmMa2YDZKCajM6n4/Gt4/ZN4Xow5hA0CSWutpvBLIoLGt/arA/j0F6x8xWHCQqGe9x
         KTbK786h9+kxOql7PUFDqUHudl0oPPrm1VdUrYIXyxRksInpElZf8jLXdruTQY2Bv0QW
         j9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=FAPJnlsHB2uhRwpWYkX+9SVJRhY+KJ2q94nKIfLpJzs=;
        b=um+F4G6UYGVoEKUlRrbJMUqb3E7d4Jmc8oj9nKTuNTufQsyrL/t9eytwVGpU5AXZgS
         9beSZ4uOLwxyDl0PzGLPka+NK8uL0CHGuayd7w8YaX5F6PfRpsMuZIWg/my2U2J/6SSM
         GxDOWGbIM3dOhSX2G/ghSavRYtumDiU5NTccfvsCacjooX/OfqfB281L0TWSmBayo4Ly
         3/YXxBNXyFgJX1n5hwbdKNzNW8YIG96tj1suzUOzF8JYNp81Iynls58/Qhaa3Bg1dNiJ
         GHNgBYQLfd7cWu2XNWuHyx9K0paebMcr1pe4b2mB87gQtzv3UHmIfj9Lk12UbuKTUd0q
         wLdA==
X-Gm-Message-State: ACgBeo1tVI41gsjFH9ZfPjir8sxnPkURy/BVgr4mhSQ84qE/DKXAeaX1
        nyZajqb6bIbBXvJ4d+YQHXR57QdFgopTO/xj
X-Google-Smtp-Source: AA6agR7p1Dwv2zduvMb5YjWBi/3qCPj3nwUrd4Eyz7PerRs0dNbim9v10/u+IoSa+y43rzVfnSytuA==
X-Received: by 2002:a17:90b:4ad1:b0:1fb:eba:9977 with SMTP id mh17-20020a17090b4ad100b001fb0eba9977mr1898989pjb.182.1661237408488;
        Mon, 22 Aug 2022 23:50:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b0016bf9437766sm1306171plx.261.2022.08.22.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 23:50:08 -0700 (PDT)
Message-ID: <630478a0.170a0220.16547.2d9b@mx.google.com>
Date:   Mon, 22 Aug 2022 23:50:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-22-v6.0-rc1
Subject: renesas/next cros-ec: 5 runs,
 4 regressions (renesas-next-2022-08-22-v6.0-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 5 runs, 4 regressions (renesas-next-2022-08-22-v6.0-r=
c1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-22-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-22-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64f8982ca06974904942c8adfa51efd785044107

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


  Details:     https://kernelci.org/test/plan/id/630465ff221bfa91b9355667

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0465ff221bfa91b9355678
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30465ff221bfa91b935567a
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:30:19.620910  / # =

    2022-08-23T05:30:19.625715  =

    2022-08-23T05:30:19.727652  / # #
    2022-08-23T05:30:19.733564  #
    2022-08-23T05:30:19.836364  / # export SHELL=3D/bin/sh
    2022-08-23T05:30:19.842392  export SHELL=3D/bin/sh
    2022-08-23T05:30:19.944244  / # . /lava-7096955/environment
    2022-08-23T05:30:19.950261  . /lava-7096955/environment
    2022-08-23T05:30:20.052256  / # /lava-7096955/bin/lava-test-runner /lav=
a-7096955/0
    2022-08-23T05:30:20.057762  /lava-7096955/bin/lava-test-runner /lava-70=
96955/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6304641f1e42f9a87b35567c

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0464201e42f9a87b35568d
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30464201e42f9a87b35568f
        failing since 7 days (last pass: renesas-next-2022-07-07-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-23T05:22:33.743749  / # =

    2022-08-23T05:22:33.748501  =

    2022-08-23T05:22:33.850214  / # #
    2022-08-23T05:22:33.855421  #
    2022-08-23T05:22:33.956445  / # export SHELL=3D/bin/sh
    2022-08-23T05:22:33.961312  export SHELL=3D/bin/sh
    2022-08-23T05:22:34.062258  / # . /lava-7096931/environment
    2022-08-23T05:22:34.067732  . /lava-7096931/environment
    2022-08-23T05:22:34.168675  / # /lava-7096931/bin/lava-test-runner /lav=
a-7096931/0
    2022-08-23T05:22:34.174168  /lava-7096931/bin/lava-test-runner /lava-70=
96931/0 =

    ... (7 line(s) more)  =

 =20
