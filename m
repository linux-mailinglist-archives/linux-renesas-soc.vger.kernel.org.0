Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3043E5036
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 02:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbhHJAFy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 20:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhHJAFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 20:05:53 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADED9C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 17:05:32 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id oa17so5661164pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 17:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=imj3/8IHvEUTduXobXpRMQ1w76ObM4q33X64Gmb0VNI=;
        b=tVTpE3GhEA9pwgPEz/B1pCu5HRax30udl6RbL9moXgM72KdibLZQmMpf1bwijUK2xn
         XiK/iyXGJfCw/jpqx9OzAO9WJvUsl0D2FB+1UyRcDaP8CZabHBzbGSXesjVirsW5rdP3
         lY0ojID1z7JmKKVKIOV6VXIDb4975KVAIBYZAYrOpORzlAeNBl7hbdpVxnx0jTjusRJP
         /4IMCpSiQkzHdBmnwtYrbgaMuaOiRKvMXLLFrNomL+lo/XwEOo51n91Q9POQ4p2H5M6o
         RjFPQN/ocbNgqmHp9ow+i5p5LPfKcYo34UUiVW8Ilt1zAOryEsW9e7fniNy/f0pBgJDQ
         oDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=imj3/8IHvEUTduXobXpRMQ1w76ObM4q33X64Gmb0VNI=;
        b=jS9lv9FhPXV6a9Kcv1AAy55xbSXswYo2n4yyqZkV0/1PCOLbuM+OaIBONd3+XzXOlE
         TrLW8Ih+LJqRGb3KW1ilYfTxTM3kcx1TZzY+5uSw1Rt8VqtdSpt6JhVBbyjdSZLaGeR7
         hVm24jRGha/6DkVLMehb+8jchCnF8aGptG5PDB+hHkHl+zXuHfk1uT7OVLsujyEzd8JS
         x49i39SIpmGC5SAz8/5aPUDdVtXxJk+8Tbpqut+c4a/7CkiyATpN7eILJyyD7g/iBsEq
         /TmcFpcJWAoTwR2Wh8FyDXgVYKnS4hPk2mCytcl/FBQel+Z+33a8q2sFSEzfR2V4XmoV
         Dk/A==
X-Gm-Message-State: AOAM5326K0Fj1NYG56k7OvOG1MvNQIH+UnSYmaO/HFkTM7SixhgTjg9j
        qfILnQTaeTabNgyNTr2GHNyYPqrywcXUBlKy
X-Google-Smtp-Source: ABdhPJxTGn5cQ/AXdmKBT+4wQuyPnnnKIdQaxH6I+nEefxu/7iG53uBoDQRLNTazoHlDeLzyQwCb+A==
X-Received: by 2002:a17:902:8301:b029:12c:d401:1b52 with SMTP id bd1-20020a1709028301b029012cd4011b52mr14667992plb.10.1628553932019;
        Mon, 09 Aug 2021 17:05:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g1sm24232709pgs.23.2021.08.09.17.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 17:05:31 -0700 (PDT)
Message-ID: <6111c2cb.1c69fb81.8eaeb.8be1@mx.google.com>
Date:   Mon, 09 Aug 2021 17:05:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
X-Kernelci-Report-Type: test
Subject: renesas/next igt-kms-rockchip: 2 runs,
 2 regressions (renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 2 regressions (renesas-next-2021-07-=
27-v5.14-rc1-14-g57ec7ff3f83a)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1-14-g57ec7ff3f83a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4ac7d6bf5dd1d7aae893fafee98a309d357e5bd6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6111b064e811c435bbb13668

  Results:     89 PASS, 3 FAIL, 38 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/igt-kms-rockchip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm/multi_v7_defconfig/gcc-8/lab-collabor=
a/igt-kms-rockchip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6111b064e811c435bbb13687
        failing since 76 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-09T22:40:14.343441  <14>[  157.089683] [IGT] kms_vblank: execut=
ing
    2021-08-09T22:40:14.343680  IGT-Version: 1.26-g6135b9c (arm) (Linux: 5.=
14.0-rc2 armv7l)
    2021-08-09T22:40:14.355574  <14>[  157.096198] [IGT] kms_vblank: starti=
ng subtest pipe-A-ts-continuation-suspend
    2021-08-09T22:40:14.355815  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-09T22:40:14.449131  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-09T22:40:14.483680  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-09T22:40:14.483921  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Aug  9 22:40:30 2021
    2021-08-09T22:40:14.501429  <6>[  157.250678] PM: suspend entry (deep)
    2021-08-09T22:40:14.501668  <6>[  157.255067] Filesystems sync: 0.000 s=
econds
    2021-08-09T22:40:14.515454  <6>[  157.260777] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done. =

    ... (95 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6111ad08400be24a45b13704

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/igt-k=
ms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1-14-g57ec7ff3f83a/arm64/defconfig/gcc-8/lab-collabora/igt-k=
ms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6111ad08400be24a45b1378c
        failing since 27 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-09T22:30:56.084896  <8>[   79.394225] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-ts-continuation-dpms-suspend RESULT=3Dpass>
    2021-08-09T22:30:56.118263  <6>[   79.431174] Console: switching to col=
our dummy device 80x25
    2021-08-09T22:30:56.122994  <14>[   79.437884] [IGT] kms_vblank: execut=
ing
    2021-08-09T22:30:56.137685  IGT-Version: 1.26-g6135b9c (aarch64) (Linux=
: 5.14.0-rc2 aarch64)<14>[   79.444054] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-08-09T22:30:56.137934  =

    2021-08-09T22:30:56.142972  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-09T22:30:56.218655  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-09T22:30:56.244479  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-09T22:30:56.251769  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Aug  9 22:27:18 2021
    2021-08-09T22:30:56.265015  <6>[   79.580084] PM: suspend entry (deep) =

    ... (126 line(s) more)  =

 =20
