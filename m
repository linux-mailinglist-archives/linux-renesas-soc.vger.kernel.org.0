Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074D44FDB6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344141AbiDLKDa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387732AbiDLJJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:09:09 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A43CEB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 01:22:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 2so17751417pjw.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EoPQEWTnvTGdLJD5EA090gGEZDaz3E4D+PKNG3xuv/o=;
        b=Y7jpuusyQvmczsHY0bJm5P6HQwQFrbXdRnIzVLnlqIpe8aknk7dDhlZ13pNIzDgpCn
         6fRV6c1vhkSyKY8n7mYbuuTSZy4jSOlKZLsHbUAbiNcJz663lW8NFFy/i/7pVGvt2xdJ
         IDjAvZstl732PsREaAhOu08nRN3q1hpiZwWmnsuyGzjZwL+F8N3r+HYno5fDBHDPd/X1
         drbAi7q16SgaHOMw4bhkxm9W4l6XDVdtesg6OSgaPCbwvt+xgR8qZijr0U+BBabcDDmO
         Ar2/UuUZ1HijFvuGgaJd9K+HjB5r8ZYFfPdIlXt4utAHw2mtx//KfmGrGW4G//d5P7Rl
         wCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EoPQEWTnvTGdLJD5EA090gGEZDaz3E4D+PKNG3xuv/o=;
        b=MMyiXpxX6y+peJK3o1QWk/TcVtt9QP42J6VndbPE5nqjn5AKy0/1iurEVFn2frAkHK
         t2289gZTvW69vwSK5Dh4fazRGVsrE4PWsKMpS7ESUeitVmr5RrF80/J1YHBOrSUICQWz
         Lex1W2YJIVd/32fW8G3Nu8aj0Uk0UkcduVqja70qhf8cTK37QqB2fM/bpUpPZCc30Z74
         AdrF9mrrH0XYjE+8gdebcK4uVgKgIWl16A1lbTDNcJ1QNN6fcUVvGmD+ZS+DXR7kmcEP
         ehgp5bL1mH8HbnNI7iDz3PfljAUyywrXdawewRICpoIPC9fQisAnCSn14TocqocUzccg
         /aMA==
X-Gm-Message-State: AOAM532kWS4ATbvZX0qMef1nFKj1NBcuj3FO2dDeGr2yI96lL3Ya5kn4
        +OUVkDttz0m7gLJnUO/BonQp6AWerLjkc4Zr
X-Google-Smtp-Source: ABdhPJxtOf1S8W0GKp2K26zPIR9RhqdbVf5pS56fH1ef5JpHvLj+XUk6OxSathHU8KH1oAhW87zxrw==
X-Received: by 2002:a17:90a:8b91:b0:1be:db25:eecd with SMTP id z17-20020a17090a8b9100b001bedb25eecdmr3702104pjn.10.1649751747716;
        Tue, 12 Apr 2022 01:22:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x123-20020a623181000000b004fdf99d25f6sm29954306pfx.80.2022.04.12.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 01:22:27 -0700 (PDT)
Message-ID: <625536c3.1c69fb81.435d2.fc24@mx.google.com>
Date:   Tue, 12 Apr 2022 01:22:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-11-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 55 runs,
 3 regressions (renesas-devel-2022-04-11-v5.18-rc2)
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

renesas/master baseline-nfs: 55 runs, 3 regressions (renesas-devel-2022-04-=
11-v5.18-rc2)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-11-v5.18-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-11-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea5bee24e7143e88663f6497f6f9defd9ae0f77a =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f6d747369b2a24ae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6254f6d747369b2a2=
4ae0680
        new failure (last pass: renesas-devel-2022-04-04-v5.18-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6254fb373dab65aa64ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6254fb373dab65aa6=
4ae0697
        new failure (last pass: renesas-devel-2022-04-04-v5.18-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f096065a0c7fd1ae06a5

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6254f096065a0c7fd1ae06c7
        failing since 34 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-12T03:22:45.567026  /lava-6069403/1/../bin/lava-test-case   =

 =20
