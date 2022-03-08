Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F7B4D1D06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 17:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243095AbiCHQTs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 11:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234417AbiCHQTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 11:19:47 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14135FCE
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 08:18:50 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id p17so17506860plo.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Mar 2022 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kTBZq2RL1hCHtEyxhDByvDTQtXRMZK6j9AVlad8TP9Q=;
        b=NXobhOQ7Rv60tbHrRXOgM15OdjLRHiduK8Vlo1OlG5+RyheUwrc8iwhl9UsH4NcUh2
         XgQuPo+K/akLYBhVt60KZPzWaqddwpMeqslU7Y3purE8o2quJmDcZbIsY/rBsad1aS0v
         tJfXRtCtPVPWEekTdVh/ClNn68eHCSklD7XHoPdjHI/1ppboVK62QZavBf4aC3KnhQ39
         z3LilFq8mGAWFO+unO6bWBW9dfnInh8vWGde1XKNJCvS48Sge4D5hYkaWdBWHCmocx1g
         bvzB0wONawFbBqWqUJwSe3bgOXmzuDLYVJO1FoQbtTKmhA5OqsO3Jt7+w0D8Q28pCA5x
         mAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kTBZq2RL1hCHtEyxhDByvDTQtXRMZK6j9AVlad8TP9Q=;
        b=0LaGKZt2fRdbKsG6JALXyXanZGQpq3lhBjLhqv4oOjo6uqZGdR8TS4pDWOAsTkRw/Q
         pbh78J0HN3XXH+zzgvSn3q3LicXm+7NEqD7ZmTmaPL3MmOfuRgeN8Ix1be0ppZB3eADX
         xAQBQ+kVEtElwTOgfNOtztfJHm/BRna0VXyW75CNqmgTSiXTKsSH3FxtisdO4u6a3Jh3
         9OuWTb8oedXLRAN9U6/nXxV/nCH+uQgxFzEuTvMPDPT4xsipULmNPRbtoSNft37lJ8GQ
         CmntX5y8Y8U2onqr1QEIp+a+CEoZkQ3H1lplHVKSAIuGGtxWLYg857FmDG/x8mV9ER7u
         LvZg==
X-Gm-Message-State: AOAM5327Y/Qr1SIgXkmObeSrbo7/JiurGJgNTii5tcWqPW0rn3cpgtcN
        QpG2Vu0i3DOTmZ2PuRLwxUm3ajXb6YGyUVNh+fM=
X-Google-Smtp-Source: ABdhPJwG9gAQX9JIwwwqa1ldCXJV9sM5qEEP0uBmOLLXbQVYpY+W7jsPWoD6rsl3gODHRJm/BWj1ww==
X-Received: by 2002:a17:90a:7f04:b0:1bf:9e71:9d35 with SMTP id k4-20020a17090a7f0400b001bf9e719d35mr1340643pjl.203.1646756330223;
        Tue, 08 Mar 2022 08:18:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0038088a28ec0sm3187860pge.22.2022.03.08.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:18:49 -0800 (PST)
Message-ID: <622781e9.1c69fb81.881a.8020@mx.google.com>
Date:   Tue, 08 Mar 2022 08:18:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-08-v5.17-rc7
Subject: renesas/master baseline-nfs: 66 runs,
 2 regressions (renesas-devel-2022-03-08-v5.17-rc7)
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

renesas/master baseline-nfs: 66 runs, 2 regressions (renesas-devel-2022-03-=
08-v5.17-rc7)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
         | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-08-v5.17-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-08-v5.17-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ac86fa2bcb4ab9ea979876e0abedf4a00bc6544f =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/62274d6b261ca57089c62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220228.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62274d6b261ca5708=
9c62999
        failing since 7 days (last pass: renesas-devel-2022-02-22-v5.17-rc5=
, first fail: renesas-devel-2022-02-28-v5.17-rc6) =

 =



platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62274e86a85a69fb75c629a5

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220228.1/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/62274e86a85a69fb75c629cb
        new failure (last pass: renesas-devel-2022-02-28-v5.17-rc6)

    2022-03-08T12:39:07.619532  [   38.498564] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-08T12:39:08.672880  /lava-5837681/1/../bin/lava-test-case
    2022-03-08T12:39:08.706327  [   39.585965] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
