Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBC25158EF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 01:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381502AbiD2X1M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 19:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381605AbiD2X1M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 19:27:12 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC424CC513
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 16:23:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id p12so8145980pfn.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j/IKgmxiBsG7lYcgAJdQgSB23+LkVQX+mTsauQEhYgk=;
        b=aZlFqRLgTTNfjD/XNRqjbftYrViv9OGoWpl+/lAUzF4HPQp9D/sjdCrV6d8pId3Msx
         XiM7/eHwtzIbQHcYVuHvFP11KmHk5Nydb5ymZLKAWpOlpmc1oH9LNgOD9DK+Q7MriG4T
         Rvd21dBCteW9i+8fjjuYhOWDAMgbH53StCYtShWWy6eyJopDSK69R2HRwdoluILT7J/M
         1hT+KizlH4tB3s8Njkx63FAt8a7LZB4EvRFFsNK+cVu9PrKXUio5IjqYXr+Z3UTPG/KR
         lc3b7FZhKo2pMKSHFKFwFnfvULRZWpyDWt0K6RQHm+hWQ36uUhHabdnuqzWotri8TQny
         RF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j/IKgmxiBsG7lYcgAJdQgSB23+LkVQX+mTsauQEhYgk=;
        b=w0fTh5Cv+Lo3WsJeVd55tOKmNHftz1sLEZfbNXq9RHNXhwTiNfakoS54xgXNfybkcX
         QgjDx6QLbicfnVd1tnyaFZ6Zh7duLB4iCpkTEY6O3muKIxaMyQ5zlhIQSU7VoyVq6Fqm
         s3nArzf8ff5iuoCBor4BfJQSDCZem7x7WaWGDLVRitwAC/sSsDU2QnVdixNww/X/vRYO
         XX3RxxREGgCPpq+eujxMdXDJoRnoGiK9Nai7koWxE12hANfUWzRJoJ/PbbUQ6nYSIRPx
         tmPJRgsBzOLbQ4v1iDkryhe4Rh2bB9VfcFMCxYJKYt3bWAHRsoS05Z+uy7pwiKxF4AUt
         Rwig==
X-Gm-Message-State: AOAM531BmqeS1wEWfvM8fjhAY5g5LXI8W/bAj52BjUfojjmVmuT2bSLe
        6upDJYnaq6Z4Vvs1WkvpND5bn9Ln4C2exk+dzAs=
X-Google-Smtp-Source: ABdhPJyhjlqHiZN72ku+aqad+MxYweLKR7jJg/uGlasIuBlY8x0p+Ez4HX0OVwFWt5yG126ywK+3WQ==
X-Received: by 2002:a63:b811:0:b0:3aa:fecf:783c with SMTP id p17-20020a63b811000000b003aafecf783cmr1243449pge.11.1651274631216;
        Fri, 29 Apr 2022 16:23:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a154800b001daac75511esm9000529pja.51.2022.04.29.16.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 16:23:51 -0700 (PDT)
Message-ID: <626c7387.1c69fb81.78a84.6823@mx.google.com>
Date:   Fri, 29 Apr 2022 16:23:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-04-29-v5.18-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 82 runs,
 8 regressions (renesas-devel-2022-04-29-v5.18-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 82 runs, 8 regressions (renesas-devel-2022-04-=
29-v5.18-rc4)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
odroid-xu3        | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+c=
rypto    | 6          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-29-v5.18-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-29-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      32b87add13fcbd8b384a969924720c0f2b30893a =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
odroid-xu3        | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626c584588137568c8bf5ffe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/626c584588137568c=
8bf5fff
        failing since 38 days (last pass: renesas-devel-2022-03-08-v5.17-rc=
7, first fail: renesas-devel-2022-03-21-v5.17) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+c=
rypto    | 6          =


  Details:     https://kernelci.org/test/plan/id/626c412800aea3cf14bf5ff2

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/626c412800aea3cf14bf602c
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:40.952720  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:40.994703  <8>[   27.326405] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.cros-ec-keyb-driver-present: https://kernelci.org/t=
est/case/id/626c412800aea3cf14bf602d
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:39.870306  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:39.914584  <8>[   26.244600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dfail>   =


  * baseline-nfs.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/tes=
t/case/id/626c412800aea3cf14bf602e
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:38.794987  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:38.836116  <8>[   25.167595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.cros-ec-i2c-tunnel-driver-present: https://kernelci=
.org/test/case/id/626c412800aea3cf14bf602f
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:37.719652  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:37.761525  <8>[   24.091361] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dfail>   =


  * baseline-nfs.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/=
id/626c412800aea3cf14bf6030
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:36.644909  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:36.685650  <8>[   23.017579] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.cros-ec-dev-driver-present: https://kernelci.org/te=
st/case/id/626c412800aea3cf14bf6031
        new failure (last pass: renesas-devel-2022-04-28-v5.18-rc4)

    2022-04-29T19:48:35.566804  /lava-6210653/1/../bin/lava-test-case
    2022-04-29T19:48:35.607634  <8>[   21.938551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dfail>   =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/626c410c5dceac3303bf6027

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/626c410c5dceac3303bf6049
        failing since 52 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-29T19:48:10.905029  <8>[   35.286773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-29T19:48:11.939950  /lava-6210943/1/../bin/lava-test-case   =

 =20
