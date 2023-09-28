Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3F37B20F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 17:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjI1PTC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 11:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjI1PTB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:19:01 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42430BE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:18:58 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3af65455e7cso458105b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695914337; x=1696519137; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V22strn0jSSgG7OrhXFMC+2wWKp2eDdkkko0x3e0p5U=;
        b=yQBclseuVt1P1YdRQ55AFNMXyAyzqUtXzqL7sNWcukCuTagzjivhW+fgDM0Awlr2HY
         O5sJLu0tzbq53+EfdVO98VgULJq8dnIdzbjYONmoniPBlJ1bCRI9Ea/WGlJ+C343lwEs
         yHbAmdRIp8lJRHJH+jIPdEGAjJKVQux1JmIL+xyMeE9HjybV/58HuWF8TmM3HCmAH5GP
         /wfob01ERi8wcMJOJunszm3nU8TvA/DJZHWf4T/YUsWHz1n/3KqX1/B3/wnGiDXxBcxE
         90ODoE+9mt1SyfRo3D9P5Vs0fJu6HpEQQSJkZgizYjYivRAW4qFPmGzFz5f+R1lAxYQA
         3vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914337; x=1696519137;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V22strn0jSSgG7OrhXFMC+2wWKp2eDdkkko0x3e0p5U=;
        b=RRbhihtbVZKuEGcvo0P9jnmWwUQ+/oQnIp4F4RvlPxHxZTXUuobC/EovU9ebFB3Fkp
         avMKi8noTdk2jC8BUw8PMKwEftgrMfV/X8VEkqtGWohvPQC7mE7ezsg8mN1jKPeLVRGr
         pz4w+cCwE3URBEVxK9jZMcAougno6xB6LBY9iaTqeDkTIWiPVmoO4o+fqnaEvVjOSLLV
         AONN48XLGsk/UXgXxCKH9yf2LqRlnW8mRet3tYdbpHjEUrQirtJjm4lS6WcC/FX6cMOx
         iAv4V7Vap2OfRnCjJfM2ZclAxioa1je95AZcMHcL6fbyvWiQk8Ba2+btnfjIOzjo4SAT
         04YA==
X-Gm-Message-State: AOJu0YwMIyBtAxve+ElvTHUNaStquEgF/JuvLQA+dD0LZ88DYUE3FNd0
        5dluPQqswx14R5BuahCusBrCTH6FWyiI10x/P6Rmlw==
X-Google-Smtp-Source: AGHT+IFld69GFPcTybMTvHS9C81I8seUno+w3kBXw1MO5kJC1PmWBYzf5fKXkqeffnYfLJOfrNzadA==
X-Received: by 2002:a05:6808:912:b0:3a1:b28f:814c with SMTP id w18-20020a056808091200b003a1b28f814cmr1532096oih.1.1695914337090;
        Thu, 28 Sep 2023 08:18:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7900d000000b006877a2e6285sm13391806pfo.128.2023.09.28.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:18:56 -0700 (PDT)
Message-ID: <65159960.a70a0220.9cd22.5c13@mx.google.com>
Date:   Thu, 28 Sep 2023 08:18:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-28-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 12 runs,
 2 regressions (renesas-devel-2023-09-28-v6.6-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 12 runs, 2 regressions (renesas-devel-2023-09-=
28-v6.6-rc3)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-28-v6.6-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-28-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      19d8182ea9c525553bf08fd99003f62430e68ec0 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/651569f8f948ef62108a0a52

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/651569f8f948ef62108a0a59
        new failure (last pass: renesas-devel-2023-09-27-v6.6-rc3)

    2023-09-28T11:56:26.982653  / # #
    2023-09-28T11:56:27.084599  export SHELL=3D/bin/sh
    2023-09-28T11:56:27.085344  #
    2023-09-28T11:56:27.186867  / # export SHELL=3D/bin/sh. /lava-382725/en=
vironment
    2023-09-28T11:56:27.187621  =

    2023-09-28T11:56:27.289009  / # . /lava-382725/environment/lava-382725/=
bin/lava-test-runner /lava-382725/1
    2023-09-28T11:56:27.290300  =

    2023-09-28T11:56:27.309230  / # /lava-382725/bin/lava-test-runner /lava=
-382725/1
    2023-09-28T11:56:27.543779  + export TESTRUN_ID=3D1_bootrr
    2023-09-28T11:56:27.546846  + cd /lava-382725/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/651569f8f948ef62108a0a69
        new failure (last pass: renesas-devel-2023-09-27-v6.6-rc3)

    2023-09-28T11:56:31.574610  /lava-382725/1/../bin/lava-test-case
    2023-09-28T11:56:31.632765  <8>[   22.667832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =20
