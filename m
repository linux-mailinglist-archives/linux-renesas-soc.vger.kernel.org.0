Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0C528D94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 20:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbiEPS6w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 14:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345231AbiEPS6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 14:58:47 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6313EB9D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 11:58:46 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id q18so15300727pln.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zjLPmt3YMI4rzENipPSxP2YJpjVvyRGW96Ry9VtsTNs=;
        b=xUyvL584yl0i8Kia7iqAKM05idoJ5ayRzoo53y5uZCtlQ8M6au0ki2gnh/mOxKSN9Z
         3dRDJSQEJ6SYjvwdaASzMM+NxVpS+HUnRJ4ZIDlMElKRhj8UA1/fyBuZHO6/hzpntXcp
         6qMWDuyyv7AK8mH5/ZV1/Ie8PUQfQrMp3f+Mwv+PB6lYdCzMKOrh5Zoi5r60XcDnIzb7
         47J+n6Y3n6N1csarfzSEZAoF2v0eBLzhgtOyUaYrLOaD09Bya7hdgg/2pSz6igIMcbiV
         /lBrAr3bbvmdcnFC/2n70e1pnXNaeJDnhZJxx4nG37JXKgcWS/ipoC28dHAthzfYjGL5
         A5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zjLPmt3YMI4rzENipPSxP2YJpjVvyRGW96Ry9VtsTNs=;
        b=JND4yrmSFwqpIeFfY2sCo1PEnl/l1R/Cli3sooslO9xI74PtVBTpZhgQjAF+gJ9h6Q
         Pad1gn++5ieBABpyuymgakHsMaQkMR+6RfEjUGBvPYEROHQEE4lBB363yqE1i0fL2Jxf
         9lh0Lei/hvLxTQpjPf7PtycCC1xmuC5pUaxVbeRdX8K8/pY1mBWyXWp3SzwMdmS6OSEO
         6UoHdIpYxJ/+2wtJ9CvxzbBhpGG2oTx13TASe6Wq18eGnyVZ9YQYottjTQDkNdga0pKp
         PG+hppmXrg1B7hEIcbqiEoIhk76HW1tNx0g4arrU0GU3PXuOZdp4MIXCyD/WFE/xayGO
         H9VQ==
X-Gm-Message-State: AOAM533ACxVrIYZfJRk5x/qPWCNGrUTFBu9cuY15ozg5qFraDM9Csw/n
        bvVsPXBW0QNOuICJNHNEacaaQq7WIvz+JNFSJ4Y=
X-Google-Smtp-Source: ABdhPJywkvZMOHZm1M3U70K6IOqCAMyXKw5uzjSpa4ZwGSjwV81wKJnJcuFMuwEiMmPbg6+fg/M4Rg==
X-Received: by 2002:a17:902:ec92:b0:161:7e29:6f95 with SMTP id x18-20020a170902ec9200b001617e296f95mr5958308plg.12.1652727526220;
        Mon, 16 May 2022 11:58:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u23-20020a1709026e1700b0015e8d4eb1ffsm7487876plk.73.2022.05.16.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 11:58:44 -0700 (PDT)
Message-ID: <62829ee4.1c69fb81.d0b9.264f@mx.google.com>
Date:   Mon, 16 May 2022 11:58:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master baseline: 220 runs,
 4 regressions (renesas-devel-2022-05-16-v5.18-rc7)
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

renesas/master baseline: 220 runs, 4 regressions (renesas-devel-2022-05-16-=
v5.18-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62826a3b4c0f58ecf48f5754

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62826a3b4c0f58ecf48f5=
755
        failing since 16 days (last pass: renesas-devel-2022-04-13-v5.18-rc=
2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62826bdc58f3e46a5b8f573e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62826bdc58f3e46a5b8f5=
73f
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62826bd458f3e46a5b8f573a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62826bd458f3e46a5b8f5=
73b
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62826dbfb268f589e28f573c

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62826dbfb268f589e28f575d
        failing since 69 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-16T15:28:49.082598  <8>[   34.158043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-16T15:28:50.111098  /lava-6391400/1/../bin/lava-test-case
    2022-05-16T15:28:50.122062  <8>[   35.197887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
