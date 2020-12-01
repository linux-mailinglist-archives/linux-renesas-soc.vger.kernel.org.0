Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234372C94A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 02:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731118AbgLAB24 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 20:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731111AbgLAB24 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 20:28:56 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE60C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:28:10 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id r2so192762pls.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4OSUdA46SHNmliTrBNis7OerMR4pcjIfnK9iS2PkS1A=;
        b=itTSN1B65MgteMiLTwfFQSj6XqP1NWwpdrGNeTpBWis0ZGBQVIS8HaRhlaOC0iAFNJ
         iwRT1ogVO6IaYbnW/gQG0k3JfScpe7rWru4zU4pNZ/2dH8lJ1I55gBmTHxeDaeyMemaf
         kPhFVAueDtqqE8sZkG6gHxYbwwpSktjSOh0NaCKVcAtQB+NbqQ1ViFC2kycHZNr3i2U0
         hFw2/6RfkESgFP1CO6AGbS2npJuAQcY/76W6GudbJimdSR9PzmgPXVNFYtFDBFyUa5+s
         AITB59r856/uopWnVu1qiKQN3sLLx5pCmZv+CWsXu6ZP9nT9SlP+iN7qQ6BPsQO8VdFi
         2V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4OSUdA46SHNmliTrBNis7OerMR4pcjIfnK9iS2PkS1A=;
        b=bY99Okyq5njg0LziQx5nWRzAwsXnqgfwXgstFsZyHI3+gszK6lCPSEOwKGKSmOmR+H
         IU75ksrjQ0heir7SBR/a96cMA8SY9d2QXpBykcLWaACSz9bXRDUxuaBfz0Zexy8gw1Id
         vZF/SplP9FbFflgKtiu3ctk1IqBym06M+xmgWwN4fP+v2LDwhVA1vSDkz1QazUeRS1hq
         ziJw62xFWcYQmYvXCKNYp8TfWFBfc9ZlS2it9I1TRFz3b/Q00NjnZpa64eoQInVa7Wxu
         Cp5+eK8XN9UN5PFHZa99wc+Lz3hZ2hf3vQz0s+T/z44Y9bofKwBqUgkvikqziVNXvi2c
         hFRA==
X-Gm-Message-State: AOAM531hvK9+ZjRdOr+1kBGfQHvaLwlP++TKIK9dp9Q/CBZXZskxDiWp
        w98GODeMx8VP2AqrdA8JYC6JB1aURDpS3g==
X-Google-Smtp-Source: ABdhPJx6eZ3K7Grs8NFfI40XwnDyz/WNdP6ARFD6A/Q9NN0k6MNbUr8hTKi8iXFtMjOy8RFFQKEl2A==
X-Received: by 2002:a17:902:7297:b029:da:861e:eae1 with SMTP id d23-20020a1709027297b02900da861eeae1mr418522pll.8.1606786089625;
        Mon, 30 Nov 2020 17:28:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i14sm287302pgm.35.2020.11.30.17.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:28:09 -0800 (PST)
Message-ID: <5fc59c29.1c69fb81.7645e.0f41@mx.google.com>
Date:   Mon, 30 Nov 2020 17:28:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-11-30-v5.10-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 25 runs,
 4 regressions (renesas-devel-2020-11-30-v5.10-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 25 runs, 4 regressions (renesas-devel-2020-11-=
30-v5.10-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
           | regressions
-----------------------------+-------+---------------+----------+----------=
-----------+------------
beaglebone-black             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig  | 1          =

beaglebone-black             | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
           | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig  | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-11-30-v5.10-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-11-30-v5.10-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9b01f862523844081e7700b57633784e4ebbece8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
           | regressions
-----------------------------+-------+---------------+----------+----------=
-----------+------------
beaglebone-black             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56c5e86cc50f5aec94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc56c5e86cc50f5a=
ec94cc7
        failing since 3 days (last pass: renesas-devel-2020-11-23-v5.10-rc5=
, first fail: renesas-devel-2020-11-27-v5.10-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
           | regressions
-----------------------------+-------+---------------+----------+----------=
-----------+------------
beaglebone-black             | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56af9534e7b2811c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-nfs=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-nfs=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc56af9534e7b281=
1c94cbb
        failing since 3 days (last pass: renesas-devel-2020-11-23-v5.10-rc5=
, first fail: renesas-devel-2020-11-27-v5.10-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
           | regressions
-----------------------------+-------+---------------+----------+----------=
-----------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc5810e65b8db77a2c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc5810e65b8db77a=
2c94cba
        new failure (last pass: renesas-devel-2020-11-09-v5.10-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
           | regressions
-----------------------------+-------+---------------+----------+----------=
-----------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc585cba75bb6df17c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc585cba75bb6df1=
7c94cd0
        new failure (last pass: renesas-devel-2020-11-27-v5.10-rc5) =

 =20
