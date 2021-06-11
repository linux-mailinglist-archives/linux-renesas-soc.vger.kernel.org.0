Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE213A382D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 02:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFKACi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 20:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKACi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 20:02:38 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364ECC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 69so1900973plc.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XBUTDjzV/Uqa1yrhGfTUWgbrKwKGMN7WXThuRzeJPX0=;
        b=ZHPpCAMM806w2ca2/BQ4BmlbTO3FTsCZW6aRp6N2X3xEbq1XrtgIukkUvDDKxgqZ9r
         dd/4UdU2vjGRMLaKxrrc/++ilto9+ZdniK/FBtp2HqawI8n1k6K2F3ShfXYt3NBkJBPj
         sk85VMNJw92G5qSpW6eW6R35CBoXIoOi6PukDh+8qEwttqanymIGd12zajfymfiRAwqa
         a/YoicPjtin11NnYRvTVMUaB87lL8MkIVV7XWj5yyRILN14s6QOxTeI04mcyqzg3E355
         H/9qw7E3MX6llcebUQMd1Yh8/UOM+G5sWbqVvp8Qv2okL+jVOksH9kQ7oUnrLzgzpWLj
         UJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XBUTDjzV/Uqa1yrhGfTUWgbrKwKGMN7WXThuRzeJPX0=;
        b=gyOE7Tx+eI8Bj5InvDRpibYLG17B21us1rTTKB81vhZd+Bgd/nj9obU/AeXzeaOh9T
         2fHAm+hKUUlY4xPFAACG1jzWGlmlSZ4EnrR+ua1TvfkZcArzKfX0kw0jyWV5/CsXdQU6
         fqv70yEqsLBJqinRe72yDJqAS0CmaKslyO7xvjA36/zpDdB/bOhtmMG/dlnuUpNBEQdZ
         fCzBos9pj+nbkPXOycwrUhAJL1YXcYV7d0NVdIToLYKmEsOTT3ewiv9oGDH62pZjiZqy
         UMDpPszJ0CyXa4Wj+asJd8rlaeFvplzolxXnTBH5/5XuAFNFjS7b6/FYKTGMbMba44EU
         mfnA==
X-Gm-Message-State: AOAM5332TGU2Cwh09lanw6vO1LYg6gfKJjoNnRryhfQLtBDtwCAaUpfk
        vY39qEbtNLhF+M4PLxSAk61ULfWjcKKxci0U
X-Google-Smtp-Source: ABdhPJxDD/D/uF+Wiz60nb2rdm7zcfIpNyOvOjuVHmW0nAkXNKpFjCEs8uLigLoQEmIkHG/TiWml2w==
X-Received: by 2002:a17:90a:fb57:: with SMTP id iq23mr2549569pjb.205.1623369627363;
        Thu, 10 Jun 2021 17:00:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b124sm3418321pfa.27.2021.06.10.17.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:00:27 -0700 (PDT)
Message-ID: <60c2a79b.1c69fb81.123e5.b690@mx.google.com>
Date:   Thu, 10 Jun 2021 17:00:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 2 runs,
 4 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 4 regressions (renesas-devel-2021-=
06-10-v5.13-rc5)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4c8365183ec52e9309ecae45c725aa315562854d
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  8eeb9c130e75d4063d0dc2ed69c8acde66b6b5d0 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/60c297eb013fe4ab420c0df5

  Results:     91 PASS, 3 FAIL, 37 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60c297eb013fe4ab420c0e66
        failing since 31 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 22:47:12.345000+00:00  <14>[  168.801849] [IGT] kms_vblank: =
executing
    2021-06-10 22:47:12.364000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc5 armv7l)<14>[  168.807792] [IGT] kms_vblank: starting subtest=
 pipe-A-ts-continuation-suspend
    2021-06-10 22:47:12.365000+00:00  =

    2021-06-10 22:47:12.365000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-06-10 22:47:12.408000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-06-10 22:47:12.444000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-06-10 22:47:12.444000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Thu Jun 10 22:47:28 2021
    2021-06-10 22:47:12.462000+00:00  <6>[  168.914973] PM: suspend entry (=
deep)
    2021-06-10 22:47:12.463000+00:00  <6>[  168.919348] Filesystems sync: 0=
.000 seconds
    2021-06-10 22:47:12.477000+00:00  <6>[  168.925079] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (111 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 3          =


  Details:     https://kernelci.org/test/plan/id/60c2961f06a1a0b95f0c0df6

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/60c2962006a1a0b95f0c0e7c
        failing since 3 days (last pass: renesas-devel-2021-05-27-v5.13-rc3=
, first fail: renesas-devel-2021-06-07-v5.13-rc5)

    2021-06-10 22:45:16.229000+00:00  est requirement not met in function i=
gt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-06-10 22:45:16.238000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-06-10 22:45:16.241000+00:00  Pipe E does not exist or not enabled
    2021-06-10 22:45:16.249000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-06-10 22:45:16.259000+00:00  Test requirement: !(pipe >=3D display=
<6>[  151.901214] Console: switching to colour dummy device 80x25
    2021-06-10 22:45:16.263000+00:00  ->n_pipes || !display->pipes[pipe].en=
abled)
    2021-06-10 22:45:16.271000+00:00  Pipe F does not exi<14>[  151.913311]=
 [IGT] kms_vblank: executing
    2021-06-10 22:45:16.272000+00:00  st or not enabled
    2021-06-10 22:45:16.280000+00:00  <14>[  151.925158] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-idle
    2021-06-10 22:45:16.287000+00:00  IGT-Version: 1.26-g8eeb9c1 (aarch64) =
(Linux: 5.13.0-rc5 aarch64) =

    ... (69 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60c2962006a1a0b95f0c0e7f
        failing since 94 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-10 22:45:21.335000+00:00  <14>[  156.984419] [IGT] kms_vblank: =
executing
    2021-06-10 22:45:21.351000+00:00  IGT-Version: 1.26-g8eeb9c1 (aarch64) =
(Linux: 5.13.0-rc5 aarch64)<14>[  156.990778] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-06-10 22:45:21.351000+00:00  =

    2021-06-10 22:45:21.356000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-06-10 22:45:22.297000+00:00  (kms_vblank:787) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:45=
26:
    2021-06-10 22:45:22.307000+00:00  (kms_vblank:787) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-10 22:45:22.313000+00:00  (kms_vblank:787) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-06-10 22:45:22.315000+00:00  Stack trace:
    2021-06-10 22:45:22.320000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-06-10 22:45:22.323000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60c2962006a1a0b95f0c0e81
        failing since 94 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-10 22:45:26.288000+00:00  <14>[  161.937308] [IGT] kms_vblank: =
executing
    2021-06-10 22:45:26.303000+00:00  IGT-Version: 1.26-g8eeb9c1 (aarch64) =
(Linux: 5.13.0-rc5 aarch64)<14>[  161.944124] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-06-10 22:45:26.304000+00:00  =

    2021-06-10 22:45:26.309000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-06-10 22:45:27.267000+00:00  (kms_vblank:793) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:45=
26:
    2021-06-10 22:45:27.277000+00:00  (kms_vblank:793) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-10 22:45:27.285000+00:00  (kms_vblank:793) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-06-10 22:45:27.285000+00:00  Stack trace:
    2021-06-10 22:45:27.290000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-06-10 22:45:27.294000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
