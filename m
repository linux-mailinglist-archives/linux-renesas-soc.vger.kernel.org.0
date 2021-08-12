Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0043A3EA7FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 17:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238320AbhHLPve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 11:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238351AbhHLPvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:51:22 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ACBC061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 08:50:57 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so15847850pji.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8epCIjawpejLlk/347S9MkQQPLaYyG8LvV64+JgAe/4=;
        b=v+PfxVKjy11LlEgV3tRvx5Ia0m6XvvsQ+YIiXxYY1kMoLVaKCxLTafrlQjgk92FBwV
         mROB9LF5/3uY0+zVaaiQUNG4uvxMY7cT7YFwbI7QfsRuJl9wwRV9IcIfkGl2TLxwFNJf
         1JZcb76p22ifvQ6i36UZtBDa7+E6GIb0jq7/5at7PkekQFpzDEb1/jJlJwEjErk0jmRk
         wybak6JDNiajwsvm0n3YMgAd0lkO4b48X/uslj8estxE5dUBVp49/UfbmCWpgmjDJsJc
         1lvLNuUdoh544mKIroJY1l4ZMtrN6lcTxeLvkI28mSTBYTwGzby7u+BappjX/HM1mj+o
         K+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8epCIjawpejLlk/347S9MkQQPLaYyG8LvV64+JgAe/4=;
        b=oLyraZ0h3HOGIUjegeLdIzJADzmZMAGG1z2Uh/AbZH/5zH1HF7pACFazLEYKxR1w8t
         oGnGfizAQIM55CmNHbH5qFhO7YHCVL6pJ5MEPsdBIIxka6dD6sSUEN2wYBJq5LxxBnHV
         OzZdtPQ+Z97TLfI58LOHeElPJF9NxOsWZ+pBQaSf5N/vEYFjmy5j3NIn5z7naLIyjQAO
         /VaZPtc0C62Rw53b9uetn1Wxyv5wC04+HbDwU1g9VdDIb4R4u/GhT/LyP1Bj/pFyKf2D
         ifsOh8wNL18wu0izkgIfTTVKu2earhVHVoRD7WWE5NDfI/TDh/+a9UTFsrBcRjdyUI6l
         UpMA==
X-Gm-Message-State: AOAM531rBt9TTY54abOHIzX0RS7tJsjQYOY58Z1bAWs9O1U41v4z8fQN
        id+mh2PrRx+2hMa2wcuH96XeeziNuS1mgyxS
X-Google-Smtp-Source: ABdhPJwSV2IUbuNoSI0m4MfF4BNWHbzCmfe12Wdqeix1jtKUdWraXRwN0rW9XCIArhckksdC9zrjMw==
X-Received: by 2002:a17:902:7b8b:b029:12b:8d3e:70e7 with SMTP id w11-20020a1709027b8bb029012b8d3e70e7mr3982736pll.76.1628783456967;
        Thu, 12 Aug 2021 08:50:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f16sm3883166pfv.73.2021.08.12.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 08:50:56 -0700 (PDT)
Message-ID: <61154360.1c69fb81.a11db.a5e4@mx.google.com>
Date:   Thu, 12 Aug 2021 08:50:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-12-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-08-12-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-08-=
12-v5.14-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-12-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-12-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      59d7f78144a8a34a290ba84931721eaf11e66ca9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4ac7d6bf5dd1d7aae893fafee98a309d357e5bd6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6115308cb3db1636afb1367a

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-12-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6115308db3db1636afb13702
        failing since 30 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-08-12T14:28:54.254661  <6>[   80.009163] Console: switching to col=
our dummy device 80x25
    2021-08-12T14:28:54.259835  <14>[   80.016248] [IGT] kms_vblank: execut=
ing
    2021-08-12T14:28:54.275204  IGT-Version: 1.26-g6135b9c (aarch64) (Linux=
: 5.14.0-rc2 aarch64)<14>[   80.022448] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-08-12T14:28:54.275480  =

    2021-08-12T14:28:54.279800  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-12T14:28:54.353314  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-12T14:28:54.382912  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-12T14:28:54.389024  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Thu Aug 12 14:28:03 2021
    2021-08-12T14:28:54.402498  <6>[   80.159329] PM: suspend entry (deep)
    2021-08-12T14:28:54.407752  <6>[   80.163848] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =

 =20
