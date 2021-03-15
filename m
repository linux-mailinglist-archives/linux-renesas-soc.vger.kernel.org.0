Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC78333B137
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 12:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhCOLeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 07:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhCOLdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 07:33:36 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9028C06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so14592578pjg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s2L63cFwY2Bh698YdgwO11QE1p5e1Pivx1Fo5WvR9SY=;
        b=LO1p5vFSTf5CeiJEhakNNp7lVCICzJ9mnOApqkdF/Umv8soihXMquJvKc4wS8p6iqb
         fdQ8Aas5pFDO8dQCWKquq6Qa9idPtj7dNuUH573Tt7cHikQ+Pazt+qq2pMxs6pGrLO0X
         e9rvx5ME9lLJLovG/qJ14dNsm26DGEkYqDP5RZI9aUaoRMFK60Zjix2QSlZmx/OT3uZu
         Lq6DsSLjOv0AKAXUUvIkPN6O+Yvb9lDitNLS/eVhzTqw1iT5nBbjOIVX8lhw3sAMBdZD
         sN6jC3v27jDitlx0zSYBc0md47HePsPhd4Ijt4yS12KXplQWAvniyYQgFCgjXy62/NTC
         HXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s2L63cFwY2Bh698YdgwO11QE1p5e1Pivx1Fo5WvR9SY=;
        b=JFCpcbmNJ6Z8+3dk01m2e/3gnCGERLGP7lHEDDLrbfv4z0gjHMAqI8tbS7jpRIYu3r
         /epNZunkf1GUpasF8jgpamLg91zICGgwDUnmf0XKETMT23bcQaiMFuIllCxupa5T5u0k
         XgHLZhm5TinKMzyupD6oKgWeXJf7zgD4qWzssgy3SgtZrsaYBDCWs9vMki5eyDrHnH+p
         +c4QbhZbIYTCXJuZL5KpbTE5+Gs/uSlvz4Iw+p1XA3+wGFQG7u+sc3a1WVY1jzP0whdh
         Ss1sbghEg8BVBKEW8ItlFKMIFCyE+fi7tn3mXmkYSUUL4uY87SFhRMInu8RVse6Siwqt
         /kvQ==
X-Gm-Message-State: AOAM532PmZYcMZyqaa2i8+SM+O4gxIP4XwZJGOqnCRDEFsiIdmsWzyKi
        D3oSHADuBh5WGeLtpbZYEpSgX0bjJ3SLnA==
X-Google-Smtp-Source: ABdhPJxysyLZ9YVSkZ8yFY3i7n52GY3JFF54leb+0QwW8McfK4mpsgf3RTBSR06Vk+4GMfpk1g2GpA==
X-Received: by 2002:a17:90a:af8a:: with SMTP id w10mr12044404pjq.114.1615808015651;
        Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k15sm13550790pgt.23.2021.03.15.04.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Message-ID: <604f460f.1c69fb81.41248.26d7@mx.google.com>
Date:   Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-15-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 2 runs,
 3 regressions (renesas-devel-2021-03-15-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 3 regressions (renesas-devel-2021-=
03-15-v5.12-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-15-v5.12-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-15-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7bd4543a30a76f48903e745f7b9decce1f019ece

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


  Details:     https://kernelci.org/test/plan/id/604f347d0095e7cd41addd06

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/604f347e0095e7cd41addd8c
        failing since 6 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-15 10:18:04.496000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-15 10:18:04.500000+00:00  Pipe E does not exist or not enabled
    2021-03-15 10:18:04.508000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-15 10:18:04.519000+00:00  Test requirement: !(pipe >=3D display=
-><6>[  141.944367] Console: switching to colour dummy device 80x25
    2021-03-15 10:18:04.523000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-15 10:18:04.529000+00:00  Pipe F does not exist<14>[  141.95641=
4] [IGT] kms_vblank: executing
    2021-03-15 10:18:04.531000+00:00   or not enabled
    2021-03-15 10:18:04.545000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc3 aarch64)<14>[  141.968443] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-idle
    2021-03-15 10:18:04.546000+00:00  =

    2021-03-15 10:18:04.550000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-idle =

    ... (67 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/604f347e0095e7cd41addd8f
        failing since 6 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-15 10:18:08.872000+00:00  <6>[  146.303493] Console: switching =
to colour dummy device 80x25
    2021-03-15 10:18:08.878000+00:00  <14>[  146.310218] [IGT] kms_vblank: =
executing
    2021-03-15 10:18:08.893000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc3 aarch64)<14>[  146.317453] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-15 10:18:08.894000+00:00  =

    2021-03-15 10:18:08.899000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-15 10:18:09.827000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-15 10:18:09.837000+00:00  (kms_vblank:778) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-15 10:18:09.844000+00:00  (kms_vblank:778) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-15 10:18:09.845000+00:00  Stack trace:
    2021-03-15 10:18:09.850000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/604f347e0095e7cd41addd91
        failing since 6 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-15 10:18:13.054000+00:00  <6>[  150.485283] Console: switching =
to colour dummy device 80x25
    2021-03-15 10:18:13.059000+00:00  <14>[  150.492051] [IGT] kms_vblank: =
executing
    2021-03-15 10:18:13.075000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc3 aarch64)<14>[  150.498843] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-15 10:18:13.075000+00:00  =

    2021-03-15 10:18:13.080000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-15 10:18:14.013000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-15 10:18:14.023000+00:00  (kms_vblank:784) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-15 10:18:14.029000+00:00  (kms_vblank:784) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-15 10:18:14.031000+00:00  Stack trace:
    2021-03-15 10:18:14.036000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (62 line(s) more)  =

 =20
