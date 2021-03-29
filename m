Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFC34D720
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 20:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhC2S3l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 14:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbhC2S3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 14:29:22 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA388C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id t20so4811014plr.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nosDFkMlBoQhMAq3IPiKf09bIT19JnThVgyC684FwFw=;
        b=fgg8JqOdeJKvYRQzeKKOt4qs9hoS89BSSNK/NFskQ/8ukhio62hMzQix4Fkimq9SDw
         X7WFrIhUG780JIzHvLc12zZcQAA2ObDLUKggFH2v1TXM+2LuN0i8eogNQe2FD8ogdwo0
         IkvYRg6GzVWzEOWE2G2dWZkN/aTJHioSUBWk7FyRCBea/pQQZTWsZtNcTazEe2iDSR9z
         EUI8lLpC3gfKUNgpgeW1AjhqWTwFxf8UmB18t5Q0/VPT/ujcLGiPZqHsX/ZnAWCJ5CWk
         i+qKWud0fRP70uAT7Shf50A8S1WMb+3C5jBd6xi9R0XJq2oVpiJm30PN1JNs9TDQ7Zdr
         L8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nosDFkMlBoQhMAq3IPiKf09bIT19JnThVgyC684FwFw=;
        b=ohojTbPR0lTfa+i2lXmDBs1/THkI329Cu7mIk8PthZkHzZTQqd0wWRVx8+TI/zL+9l
         g9sgpFCz2otBJPWOzzPwtrAt21Q+q45jo0CJtvY8g1eJG1NWtjC0RycAd4z1SILcBV8u
         +/7jvPm41qgevwa+95gxiW4lIx3/UvJJAUA6vL/Yy+QfPaQs1YvnsIBpfW+Jql6zGlmb
         r7KW6HnEVE5v/H3U1PeOZh9hdgyuO9lo/BO/CRM4ZhCKZvGnGI+/1Tq7m+SI8MEkj/cq
         an7u8HLaTb3FCaOrdNqnniVOt7dA0YKIsCXxJS0qLws+BFV3P6e8Iwegl7VDMeN9WkFN
         nG6w==
X-Gm-Message-State: AOAM531v7ykYtKkmOrNs9Bnw5kWn7P6NYVYvadz4vvER1s64T5oIRscA
        2gMiwYa68c+cRUMBtv/SWnJzWqKD2IxAVbm5
X-Google-Smtp-Source: ABdhPJw4HGF9EfnOMInl7X1ETXoS1ZmJTSThg2O8uytMlefu8ZS1kdG+s0ZptyLRsht0Wid+/ttiXg==
X-Received: by 2002:a17:90a:e28c:: with SMTP id d12mr394686pjz.167.1617042560190;
        Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a7sm17347015pfo.105.2021.03.29.11.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 11:29:19 -0700 (PDT)
Message-ID: <60621c7f.1c69fb81.5c77f.bb33@mx.google.com>
Date:   Mon, 29 Mar 2021 11:29:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-29-v5.12-rc5
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 3 regressions (renesas-devel-2021-03-29-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 3 regressions (renesas-devel-2021-=
03-29-v5.12-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-29-v5.12-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-29-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb48e88392ae845729086cf17d765fd2a3a60f2a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  7d6a1759900ffde0a7aac2fa0cbd7c2bf4989476
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f3fd2cc23455929d0ef276e05e02416b86a6db91 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:     https://kernelci.org/test/plan/id/60620c1db86be95ed5af02c0

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210315.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/60620c1db86be95ed5af0346
        failing since 21 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-29 17:18:50.815000+00:00  Pipe D does not exist or not enabled
    2021-03-29 17:18:50.823000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-29 17:18:50.831000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-29 17:18:50.835000+00:00  Pipe E does not exist or not enabled
    2021-03-29 17:18:50.847000+00:00  Test requirement not met in function =
igt_require_pipe, fi<6>[  146.764288] Console: switching to colour dummy de=
vice 80x25
    2021-03-29 17:18:50.849000+00:00  le ../lib/igt_kms.c:1910:
    2021-03-29 17:18:50.858000+00:00  Test requirement: !(pipe >=3D display=
-><14>[  146.777203] [IGT] kms_vblank: executing
    2021-03-29 17:18:50.862000+00:00  n_pipes || !display->pipes[pipe].enab=
led)
    2021-03-29 17:18:50.872000+00:00  Pipe F does not exist<14>[  146.78999=
8] [IGT] kms_vblank: starting subtest pipe-B-ts-continuation-idle
    2021-03-29 17:18:50.874000+00:00   or not enabled =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60620c1db86be95ed5af0349
        failing since 21 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-29 17:18:55.217000+00:00  <6>[  151.140032] Console: switching =
to colour dummy device 80x25
    2021-03-29 17:18:55.223000+00:00  <14>[  151.147150] [IGT] kms_vblank: =
executing
    2021-03-29 17:18:55.238000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc5 aarch64)<14>[  151.153379] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-dpms-suspend
    2021-03-29 17:18:55.239000+00:00  =

    2021-03-29 17:18:55.243000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-03-29 17:18:56.169000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-29 17:18:56.179000+00:00  (kms_vblank:781) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-29 17:18:56.186000+00:00  (kms_vblank:781) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-29 17:18:56.187000+00:00  Stack trace:
    2021-03-29 17:18:56.192000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert() =

    ... (63 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60620c1db86be95ed5af034b
        failing since 21 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-03-29 17:18:59.401000+00:00  <14>[  155.326618] [IGT] kms_vblank: =
executing
    2021-03-29 17:18:59.416000+00:00  IGT-Version: 1.25-gf3fd2cc (aarch64) =
(Linux: 5.12.0-rc5 aarch64)<14>[  155.333713] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-29 17:18:59.417000+00:00  =

    2021-03-29 17:18:59.422000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-29 17:19:00.357000+00:00  (kms_vblank:787) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-29 17:19:00.367000+00:00  (kms_vblank:787) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-29 17:19:00.374000+00:00  (kms_vblank:787) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-29 17:19:00.376000+00:00  Stack trace:
    2021-03-29 17:19:00.380000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-29 17:19:00.383000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
