Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18AF66CE87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 19:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjAPSOH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 13:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbjAPSN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 13:13:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9FE3FF24
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 09:59:18 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 7-20020a17090a098700b002298931e366so1896396pjo.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QLMwkZfjb5VrG8Vs5n8uDc3u9/1F+E7YplCs7IwlG2c=;
        b=EuCf1fZ79xEHZE41A0dEOMxFTVpcr+mlvd8aLp+0AvQIJHvNqrCkxejNfQDFhjHIpx
         M4RAHTu5Tcpy4Gcz2p9bqi8nTXBB+Jf02epltdgoCZBjvvqMIlF9KDxcVpvsO9N78ENV
         B75HYT2toD5I1weZ/RLUxp2gME6qPseUUjH48uckLhCuj0mW1f6LwogGKoNodu1t55QF
         M13i2AId973MVozluU3yrh9sTlUnI8L3LjjZvcEHD0LXAH3gu6/ks6ZrOTFxcO8rPuX0
         d4D+KOHzcDTn3+NZY7sSJ/SqP7yF07nyq140Tte7j128RYYqtdDugRpyGr9YBYR8qAam
         fvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLMwkZfjb5VrG8Vs5n8uDc3u9/1F+E7YplCs7IwlG2c=;
        b=D4Jh2sZtAOJ0WZVZbpMBUAJ+ve8KkSHHofW7quGM9eSjtQu+L2KyJd410he6QNn0Im
         70fxDZ6JlVeqzBToOe0sUPpnlhHixJIBs3yFZLoxIaRCUEDzsLlAFrhgVFS/DjxCvEgY
         lAgbuo/ZY4CkbroOKMMG/2tydbcGP3tCOyx0pMUbQKFYy8q1WuJcTyScKDYDqu7rcByE
         H35ocIBgJql/xP1GyFRCVfqHZkklgYCZLoqZxWRq6lrSCm4nsGGQonOlfgtpJMq62VEY
         3Q0RGFbUK8GFLPw2NYYoRzmp0KW5mHcHGXOnp8T6YiTdgtWlq9XJsdaaY5k7Kn+Gxb/k
         8Y+Q==
X-Gm-Message-State: AFqh2ko+RybFfGjOk+DsjovfpgTTOnSHZDI3Fm4JTtvzZAdZOGEWSEt9
        HjuHvJ8icb3C5VejTbHBZadhJals6SVi3jx+q6V6Og==
X-Google-Smtp-Source: AMrXdXuG15PICBFgNdD5IEM8yzPCJOlglX2pzCHoZmznz7cowUGIWB+qq2xPt9oL2CLLu42Z6p8plQ==
X-Received: by 2002:a17:902:e495:b0:192:8bee:3e29 with SMTP id i21-20020a170902e49500b001928bee3e29mr517352ple.2.1673891958234;
        Mon, 16 Jan 2023 09:59:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b001869f2120a4sm19627594plh.94.2023.01.16.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 09:59:17 -0800 (PST)
Message-ID: <63c59075.170a0220.2050a.ed4b@mx.google.com>
Date:   Mon, 16 Jan 2023 09:59:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-16-v6.2-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 248 runs,
 4 regressions (renesas-devel-2023-01-16-v6.2-rc4)
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

renesas/master baseline: 248 runs, 4 regressions (renesas-devel-2023-01-16-=
v6.2-rc4)

Regressions Summary
-------------------

platform          | arch | lab         | compiler | defconfig           | r=
egressions
------------------+------+-------------+----------+---------------------+--=
----------
imx6dl-udoo       | arm  | lab-broonie | gcc-10   | imx_v6_v7_defconfig | 1=
          =

imx6q-udoo        | arm  | lab-broonie | gcc-10   | imx_v6_v7_defconfig | 1=
          =

imx6sx-sdb        | arm  | lab-nxp     | gcc-10   | imx_v6_v7_defconfig | 1=
          =

r8a7743-iwg20d-q7 | arm  | lab-cip     | gcc-10   | shmobile_defconfig  | 1=
          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-16-v6.2-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-16-v6.2-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f1d973ba5f7b61d0a8b15648e089f267b79e10 =



Test Regressions
---------------- =



platform          | arch | lab         | compiler | defconfig           | r=
egressions
------------------+------+-------------+----------+---------------------+--=
----------
imx6dl-udoo       | arm  | lab-broonie | gcc-10   | imx_v6_v7_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/63c55823e330f0c5571d3a03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c55823e330f0c5571d3=
a04
        failing since 126 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform          | arch | lab         | compiler | defconfig           | r=
egressions
------------------+------+-------------+----------+---------------------+--=
----------
imx6q-udoo        | arm  | lab-broonie | gcc-10   | imx_v6_v7_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/63c558ec752abfa9511d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c558ec752abfa9511d3=
9d0
        failing since 126 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform          | arch | lab         | compiler | defconfig           | r=
egressions
------------------+------+-------------+----------+---------------------+--=
----------
imx6sx-sdb        | arm  | lab-nxp     | gcc-10   | imx_v6_v7_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/63c557dc6c3666fa5e1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c557dc6c3666fa5e1d3=
9c3
        failing since 126 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform          | arch | lab         | compiler | defconfig           | r=
egressions
------------------+------+-------------+----------+---------------------+--=
----------
r8a7743-iwg20d-q7 | arm  | lab-cip     | gcc-10   | shmobile_defconfig  | 1=
          =


  Details:     https://kernelci.org/test/plan/id/63c5582fea0b018e4b1d3a12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c5582fea0b018e4b1d3=
a13
        failing since 3 days (last pass: renesas-devel-2023-01-09-v6.2-rc3,=
 first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =20
