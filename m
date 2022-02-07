Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923924AC9E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 20:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiBGTs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 14:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241023AbiBGTpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 14:45:25 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CE7C0401DA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 11:45:24 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d187so14785532pfa.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Feb 2022 11:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bwaJkTanQbDWDJpGsODN6Ndacjns40cIs0N6yepdeSQ=;
        b=Poj2E7/t9T3gYG5syB9XnOynpIC0KyPQ4j1kJzavn3JqLQxqA+h5Ma+6nIimGhmZ++
         cimdJV3zA6txmbQdNFM6uDb+xKxEh8ubKGyWyjHRemo3jZeVDgtd26G/jFnddNiy0BjB
         gIPcI47Et8MqahPXcUf2rBvH9uuy7caaRNRkz/Y7rnzWhpAgvq1jXNUwBkVhDNpDGv71
         9NGqPrGwEvoqL0qYQ9ZGTdoeFt8iOJW/ZZnIqIFvW1j2xzEt9fUflSIqvHC7rdd7DK+D
         Xv9AybBMTjUFGz4YjTBcyjeJPvZ4NSEBDq5h+6ofrHZdcTfmYiblEImcsCDvjZ8ebNEI
         4EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bwaJkTanQbDWDJpGsODN6Ndacjns40cIs0N6yepdeSQ=;
        b=I6Ik6S+PJO6nEGhkPq7fjNnudcJyHzfbyAf8qb7/PPt4g6eimv47sU/BsXk8VYGOhH
         7csNIUJdT6vR+3mkGJt5WHHTmH1uZqXo/nt1OUhXibtDkgY/AhQ9fKctf2lyr6tRIra6
         N9/0odKnJxvTg2vUmC+boCX5vZHZ/XyhJhVGCIp+BX492LzXv5CveLbnLkdVff+2EG28
         J7P2xjoTs/NjwCTnRyEqfMPwrFeCfqVv3hDQVr6zF+5hUNWIv/4W0pfJCH/Gav/QMF9j
         tH3jwE3HQnBBwOKh2wE1w2f0thpXmbsnb6CN5OkiM7B6n/Lf2GIM8U6npOv1inaoGAqG
         lr1w==
X-Gm-Message-State: AOAM533+YMpnFRvuedQ8CF8bHqyxmSnNh1wku4QcCvYnfu2c6zQHe47Q
        n4Jg7XBTN0i3AzERlkhtG+j0zQpJSxsCD896
X-Google-Smtp-Source: ABdhPJwSwRxbX2q+f25+DuJG0dGauZPL3Z7M5F8nZYp5lc+3ZX7qgNC+L+RIyHhQ6IANJLsCJ1nPwg==
X-Received: by 2002:a63:e94e:: with SMTP id q14mr775905pgj.376.1644263124155;
        Mon, 07 Feb 2022 11:45:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 12sm9175134pgb.71.2022.02.07.11.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 11:45:23 -0800 (PST)
Message-ID: <620176d3.1c69fb81.c83cb.7dad@mx.google.com>
Date:   Mon, 07 Feb 2022 11:45:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-07-v5.17-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master baseline: 355 runs,
 3 regressions (renesas-devel-2022-02-07-v5.17-rc3)
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

renesas/master baseline: 355 runs, 3 regressions (renesas-devel-2022-02-07-=
v5.17-rc3)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-07-v5.17-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-07-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1473d361292c53a189d07c296105887e45695417 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620150cc0e4a8b4cfa5d6f02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620150cc0e4a8b4cfa5d6=
f03
        failing since 83 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62013e821d52e088c15d6eea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62013e821d52e088c15d6=
eeb
        new failure (last pass: renesas-devel-2022-02-02-v5.17-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62013ef9ab677c03055d6f2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62013ef9ab677c03055d6=
f2d
        new failure (last pass: renesas-devel-2022-02-02-v5.17-rc2) =

 =20
