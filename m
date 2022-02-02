Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85B14A72C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 15:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344812AbiBBONM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 09:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbiBBONM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 09:13:12 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED3DC061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 06:13:12 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id d186so1072316pgc.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=A8EC0DveYA4sHJBH/BHJv3FM9hKMFec+XzWLqiUKvao=;
        b=CQ+THkzxn5+S2H/jrWbzt+UDA8YiD1bJSKPxnD9TcqZgm6tAq85zbi3E/BGVLg0Raf
         85u/kPOYSBlaB+BIEtjvq3InUyUtKP19tV5nYcoZ2emwHYgP3VV2psNE1BQp+35J8Jat
         HDRlUXEpcZmyv9rLNSm45Svv3BUXsDcXbtpwfDzzJEbcUK1Kwx79vVMpXDDpTcHAs02J
         slQQdXXRZ4v1ubieugW6TtZiUUqZpSMA6rmdNK9RLU1hN4zoxiyunfsES0SpI7320J6d
         ZmlFyE2R3zkNVAqjtaDMFw4krGVpfsYj5XqZeLhe4fiPa59dNhSQZgFOvs+Krgp+GxRG
         jqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=A8EC0DveYA4sHJBH/BHJv3FM9hKMFec+XzWLqiUKvao=;
        b=JB3l8UMyhFuKeTl4kP7Gv+0EawRdrqeBkgxyY0MXZ7ehhKCHlZAJz7491UhAc2Vh1P
         lM8gB+lG9jlroRtt6KSX5I7R6+ELzS8SpiLsBB7HQ2afizXFIRaGOW3ga6+m37ehmScz
         eZVG8Lc9ioxD+2850I9mufVg7hNSzNo8+dPtO8yiZq1RVPYfvC7laYDYi67ZJwdLpWSi
         QtI9xTJbhpYRgxtkeFo7y55uNp4Hy225SJdIyYAiPcHZm6iXMTZb40SS5IpE6efZrAQd
         bwSmHwLvflK8EVlAdRQ/NFPLzHx8bXW4VNBffzEMb3ekLtq11m0zi8AdE31ecD3g5cR8
         gy6g==
X-Gm-Message-State: AOAM532494wD+FuA5lJCAgDoZCoeLcrjG775eaPcb/yuTuTYIa4pWdd7
        Rt07pQxp5IRRz3QMLt9rTrs33hrAfLyhq6U+
X-Google-Smtp-Source: ABdhPJzJ4B2nvjNqnh+dNPe5rZ2/rHfVU/FeUGD6vPxa2QtMRGAIIpsHXx7PTDtchHN6jYbfSzIwYQ==
X-Received: by 2002:a62:2982:: with SMTP id p124mr29957489pfp.53.1643811191863;
        Wed, 02 Feb 2022 06:13:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u33sm26202056pfg.195.2022.02.02.06.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:13:11 -0800 (PST)
Message-ID: <61fa9177.1c69fb81.19c52.3545@mx.google.com>
Date:   Wed, 02 Feb 2022 06:13:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-02-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 35 runs,
 1 regressions (renesas-next-2022-02-02-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 35 runs, 1 regressions (renesas-next-2022-02-02-=
v5.17-rc1)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-02-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-02-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3b08f12c71900ef2e92cc8f778f3073afe69f4c =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/61fa5ba32f33f56ce35d6f02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61fa5ba32f33f56ce=
35d6f03
        failing since 7 days (last pass: v5.17-rc1-18-g925b6371c834, first =
fail: renesas-next-2022-01-25-v5.17-rc1) =

 =20
