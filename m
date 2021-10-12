Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED60442A3E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbhJLMJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbhJLMJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:32 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BE4C061749
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1707303pjc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3/GkzBH/vfaiEE1MF3HpKCgU4l7m2C+BdgyxFcGOiw4=;
        b=1rFCbk76Kyrzu5FVbiVidshbBZZY/+E52JLDfCbJJmpmgOrJfrLJtMrJai5NhbHKH5
         Lga+SK6B2XVfpvOWvCJtojJWZ2b259Cg0T8iyNQ10IjQhOyf+3W+MN5fAXPsBb3NaP6p
         tCGDmD0crKcSnM9TW6fweZRgLQ6Z0jcBnJE/Q/eSrbosrPwNtdMlNzC11Q1RwJGZV6j0
         GkfDkflWC8CoxF+vEA2fvQNncwayXxPOCCkDuIIgEMf3k0GhDCeRBcyLyMRAARCE1+4S
         bN2lgr4MyYN6ih/kB2RVPzzSFQGXFeQvcbrYYhHis4MO30cO6APINSLYxXCIg3ouESbW
         4Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3/GkzBH/vfaiEE1MF3HpKCgU4l7m2C+BdgyxFcGOiw4=;
        b=7CDpyRmFW61RkSgab8xsrjEu7gk0a5cedBhCnT4qS4Z4RTBCFMLgCVF5jWct4Y91oN
         8tk1WFloxJV3rStdtiuBvY2FLamtL6Yv5OnwXnlCbQuE/OUSrZw5VMSGV18CbaXNSNQC
         AHR/ytzoDofrd24Ml4y/sdvQnwB+zw25pr1Nhh3a1sTLQxTzu0bvrDlCwWxHoa5HOodw
         UmIAn3UQlDzi7oL4bpDdIUfnUUNIK5FazaQ+8vCGFNvq03a5wwxXLoIqpAm7WhFZGQnl
         +1QpEuyoH38d9tvFk9e7TZGx9n3jS8KoA5HdagPeZrK1Ry8Kxb96Wd+Y1Gmn3xRnNdFw
         KL5Q==
X-Gm-Message-State: AOAM530z9nu/t1fnIwaI5BTYhJICUPx2PVkjPDNihqBhej/WZ8s4esNm
        moG1wRcumCFxpOZBzZZJ1g728iafUbbOxrKa
X-Google-Smtp-Source: ABdhPJyZ8EFu+w9IIeqIAFQ0B3Lhx0y2YULV+LPMYLqLAza3lROAw8IF3CG3ka/HLprdogfOVULC0w==
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr5589987pjg.118.1634040449667;
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z11sm2657413pjl.45.2021.10.12.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Message-ID: <61657a81.1c69fb81.560fd.7c25@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next ltp-ipc: 6 runs,
 1 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 6 runs, 1 regressions (renesas-next-2021-10-11-v5.15-=
rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  9ce71152bf21e410c471fd8d7ca43a06abbe7c54 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6165651376a9d12f4408facd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20211008.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6165651376a9d12f4408fa=
ce
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
