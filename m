Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20BC45994D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 01:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhKWAuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 19:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhKWAuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 19:50:01 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A1FC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 16:46:54 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id v19so15570039plo.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 16:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7aEqDbwwnwjmhHoVo6TMkSZOQI0CK8tSuCcXzrVveSg=;
        b=C8Z4rbYlmrA3WVz+LBC3o8BqbBB6IettFbtoxRHme/hSdgsd0maqLQA98uEKM7JQmG
         TWO0TPY+Ocsz6iO+mKhAlkOMDX6Re37R4tza5VKyeSuKZW+h/UNX47OiqxVVkX6DeU6n
         e+2ZVDDcTIdFNlN3vxsNqwZGrjS1QB0y0EaX8PrgSXtrP+VdJoOFqZCNFfUtOnQPgWEf
         O7IeANPVyVoJK41FGVrh2te99ZO6j0yKXQGX3NdasbVppnOKowVmon/qmlZHA9wV3wQw
         +A12L0vP/L3x6nzC3WcVQ5YEAeQmNU6hGS28xZ8INBXXnD6/tUhn/T/HhR2xf3zlyFpS
         4lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7aEqDbwwnwjmhHoVo6TMkSZOQI0CK8tSuCcXzrVveSg=;
        b=5rWQZ6WUZiB1D3bNa5c7n4ZDs3aK5JIpZGXazcmGVXKj7qfpi5dcZCFHXX3SznEVlz
         s5b5JVjgYLjmsehnJG2VgwEppCRx58WPqHApfvYFSScY06sgrOBJX/UkoiFmDqAR5OMy
         K3+RyYKcrZtMDuRGCF8/0iB0t3wwQ+2rExC2we1qvL1jPBhKB3eAnd9Wd5i3+6kU/GRE
         Hr664Lsj9c7wKO2SJtjsbEzvD6Gdv0Yu8Bme3hvJ0YazQZHuK79IjQQRGUYVfufLKk04
         xNWC/VAGRnxMl1AGGX0LpNWjSScLxvmuIc1m/IBRS3Mg4rgfIFSY7zwMB/ZQ1k+als4M
         1qDw==
X-Gm-Message-State: AOAM532KLO6mAbp1e/GQWSOBZ8F7QTSBlvQ1RXjKNSG3F7NxV8nVGgkW
        E/mVj3P2sLXfQOVVMXs6Fj8zza34ofuOPJuG
X-Google-Smtp-Source: ABdhPJybwHZKM/OJbsRnd1IauwxEGK+ooaaWb+3VCUfzH6jReY2N0Xzh4oBHKl+zKteknU150TBTWA==
X-Received: by 2002:a17:90b:2249:: with SMTP id hk9mr36563700pjb.245.1637628413610;
        Mon, 22 Nov 2021 16:46:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o11sm7004532pgh.91.2021.11.22.16.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:46:53 -0800 (PST)
Message-ID: <619c39fd.1c69fb81.970b6.4d3b@mx.google.com>
Date:   Mon, 22 Nov 2021 16:46:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-11-22-v5.16-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 52 runs,
 1 regressions (renesas-devel-2021-11-22-v5.16-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 52 runs, 1 regressions (renesas-devel-2021-11-=
22-v5.16-rc2)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-22-v5.16-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-22-v5.16-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      76e8eb89ce81234e80daca68c8ea9523696bf0d5 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/619c061f2c9d0b9e63f2efc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-22-v5.16-rc2/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-22-v5.16-rc2/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1118.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/619c061f2c9d0b9e6=
3f2efc1
        new failure (last pass: renesas-devel-2021-11-19-v5.16-rc1) =

 =20
