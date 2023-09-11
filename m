Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436DD79AEA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 01:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbjIKVRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242888AbjIKQax (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 12:30:53 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50A4CD2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 09:30:47 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68bed2c786eso3761503b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694449847; x=1695054647; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aPMkADmk1RIZ9DDnrlKhLmNuiYwAoxqdpXM0wdIEXO8=;
        b=GY1OIVM443PObHrEhGINXxXTOcefi7bZI18YzA6nbeOwZ1Lm/VgpqsceVvPqschvO4
         gwd2KBlChoj166XrqVwp1Lbar+nGYqtWfTTp4yXEYEQz8k5HsBnHcnL7fJ49nbx9E3Cy
         UzJBbj1xZnaWMSpjtWEp1ZvC2iPhxaf8oKFq2YfQmBIDvxOpoNkpEC5RvdtbC6sYndA+
         rhip9TZ3k1dZwtHzyxGW9m7azrtH32E8ryGM4DcXiPdFdOjPQluMqYkyMYd2jfcmZqtu
         oA6HFbEBro2WbTg7eqEBPZnloeIZjem1qGFantsbLAo/UWz7WoSGFLf09F7lcSxtzcTc
         4nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694449847; x=1695054647;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPMkADmk1RIZ9DDnrlKhLmNuiYwAoxqdpXM0wdIEXO8=;
        b=NqpYhb2meZ3nI/J5tjgsJQwoTiB2tRG7TCuEsJdkA5FfTuF72mF2Ty6X/Razj83d3z
         cgKctp59hJ3CTi3Gb1yXTZTnwSX3Q4FyjmIE5udBtQWE0lUkQ+qyaJqeHuHZ4NpWhPBr
         /yripApKdMcBl+gihmuGcJygkU6H0bkW2jRwiKcRaA5Y5TOXMW4pidOPj6IaL/2GTBbP
         oEqkNC3ndmvzztcbKxJk9EKFTgS5hv3hy6NbyLnL8zNQdfHtMiOK8ruoJL+qmYNfl52O
         uiueH7RiqEiLgDd6Q8T9z5ZJPVZQjCIDMlhcTB8nlVLs8tLUiDZICbCZ/0/1TNmAloJ1
         Un2w==
X-Gm-Message-State: AOJu0YxUINfeTQ3UPC+oxVEYt6Mpk4qH2gNIvkqUuRDwP9TsCewYyNP+
        RM01Erc37EM3PUxbYaO2nU0I79eILvLh5kNvRv8=
X-Google-Smtp-Source: AGHT+IG83YADYbJcCDH/gPp/c1opOCs6phBhJwTDP9zWFpv/4z7Ng1pn9lT+29cBs6SFlF2XY5ZqRg==
X-Received: by 2002:a05:6a00:23d5:b0:68e:42c9:74de with SMTP id g21-20020a056a0023d500b0068e42c974demr10034976pfc.18.1694449846881;
        Mon, 11 Sep 2023 09:30:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ce7-20020a056a002a0700b0068fc48fcaa8sm2158089pfb.155.2023.09.11.09.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 09:30:46 -0700 (PDT)
Message-ID: <64ff40b6.050a0220.dbb02.640b@mx.google.com>
Date:   Mon, 11 Sep 2023 09:30:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-09-11-v6.6-rc1
Subject: renesas/master baseline: 45 runs,
 6 regressions (renesas-devel-2023-09-11-v6.6-rc1)
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

renesas/master baseline: 45 runs, 6 regressions (renesas-devel-2023-09-11-v=
6.6-rc1)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =

r8a774c0-ek874           | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =

r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =

r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-11-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-11-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1eca18d69419dafde85f1255c5979532b41415f7 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff0ff9e48d8fdb28286d94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ff0ff9e48d8fdb28286=
d95
        failing since 14 days (last pass: renesas-devel-2023-08-21-v6.5-rc7=
, first fail: renesas-devel-2023-08-28-v6.5) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff1020c8d60fcefb286da8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff1020c8d60fcefb286dab
        failing since 55 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-11T13:02:57.276179  + set +x
    2023-09-11T13:02:57.279445  <8>[   28.465955] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1007789_1.5.2.4.1>
    2023-09-11T13:02:57.387203  / # #
    2023-09-11T13:02:58.851674  export SHELL=3D/bin/sh
    2023-09-11T13:02:58.872668  #
    2023-09-11T13:02:58.873136  / # export SHELL=3D/bin/sh
    2023-09-11T13:03:00.831179  / # . /lava-1007789/environment
    2023-09-11T13:03:04.433389  /lava-1007789/bin/lava-test-runner /lava-10=
07789/1
    2023-09-11T13:03:04.454855  . /lava-1007789/environment
    2023-09-11T13:03:04.455277  / # /lava-1007789/bin/lava-test-runner /lav=
a-1007789/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a774c0-ek874           | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff1025225f49238e286d7d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff1025225f49238e286d80
        failing since 55 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-11T13:03:17.084472  / # #
    2023-09-11T13:03:18.546137  export SHELL=3D/bin/sh
    2023-09-11T13:03:18.566713  #
    2023-09-11T13:03:18.566920  / # export SHELL=3D/bin/sh
    2023-09-11T13:03:20.522745  / # . /lava-1007784/environment
    2023-09-11T13:03:24.115247  /lava-1007784/bin/lava-test-runner /lava-10=
07784/1
    2023-09-11T13:03:24.135811  . /lava-1007784/environment
    2023-09-11T13:03:24.135920  / # /lava-1007784/bin/lava-test-runner /lav=
a-1007784/1
    2023-09-11T13:03:24.227025  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-11T13:03:24.227173  + cd /lava-1007784/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff0fe4e48d8fdb28286d6c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff0fe4e48d8fdb28286d75
        failing since 55 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-11T13:06:39.180772  / # #

    2023-09-11T13:06:39.282916  export SHELL=3D/bin/sh

    2023-09-11T13:06:39.283636  #

    2023-09-11T13:06:39.385090  / # export SHELL=3D/bin/sh. /lava-11494613/=
environment

    2023-09-11T13:06:39.385761  =


    2023-09-11T13:06:39.487126  / # . /lava-11494613/environment/lava-11494=
613/bin/lava-test-runner /lava-11494613/1

    2023-09-11T13:06:39.488126  =


    2023-09-11T13:06:39.489326  / # /lava-11494613/bin/lava-test-runner /la=
va-11494613/1

    2023-09-11T13:06:39.554951  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:06:39.555454  + cd /lava-114946<8>[   19.500711] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11494613_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff1000e48d8fdb28286dcf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff1000e48d8fdb28286dd8
        failing since 55 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-11T13:02:36.709799  / # #

    2023-09-11T13:02:37.789763  export SHELL=3D/bin/sh

    2023-09-11T13:02:37.791625  #

    2023-09-11T13:02:39.282341  / # export SHELL=3D/bin/sh. /lava-11494607/=
environment

    2023-09-11T13:02:39.284120  =


    2023-09-11T13:02:42.003825  / # . /lava-11494607/environment/lava-11494=
607/bin/lava-test-runner /lava-11494607/1

    2023-09-11T13:02:42.005729  =


    2023-09-11T13:02:42.017838  / # /lava-11494607/bin/lava-test-runner /la=
va-11494607/1

    2023-09-11T13:02:42.076994  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:02:42.077456  + cd /lava-114946<8>[   28.523697] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11494607_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64ff0ff62470eeeb68286d93

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff0ff62470eeeb68286d9c
        failing since 55 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-11T13:06:48.656540  / # #

    2023-09-11T13:06:48.758632  export SHELL=3D/bin/sh

    2023-09-11T13:06:48.759322  #

    2023-09-11T13:06:48.860483  / # export SHELL=3D/bin/sh. /lava-11494605/=
environment

    2023-09-11T13:06:48.861134  =


    2023-09-11T13:06:48.962275  / # . /lava-11494605/environment/lava-11494=
605/bin/lava-test-runner /lava-11494605/1

    2023-09-11T13:06:48.963310  =


    2023-09-11T13:06:49.004110  / # /lava-11494605/bin/lava-test-runner /la=
va-11494605/1

    2023-09-11T13:06:49.004577  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:06:49.044285  + cd /lava-11494605/1/tests/1_boot<8>[   17=
.015039] <LAVA_SIGNAL_STARTRUN 1_bootrr 11494605_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
