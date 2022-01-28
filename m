Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD3949FFB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 18:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238807AbiA1RnO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 12:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbiA1RnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 12:43:14 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3B7C061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:43:13 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so7067496pjp.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qLZw2zYTCZ8bCeDeSgdjQEyeujulcRQzOkrKqjF62rk=;
        b=qCwKYxewIYRdCV7sp/TQosLjKGtf0K1/jU4Z7Wg5teWd31Zqc7rm6Z/NTm9xpEIZzl
         CiIetNKiKMzFosh0bBHl4f6IZyQ0Ca99d8f08Xy8myxUoihx+5lSuciDqthW5bjiC2/n
         09bzSsesJbot1VVzY/xwFbJSyAiDiSxZpeEDFaESU6yzodDB7Tay3DPXmTtZJYtbVtAu
         A8swyR7e8CSG114/esJ/YiOcklCne4R+wAiwYwXtJBmhon7XdNB9SYpe4HU4OTHGlGC5
         h7uksJ3QunpREYpiCoVM7moF8IVMiwfSsPTDI6R18NWBELxNK7ExNIT5KpLNRhlaRF0K
         VuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qLZw2zYTCZ8bCeDeSgdjQEyeujulcRQzOkrKqjF62rk=;
        b=ZzImRNRzc6w+D0D9iyO990BxkM3IdXzFjPg3fAd6jj1vZ0UcqruZOycw5y+94heHHP
         4h2oECOXIdh0xboZVnrpMTTN+YFazZyXaXTM7k7LnjnSDOFp18tBnHEE3Kz+j9kY15ha
         RQdmOT856xLVSBhnR764ld1tXDuJ49wAV8DtxQp2XJgmPo7CYKAvgdGcZdNd2vMOJLvY
         gYfcsrvgRoZlEyhc+oot0mwB9+7gRUedBaY9YHrTvdWsvdsHcjujJzB0eYiSZATYxb/1
         /IL0mjg8yTr24ejy1XYi1K0fxgXGtBWqDpSYLcgm9tslq9j+H5IzItODidJAH9vAxlzI
         s1IQ==
X-Gm-Message-State: AOAM533QGOIS1kjXWp41hIxysA0b2lryBiGEr6WGpF6z5XF8dDsq8T7j
        7+nJx2MP1MnQLz73FxkKBXGezj06wfJWXrBp
X-Google-Smtp-Source: ABdhPJwuPPpouuZqP8/TXWo6ABO6jHhdpu5o3GmszMpXr12q9mMC52r02hGDQJPhhX4Gzw1/VL221Q==
X-Received: by 2002:a17:90b:3e82:: with SMTP id rj2mr20836234pjb.206.1643391793143;
        Fri, 28 Jan 2022 09:43:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h25sm9342913pfn.208.2022.01.28.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 09:43:12 -0800 (PST)
Message-ID: <61f42b30.1c69fb81.549b1.9d0a@mx.google.com>
Date:   Fri, 28 Jan 2022 09:43:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-01-28-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 35 runs,
 1 regressions (renesas-next-2022-01-28-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 35 runs, 1 regressions (renesas-next-2022-01-28-=
v5.17-rc1)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-01-28-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-01-28-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7fb968536682d96db805b040a0d8376c36c718a5 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/61f3f41670b249da5aabbd25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61f3f41670b249da5=
aabbd26
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1) =

 =20
