Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A0945F73D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 00:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhKZXnd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 18:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhKZXlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 18:41:32 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7147DC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 15:38:19 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id p13so2585647pfw.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 15:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hfLx5n2d1gEQKBVeB9pn6FLcsxhFkCypQ9bHG5ftMkE=;
        b=sRnjNq6VNyNWHnZMobAcV4TVxakYDU+ILh1wZ8P7ixXm7HWCld/eBHMKnMJcjk/TFF
         yKHkJSAXKw1guwN+Kn10v9Y0hkAAzG3jCZ8u1+8689OYI2opBG/UZD/A39Ds59+jSkqV
         3tltoNj/lff/kjGDVzjATlMA2dLNK+xKdTOOqdjM7XHtoad9tBwm5C8F2VQgZLtgOrJt
         JUDayEeNUS3IpYau8p40vpx5Hq7Tq+SGn9yNWJ09EBEsmqJT+fdepc0HT3tdx4/QbAiS
         LzHCVB1OqfIajQBdTa0i5oiJslYvsJI+McMn5FRw7PLB2SIMeYtC+iRR2wFhFqoVykga
         6tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hfLx5n2d1gEQKBVeB9pn6FLcsxhFkCypQ9bHG5ftMkE=;
        b=6SAsC5haTe5SWzkp5ZwcnHKtJhRQFM5VMb8z7JHYPfyXyiA2uDWuY+RlYqTQImOcqn
         NcH+L/yjoxkM/RtEkTTJg2FuGyf3EYRu+SBHzb4rUVq8bKsJf5Qu7ZpvTkv7G20wqZA5
         k0BlKUjw1T256Mq5raCq0hGLrEqIuq0btKfb5kZnB7GHLuTGgksqcyT0kOSBHHN8ZWkK
         vNVSEzBqdpM0rGCxN1uKYJai+ecPjUgAzc+zlBawEaSMyig/vuOm6muqMb3vq0WuaEz3
         Z9X6TYSdgrZjMn3InEck2FpHVQr1vi6GrpuNSfYbOooN9DZEkpdl/FHDIsAzNU/byyCD
         rSfQ==
X-Gm-Message-State: AOAM5305j+j+09/enp/SJxfGhs0tYu+zwa9wXgqRjLU/q5eMgcxPEcdO
        pJzHBLgvmmGM+U5vtPCmt9/NabV82SheOsXT
X-Google-Smtp-Source: ABdhPJxMpJ9LCpWxKIHkpMrK4Ea7wBZZnQihkHHJjZMMMub6RqkwOlCjU0292yVhodnlJJKvdYy5AQ==
X-Received: by 2002:a63:790d:: with SMTP id u13mr9429774pgc.553.1637969898591;
        Fri, 26 Nov 2021 15:38:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 63sm8223423pfz.119.2021.11.26.15.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 15:38:18 -0800 (PST)
Message-ID: <61a16fea.1c69fb81.507d.7aeb@mx.google.com>
Date:   Fri, 26 Nov 2021 15:38:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-26-v5.16-rc1
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-11-26-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-11-=
26-v5.16-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-26-v5.16-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-26-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      aeb0ae2627f78fca02f76bf5cb64d0ea94ff31b1

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2e0355faad5c2e81cd6705b76e529ce526c7c9bf =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61a1629a783cc3d28818f754

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211118.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1a1629a783cc3d28818f7fa
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-26T22:38:59.144468  <8>[   44.125483] <LAVA_SIGNAL_TESTSET STOP>
    2021-11-26T22:38:59.189434  <8>[   44.168817] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-11-26T22:38:59.224572  <6>[   44.203796] Console: switching to col=
our dummy device 80x25
    2021-11-26T22:38:59.230265  <14>[   44.210491] [IGT] kms_setmode: execu=
ting
    2021-11-26T22:38:59.242803  IGT-Version: 1.26-g2e0355f (aarch64) (Linux=
: 5.16.0-rc1 aarch64)<14>[   44.216255] [IGT] kms_setmode: starting subtest=
 basic
    2021-11-26T22:38:59.242985  =

    2021-11-26T22:38:59.245288  Starting subtest: basic
    2021-11-26T22:38:59.249209  Testing: basic 1 connector combinations
    2021-11-26T22:38:59.352313    Test id#1 CRTC count 1
    2021-11-26T22:38:59.358822      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (152 line(s) more)  =

 =20
