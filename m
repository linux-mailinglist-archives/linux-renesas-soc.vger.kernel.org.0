Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBAF3CEF09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 00:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242807AbhGSVYC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 17:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381801AbhGSSHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 14:07:16 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4278FC0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:33:24 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id b12so17268681pfv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cb74VT99U/mh9i4dK6u0VRwUlM4VU6UIJY4vSiji1Y8=;
        b=aGYvn6iPzapkWZ5F7oXKuZLrTDFMLCrBGn1wPGKx17fwWLAyZhstAT6MnzJ2amguny
         5AqEMKCVA+zxfyGwUvjgQfiWUSrTJaMrhkb8z4YI9PE/L0xnSRJEOJu8SAX90ssGnUtm
         P9b7osHgdMlFuFqsMG+mZdybGkiBfh5wASIvpbxt09cpJswhFMFKxBZSMQLSfYNtOCxe
         7+F3AnO4s/lMZO4fiR+X9xYN23oJBoZgH9SzQRbyvZcSjoC6u4A3J7vgUXCvno947NUo
         9+rFADnOGJG4BQqSmmkKU4hCzs5tEHYnncRGy7c5obkHdRNsoU/4Af8Uqz6vhe7VSN7g
         zfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cb74VT99U/mh9i4dK6u0VRwUlM4VU6UIJY4vSiji1Y8=;
        b=qTYUUOoiyeBVjH9g1CACZq8wKGrTFEhfe1l1W5hcIft5jWrj5vqOdSEzYyAYliIjGc
         fCuvQhwLQUZlskCum60Ywa86vpqkdivjGjUr9qEex2SiBmlTy5gjSpugsvoAMIPSPs+0
         ouPPV+j60Qai3T8Q70tHQgtaNTyy1FnquiseJEHufMd80bkST6abO8Ba7Y1yVS01Xe6V
         WxlQIKr+YHMzTBAccgfd1oB/uQ0b1sAW6U/tLIDg9vN+kjZ3rs302oHqBdUBnKWRyZC+
         c71Qm9F3WSWCvQboaNrA1ESZjcZO4Cf5V8B92b1mNqxqdeq8Hk9G4z51khoUvfVWhkKy
         jJWg==
X-Gm-Message-State: AOAM533ilzrBpbXzssiU4B4ySxrmqPXTFq0MLl1F5oZCVC92n1u2jlUS
        RL/a12Cr4aWYGe/08VSzNllp8aZoRvg1jYnB
X-Google-Smtp-Source: ABdhPJx4oAapOnA2NIDx/v1oqn43VyOokpM2aEPxGgt+7HkqnUM8GePJplGz5ZLIWy4lMEZ/Q4cABA==
X-Received: by 2002:a63:114d:: with SMTP id 13mr27282618pgr.180.1626720339713;
        Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w2sm16553118pjq.5.2021.07.19.11.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
Message-ID: <60f5c853.1c69fb81.a4991.2b10@mx.google.com>
Date:   Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-19-v5.14-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-kms-rockchip: 2 runs,
 3 regressions (renesas-next-2021-07-19-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 3 regressions (renesas-next-2021-07-=
19-v5.14-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 2          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-19-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-19-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a022240886d918d1f09a50b86a4065256caac42

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  9cef5dee3cd817728c83aeb3c2010c1954e4c402
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  cd63c83e23789eb194d38b8d272247a88122f2f6 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 2          =


  Details:     https://kernelci.org/test/plan/id/60f5bec048ea0dfe2111609b

  Results:     91 PASS, 4 FAIL, 140 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60f5bec048ea0dfe211160a5
        failing since 55 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-19T18:02:56.799107  >n_pipes || !display->pipes[pipe].enabled)
    2021-07-19T18:02:56.799563  Pipe C does not exist or not enabled
    2021-07-19T18:02:56.811532  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2094:
    2021-07-19T18:02:56.812069  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2021-07-19T18:02:56.812491  Pipe D does not exist or not enabled
    2021-07-19T18:02:56.824283  Test requirement not met in function<14>[  =
160.071232] [IGT] kms_vblank: executing
    2021-07-19T18:02:56.824785   igt_require_pipe, file ../lib/igt_kms.c:20=
94:
    2021-07-19T18:02:56.836462  Test requirement<14>[  160.081656] [IGT] km=
s_vblank: starting subtest pipe-A-ts-continuation-suspend
    2021-07-19T18:02:56.841956  : !(pipe >=3D display->n_pipes || !display-=
>pipes[pipe].enabled)
    2021-07-19T18:02:56.855319  Pipe E does not exist or not enabled =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.invalid: https://kernelci.org/test/case/id/=
60f5bec048ea0dfe2111613a
        failing since 6 days (last pass: renesas-next-2021-07-08-v5.13-rc1,=
 first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-19T18:01:08.121084  Subtest invalid-clone-single-crtc-stealing:=
 SUCCESS (0.000s)[0m<8>[   66.512674] <LAVA_SIGNAL_TESTSET STOP>
    2021-07-19T18:01:08.121315  =

    2021-07-19T18:01:08.153465  <8>[   66.549765] <LAVA_SIGNAL_TESTSET STAR=
T kms_vblank>
    2021-07-19T18:01:08.194817  <14>[   66.584629] [IGT] kms_vblank: execut=
ing
    2021-07-19T18:01:08.195052  IGT-Version: 1.26-gcd63c83 (arm) (Linux: 5.=
14.0-rc2 armv7l)
    2021-07-19T18:01:08.208044  <14>[   66.591108] [IGT] kms_vblank: starti=
ng subtest invalid
    2021-07-19T18:01:08.208274  Starting subtest: invalid
    2021-07-19T18:01:08.219805  (kms_vblank:504) CRITICAL: Test assertion f=
ailure function inval<14>[   66.606304] [IGT] kms_vblank: exiting, ret=3D98
    2021-07-19T18:01:08.220063  id_subtest, file ../tests/kms_vblank.c:484:
    2021-07-19T18:01:08.232858  (kms_vblank:504) CR<8>[   66.619952] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dinvalid RESULT=3Dfail> =

    ... (1 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/60f5b7d2f352d642d31160d2

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60f5b7d3f352d642d311615a
        failing since 6 days (last pass: renesas-next-2021-07-08-v5.13-rc1,=
 first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-19T17:33:37.262094  <6>[   79.479085] Console: switching to col=
our dummy device 80x25
    2021-07-19T17:33:37.267176  <14>[   79.485800] [IGT] kms_vblank: execut=
ing
    2021-07-19T17:33:37.282612  IGT-Version: 1.26-gcd63c83 (aarch64) (Linux=
: 5.14.0-rc2 aarch64)<14>[   79.492540] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-19T17:33:37.284719  =

    2021-07-19T17:33:37.287813  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-19T17:33:37.364633  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-19T17:33:37.394555  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-19T17:33:37.401541  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Jul 19 17:32:22 2021
    2021-07-19T17:33:37.414761  <6>[   79.633396] PM: suspend entry (deep)
    2021-07-19T17:33:37.419786  <6>[   79.637781] Filesystems sync: 0.000 s=
econds =

    ... (124 line(s) more)  =

 =20
