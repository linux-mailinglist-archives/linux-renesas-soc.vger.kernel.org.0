Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A077A59CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 08:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjISGNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 02:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjISGND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 02:13:03 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6184A102
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 23:12:57 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c59c40b840so3144605ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 23:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695103976; x=1695708776; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0QYAX8kDbtMNK9Xqbbb5LIzVlBkg7mMMZCks9stfeEY=;
        b=Aki/rKnN9I6NRrTnsaed8oEwQvY9y3nrG92QLl6yDJ0YdIBrWF5OoDqsMTr5AVFq9y
         WkKGLGimuhC0IV+7JWFO9gmSYajTZ+nxeHqDMvfMYPqp9EjPXOawPOxOvEANxOnubQ0+
         lWffaTt5g0dFlk5Tn54DzLZjPuaRge48l7n/CQQ6XHBsEFQYBWv9gE22kuF8mP6cjDO5
         kzc5tU71tcfri+SfB/wmEn2AE2FEY0zZDHqoMiSyz1FpXI51LWdju0cQSnDuJwE3cSQE
         ofY4nrBISWsLVIo1lfgkqmKDM7BZ8e8TDXSZCP3br8+IObIWijvvrRl7cfsPOQvcmYCh
         VKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695103976; x=1695708776;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QYAX8kDbtMNK9Xqbbb5LIzVlBkg7mMMZCks9stfeEY=;
        b=ia20iep7Dqy/9FpnMkUStlblmSvMWhK+e2mUw7uKIptG90TH3vDYiBoA1YLanDC3dP
         OKUVfkeDFE/H7ApgolC3XZuXsGNPFkcqOAH1n/rHO6IZzLYSTsyLPeKjof6z4LOwJ9+X
         j7cvjpXtITJTjpGtBOCKjUZ76xGCtXI3P/YozMA/ftrYB2HjAta1VqxwKQtNca0RVxJu
         rzq4eaQ8p5Loz6HQMM8Nt1PhBtTGRbTTgBzgq7A6yzobGwYCiNOtWZy7wOa3DEECM8Qh
         lYeghqSp6vKfb0NDJ4wpDsvgGCuBOtLXPs/orNE6W2RNqI/xG/nxU4rETZeYQHufrNRR
         colQ==
X-Gm-Message-State: AOJu0Yzu3GUNQUZN67llZeVI7dRZDfvbP2aUC8ZI0+HCZxrbloZSCZKI
        0KuHNgG7bwfycLwHUB++uEOVOuXgkG7HQxfb8bOsLA==
X-Google-Smtp-Source: AGHT+IHDR7/zeDg6IxP0RCyYnQqXycOCnepOSUGwp1bXSxs38eD4PGsiJo5hp7marqYTzlRE3idSEg==
X-Received: by 2002:a17:903:2301:b0:1b8:b285:ec96 with SMTP id d1-20020a170903230100b001b8b285ec96mr14086607plh.23.1695103976340;
        Mon, 18 Sep 2023 23:12:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id be6-20020a170902aa0600b001bdccf6b8c9sm810452plb.127.2023.09.18.23.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 23:12:55 -0700 (PDT)
Message-ID: <65093be7.170a0220.3f964.3c3b@mx.google.com>
Date:   Mon, 18 Sep 2023 23:12:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-09-18-v6.6-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 48 runs,
 4 regressions (renesas-next-2023-09-18-v6.6-rc1)
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

renesas/next baseline: 48 runs, 4 regressions (renesas-next-2023-09-18-v6.6=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-09-18-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-09-18-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9be37ec25181d9cb019a0ccedc287da689a74c16 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/650908943950c893b78a0acb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650908953950c893b78a0ad4
        failing since 7 days (last pass: renesas-next-2023-07-27-v6.5-rc1, =
first fail: renesas-next-2023-09-11-v6.6-rc1)

    2023-09-19T02:33:29.993387  + set<8>[   29.060492] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116356_1.5.2.4.1>
    2023-09-19T02:33:29.993984   +x
    2023-09-19T02:33:30.102460  / # #
    2023-09-19T02:33:31.268616  export SHELL=3D/bin/sh
    2023-09-19T02:33:31.274767  #
    2023-09-19T02:33:32.773145  / # export SHELL=3D/bin/sh. /lava-116356/en=
vironment
    2023-09-19T02:33:32.779095  =

    2023-09-19T02:33:35.501467  / # . /lava-116356/environment/lava-116356/=
bin/lava-test-runner /lava-116356/1
    2023-09-19T02:33:35.508204  =

    2023-09-19T02:33:35.511745  / # /lava-116356/bin/lava-test-runner /lava=
-116356/1 =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6509085c6aabc25a838a0a85

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6509085c6aabc25a838a0a8e
        failing since 53 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-19T02:37:07.592834  / # #

    2023-09-19T02:37:07.693391  export SHELL=3D/bin/sh

    2023-09-19T02:37:07.693516  #

    2023-09-19T02:37:07.794018  / # export SHELL=3D/bin/sh. /lava-11566765/=
environment

    2023-09-19T02:37:07.794141  =


    2023-09-19T02:37:07.894671  / # . /lava-11566765/environment/lava-11566=
765/bin/lava-test-runner /lava-11566765/1

    2023-09-19T02:37:07.894897  =


    2023-09-19T02:37:07.906385  / # /lava-11566765/bin/lava-test-runner /la=
va-11566765/1

    2023-09-19T02:37:07.947855  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T02:37:07.965732  + cd /lava-115667<8>[   20.454163] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11566765_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6509087d3950c893b78a0a7e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6509087d3950c893b78a0a87
        failing since 53 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-19T02:35:11.157463  / # #

    2023-09-19T02:35:12.237804  export SHELL=3D/bin/sh

    2023-09-19T02:35:12.239701  #

    2023-09-19T02:35:13.730431  / # export SHELL=3D/bin/sh. /lava-11566763/=
environment

    2023-09-19T02:35:13.732292  =


    2023-09-19T02:35:16.450451  / # . /lava-11566763/environment/lava-11566=
763/bin/lava-test-runner /lava-11566763/1

    2023-09-19T02:35:16.452524  =


    2023-09-19T02:35:16.466978  / # /lava-11566763/bin/lava-test-runner /la=
va-11566763/1

    2023-09-19T02:35:16.482994  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T02:35:16.525930  + cd /lava-115667<8>[   28.508042] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11566763_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65090871ff83ae58f38a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-18-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65090871ff83ae58f38a0a4b
        failing since 53 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-19T02:37:18.976973  / # #

    2023-09-19T02:37:19.079161  export SHELL=3D/bin/sh

    2023-09-19T02:37:19.080015  #

    2023-09-19T02:37:19.181506  / # export SHELL=3D/bin/sh. /lava-11566769/=
environment

    2023-09-19T02:37:19.182252  =


    2023-09-19T02:37:19.283615  / # . /lava-11566769/environment/lava-11566=
769/bin/lava-test-runner /lava-11566769/1

    2023-09-19T02:37:19.284797  =


    2023-09-19T02:37:19.301945  / # /lava-11566769/bin/lava-test-runner /la=
va-11566769/1

    2023-09-19T02:37:19.369961  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T02:37:19.370464  + cd /lava-1156676<8>[   17.024770] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11566769_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
