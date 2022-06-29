Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6964C560AD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 22:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiF2UCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 16:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiF2UCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 16:02:30 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB333ED11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 13:02:29 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so530868pji.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bAKNhE1HqcfA+Wr6ohr2LZJgJkg3CdIpZnqilvqzNn8=;
        b=Q28ICiHz3E2apMdUdNwHkJYUoIrblpR0SSuGI8VUcbQnDUoomOnWfrySP4npMWzuiN
         Wz5nqxPLP4nf+u39+b6Br9+Bj+OCtTdBaoM833eNtN4AKrZCfOpoVvJJkKvDrprWgaOg
         +wDqXXSiYqL0GXrpY6zfBHmLj3EIb6jsBkaTzgilZu7iMc1PcOqWtZCJ1yf/ZQqlCx2S
         aW9ARah3rDbPS6K3zqXm1macTe19JraXMP4mr5G9uiUsn1kwNzjYDhpIei27HZZX+OU6
         igS9lf87JpLz2JpF1qi1BJiKae5Y71hWa7g+TJTUnxQHkxXG9mMW9QM5NarT8+rkX6XK
         nQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bAKNhE1HqcfA+Wr6ohr2LZJgJkg3CdIpZnqilvqzNn8=;
        b=MNg+O2gPRSojnwxjMZFVpO3tmMHElpf5LyN802cVBM/OqXMxD5ZIEU5gKitPF8npwX
         Pzj7Qd8h/pF1pr24puhJ4ckZIT4GmWRQAG7uIGb/1TA5qr4cF6PuSsy57Dfd/tyY3oze
         uePsGLaNP5volXywVJRQDIcvjezbYCleRFlQClFEw7+bJTnqG8Z8kyaOyMEycaMNbpN0
         cwHzNoNaUQV75oPQCNgS9TvspfjGSGMDj3dgYu7rSuZzs+UuC0QhXC1m8jX4brs34XWb
         AW9+fMMgySbWo1hgFwkB0+/xhuuKg7MSy0LLVsaU6tSZGTvOKv7b91U7oKw1SRR94i57
         WOQQ==
X-Gm-Message-State: AJIora8Ep+wSIcWEw/qp1iTl0anZWimzT7+bTsxEJKWrl+9fgbMluPWq
        kK1syD/CXv0Osl8M5PgVeDrYZqjL228Aw9aDI6I=
X-Google-Smtp-Source: AGRyM1srreY7DbSRWVU7/T5zu7vS9Wf1EBiOcRp0s3mwN5ULRi4M+NewVdSpZTSBPzXKkXgrEwCN+g==
X-Received: by 2002:a17:90b:35c7:b0:1ee:f8a7:2b03 with SMTP id nb7-20020a17090b35c700b001eef8a72b03mr7726007pjb.50.1656532948635;
        Wed, 29 Jun 2022 13:02:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b0016797c33b6csm11760314plb.116.2022.06.29.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 13:02:27 -0700 (PDT)
Message-ID: <62bcafd3.1c69fb81.d3322.0e62@mx.google.com>
Date:   Wed, 29 Jun 2022 13:02:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-29-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 52 runs,
 2 regressions (renesas-next-2022-06-29-v5.19-rc1)
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

renesas/next baseline-nfs: 52 runs, 2 regressions (renesas-next-2022-06-29-=
v5.19-rc1)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig                    =
| regressions
-----------+------+--------------+----------+------------------------------=
+------------
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defc...MB2_KERNEL=3D=
y | 1          =

jetson-tk1 | arm  | lab-baylibre | gcc-10   | tegra_defconfig              =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-29-v5.19-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-29-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5695289da1bfec5108a882840cf064600cb4ff0c =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig                    =
| regressions
-----------+------+--------------+----------+------------------------------=
+------------
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defc...MB2_KERNEL=3D=
y | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc7d8d53ae2528b6a39c70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62bc7d8d53ae2528b=
6a39c71
        failing since 22 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform   | arch | lab          | compiler | defconfig                    =
| regressions
-----------+------+--------------+----------+------------------------------=
+------------
jetson-tk1 | arm  | lab-baylibre | gcc-10   | tegra_defconfig              =
| 1          =


  Details:     https://kernelci.org/test/plan/id/62bc78c1e079dcdcd8a39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62bc78c1e079dcdcd=
8a39be3
        failing since 11 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-17-v5.19-rc1) =

 =20
