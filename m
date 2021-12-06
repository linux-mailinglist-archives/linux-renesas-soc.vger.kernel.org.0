Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F0469928
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344384AbhLFOll (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 09:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244928AbhLFOlj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 09:41:39 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012B2C061746
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 06:38:11 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p18so7158912plf.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VlQMowiy1RvjHb4ycTf+CZ5f9eVsi1wYhK6YZUB5OQY=;
        b=CMXZCx2FDukqFBSZt+0OCMLuU/V7PvTvL7/40wQdA0yxtPHRYpifqfcfJo972QOl4n
         9iZFXWN0p3QuQapKiUouDuGk/dNreziFawrDvsECmvtbxNlisA19WbevTKlHAC7GmevL
         p0i8j9jzCsl2F8bLO61mS7D3zr0Z9rpm0Z2bTk/+SEhKv2r7MUGDuybFsXxZ+ONr9cbT
         Ti9zlGURiPnHgT6J8TLAUmL2B52dM4Ic89dzZQrSnT9Srua3Se23kvr4zgm92eBJHBtZ
         jWDVOpvZtj9kwlghOKMfVFH6cBr07claqhNCrHWV+BuEIECie4PxnrchOs+Xj7hVCrK/
         qFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VlQMowiy1RvjHb4ycTf+CZ5f9eVsi1wYhK6YZUB5OQY=;
        b=1s89hL+Tj/WaUleoWbOnuLmA61MUZz6055bUus7zQCDbHamGpysDZxnJTNnoKPYqt+
         0oF2E8she9vP0VqFJja1fWJnBtsrLKsoBch6JVXBZXAIWIOxI7sZZ9pO6Wj3qu3yaNDv
         GEkaOnbZqUJ6UAqBngKZ1RZPIL9/Ec4hpdPgr39avYZ1hbd3OxUHmh2sd1rWnFrL9pab
         3drcBtXwWBHmKa4PC8Dtjc+cnx5IcKkwKVVIsjcVLl2Nzxz3VwsiFJsKo21pOGq2eZzQ
         kAheUVFIoBQdIiL1Sj43J530+rWLh8QTawLy+muMs7oooxDdjVgfBs1xf3oNOdzDrmP0
         4PSw==
X-Gm-Message-State: AOAM533xIUdazfUUREVyhijMYpNF/lSh9sL7Em6EIsDykoYvj95nbm0Q
        HQY+JkAFim9NbHSuiXgpp2U9tMG7qpccBEhg
X-Google-Smtp-Source: ABdhPJzAEEStQdq3+j6shC2BjZaOP9yZOQiUdarj8eor/jjMGDDLpc0dUIVshDIPdVPueiwZ/ovLkg==
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr37530331pjb.142.1638801490396;
        Mon, 06 Dec 2021 06:38:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p3sm10484097pjd.45.2021.12.06.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:38:10 -0800 (PST)
Message-ID: <61ae2052.1c69fb81.1d086.da50@mx.google.com>
Date:   Mon, 06 Dec 2021 06:38:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-12-06-v5.16-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 40 runs,
 1 regressions (renesas-devel-2021-12-06-v5.16-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 40 runs, 1 regressions (renesas-devel-2021-12-=
06-v5.16-rc4)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-06-v5.16-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-06-v5.16-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8feef3cda1f4673737514cb20366eeeb69cc0be2 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/61ade8ff0d06e25b611a94a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211126.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61ade8ff0d06e25b6=
11a94aa
        failing since 6 days (last pass: renesas-devel-2021-11-29-v5.16-rc3=
, first fail: renesas-devel-2021-11-30-v5.16-rc3) =

 =20
