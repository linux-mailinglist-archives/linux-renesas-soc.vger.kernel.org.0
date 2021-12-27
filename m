Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFAB48048D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Dec 2021 21:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhL0Ufb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Dec 2021 15:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhL0Ufb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Dec 2021 15:35:31 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11ABC06173E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 12:35:30 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so19447132pjj.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XfUzaH/3sauYILrHi+bAmLxYIw3KzVPhvsRKUM/S5nY=;
        b=k1/3TID6rNAZ+qiTAKqflsHfU3vrFOxgYtj0aFJYV9LUFvu1ULptfOFlk7mesNNRoU
         Pev7hUkda9AXI5+ada8u3f1pbGdJxymeoUVcrUseCTXc4Geyo0oOkkFJpeDBuAsJGPjR
         ZC8ormQ8ZXSF7cLG6hHYmMwwFmfsu4eGpQlbYOVaoKOa37ZIkES4y9xZDZZzTS0XKinZ
         Xtwrd51QmaLsEBGiAouzfbfqjmX0PY/0IRTc0qnMNaVgzGR7IBswTBjg5h8oDPbNwYFz
         PZxg+ursmd/5Wlb3QKnzblUvL6ygX3aUGBCfDGtlOvywaPJLcd9vtdl8gu7dD49RXBNx
         SxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XfUzaH/3sauYILrHi+bAmLxYIw3KzVPhvsRKUM/S5nY=;
        b=Zs/P8Xu1DY9XT/MDWpT+c70LiIZgP5dv2SeQYeLcJ3CRrOBcdADRTl4qkeZUQurv85
         R/KbPlc2iUsO3azEzgf5s/AsLD9tZrilCFMFDpJEUSCnZGpo5SMEttMDBXYdRhRqEHds
         vjdOvyK1Odg9hcRLKm3CHcHbadQKeMzD/PF/dncyTrPF2mkgJNkacOyZMsO0X5l00gT+
         qRBZqE/UB9xF2hLSpPYA9DUQyJkr2LQXJsYpMQFz9zke1bG+N0VMA5fR0KLDVmHbgKq0
         rhysaDYduU87MGXAsezRsbkG4WHH+T25K2t6ul2jldKxexjfHYtPwrwY8lrcauR1uvYW
         Sf6g==
X-Gm-Message-State: AOAM532MJMN1VDJot70nUN0cw1fKCkIgKDFiJF0SpKVmxYLK25k5+Yg8
        Jyv1N2MY6Yq0ufB9b+IWnuMPY94ntZR9ezVG
X-Google-Smtp-Source: ABdhPJxnpIgV+KXoxsSF1fay7oao//EbvAfcRtSZ0y0RJJjcwhRFwV6Dzdk8B61ppC0AuNtzC7hMDA==
X-Received: by 2002:a17:90a:458d:: with SMTP id v13mr664715pjg.202.1640637330430;
        Mon, 27 Dec 2021 12:35:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d4sm18740637pfj.78.2021.12.27.12.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 12:35:30 -0800 (PST)
Message-ID: <61ca2392.1c69fb81.6bc20.4ab0@mx.google.com>
Date:   Mon, 27 Dec 2021 12:35:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-27-v5.16-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 7 runs,
 1 regressions (renesas-devel-2021-12-27-v5.16-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 7 runs, 1 regressions (renesas-devel-2021-12-27-v5.16=
-rc7)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-27-v5.16-rc7/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-27-v5.16-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70c9b40ad59ce28a6c668a48cc12f21ebf81aeba =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61ca0b816ae89511bd397128

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61ca0b816ae89=
511bd397132
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5)

    2021-12-27T18:51:25.265508  rtcwake: assuming RTC uses UTC ...
    2021-12-27T18:51:25.272051  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Dec 27 18:51:31 2021
    2021-12-27T18:51:25.284711  <6>[   29.649878] PM: suspend entry (s2idle)
    2021-12-27T18:51:25.288003  <6>[   29.653926] Filesystems sync: 0.000 s=
econds
    2021-12-27T18:51:25.298036  <6>[   29.658499] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-12-27T18:51:25.301235  <6>[   29.667167] OOM killer disabled.
    2021-12-27T18:51:26.398109  <6>[   29.670657] Freezing remaining freeza=
ble tasks ... (elapsed 1.052 seconds) done.
    2021-12-27T18:51:26.404452  <6>[   30.767821] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-12-27T18:51:30.834840  <6>[   30.848896] ACPI: EC: interrupt block=
ed
    2021-12-27T18:51:30.838168  <6>[   34.908646] ACPI: EC: interrupt unblo=
cked =

    ... (3 line(s) more)  =

 =20
