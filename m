Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2B24AD8A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 14:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbiBHNPa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 08:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350192AbiBHM0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 07:26:00 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F800C03FECA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 04:25:59 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id h14-20020a17090a130e00b001b88991a305so1906228pja.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+5lyFXoFO3bi8UkKJLISokJtJ+RXLuwiLDIl7nyx7RM=;
        b=tUvPDIuZ4/4vHXQ+l6WUAW3bnN2qughjqCLayeUSKMbSb9SLwq0Z8sTgx/lxSLbpWu
         Wk8zM5bKGC5yDlZ5wkgn6t0BBjygBf31sICr+uY9LbglvLi6JX0dAV8Fx7FYs+PSS0ry
         ktDnMA/axEUriQGPMpc0aS0Y8MLCKy+JAL37yXIaAkWtclb8JG9uKn49GH0DAtwA201H
         r/WJXopfg7n8PpaIy4bY8hSiLmaKkVoWZnGVRrfKM/p0tC/jJ+diCBYTSKY3JUwGIm5u
         303hj3NvjrElJUOiBdKrbjvMEsSh2fhqgVjZH6K0P1V7oPDy4BWXcUdAIK3jOhE3t17h
         0GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+5lyFXoFO3bi8UkKJLISokJtJ+RXLuwiLDIl7nyx7RM=;
        b=0i94vc80rNWj3psneI7aRdpXqpCgoIxDi7BWwkSfoEN3iKeCc0DYRKpZr5QnoUe0b9
         57y3Roo/d8I/qdCNOUlmHLXMs9QYzWjd5LZKRzibdTruS4yft6rE37aHoOUT2f1Fmu9B
         0J09MvZ/hLJ1m+F5mRHnJDCSTuKyc5C6EET/B8DYGq1KlR/dqklIKKZ4dv2RQYe1t5FU
         Ob1Ox+Jgbvp1ikLWeXUlJXgVan/i7xY+kIUHEJkBXszpAMCm5lc7twoDTDoK6n9/d5uZ
         DyheBOoBx4Q/njVsX7WtKC5ANrGKEPUFQF0X118LZT1UwMEYp1ap2p9T/KUGi10V39DG
         lb4A==
X-Gm-Message-State: AOAM531fAWON1w9qWka3nz/hXpI7oFKxRy7zFr1LBwEbaxSDUATlmVf7
        ULKjbfuUCWe4xqi0fmAYtiQ7uUJtPVQy3qY2
X-Google-Smtp-Source: ABdhPJwFMAroHUHCrB6vVI1c1PLGOM7ok0CfITUr0HsPGvF3T22I9gVA9U8s5p+9XpErdSEKJf7jwA==
X-Received: by 2002:a17:902:f60f:: with SMTP id n15mr4049657plg.34.1644323158425;
        Tue, 08 Feb 2022 04:25:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g18sm2670483pju.7.2022.02.08.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:25:58 -0800 (PST)
Message-ID: <62026156.1c69fb81.dfa2f.6c73@mx.google.com>
Date:   Tue, 08 Feb 2022 04:25:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-08-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next sleep: 6 runs,
 1 regressions (renesas-next-2022-02-08-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 6 runs, 1 regressions (renesas-next-2022-02-08-v5.17-rc=
1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-08-v5.17-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-08-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      65a3b7e5807616a88f3c6a25ce47cbc706676b63 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6202476f7258f264df5d6ef7

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-10: https://kernelci.org/test/case/id/6202476f7258f26=
4df5d6f03
        new failure (last pass: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-08T10:33:58.725911  rtcwake: assuming RTC uses UTC ...
    2022-02-08T10:33:58.731271  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Feb  8 10:34:04 2022
    2022-02-08T10:33:58.735279  <6>[   30.405126] PM: suspend entry (deep)
    2022-02-08T10:33:58.740835  <6>[   30.417057] Filesystems sync: 0.000 s=
econds
    2022-02-08T10:33:58.743725  <6>[   30.421525] PM: suspend entry (deep)
    2022-02-08T10:33:58.748600  rtcwake: write error<6>[   30.425366] PM: s=
uspend exit
    2022-02-08T10:33:58.750076     =

 =20
