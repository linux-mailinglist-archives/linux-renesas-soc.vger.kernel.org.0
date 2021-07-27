Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C788A3D838D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 00:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhG0W7o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 18:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhG0W7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 18:59:44 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BADC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id m1so2275391pjv.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NVGmxq8pGa0ZFvCInHye7DG8OvNc8FAoV6vMHpiDsDU=;
        b=KZuGkMTlvHO/6pdWs2OX10r3M4PkYWYHTsZmbWAr2c8z1TUmFvQbsWUaiB2mX3DESG
         m0Vt8FjvdG5wcpPorfIOOCl7F1G0n9Ry0mjn4mrBlIls1iEOQZpdmavHQHihAj/PVz2M
         860Zq9tad9apjDuLlgzaNQhrIQzEfWp7Ouw8HiEETa/wrNNTug/RjTlRHuzTmZNJlzEV
         0Z1dRiLb7h4WzhNprG10f0m39rb8iI9pZLgIqvCSImtqFekXhL5sYQdGmHRzKK+brCDU
         BOyUTqe2IRX0V5iofWhfooIs64VilxKe0AXBsyNmAGR1IAL2d8nhR2A3LKVeaZgks/Jo
         E+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NVGmxq8pGa0ZFvCInHye7DG8OvNc8FAoV6vMHpiDsDU=;
        b=XCqgrh0z39M1hy8T+aEGHcLRYT1zfKAoScAymc52s4APAs1FaJQHDNsN74mjAW5spD
         d3ISOXUo1Cdf/nXcNYKZ73ByK2UZQRI0dJTAACPzlssnV3GoW8iR/ul6enOQ2qEX7Sk8
         6Kw6HUB7BvCvq5zqcgiA6Qud+eLDZ0t09nIEQgFE4PM4yArLzsWHeb4smLsz7APOxtZR
         ITCHNJEx4S6rMRV0O63FWAyaqgtIHH5JGhmXj3Db5YnbN72csAGz32R/Rdme2ytiWdBS
         ogI1I9LZ+98BFL/50t3zyI6EWhDjd5psCbhzfBCyw62qzjruVyvibEFUxRLWGkIhoCq3
         MHmw==
X-Gm-Message-State: AOAM531FRPxrwpDABdcQInH+WfEdgMUVQ5XromSaOd/drFrNfHigWKA+
        /WCdM106hn8ABst7cYq8eUyzwOS2YY6qr1Sw
X-Google-Smtp-Source: ABdhPJxw3msRRW8idQtywJeUQ+A5iSSJb9G/cou4G3yrahFAxsR3avx5qVaaXVkpN7xxVTJg4YLRig==
X-Received: by 2002:a17:90a:3489:: with SMTP id p9mr13216111pjb.4.1627426783439;
        Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9sm4920945pfd.100.2021.07.27.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
Message-ID: <61008fdf.1c69fb81.1de2f.0024@mx.google.com>
Date:   Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-07-27-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-07-=
27-v5.14-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b1f6bead1fb4976611429f459a1865daadedbb48

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  87a68fe9e49605d200ab2604e45b8a9d868d1922
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f3994c2cd99a1acfe991a8cc838a387dcb36598a =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/610083faaf4afc8b665018db

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210722.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/610083faaf4afc8b66501963
        failing since 14 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-27T22:07:20.514475  <6>[   84.318543] Console: switching to col=
our dummy device 80x25
    2021-07-27T22:07:20.519039  <14>[   84.325297] [IGT] kms_vblank: execut=
ing
    2021-07-27T22:07:20.525026  IGT-Version: 1.26-gf3994c2 (aarch64) (Linux=
: 5.14.0-rc2 aarch64)
    2021-07-27T22:07:20.535316  <14>[   84.338145] [IGT] kms_vblank: starti=
ng subtest pipe-A-ts-continuation-suspend
    2021-07-27T22:07:20.540451  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-27T22:07:20.616327  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-27T22:07:20.643017  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-27T22:07:20.649379  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Jul 27 22:05:43 2021
    2021-07-27T22:07:20.662558  <6>[   84.469783] PM: suspend entry (deep)
    2021-07-27T22:07:20.667931  <6>[   84.474183] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =

 =20
