Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5852942A3E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbhJLMJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236368AbhJLMJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:33 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B922C061753
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:31 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e7so13703522pgk.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gURghvRWNoA++o2VFeVcVYw4TbRESAtmR/5Dm1UqSbk=;
        b=AIEiNJvMbVLffm0cTU2EXRLjd46/i3JhNuEYCnQEd208t5hNzE58FtGZ/YG+eCZOfS
         oLW/SSr8gvCSC2vxNa/t0hMJuD4xtQQuJg04K+gHKzyvZy5xbVpNkBSumBCYMWxGYItD
         1k9TApev2lA9OeUtratgKPk4LO0aFqhwwP3CR8BE6uSawdcDbYN0guYisxRllbVByb6f
         ZCvbzqOIUHyOfO1iDZprNB5r6QAWDOApbahC2Ds5bVmdUHsP4B/4oKSyLeJMdIFsINgZ
         pSkKUdIQGXB4xwlp41GlrfbJlo4GrO9HyJLQQk7TLJAwu0pp/Sr1cS0A2JHioHRS/+Mr
         6Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gURghvRWNoA++o2VFeVcVYw4TbRESAtmR/5Dm1UqSbk=;
        b=detYP3GkFMFt9w+L28sbrG6UTUL9V+tt3bY1n7cXSwvh3UaLw+CoeD9PxAcEjtk+Vj
         4O64HEudWJ47okGQ4y6T9qDBRFFXbrAGMi3muP2KH0B42bN1WZQPw20cAAt5CPGyixfu
         shh1nx+z1uk77wE8vfDMY/BRzIB6W1/HnNyWhjn69Sw1tmafjkhNubklKXvpfF8IqVfI
         1pX3RMBgKMdmc2HmOBDzKCi4Jjs8N+BKjTArYbLxVhRJR6NiYGJvAQiOn6hH/Q5/sUT7
         oIdm824SW1zW/+oWoq5Mn6T3jI2pzfPex+cR39kRoFNpAdzkQMuDogkcNF4I38zBUu3E
         Zhwg==
X-Gm-Message-State: AOAM530EhmumQ2Arv7Hp02jrHDUPJp7Bg+fGYTO/pCDaj8bf/d3z+qFl
        G/I9IHsPFJOw6oo57+CzQKbXwhrj0j/J7r35
X-Google-Smtp-Source: ABdhPJxkEKmWYSUJI8yJuriWhKipPD4IFqTHfIs+f4EdBu/izgUgatHhyKb9BwWu8izsD7npgST7UQ==
X-Received: by 2002:a05:6a00:1c60:b0:44c:def1:a66b with SMTP id s32-20020a056a001c6000b0044cdef1a66bmr24427752pfw.7.1634040450469;
        Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9sm11046738pgq.58.2021.10.12.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Message-ID: <61657a81.1c69fb81.25209.ee93@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next sleep: 10 runs,
 2 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 10 runs, 2 regressions (renesas-next-2021-10-11-v5.15-r=
c1)

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
s-next-2021-10-11-v5.15-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/616567df712ebe33ba08faa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/616567df712ebe33ba08faa7
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/61656644b3fbc2154408faa6

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61656644b3fbc215=
4408faae
        new failure (last pass: renesas-next-2021-09-28-v5.15-rc1)

    2021-10-12T10:36:08.774352  rtcwake: assuming RTC uses UTC ...
    2021-10-12T10:36:08.780570  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Oct 12 09:32:58 2021
    2021-10-12T10:36:08.794099  <6>[   25.723287] PM: suspend entry (deep)
    2021-10-12T10:36:08.806982  <6>[   25.735414] Filesystems sync: 0.000 s=
econds
    2021-10-12T10:36:08.827143  <6>[   25.749945] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-10-12T10:36:08.839338  <6>[   25.767675] OOM killer disabled.
    2021-10-12T10:36:08.858091  <6>[   25.778774] Freezing remaining freeza=
ble tasks ... (elapsed 0.004 seconds) done.
    2021-10-12T10:36:08.871951  <6>[   25.796907] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-10-12T10:36:15.379691  =EF=BF=BD=00=00<3>[   25.812969] mwifiex_pc=
ie 0000:01:00.0: adapter is not valid
    2021-10-12T10:36:15.395667  <6>[   26.082092] Disabling non-boot CPUs .=
.. =

    ... (43 line(s) more)  =

 =20
