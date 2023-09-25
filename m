Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF1A7AD929
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 15:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjIYNbX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 09:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbjIYNbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 09:31:21 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D9B11B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 06:31:12 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c5c91bece9so46176855ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695648672; x=1696253472; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qUxSkbIZIbBTLeCuDwyCOq2aWehLrFPCDhjAAAs0cBY=;
        b=SfVQmhDCfJRenbGBpnPMvm2uVIVg0TyCxiLY3tUJH6FESAM3pkkaJtn+/W0lSeJ47j
         PMSl5ub4qUbPXC8CZe/5DvGBHfJf0yIZm01eHqPaEaTNGlU6Qojc1ErlDJNk2/hDxoU4
         jujL1/AfZjWhodoMwREQenzVjc4CE769PdsQ64wZsP0EbteYXAjutVH3rdi8L3igSJVp
         CLJg/VMi4HKre/E4MzYkeCKHSOGt75ZTmTbs7D8qtJK0Mp/fTzq5J8i+gEqxa2CsTNJR
         t3DECBbeqsujRtOphpW1V7Eq8LjBYyjhHbozH9ZpCzfFhM1oLrqReyIceEDkc7GG4D0K
         KO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648672; x=1696253472;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUxSkbIZIbBTLeCuDwyCOq2aWehLrFPCDhjAAAs0cBY=;
        b=EsoB/NN0uEg/Kotnz+Jx5yqvJYJ6z3cS90P0VKTGNP69vuKEKIxTDNpqNJbqcKwXL1
         sVQGE8Oap8TfN9Gk8SlLwepAGZcBpyWJ1cM2hd0VS1EWh/KO46yB/YDyMXcUeB4M4Gqh
         TJLGoH3QIyoK/1Sc2zr0phOh+C5cweztb6RV5afltKuRvhoXjlPlJSfi6hb7OHbK/c8D
         txRMQCtK03XDd6gLuiU7d0ihGQaxDDPx6ym9tobVqGBg/7SgRz1RyziqXpd4CtAGuDg0
         /2qHi3FmejdsRm9/ZOWC5P+Po3Us26HgVe00Fb5BYNYGE251kUTF+sf5HP3ZvnuM6LZz
         ijAg==
X-Gm-Message-State: AOJu0YzJ7wL6Zly7hcaSg6kLbC0hKGK/jTfncaYXePNS9cfThMCPxsjQ
        P4mMoL+iJfPF7k4ZExub0SMomBct063UbwLDMoYB1Q==
X-Google-Smtp-Source: AGHT+IFt9y7V7doROx6g7bVRK2wMORyEtn/5wIVsbjnxqUbfTVf23umyARqoaMwHe860qFSrobjSEw==
X-Received: by 2002:a17:902:da88:b0:1c6:777:712c with SMTP id j8-20020a170902da8800b001c60777712cmr3081537plx.51.1695648671935;
        Mon, 25 Sep 2023 06:31:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bbb25dd3a7sm5203373plg.187.2023.09.25.06.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:31:11 -0700 (PDT)
Message-ID: <65118b9f.170a0220.b0caf.46f6@mx.google.com>
Date:   Mon, 25 Sep 2023 06:31:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-09-25-v6.6-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 48 runs,
 4 regressions (renesas-next-2023-09-25-v6.6-rc1)
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

renesas/next baseline: 48 runs, 4 regressions (renesas-next-2023-09-25-v6.6=
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
s-next-2023-09-25-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-09-25-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dbff263ccfbe181dbe3585637c56ffcd7ee4a4f4 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115b09bfe81c1abe8a0a65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115b09bfe81c1abe8a0a6e
        failing since 13 days (last pass: renesas-next-2023-07-27-v6.5-rc1,=
 first fail: renesas-next-2023-09-11-v6.6-rc1)

    2023-09-25T10:03:43.301957  =

    2023-09-25T10:03:44.467115  / # #export SHELL=3D/bin/sh
    2023-09-25T10:03:44.473177  =

    2023-09-25T10:03:45.971980  / # export SHELL=3D/bin/sh. /lava-130394/en=
vironment
    2023-09-25T10:03:45.978095  =

    2023-09-25T10:03:48.701559  / # . /lava-130394/environment/lava-130394/=
bin/lava-test-runner /lava-130394/1
    2023-09-25T10:03:48.708184  =

    2023-09-25T10:03:48.725022  / # /lava-130394/bin/lava-test-runner /lava=
-130394/1
    2023-09-25T10:03:48.738588  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-25T10:03:48.741802  + cd /l<8>[   33.918776] <LAVA_SIGNAL_START=
RUN 1_bootrr 130394_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115ac6ee3e05065a8a0b71

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115ac6ee3e05065a8a0b7a
        failing since 59 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-25T10:06:50.899306  / # #

    2023-09-25T10:06:50.999795  export SHELL=3D/bin/sh

    2023-09-25T10:06:50.999905  #

    2023-09-25T10:06:51.100418  / # export SHELL=3D/bin/sh. /lava-11612982/=
environment

    2023-09-25T10:06:51.100523  =


    2023-09-25T10:06:51.200994  / # . /lava-11612982/environment/lava-11612=
982/bin/lava-test-runner /lava-11612982/1

    2023-09-25T10:06:51.201189  =


    2023-09-25T10:06:51.213133  / # /lava-11612982/bin/lava-test-runner /la=
va-11612982/1

    2023-09-25T10:06:51.255869  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:06:51.272493  + cd /lava-116129<8>[   20.486727] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11612982_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115ae6bd3baae5a08a0a5d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115ae6bd3baae5a08a0a66
        failing since 59 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-25T10:05:09.091168  / # #

    2023-09-25T10:05:10.166506  export SHELL=3D/bin/sh

    2023-09-25T10:05:10.167808  #

    2023-09-25T10:05:11.654187  / # export SHELL=3D/bin/sh. /lava-11612989/=
environment

    2023-09-25T10:05:11.655455  =


    2023-09-25T10:05:14.373925  / # . /lava-11612989/environment/lava-11612=
989/bin/lava-test-runner /lava-11612989/1

    2023-09-25T10:05:14.376173  =


    2023-09-25T10:05:14.391427  / # /lava-11612989/bin/lava-test-runner /la=
va-11612989/1

    2023-09-25T10:05:14.407429  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:05:14.450430  + cd /lava-116129<8>[   28.538492] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11612989_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115adad12808c9d58a0aab

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-25-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115adad12808c9d58a0ab4
        failing since 59 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-25T10:07:05.691802  / # #

    2023-09-25T10:07:05.792272  export SHELL=3D/bin/sh

    2023-09-25T10:07:05.792375  #

    2023-09-25T10:07:05.892849  / # export SHELL=3D/bin/sh. /lava-11612990/=
environment

    2023-09-25T10:07:05.892954  =


    2023-09-25T10:07:05.993436  / # . /lava-11612990/environment/lava-11612=
990/bin/lava-test-runner /lava-11612990/1

    2023-09-25T10:07:05.993686  =


    2023-09-25T10:07:06.005599  / # /lava-11612990/bin/lava-test-runner /la=
va-11612990/1

    2023-09-25T10:07:06.075923  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:07:06.076012  + cd /lava-1161299<8>[   19.146726] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11612990_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
