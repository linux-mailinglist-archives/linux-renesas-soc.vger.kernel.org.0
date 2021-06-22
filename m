Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA673B09F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 18:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhFVQKM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 12:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhFVQKM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 12:10:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34185C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 09:07:56 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x22so9139737pll.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ELOo2+CS7pQi6X3bhWvrfKHddfFvMcg84KsAZ8rEDCc=;
        b=qAo2VlbavNohdk19vYEYOv6zEoVde4JBbq7dgKjzmT6dmcYf5F/MjJVs7q7z+8oGuF
         87+TYY236wwCg4B4Zzdr5gTL2k9el5s5kqOE5226rz5LTMGbfurD8/1Y/Gg4CbVa+ACO
         vOzFD8frZH3Sj7E2rbC62ChGfW/a+hc3oi82hXLXybi6L2jWkBQo65IcCTCsCuu228rQ
         7ilu6C2Zh6Iro4pWsJIrgo0dyd/6f4Kh07ZGRPdk61Ayvlq9aTDMjD4XF1n/LoFIp/Da
         PVL4cotpEUJTCHkWJiKyalrAjbxY+w5TG2nZe0DMbKslWGvUrprV7Y4MxpfVhIp3UvAd
         wIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ELOo2+CS7pQi6X3bhWvrfKHddfFvMcg84KsAZ8rEDCc=;
        b=B4bKVGk4lJE9qneVXQ+Qfg7DVSm+X73sZq3734laFYmMjpVSP5xZ2JiSmsSk4eaxnI
         285/pTJhJgYarBIKa3/JzwimU7NXpCVs2Q8jdawIKna3lR9OzX1ZdPdaclvzFiZlTrNi
         lqeazm5neWbgmxqvcd7bwDJb64w0A02TUvzo8FSzW0WyBiY9wIpbzAvulKtNZwjPO8b5
         ITCHcjsNKSp/LwxhVFpKi9Q1UnvbIP0awZlI6obhz4j3DDdCNJ5HVMpDxq+jdsbWW6rM
         LHK5ZZoXNtjr1M4XmVtwSbgBPWLNs3VnbLFjR8zwtC6Qi6clEljEPh886Kx1jiAqiAhD
         oWmQ==
X-Gm-Message-State: AOAM531f8xfHVl0xWkbpV05zdA0JR4T2pEYAr8/1QMiwxA70EKUsAVCk
        ugnzmRukLcm3dvj3NO6699MT3RbfjG1C0A==
X-Google-Smtp-Source: ABdhPJxzhb9CiHv44w7v6lIeuvGcyXhhML0j01J8ARPD8Xw+muL7tIqMrOW7W8QQSbkk9DJx6NL0YA==
X-Received: by 2002:a17:90a:6402:: with SMTP id g2mr4595869pjj.82.1624378075512;
        Tue, 22 Jun 2021 09:07:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h22sm2893159pju.22.2021.06.22.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:07:55 -0700 (PDT)
Message-ID: <60d20adb.1c69fb81.70f55.7643@mx.google.com>
Date:   Tue, 22 Jun 2021 09:07:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-22-v5.13-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 33 runs,
 4 regressions (renesas-devel-2021-06-22-v5.13-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 33 runs, 4 regressions (renesas-devel-2021-06-=
22-v5.13-rc7)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =

odroid-xu3                | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-22-v5.13-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-22-v5.13-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b9234c27991cbe7e6f97f22c3c7fef521fe34d3 =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d16eeaaa66b3834132f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60d1d16eeaaa66b38=
34132f7
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
odroid-xu3                | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d203ac3ec2754ebe413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60d203ac3ec2754eb=
e413277
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/60d20929634020043f413297

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60d20929634020043=
f413298
        failing since 52 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60d20464dce7f25f6741326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-22-v5.13-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60d20464dce7f25f6=
741326c
        failing since 77 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
