Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2314733C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 19:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbhLMSSP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 13:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236187AbhLMSSO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 13:18:14 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55EDC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:18:14 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id q16so15250927pgq.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rp7zLJnKXfkHyHE5dV/iJGgDRTE1lO4E2SQUFqFSluI=;
        b=IEV2HIcbfAeFJQ2gjfgbp3kMevpISfYmUG5//XODZGlX0LRCpvWoZ4RqGsdDTVA9ml
         69rETpbOIZUaJ7ZmFdzfw9i2RMWAcy6IjnO3KbIK5a/deZtoNf6Zr/jvF3UBF9NBLeS+
         ujKbnpDrwdOXb1hHSqZ4FWsjisw747khWjBIM+UsAOBRHeCkq0JZFbW0C07nWypoEJbg
         fYOWNOfO/MzNZt6blJ5yuWO34WGMVvVDSqRGQ6dOSo8HlkuyokcyyVq54CE53x8IZG7F
         ceRHFeRG7ZwyUasMkj65ClH29D4BqO+lfOUxcq6NNE0/iZn4FOX5xkDFzVHwH+I9dhmP
         tkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rp7zLJnKXfkHyHE5dV/iJGgDRTE1lO4E2SQUFqFSluI=;
        b=CCSXh3gzc4tkb5ZCLp9Y3jjvldz1Y/A8PLsg7C0LQGc7F7CZbI0BOcqzLANZqbyPVG
         C+YiWG5ESvGAgS+uSMnerGSjv3f457OA3yv9LYAnYdr3Ux9W5DP4s0T49zaX7Ek0+1Yi
         LNJpijtKDmgA9ebxXHI6dnUmEIRKvJTnUJnSfmogTnEdgVph2cnQnQ4JrlwAv0M1/bhZ
         OwTuFKYiBaecLBKGFQZLMlMcbfRNv+yO4CaQi+C3RClN0awMSjymP28+DRtVNmXEZ01f
         z2Y+VWZGG1Ui1liw/wk+zx0TQE0G2Rmm/3WkljPL6fVeUc8GFuqtnPNUtPdoDs3oow08
         5ZGQ==
X-Gm-Message-State: AOAM530FyuHBUdUFumWWiw7VTqspjTgfnI811CUrb5kx+a2Lntw+nFde
        7RKkc1hijcvwKzbPTCmfuId7Sp9G8T7M7Exp
X-Google-Smtp-Source: ABdhPJyyU/cI0YsssgGE+e/Ig3+P3YIGh7hsnusOWGNWarjsDe99u/5KB07kNTYttp4P+k5NWzQmkQ==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr182486pgd.364.1639419494067;
        Mon, 13 Dec 2021 10:18:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y4sm13679681pfi.178.2021.12.13.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 10:18:13 -0800 (PST)
Message-ID: <61b78e65.1c69fb81.8879e.604d@mx.google.com>
Date:   Mon, 13 Dec 2021 10:18:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-13-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2021-12-13-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2021-12-13-v5.16=
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
sas-devel-2021-12-13-v5.16-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-13-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2d93a61c003c8e6bbc9e44c5ffc3eb00242028ef =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61b780f10ff9f0b90b39711e

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211203.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61b780f10ff9f=
0b90b397128
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1)

    2021-12-13T17:19:40.607503  rtcwake: assuming RTC uses UTC ...
    2021-12-13T17:19:40.613973  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Dec 13 17:19:46 2021
    2021-12-13T17:19:40.617783  <6>[   34.724490] PM: suspend entry (deep)
    2021-12-13T17:19:40.623958  <6>[   34.737237] Filesystems sync: 0.000 s=
econds
    2021-12-13T17:19:40.627012  <6>[   34.741871] PM: suspend entry (s2idle)
    2021-12-13T17:19:40.630928  <6>[   34.742105] Freezing user space proce=
sses ... =

    2021-12-13T17:19:40.634079  <6>[   34.745893] PM: suspend exit
    2021-12-13T17:19:40.644233  <4>[   34.758376] (elapsed 0.012 seconds) d=
one.
    2021-12-13T17:19:40.647488  <6>[   34.762660] OOM killer disabled.
    2021-12-13T17:19:40.650548  <6>[   34.764318] r8152 2-4:1.0 eth0: carri=
er on =

    ... (1151 line(s) more)  =

 =20
