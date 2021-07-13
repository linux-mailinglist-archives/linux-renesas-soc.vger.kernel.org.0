Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4173C67B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 02:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhGMAyo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 20:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbhGMAyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 20:54:44 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7C2C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:55 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n11so669500plc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6gPxuGAtNGVlwwHxQ5yPeeIMieS9oRbSg6xd7gmiFlQ=;
        b=LL3qv8/g4XMWNaLY/MWe0KQWDPOPJvIRFlQcBOEAZTTRVa01334QYAFzEkJuRMZfu+
         7m8ZG8ybRzmFdc15VRO2Nu6hoKlwQdKKdajLBDwokHLMbN/jk6vvjQVD6vUzQKAIJIh6
         6WIGoz+RyD1oH4AuViEACpjRfUXs0pC8wRrLWspU0Xm0tbmL0IcQCk6ZI8eNAEgdXoAh
         qg6C1khqIfq4q+EH81xj6S5dv36hHe38b7fQZ17XxjcBousUR2b+KpPpTrEW0grywqZ5
         3shYxCcDO9lDUXxptti0NKv69X0gtVUOKxFmKculMc7HXiqKz58meb1Jn8PchZsJCIjC
         JG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6gPxuGAtNGVlwwHxQ5yPeeIMieS9oRbSg6xd7gmiFlQ=;
        b=iBEVs3ik2s+UMbU3yyCg5YZdv6wNNJmS/a9UL3YkrDjnvEEo1xgbbzxg4MIYPXv9od
         oPpuE50HalOeGNZo9/Cb36KctwxCkK5iq6hqO9QWH0UCywmiRUx6/WVkRQWbMnDhsd4W
         NmzfBYDVk8m1y8YvDmhxtPdQeQi8XEC2K7Sb6VIAId9UhXta61+wuGGvVDFr1XRmP0eq
         M93SLNawnMFMxIWpF1PNIKhrFj4tMEEgEJIT43H2FtDaSlJAahWVuOwB4Kg1VmFmrwJ/
         CnZOZpjf13N3FdwYWnFMsvHP80B/888XlGfi+iW5xotULfm39rY0e3Qbgum22nSQnBMN
         psEw==
X-Gm-Message-State: AOAM530uuVDsWW9Y7OsgASNCRU9zH1FZSfv/FvOIAX9S9iD0tsYU8R+m
        1XYYt6TQznVdNgBRj0lJpngFJ/qFA1UD7Hoa
X-Google-Smtp-Source: ABdhPJzeToW7KcDs6PvweHEw2TORvhZhlu1jcgnR7AJMcQUnDutu4+Oo8mTTwymAl9GRUDMCacsPew==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr1269442plw.83.1626137514616;
        Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v5sm19377144pgi.74.2021.07.12.17.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
Message-ID: <60ece3aa.1c69fb81.431c4.a0c4@mx.google.com>
Date:   Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-17-gcd117793e1ac
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 6 runs, 1 regressions (v5.14-rc1-17-gcd117793e1ac)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 6 runs, 1 regressions (v5.14-rc1-17-gcd117793e1ac)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.14-=
rc1-17-gcd117793e1ac/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: v5.14-rc1-17-gcd117793e1ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cd117793e1ac66174038470d85471fa4d9e226b9 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccc4a41ccb6e98d11798a

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sleep-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sleep-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-3: https://kernelci.org/test/case/id/60eccc4a41ccb=
6e98d117993
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-12T23:11:05.585872  rtcwake: assuming RTC uses UTC ...
    2021-07-12T23:11:05.592900  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Jul 12 23:11:11 2021
    2021-07-12T23:11:05.596010  <6>[   39.775294] PM: suspend entry (deep)
    2021-07-12T23:11:05.602442  <6>[   39.785551] Filesystems sync: 0.000 s=
econds
    2021-07-12T23:11:05.605952  <6>[   39.790084] r8152 2-4:1.0 eth0: carri=
er on
    2021-07-12T23:11:05.615827  <6>[   39.794799] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-12T23:11:05.619528  <6>[   39.803994] OOM killer disabled.
    2021-07-12T23:11:06.655611  <6>[   39.807481] Freezing remaining freeza=
ble tasks ... (elapsed 1.028 seconds) done.
    2021-07-12T23:11:06.661892  <6>[   40.843521] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-07-12T23:11:06.762484   =

    ... (1150 line(s) more)  =

 =20
