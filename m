Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2E362E997
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 00:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbiKQX3U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 18:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbiKQX3T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 18:29:19 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667FE1101
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id k22so3275302pfd.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pdGQFFddT/k+BFQzLyBhREy4E2wYqE/CVGG6X98GpnA=;
        b=Bmez5rnVLjprtImMqSuHlKdBnKZTh9OoUzcGNwrdKtzjxQDcuaiTbc2insYBWQVwvj
         xm1566jtN0Uluujgi+ZQW3+tja5WXYAwRIjmg1aAbrKI30jUHsrF/C/Cnb1Cf6Qf3sS1
         6H3wrjb/y99YWJFhckrZWxUuANXo9fM7kHvan8v8D6n0DXLuzgznX+YmM+eK1tnSu91t
         G+YEjSJ7rqrmI6YXWs9ASCz9j/fnsfq9xtOGSsak3cDvgE/YnV5588byShagQv3jnWin
         ALWZHI62PGbojc0mWjyAtbgoc/0mFQZvhMANw9WzKmBwSH29enNEnyVkl3/YN1+J/rEJ
         Lo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdGQFFddT/k+BFQzLyBhREy4E2wYqE/CVGG6X98GpnA=;
        b=RDWUaPyAExBXSb0dwVgtP9lXddmJ790X2xolYPMZ2AX0dtWHhyozpyBi7M7xUqb08t
         JG6H58KF8qI3B7MNIgp/eoMLfKaISTqb/LyFRGc06WKCnpJxZzcO3jgx825lxMbwn4gI
         7F5sskS+vYFmFwUNOxMb9wQc+Y5bfW1lI45ySl1c5mrJtmP5CxMeREZW2ZKh1N4yeN8M
         TYpgv5N/oYNd2v1fXcjaeBkllzKxfZ97XH2vxB6RxsgBS4JEBxkfqv1bdQN/IyoKXGbv
         f/IHlGr3yaTRS7BIKPPfw2lHDo7QiJtK5Cbh0mbNWsNuKrhRRhlKks+ESvAVEeMX+A1Q
         QwHg==
X-Gm-Message-State: ANoB5plf2za5/dT/F6NTr/X4o1gOh5WKsgE9OxT0NBGq8iL+AT1xp6Yv
        FigkdlOri1M+Rc2hTcxxCBa97AG4gObcG68WKbQ=
X-Google-Smtp-Source: AA0mqf5nsPZWmzTBIyG4CLEAhHRCzJeA9SouAXBdtXsqfeQbVd3aLsEe4Mofde8ciDOWYuWfW+v3zQ==
X-Received: by 2002:aa7:8429:0:b0:556:d001:b830 with SMTP id q9-20020aa78429000000b00556d001b830mr5224534pfn.62.1668727757700;
        Thu, 17 Nov 2022 15:29:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g19-20020a635653000000b00477055c6d85sm1599702pgm.22.2022.11.17.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:29:17 -0800 (PST)
Message-ID: <6376c3cd.630a0220.7e90c.2bb5@mx.google.com>
Date:   Thu, 17 Nov 2022 15:29:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 5 regressions (renesas-devel-2022-11-17-v6.1-rc5)
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

renesas/master cros-ec: 8 runs, 5 regressions (renesas-devel-2022-11-17-v6.=
1-rc5)

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

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      882ccb9771f9e9985a9ada17c5e35b4863258378

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


  Details:     https://kernelci.org/test/plan/id/6376ab80a4f87e1c682abd01

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
76ab80a4f87e1c682abd12
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
376ab80a4f87e1c682abd14
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-17T21:45:25.806643  / # =

    2022-11-17T21:45:25.811861  =

    2022-11-17T21:45:25.913555  / # #
    2022-11-17T21:45:25.918908  #
    2022-11-17T21:45:26.019933  / # export SHELL=3D/bin/sh
    2022-11-17T21:45:26.024681  export SHELL=3D/bin/sh
    2022-11-17T21:45:26.125677  / # . /lava-8023130/environment
    2022-11-17T21:45:26.130668  . /lava-8023130/environment
    2022-11-17T21:45:26.231691  / # /lava-8023130/bin/lava-test-runner /lav=
a-8023130/0
    2022-11-17T21:45:26.237156  /lava-8023130/bin/lava-test-runner /lava-80=
23130/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6376ad1191ff237ac12abd3d

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
76ad1191ff237ac12abd4e
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
376ad1191ff237ac12abd50
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-17T21:52:00.711263  / # =

    2022-11-17T21:52:00.714354  =

    2022-11-17T21:52:00.823691  / # #
    2022-11-17T21:52:00.826707  #
    2022-11-17T21:52:00.827535  =

    2022-11-17T21:52:00.931894  / # export SHELL=3D/bin/sh
    2022-11-17T21:52:00.935477  export SHELL=3D/bin/sh
    2022-11-17T21:52:01.040569  / # . /lava-8023209/environment
    2022-11-17T21:52:01.043670  . /lava-8023209/environment
    2022-11-17T21:52:01.044443   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6376abbe7f74f8ba952abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6376abbe7f74f8ba952abc=
fd
        failing since 7 days (last pass: renesas-devel-2022-11-01-v6.1-rc3,=
 first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =20
