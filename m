Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5463F33121E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 16:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhCHP0g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 10:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhCHP0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 10:26:16 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8E1C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 07:26:16 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id m6so7426946pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rDCGjxYjlYC7WtmHGhWKmTFrcaeb42L3F591zIwG1Tw=;
        b=vC9iYLZVSdlVpQi580apW2m3kVX8pzgN8ME34csAA626yfTh+d2SUQ6UY72m4rzpo7
         9/yXgnQtVNQY5NR+1wmeX0FIByA4AqZx0bYjTHSAdTPr7s8l3twRCE3URvo6IBpfWOxy
         Iau4F1LhgQN5q9JWZrBVDvtJGZEH5bbiU9rDqwizTAGm26PH3r+q/yWVLV97fI+LSrb0
         S3eSawySyjmttbRMuzE+IzVw+1ydJDcAwhSi+XFqwVPUChYg/H4ZcCAzXnYIff5w8rw+
         fvtsaciUvQOGtnQLpakfGNp+W+yld+Tf0JQn2GtDrwE2ebV7fmA6abr06sSy3ENulp1e
         OsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rDCGjxYjlYC7WtmHGhWKmTFrcaeb42L3F591zIwG1Tw=;
        b=rK0vWby9kbXtetNCr+we+BBlSaYJ+Mr7xWCrI/RZUFKfZDkybcKoNKUWVNC5iosoz/
         pwdj5e/EBuZ+GrOBqfv2Vo69eYp9DsQ2gB71xyoHKKlLOZ6dJFWZ1449WYaQ3yzW1HUV
         bEUSDUtCRtQ7DSAOhrxg5S3aMCNRLt+v0mZwPVgZ8WR84WPWRtncG4Mp7imSdpy5aRp8
         4+ItlcZhpGVVCeFkTFKvTj53dU0tNQCjyoMHgvKxYkQLjF8+3wL0lb9mrttWWVhMCZmj
         g4/y/VojYgcxpCdvWIZb4SYvbGHgjJNP57yAE90dDbs0COvbBvRpT/b3QmDWMXqoj6XS
         CbZA==
X-Gm-Message-State: AOAM532tenDDRv2a8JEOWHA2OEzgFoVO9HYhkGBYuFqB5wvgluO4boML
        cU3yLIjKcmiV80N7vCEkK2RrCAhcptNg65HX
X-Google-Smtp-Source: ABdhPJy/S8D5vW8oYJyl+1COPkc3peiT/vPL+MS8l9+87rvkqgwK+F4PdGwcc5T/4ucZvzvPCVbxcg==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr21459227pgf.141.1615217175856;
        Mon, 08 Mar 2021 07:26:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gt22sm11130118pjb.35.2021.03.08.07.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 07:26:15 -0800 (PST)
Message-ID: <60464217.1c69fb81.3b86b.b001@mx.google.com>
Date:   Mon, 08 Mar 2021 07:26:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-394-g4e589d84c742
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 2 runs,
 3 regressions (v5.12-rc2-394-g4e589d84c742)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 3 regressions (v5.12-rc2-394-g4e58=
9d84c742)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc2-394-g4e589d84c742/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc2-394-g4e589d84c742
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4e589d84c7429ff697e741961eda21ac05f0b7b8

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  a9bb32cfe1ee87ff831707dfdcbcae56f2b2a036
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2107b0a53692fb329175bc16169c3699712187aa =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/6046311c67d570be4caddcb1

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-394-g=
4e589d84c742/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/6046311d67d570be4caddd37
        new failure (last pass: renesas-devel-2021-02-15-v5.11)

    2021-03-08 14:13:14.727000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-08 14:13:14.731000+00:00  Pipe E does not exist or not enabled
    2021-03-08 14:13:14.739000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-08 14:13:14.749000+00:00  Test requirement: !(pipe >=3D display=
<6>[  146.114272] Console: switching to colour dummy device 80x25
    2021-03-08 14:13:14.753000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled)
    2021-03-08 14:13:14.759000+00:00  Pipe F does not exi<14>[  146.125679]=
 [IGT] kms_vblank: executing
    2021-03-08 14:13:14.762000+00:00  st or not enabled
    2021-03-08 14:13:14.774000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: <14>[  146.137643] [IGT] kms_vblank: starting subtest pipe-B-ts-con=
tinuation-idle
    2021-03-08 14:13:14.776000+00:00  5.12.0-rc2 aarch64)
    2021-03-08 14:13:14.780000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6046311d67d570be4caddd3a
        new failure (last pass: renesas-devel-2021-02-15-v5.11)

    2021-03-08 14:13:19.139000+00:00  <6>[  150.509258] Console: switching =
to colour dummy device 80x25
    2021-03-08 14:13:19.144000+00:00  <14>[  150.516248] [IGT] kms_vblank: =
executing
    2021-03-08 14:13:19.159000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  150.522704] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-08 14:13:19.160000+00:00  =

    2021-03-08 14:13:19.165000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-08 14:13:20.092000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-08 14:13:20.102000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-08 14:13:20.109000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-08 14:13:20.110000+00:00  Stack trace:
    2021-03-08 14:13:20.115000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/6046311d67d570be4caddd3c
        new failure (last pass: renesas-devel-2021-02-15-v5.11)

    2021-03-08 14:13:23.324000+00:00  <6>[  154.694596] Console: switching =
to colour dummy device 80x25
    2021-03-08 14:13:23.330000+00:00  <14>[  154.701273] [IGT] kms_vblank: =
executing
    2021-03-08 14:13:23.344000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  154.707727] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-08 14:13:23.344000+00:00  =

    2021-03-08 14:13:23.349000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-08 14:13:24.279000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-08 14:13:24.289000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-08 14:13:24.296000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-08 14:13:24.297000+00:00  Stack trace:
    2021-03-08 14:13:24.302000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =

 =20
