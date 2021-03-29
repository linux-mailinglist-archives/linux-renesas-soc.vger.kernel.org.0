Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B64834D722
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 20:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhC2S3m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 14:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhC2S3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 14:29:22 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F29C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:29:21 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t140so2620317pgb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VnCXO2GQYefRbwuj12pOdFyME5WvmEz2ORwKZjpJv6E=;
        b=rziZV36+u6i2ZNcF2JhEXOvfsWBhryw9Ya5tdA+ZSHd5OIYRA5qioVKlbQKAqYvEv1
         iIvMdZ2HEbg6+zsqAYo0Y4mqhRkshCaGmgfrCNAQ0YnacabqeR1MSGnQiLeY4OFjjhLg
         cKPkGB992lPeCCZLCSoNDFLT4aZcc7mafJIhvkz3dFmLaSfSEqpFk4/Bhen9PonP2QOC
         1Tj4TqXRI4S4DNYd9rhReJxKleh6SdZBfVrd6t4ZId6cK5JIuFIVK8ZqjJ9FOty5EG/L
         kOQuMBvJt7nDylqQrqgbokl+2ICK9uWvY05JcQciFlPZUPPWGqve5qhOW1rO3h/i8oZ4
         sCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VnCXO2GQYefRbwuj12pOdFyME5WvmEz2ORwKZjpJv6E=;
        b=m3QlOlIi+d7aYXKL29/STTNvPfw2GzlFGPA0jZFr/9ftTS0sK5VL1kUcRNfYY0OEf5
         wRhXkmWiQnRFsJJuxpcEZW2adRL0lvtewnvEj4zHrE+6F2eQKhntJBXKY7PONhJD3u4i
         RcQgC0eE15U4qZiyFCrccMS5UyrmUO+m8Iz03/t1VGttS6FrSug0sekXuqfuWyjPGhDw
         BBx34keb7+z/VtBuiCMKB9vzHzPbWr2Wo12BkJYG5acLRnXvehk+wSLtHCd7J3ZieHxa
         8mt28FIwxxMhK6Gd7cspbe99GG8/S62VHXIv/noWG5Vv2Q0+rB/vwAqb2qSAJnN0PomE
         G6tw==
X-Gm-Message-State: AOAM532f/Qpd19/tegqkqmrr69GGf/GqBHXYZlsULg+GWszxolXMV3tN
        ZoOjmpyXZUYJPFNWsHkhp9Hb+0nKR7DMjmna
X-Google-Smtp-Source: ABdhPJwuZ3AILxeuXB01plGEsngmMoIDHxNWDaJ5jTOBwXKx+34FGpi7p7iP/rr/nUkUmoUVazJykA==
X-Received: by 2002:a63:5857:: with SMTP id i23mr24837397pgm.152.1617042560926;
        Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a18sm12999957pfa.18.2021.03.29.11.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
Message-ID: <60621c80.1c69fb81.ed78b.0135@mx.google.com>
Date:   Mon, 29 Mar 2021 11:29:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-29-v5.12-rc5
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-03-29-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-03-29-v5.12-r=
c5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-29-v5.12-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-29-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb48e88392ae845729086cf17d765fd2a3a60f2a =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/606210bf7f1ca987f9af02ba

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/606210bf7f1ca987f=
9af02bd
        failing since 5 days (last pass: renesas-devel-2021-03-22-v5.12-rc4=
, first fail: renesas-devel-2021-03-24-v5.12-rc4)

    2021-03-29 17:34:07.838000+00:00  <6>[   19.725601] PM: suspend entry (=
s2idle)
    2021-03-29 17:34:07.838000+00:00  <6>[   19.730178] Filesystems sync: 0=
.000 seconds
    2021-03-29 17:34:07.839000+00:00  <6>[   19.736603] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-03-29 17:34:07.839000+00:00  <6>[   19.746064] OOM killer disabled.
    2021-03-29 17:34:07.840000+00:00  <6>[   19.749958] Freezing remaining =
freezable tasks ... (elapsed 0.001 seconds) done.
    2021-03-29 17:34:07.840000+00:00  <6>[   19.759665] printk: Suspending =
console(s) (use no_console_suspend to debug)
    2021-03-29 17:34:59.841000+00:00  <6>[   19.774165] rk_gmac-dwmac ff290=
000.ethernet eth0: Link is Down
    2021-03-29 17:34:59.841000+00:00  <6>[   43.991949] vcc_flash: disabling
    2021-03-29 17:34:59.842000+00:00  <6>[   43.991955] vcc_host: disabling
    2021-03-29 17:34:59.842000+00:00  <6>[   43.991958] vcc_sd: disabling =

    ... (141 line(s) more)  =

 =20
