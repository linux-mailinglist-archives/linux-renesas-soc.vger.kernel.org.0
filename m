Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939A443B385
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Oct 2021 16:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhJZOEa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Oct 2021 10:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhJZOEa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 10:04:30 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71161C061745
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:02:06 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v20so10404999plo.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AMQsE0Q0OJACmGqI7GLExuP64uI+Kq/kqTXJdB/Wvh8=;
        b=5zIzRvd5iq7hA5MCz4a00d3SvdCDfsxEqjBD9qdnoeE7o1v5NpPAfwvoRZjPHcKG3g
         jw89RnL4T8v/mqCxctK6Zja59DZw3y6gYdr77CbZKmPbQaVnyfbQBP8ruH6UuB5JOdhw
         8ce2F2165Fiw4yOGYihVuf0a11/pBWWruWCBYBXSC5Z4jP6yx/nrGsOrpLuhyJOajk5f
         2ZXJfc1hwzHqQqdI3jc24eUZf3RaFI/HXlaXruRsS/JAO6YxmfdToEKtFrXXdQEu/NH8
         VaYD1sQhHE8Hwmpt2+OAacqyUSevhOXuoYNy+xi/8neWvXlXeDSANSv8rVKRDPF1P1sB
         v29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AMQsE0Q0OJACmGqI7GLExuP64uI+Kq/kqTXJdB/Wvh8=;
        b=7GvrLwGF8+A12i0wl3eilu2Gl8Q0E1urS0/YQzYmsfyYKcWPiTNB4vWb+BTaqkhvX+
         L5LIvrIEz/d11fHgikN9Kn3HVcUu8UQhdLYtPJkwCvbj97E8sd/xKCe/hDH1XlcZz4in
         jnL8TGAPhOT6GGPDEcwHI0x64Oq/UGp7GqjKwE4f+N+zZK6XFasAcCjmbPZhLW7jPAoh
         2PItQziO+l7zdLNibodBKfXMhyNQEiZ4LnyLYIWda0uLCroblsuSw3oDdTNA19LwcW0Y
         K8QcTMxBcGLinrq6MPJ2aw0i0sI4vLuXhpeonHvDpCxn0DihUPiVWbvRcw05jUZ0yHTD
         kYXA==
X-Gm-Message-State: AOAM531z0pYAS0cU0vCtaSvVVH3RckqIpILLUix3N+CGAIEO7Hnb42wP
        VIzdkrcH7i+DPErDDLcM+2Nby04GnvgM7OTC
X-Google-Smtp-Source: ABdhPJyT9bQzn83ZUiSnRbpaTp6wqZ492+tJnhIzrqM78mKhBm6FCrW3isr4r/KsY+iKn9mA2OcfQA==
X-Received: by 2002:a17:903:22c5:b0:140:298b:9e27 with SMTP id y5-20020a17090322c500b00140298b9e27mr21889805plg.23.1635256924212;
        Tue, 26 Oct 2021 07:02:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nv5sm1199313pjb.10.2021.10.26.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:02:03 -0700 (PDT)
Message-ID: <61780a5b.1c69fb81.4956c.266a@mx.google.com>
Date:   Tue, 26 Oct 2021 07:02:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-10-26-v5.15-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 387 runs,
 4 regressions (renesas-devel-2021-10-26-v5.15-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 387 runs, 4 regressions (renesas-devel-2021-10-26-=
v5.15-rc7)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima     =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-26-v5.15-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-26-v5.15-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1eb1073587ad2566bf2f1746c425ce1804b54276 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177d2427bc47ae4fd3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177d2427bc47ae4fd335=
8dd
        new failure (last pass: renesas-devel-2021-10-18-v5.15-rc6) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177d410ad7e50de8b3358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177d410ad7e50de8b335=
8f5
        new failure (last pass: renesas-devel-2021-10-18-v5.15-rc6) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6177d7eb1fcf1790e0335909

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177d7eb1fcf1790e0335=
90a
        new failure (last pass: renesas-devel-2021-10-18-v5.15-rc6) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177d8c09eb514334833590c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177d8c09eb5143348335=
90d
        new failure (last pass: renesas-devel-2021-10-18-v5.15-rc6) =

 =20
