Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE42839DD3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFGNCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 09:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhFGNCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 09:02:16 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53164C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 06:00:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso8230743pjx.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hXku45TnZ/0sxboJTjqU6CF58oh0rltGeVrogO16Iek=;
        b=GMDmURtoOvEbRR5gRmAxZz6rDn4R6xjNA8RVWkWmaY1wQaUHXUomj52s0cmeYWFmlC
         XFsFfLWfnfM+5M3pl1Za0NfJOHNVLjvFORSL9/2R39rp2kp0A5xumTSIVH2EhT8amodN
         xnUuAXij2sp5u4obLY+OUhcmuhR3RFbu0S1Y+H10rRYDNETNgEZfPS+8IINp4pXvh0Ac
         ciqmbLtwglaFEJO4ODhUnHEjdFFtPo0B7HngdsD545qEYNvou7RIFpP8VCLHSv0kXdEA
         1IUtuAqgA0IBwHpOTZGadOW4TxSD7S8KV78VJan2sgvTHkiCaIocRHfSG29pbp60uxrd
         /38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hXku45TnZ/0sxboJTjqU6CF58oh0rltGeVrogO16Iek=;
        b=fIBMgw/s4e19AGfXuUNE53Hn+uMN1aZQzWy05cc7qr650HV0obpZi50RsL5P9fB/dW
         4kiFH4y0/e8zf0jcQ2W0EyitPlQmg41e/yvKXrv4TyxJiu02Mm8L/zw3FyvDG26rthVH
         atPzR1SP4NVyY/zbwJCmFFJeB5oDyPLR3xSJ0yeO6BG0Iv/cQGMgqnRQ/j021TP6d7/7
         X7J3b/oS5rVriaB5uPrihd2P9whJ6Jcc1smP0ZUncFydDHWYKuEppupfSKvkdBIfVYoy
         Dmlk7ouLWV9dCuZVvrbYGjZ1qaupy22cczY5lU7aFgOPS0xWURt6VkHZfZSzZuBd1t2G
         Evhw==
X-Gm-Message-State: AOAM531VVuzm+Uhb3Ie0Ns04mm5CvvJmvx0lWqupClbFmbx82YgQ4lt9
        aEbJUHNzfN68d2abwIPFidJiQLc1dFmny5EG
X-Google-Smtp-Source: ABdhPJyyd9wXnjR101hRMkS35dpxXOTIE9S8HwjrVul9WDNaJ4iZBD7Sqk7LH36gkgCEd80y3EgCkg==
X-Received: by 2002:a17:90a:ab8f:: with SMTP id n15mr20288717pjq.83.1623070811501;
        Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s21sm8105830pfw.57.2021.06.07.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Message-ID: <60be185b.1c69fb81.b09dc.8c86@mx.google.com>
Date:   Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-07-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 2 runs,
 4 regressions (renesas-devel-2021-06-07-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 4 regressions (renesas-devel-2021-=
06-07-v5.13-rc5)

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
sas-devel-2021-06-07-v5.13-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-07-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0dc27258c7ad2021418a2aa43fb14a9dda2dd46d

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


  Details:     https://kernelci.org/test/plan/id/60be03fe686ce868ca0c0e13

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60be03fe686ce868ca0c0e84
        failing since 27 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-07 11:31:44.903000+00:00  <14>[  168.444890] [IGT] kms_vblank: =
executing
    2021-06-07 11:31:44.916000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc5 armv7l)
    2021-06-07 11:31:44.922000+00:00  <14>[  168.450740] [IGT] kms_vblank: =
starting subtest pipe-A-ts-continuation-suspend
    2021-06-07 11:31:44.922000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-06-07 11:31:44.972000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-06-07 11:31:44.993000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-06-07 11:31:44.993000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Mon Jun  7 11:32:01 2021
    2021-06-07 11:31:45.011000+00:00  <6>[  168.548362] PM: suspend entry (=
deep)
    2021-06-07 11:31:45.012000+00:00  <6>[  168.552675] Filesystems sync: 0=
.000 seconds
    2021-06-07 11:31:45.025000+00:00  <6>[  168.557915] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (110 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 3          =


  Details:     https://kernelci.org/test/plan/id/60be148debdb7ad1de0c0e25

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/60be148debdb7ad1de0c0eab
        new failure (last pass: renesas-devel-2021-05-27-v5.13-rc3)

    2021-06-07 12:43:22.227000+00:00  Pipe D does not exist or not enabled
    2021-06-07 12:43:22.236000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-06-07 12:43:22.244000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-06-07 12:43:22.246000+00:00  Pipe E does not exist or not enabled
    2021-06-07 12:43:22.259000+00:00  Test requirement not met in function =
igt_require_pipe, fi<6>[  157.649973] Console: switching to colour dummy de=
vice 80x25
    2021-06-07 12:43:22.262000+00:00  le ../lib/igt_kms.c:2094:
    2021-06-07 12:43:22.269000+00:00  Test requirement: !(pipe >=3D display=
-><14>[  157.660235] [IGT] kms_vblank: executing
    2021-06-07 12:43:22.274000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-06-07 12:43:22.284000+00:00  Pipe F does not exist<14>[  157.67251=
7] [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle
    2021-06-07 12:43:22.286000+00:00   or not enabled =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60be148debdb7ad1de0c0eae
        failing since 90 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-07 12:43:26.579000+00:00  <6>[  161.972948] Console: switching =
to colour dummy device 80x25
    2021-06-07 12:43:26.585000+00:00  <14>[  161.980336] [IGT] kms_vblank: =
executing
    2021-06-07 12:43:26.600000+00:00  IGT-Version: 1.26-g8eeb9c1 (aarch64) =
(Linux: 5.13.0-rc5 aarch64)<14>[  161.986889] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-06-07 12:43:26.601000+00:00  =

    2021-06-07 12:43:26.605000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-06-07 12:43:27.535000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:45=
26:
    2021-06-07 12:43:27.545000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-07 12:43:27.552000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-06-07 12:43:27.553000+00:00  Stack trace:
    2021-06-07 12:43:27.557000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60be148debdb7ad1de0c0eb0
        failing since 90 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-06-07 12:43:31.537000+00:00  <14>[  166.933776] [IGT] kms_vblank: =
executing
    2021-06-07 12:43:31.553000+00:00  IGT-Version: 1.26-g8eeb9c1 (aarch64) =
(Linux: 5.13.0-rc5 aarch64)<14>[  166.940690] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-06-07 12:43:31.554000+00:00  =

    2021-06-07 12:43:31.557000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-06-07 12:43:32.471000+00:00  (kms_vblank:790) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:45=
26:
    2021-06-07 12:43:32.480000+00:00  (kms_vblank:790) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-06-07 12:43:32.487000+00:00  (kms_vblank:790) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-06-07 12:43:32.489000+00:00  Stack trace:
    2021-06-07 12:43:32.494000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-06-07 12:43:32.497000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =

 =20
