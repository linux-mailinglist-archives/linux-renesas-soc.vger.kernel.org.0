Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA0D30A918
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 14:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhBANvd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 08:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhBANv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 08:51:28 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C8CC06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 05:50:48 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id kx7so10346507pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Feb 2021 05:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HZN1RFOX/ONXMS5nfBHOwexVQXHAHqVAO6SUOHPHb9s=;
        b=fxlCfEGjm6MB9typcy723xh/srb1LBY5eicxVT9kuMRICVZNIP8ueEh9KO9GoKFWl0
         S9pcH7ou+ODxsvjt+tBmkJVH6hPDOx/UtTQCGq5fpircL1h/h1HBgQYlT2Do5uquc57i
         S2q9WY8THStpt7LKedD5OuVpaxeOAShNghUGKGWfWD6G8A4uxp4hVxR0bA7C4hdNqD+k
         YLX13AFLHRVs3C09qRo2W9maNrMoUGT+xdnFbeBhiUji4aPwT4Y9nXNN5VE5aYnG2lJ4
         wMdLzWh99Vil8pkwPJaeEmt6N9/Qqe60SxZDYFyI+bMDEoo1qUS+xe1UO8ufGzLbFuhE
         J/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HZN1RFOX/ONXMS5nfBHOwexVQXHAHqVAO6SUOHPHb9s=;
        b=m4dmpMYtP1bABe2pnv1K2TeeONZq1LQ6BOt/ZvFMDzSe/lAdccHQ528NUIKt9ntlfa
         Kwc4ykxKSPpENO8j9ONR3s8eRbbg1H7eJ+uU5T6XkahG+t0zZy9+i1TJSCLNikK1z15I
         JN+/U4GM9D/uA+7KwHsS7OzJB/6GIW6EQn3W2p8AUNoMhPnRcIWTNvJxa0AQz41OfB5w
         ddXfUrTBObHCcguxWDtDiLFCt8zn2Ut6Hlb1gMSx+QJ2ThmUOu0T0ZvMIaRLxQvAFAsf
         svd8kONy0eRjDaP3F97RmtBMx8lGIfbsAOKdTBNH3ka4cQORu4c3XPLs5oe7sWCjGtmx
         tTSg==
X-Gm-Message-State: AOAM531ZkZ+cnEd3SDxFCw46uzrMyt4bbfdcRl6h0PLO5eH/ge4t7q/s
        XJgVa62ctzxEqrnXH0J7nh/arjc4hdYtNA==
X-Google-Smtp-Source: ABdhPJyyEW9msIX4MzH/MLeCP1kyjjRp57YbMBjop+ouVTshMiNBzRHrO7cazYMWB3z4S7MDK+5Ddg==
X-Received: by 2002:a17:902:6a87:b029:da:e253:dd6a with SMTP id n7-20020a1709026a87b02900dae253dd6amr17523989plk.81.1612187447259;
        Mon, 01 Feb 2021 05:50:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w21sm17961468pff.220.2021.02.01.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 05:50:46 -0800 (PST)
Message-ID: <60180736.1c69fb81.c2e6.aa0f@mx.google.com>
Date:   Mon, 01 Feb 2021 05:50:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-02-01-v5.11-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 27 runs,
 1 regressions (renesas-devel-2021-02-01-v5.11-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 27 runs, 1 regressions (renesas-devel-2021-02-=
01-v5.11-rc6)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-02-01-v5.11-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-01-v5.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      45e12c13bdd70bc8d9741ce35e2aa594e986e457 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6017d261e61b5fb8d2d3dfcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6017d261e61b5fb8d=
2d3dfce
        new failure (last pass: renesas-devel-2021-01-26-v5.11-rc5) =

 =20
