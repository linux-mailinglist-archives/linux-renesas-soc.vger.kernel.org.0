Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398F2330F29
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 14:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhCHNar (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 08:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhCHNag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 08:30:36 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867B4C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 05:30:36 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id m6so7211228pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 05:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tzdaIc5sV7gTkh7/84F8KktIb6PPy28L+cwFjWTh5hk=;
        b=iMAKqKUYW5Y4WRP8+kUXWqj5R5ydz1VoZtuvMC8Larz7zjtm2Z5rLFMt4vtESnKFfo
         4jruSY0t8Sud8vqqISOBnOkpr1Ed36AACywu/wPutDrhUAsRUzL0qpeFaUEN/aeUYNG4
         0zPi7inbv3Dv37SuYGzG7cdgnqCrqd+meUHtwdemBkf3Sq8fkLkOV89R3Q33pIox6yjc
         Qc0v+60K8495uEKkS9HSHDWgrwveN0MvUq0R2de+j5Ixbu8CAFGiQN9qrBAEQ6jpXCD7
         Uzd/sUhFr490vBz5uRlsCtMCHc0SBqHzUobbuCaTBBu4FFkB09UERLiMaOd+uGn0fk2m
         vUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tzdaIc5sV7gTkh7/84F8KktIb6PPy28L+cwFjWTh5hk=;
        b=Mdj8VFM9hiJhEHzFrMaZTUAX9kdf2o0Zmnd9hnpbqHVcU8agfXKtb4q/equTJmqcco
         ExbgcKVnEGJIXTTfUCwBeWrt/XWonjJB9yfdSpO0MCyLMtgrn34KhgYX0kSMx4glY3T4
         gBz0g7CULx+sbGCZj3e23NO1ef/MWGU3yt43ofb2XDz8Ym9pR+AzOf++cQ/lRp8Mb1fF
         4j9BKUvaVNpIEgOdKuJQmYLNgEXtoCGh+MaSpUsnqPBTF9rx0xirVAP/68Trng1OHgaw
         JezmjQ0n+48Sn4/0kuxGFP38iepbr9sby9DLS4k+UR8oL8vfqavc1tDrXG8GaraT6oRb
         0juw==
X-Gm-Message-State: AOAM533AIDrbbTSeYlhhY9VUqGWv0jpJvps7+W31UqWyGbyLqlkj3uds
        0i8DpWRsO3e7Lej3sbILDa5LJvIr4H1m53qv
X-Google-Smtp-Source: ABdhPJxL7UFJhSkcWF9ATYdKjWy5IjUMwzYJcmHZHhIF7Nbb8G/+brxujMvl84JgWwGGn3f/fYp7LA==
X-Received: by 2002:a62:8811:0:b029:1ef:2105:3594 with SMTP id l17-20020a6288110000b02901ef21053594mr20099250pfd.70.1615210235871;
        Mon, 08 Mar 2021 05:30:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d6sm10169146pfq.109.2021.03.08.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:30:35 -0800 (PST)
Message-ID: <604626fb.1c69fb81.3722b.8ee9@mx.google.com>
Date:   Mon, 08 Mar 2021 05:30:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-14-g6f56f6c26099
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 2 runs,
 3 regressions (v5.12-rc2-14-g6f56f6c26099)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 3 regressions (v5.12-rc2-14-g6f56f6c=
26099)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-14-g6f56f6c26099/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-14-g6f56f6c26099
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f56f6c260995c9bcecd0b8a520d80b0d6c11007

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


  Details:     https://kernelci.org/test/plan/id/604615275e1528aa8caddcba

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/604615275e1528aa8caddd40
        failing since 6 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-08 12:13:55.494000+00:00  Pipe D does not exist or not enabled
    2021-03-08 12:13:55.503000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-08 12:13:55.510000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-08 12:13:55.514000+00:00  Pipe E does not exist or not enabled
    2021-03-08 12:13:55.526000+00:00  Test requirement not met in function =
igt_require_pipe, fi<6>[  149.021098] Console: switching to colour dummy de=
vice 80x25
    2021-03-08 12:13:55.528000+00:00  le ../lib/igt_kms.c:1910:
    2021-03-08 12:13:55.537000+00:00  Test requirement: !(pipe >=3D display=
-><14>[  149.032263] [IGT] kms_vblank: executing
    2021-03-08 12:13:55.541000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-08 12:13:55.551000+00:00  Pipe F does not exist<14>[  149.04401=
7] [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle
    2021-03-08 12:13:55.553000+00:00   or not enabled =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/604615275e1528aa8caddd43
        failing since 6 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-08 12:14:00.602000+00:00  <14>[  154.103272] [IGT] kms_vblank: =
executing
    2021-03-08 12:14:00.619000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  154.110190] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-08 12:14:00.620000+00:00  =

    2021-03-08 12:14:00.624000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-08 12:14:01.534000+00:00  (kms_vblank:777) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-08 12:14:01.544000+00:00  (kms_vblank:777) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-08 12:14:01.550000+00:00  (kms_vblank:777) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-08 12:14:01.552000+00:00  Stack trace:
    2021-03-08 12:14:01.557000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-08 12:14:01.560000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/604615275e1528aa8caddd45
        failing since 6 days (last pass: renesas-next-2021-01-29-v5.11-rc1,=
 first fail: v5.12-rc1-12-g3158164f1526)

    2021-03-08 12:14:05.489000+00:00  <14>[  158.990588] [IGT] kms_vblank: =
executing
    2021-03-08 12:14:05.504000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc2 aarch64)<14>[  158.996759] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-08 12:14:05.505000+00:00  =

    2021-03-08 12:14:05.510000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-08 12:14:06.437000+00:00  (kms_vblank:783) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-08 12:14:06.447000+00:00  (kms_vblank:783) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-08 12:14:06.453000+00:00  (kms_vblank:783) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-08 12:14:06.454000+00:00  Stack trace:
    2021-03-08 12:14:06.460000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-08 12:14:06.463000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
