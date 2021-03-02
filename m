Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915D832A637
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351322AbhCBOPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377153AbhCBApz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 19:45:55 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A1AC06178B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 16:45:15 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m6so12696360pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 16:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8AuPYIvEqrchHM+w97dxGOSef1bY5CM82nIOzVqlOPc=;
        b=dEx6Z02xqZupUHnsXzdL7kZV0PnUPrCV0onbWMyUduwyp4HLmUDBIge6fHUIdfeXHo
         EOg8VkWFYjx0NDzNsWrnMJ8sRXWqOwtOJTaJRvQmdngR2/bqJuhgwWVeLZoqOjYUa/j8
         o7VVyIei5iDnmt9fAhzNN2Sn4p1Zp/0jhaMr48CfZdMPtT4Au3SNZ7GiSP5ifPwEV0Di
         WlMSVG3exFlxeCDN1cJ5e+Owb8BYB6LR9ZuFZruR6qVsqYjV/UtfbqcJtVbRAWZ2IIT+
         Va8elGezxq3pwrEYbta616Op1Xg+XuXQAB+O9MXyUiJTyafxj0HHzA3sgSJJpNA1ngTJ
         Qsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8AuPYIvEqrchHM+w97dxGOSef1bY5CM82nIOzVqlOPc=;
        b=s5+rR1GoNo1yDvokVpq4zqTWkSqKFSWGSQOh9xcxmvWH6rvcIkc/YzFi3Ael6DUJSg
         jbPaFkFPwNJYcCNWi8IyfKGIue6OMQSAwL2HL8tTK/Mq8tj6cFzcQnATzQXbXm5+ysq3
         WV+My0xF06o4zAOf9YT18zbw4gfHrZGea4pKNczoCEnofYxJoRi0MA9cfp8+cTrkPdPM
         ZEVkNcizUCiYACGZ/UpW9t2D+xjYC/Kee6VYLvejkLf9U7rW/gEzDhCS+atkHxWhocVj
         000CeaKgkl6u5ykjFJxJ05OGaTEWNkMNmRKEQ+JgocrH9p3b2tKHx5h3/mFWWPrQ4vDX
         j+0w==
X-Gm-Message-State: AOAM532ghPoxLa06OTlde3unEQIby/kiqYeccay9nLTSRqZ9xr/o+qQx
        sXFwxyfDWZW0xBfeXZZnQ9IbEDVsegJN0Q==
X-Google-Smtp-Source: ABdhPJwNhBxy+vJ6PeVVkSp2xqoxH5gx0M7nwXzGlW/JWDRBYzXFqEDQP1QnYrtyVnf7Zd/DbClH6w==
X-Received: by 2002:a63:9a41:: with SMTP id e1mr12582910pgo.288.1614645914479;
        Mon, 01 Mar 2021 16:45:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 14sm19190929pfo.141.2021.03.01.16.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:45:14 -0800 (PST)
Message-ID: <603d8a9a.1c69fb81.9827f.dd23@mx.google.com>
Date:   Mon, 01 Mar 2021 16:45:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-12-g3158164f1526
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 2 runs,
 3 regressions (v5.12-rc1-12-g3158164f1526)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 3 regressions (v5.12-rc1-12-g3158164=
f1526)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 3        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc1-12-g3158164f1526/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc1-12-g3158164f1526
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3158164f15266c9acdb4d53ec2df89b4723dcde7

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


  Details:     https://kernelci.org/test/plan/id/603d7a80aa424375b9addccf

  Results:     77 PASS, 19 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc1-12-g315=
8164f1526/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210301.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-idle: https://kernel=
ci.org/test/case/id/603d7a81aa424375b9addd55
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)

    2021-03-01 23:35:58.124000+00:00  Pipe D does not exist or not enabled
    2021-03-01 23:35:58.132000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:1910:
    2021-03-01 23:35:58.140000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-03-01 23:35:58.144000+00:00  Pipe E does not exist or not enabled
    2021-03-01 23:35:58.154000+00:00  Test requirement not met in function =
igt_<6>[  142.033395] Console: switching to colour dummy device 80x25
    2021-03-01 23:35:58.158000+00:00  require_pipe, file ../lib/igt_kms.c:1=
910:
    2021-03-01 23:35:58.165000+00:00  Test requirement: !(p<14>[  142.04348=
1] [IGT] kms_vblank: executing
    2021-03-01 23:35:58.171000+00:00  ipe >=3D display->n_pipes || !display=
->pipes[pipe].enabled)
    2021-03-01 23:35:58.180000+00:00  Pipe <14>[  142.056545] [IGT] kms_vbl=
ank: starting subtest pipe-B-ts-continuation-idle
    2021-03-01 23:35:58.183000+00:00  F does not exist or not enabled =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/603d7a81aa424375b9addd58
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)

    2021-03-01 23:36:03.458000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-01 23:36:03.465000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-01 23:36:03.466000+00:00  Stack trace:
    2021-03-01 23:36:03.471000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-01 23:36:03.474000+00:00    #1 [igt_wait_for_vblank+0x4c]
    2021-03-01 23:36:03.477000+00:00    #2 [<unknown>+0xb05222e0]
    2021-03-01 23:36:03.480000+00:00    #3 [<unknown>+0xb0522ac8]
    2021-03-01 23:36:03.483000+00:00    #4 [<unknown>+0xb0522d80]
    2021-03-01 23:36:03.486000+00:00    #5 [<unknown>+0xb0521acc]
    2021-03-01 23:36:03.492000+00:00    #6 [__libc_<14>[  147.369788] [IGT]=
 kms_vblank: exiting, ret=3D98 =

    ... (57 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/603d7a81aa424375b9addd5a
        new failure (last pass: renesas-next-2021-01-29-v5.11-rc1)

    2021-03-01 23:36:06.702000+00:00  <14>[  150.586187] [IGT] kms_vblank: =
executing
    2021-03-01 23:36:06.717000+00:00  IGT-Version: 1.25-g2107b0a (aarch64) =
(Linux: 5.12.0-rc1 aarch64)<14>[  150.593172] [IGT] kms_vblank: starting su=
btest pipe-B-ts-continuation-modeset
    2021-03-01 23:36:06.718000+00:00  =

    2021-03-01 23:36:06.723000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-03-01 23:36:07.636000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:42=
40:
    2021-03-01 23:36:07.645000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-03-01 23:36:07.652000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-03-01 23:36:07.653000+00:00  Stack trace:
    2021-03-01 23:36:07.659000+00:00    #0 ../lib/igt_core.c:1726 __igt_fai=
l_assert()
    2021-03-01 23:36:07.662000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (61 line(s) more)  =

 =20
