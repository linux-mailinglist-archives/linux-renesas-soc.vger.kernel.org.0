Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2749477B35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 19:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbhLPSCL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 13:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237874AbhLPSCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 13:02:11 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEB2C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:11 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id y7so20102668plp.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GtxZIuPyVafhh7hcimXUV3cgpwSe7G7xEMxO695UvIw=;
        b=5ZKXiSV7OXxscZeYFr+uaiVlXaXOc5CsKXKI32Z44akqYN4s9tKPkVHEz7DNNyt55c
         QR3/lm4Y1JShz3MUhlI12UvNaP2K7b5Oru8BWE2gv6biPdjVmeUue3wFI4T9GXWy6eai
         ajmIzIu5wdKUc+Qaovi85MPwrHZllsMH31noqGdvE5G6h1GolhQqxFejGtXDPxOPhwAX
         DJkRm3BaWGl1IRWAZKvlWJVQG7EMFeFi6KOLMC3/KILOh/tX2zm1wdD6rXdBVkl95C2q
         EhH2kvnI0Tzg7xC2SZ5woBwDkXIvurMJ0SfOesj1OKkfDEB9w5jpc/9CIaH6LzW0VbxA
         VAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GtxZIuPyVafhh7hcimXUV3cgpwSe7G7xEMxO695UvIw=;
        b=xClS7IQk/LV0b9Lhk5PLV058e/sFG9/hd5NnAyKEuBlKkDTy9RM9mIpxZOUfrfRqG3
         iuH4LNHGpK92gC8z+lwdXYhPweghkTspPDAg63LLpUvm2kNOeCm/XadqFsrfJ2CBFth4
         F3s0JKnoEPKdG1c3Nco9ariSrx9HHfjBhGxBQHTps4w8n4ceY/dDFS5kCtan+ADNRo/I
         HLhnX0NUxEmaujSoL5g08gMNeLaRfukgs7z36+k0wO0eCiLrBnnq60Y/zWDh1NU265FV
         PgvkUtNECS20UDKLjWce6TAOb+IaIGRYtSz2KvBjGFmNfvn4nT7nkvPvWetJmMP470iD
         7DOw==
X-Gm-Message-State: AOAM530noijGuisbDmB+tDWm680YFl5GNRvggErWhJKeopgzBANDcr6o
        vRGIFHYF6yv8B8rr6xAbw584EHqopW61TnSy
X-Google-Smtp-Source: ABdhPJy3Y0Dza3tZLURm+IuRpRRFIawJYzr6tTZaKfWSsDasXiMiVUVj5zyx7yRY5tHgwhrtgm6I1Q==
X-Received: by 2002:a17:902:f781:b0:148:ada1:e913 with SMTP id q1-20020a170902f78100b00148ada1e913mr8371930pln.97.1639677730357;
        Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gf4sm5768247pjb.56.2021.12.16.10.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Message-ID: <61bb7f22.1c69fb81.3c92a.fce8@mx.google.com>
Date:   Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-16-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 6 runs,
 1 regressions (renesas-devel-2021-12-16-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 1 regressions (renesas-devel-2021-12-16-v5.16=
-rc5)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-16-v5.16-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-16-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b33e75b3e597788be243c04aba22d39431b9ecfb =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb66fe43ea45dba139713e

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61bb66fe43ea4=
5dba1397148
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5)

    2021-12-16T16:17:46.927582  rtcwake: assuming RTC uses UTC ...
    2021-12-16T16:17:46.934173  rtcwake: wakeup from \"freeze\" using rtc0 =
at Thu Dec 16 16:17:52 2021
    2021-12-16T16:17:46.945409  <6>[   28.785274] PM: suspend entry (s2idle)
    2021-12-16T16:17:46.948477  <6>[   28.789324] Filesystems sync: 0.000 s=
econds
    2021-12-16T16:17:46.958622  <6>[   28.793997] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-12-16T16:17:46.961776  <6>[   28.802348] OOM killer disabled.
    2021-12-16T16:17:47.968929  <6>[   28.805836] Freezing remaining freeza=
ble tasks ... (elapsed 1.046 seconds) done.
    2021-12-16T16:17:47.975469  <6>[   29.813310] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-12-16T16:17:52.495529  <6>[   29.894396] ACPI: EC: interrupt block=
ed
    2021-12-16T16:17:52.498955  <6>[   34.053742] ACPI: EC: interrupt unblo=
cked =

    ... (3 line(s) more)  =

 =20
