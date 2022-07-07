Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB83A56A6C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 17:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbiGGPUC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235428AbiGGPUB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 11:20:01 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB8224BFD
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 08:20:00 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id z14so19160540pgh.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jul 2022 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uGkTpcTvZE36kWbIA0xBFJkxn7jVBZ7/EXy05PwzNxA=;
        b=m5ZitoNpqqj3hJC83/jFJBEXhSo9DkLW/TOaDq+GMsrcdnCYx6Asa8VaGQQmz8UKZw
         oHmVRuvoAgiZioWGeYBkPXnMGDLdGusnU3W+re71XtP9n4JRjxTm/zkuhailQ7y2OxDb
         plPc7OWEgkYzLHLJpBmfmDOodYtiBQroLS5GAtoSJ/xzjFZVYsAE88D3pgcrjonBGnLb
         bAguIc/EGFRjVnDE1LoUrI1IUE8QRJiY0EcOECketfbsubq3z3GDcASv3qI41baei0w7
         lapC9yCsWp786jzoGZeAv7dXyUDRBmbuUk9GxvX33jkQN2rTf7ZaGJWP7Zn3G2/a49rU
         N4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uGkTpcTvZE36kWbIA0xBFJkxn7jVBZ7/EXy05PwzNxA=;
        b=wfMC4tRK4h4XC2krpd5/N85wIYonxaRtYxIprIRHnRMoF/FNzhTI11BsZMvqW/zMq1
         gibX2Y0iy3Apkuwpt+3igt318z/LGdLOP7tM2xQpAxzIBvjITCWrpjpQocud11dULibi
         7gMfUkGeClKrs0d//7lrx2vQ5/+fvLLeFm2KW9QcI/8ZgKfrtBiM298H+C+kGRO0p+Vt
         JvkBbZfXfOEJIpfQjuBMyJhzlQFlXh4W8cSeL6IKsqV/LoNmrTJ9UXUVtgMXBdst0468
         AvNTHUqWl5GmaJlpR4jBTnx9sAjtLv4TyeN3FbodWbf2wsWQ/D9eOye3agF3Bbam/01e
         /1LQ==
X-Gm-Message-State: AJIora+USdYPFz8mNv3NFj5Y4JCRM7PzF03ebCmAsaQ00A6CPRKoBGOR
        v1TJEskXdQxycUT+EMLecZjjy7xpB9e5D066
X-Google-Smtp-Source: AGRyM1vBwgEVUJa99qOsynfKpux61nDqh2WKGizZqbGR75xaqW4t5H8UrJ12QmWuD8bY+UxJMyvE/g==
X-Received: by 2002:a65:6d08:0:b0:412:71bc:7e24 with SMTP id bf8-20020a656d08000000b0041271bc7e24mr12964206pgb.219.1657207199826;
        Thu, 07 Jul 2022 08:19:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902f64a00b0016bf01394e1sm6564434plg.124.2022.07.07.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 08:19:59 -0700 (PDT)
Message-ID: <62c6f99f.1c69fb81.107a5.a48a@mx.google.com>
Date:   Thu, 07 Jul 2022 08:19:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 93 runs,
 5 regressions (renesas-next-2022-07-07-v5.19-rc1)
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

renesas/next baseline-nfs: 93 runs, 5 regressions (renesas-next-2022-07-07-=
v5.19-rc1)

Regressions Summary
-------------------

platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
at91sam9g20ek | arm  | lab-broonie  | gcc-10   | at91_dt_defconfig         =
   | 1          =

jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig+ima    =
   | 1          =

jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig        =
   | 1          =

jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig+crypto =
   | 1          =

jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-07-v5.19-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b5468cb7909f0068dd977e1f63ea39132098dbb7 =



Test Regressions
---------------- =



platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
at91sam9g20ek | arm  | lab-broonie  | gcc-10   | at91_dt_defconfig         =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/62c6c39c4ee07a7df4a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91=
sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91=
sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c6c39c4ee07a7df=
4a39bd9
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1) =

 =



platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig+ima    =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/62c6d3ee2790c5b742a39c40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nf=
s-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nf=
s-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c6d3ee2790c5b74=
2a39c41
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig        =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/62c6d557853a84ade8a39c14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c6d557853a84ade=
8a39c15
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig+crypto =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/62c6d9c961ee05f2e8a39c13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c6d9c961ee05f2e=
8a39c14
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform      | arch | lab          | compiler | defconfig                 =
   | regressions
--------------+------+--------------+----------+---------------------------=
---+------------
jetson-tk1    | arm  | lab-baylibre | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c6dc9b6542a991e9a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62c6dc9b6542a991e=
9a39be0
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
