Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02197AD937
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 15:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjIYNdP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 09:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjIYNdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 09:33:15 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAB7E8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 06:33:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c5db4925f9so44421515ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695648787; x=1696253587; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58Ns2FW0bYEhzxH9PwdhvUwIb7ceelGA/S7nPGkBL2k=;
        b=Fdpwb+b0cyLBth+L0Ihp7yTLb4CiWj6HKIGLUr4evtHtVLMIIgeUfRJjLQum1j4BMj
         UWx4NRU2myl64tMSDi7Eqbpl2LwkYmhCjDYNkAt/zfLLpOtml7A45CGJG/ZNDNbqc0ir
         WYfrZKOMYdbBloJur4THIwdt662hdIsttFqbqkLoUApwBj8y+Hs/2HzO6CR3ZTzo0mv3
         vUalyhjX+283J2RmnixpLkd/X6BZ97CNvGnHmBhbGmH0Z3UvRjaKJHBu0kwfghHCajvm
         OiUz+BnMZM2i3gEhDZ0fvzkaXb7cj8Hb5qPmoON3hSBahlhWpsu/1qMoiWdCtdu69DTQ
         8/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648787; x=1696253587;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58Ns2FW0bYEhzxH9PwdhvUwIb7ceelGA/S7nPGkBL2k=;
        b=PRFYzQBEtzFrBjtE83TL5S/bpxfsqjmVnZ/JowKXAeAQRoatvxm5kvmuOsj85yuewL
         +NM+7/u819ya7BJf20NdDtrg0SJzabmLtoM9BM3k1lG3sPO9t1SXikZr7aNiKxMNhTam
         32jCA2JtpSk5RpoRiLPKYmP6SPFeM+AQbG7Oa6Jyc+hc80n6qPQA9IXM3wf7NZrenx2w
         0e/TaGtUquJ/w/iqQzZJ/BplXDvq/X+pYM9mhONYb5pGdWyG/XrPO/7nOgBkzDyKpX7l
         dVRmfkmdnJg3zZd4tVFDn0UB+i3x6xestRgFZ/06WT5vyGNkgQ0EvPcOSl2t1lIdpVIj
         tWHg==
X-Gm-Message-State: AOJu0YzCXVvlRdPQwOcCy5YOWHqU+jxl4wpnqmkOVqmgnaVcuc5FWzp3
        tsN9HD8MLAcszw6D/N/h92riVCbrnnYJSrbhtD9YhQ==
X-Google-Smtp-Source: AGHT+IHKH6zCIu/4tY4cjHj/hTbYwMGDyRirPpTG1sL/NUhmAyOJgJ/IcY11HIDNJ0ty+irn+XsyAA==
X-Received: by 2002:a17:903:1ca:b0:1c0:afda:7707 with SMTP id e10-20020a17090301ca00b001c0afda7707mr10876834plh.34.1695648787192;
        Mon, 25 Sep 2023 06:33:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b001c5fc11c085sm4940703plg.264.2023.09.25.06.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:33:06 -0700 (PDT)
Message-ID: <65118c12.170a0220.d5d4b.18fa@mx.google.com>
Date:   Mon, 25 Sep 2023 06:33:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-25-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 49 runs,
 5 regressions (renesas-devel-2023-09-25-v6.6-rc3)
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

renesas/master baseline: 49 runs, 5 regressions (renesas-devel-2023-09-25-v=
6.6-rc3)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-25-v6.6-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-25-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5da24426ea5f6b66c98f74193d0bbd9d63ae3db8 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115b95ee17ba5a7e8a0aa9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115b95ee17ba5a7e8a0ab2
        failing since 13 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-09-25T10:05:53.865273  <8>[   28.526681] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-09-25T10:05:53.872215  + set<8>[   28.536092] <LAVA_SIGNAL_ENDRUN =
0_dmesg 130414_1.5.2.4.1>
    2023-09-25T10:05:53.872828   +x
    2023-09-25T10:05:53.981404  / # #
    2023-09-25T10:05:55.147455  export SHELL=3D/bin/sh
    2023-09-25T10:05:55.153535  #
    2023-09-25T10:05:56.652828  / # export SHELL=3D/bin/sh. /lava-130414/en=
vironment
    2023-09-25T10:05:56.658828  =

    2023-09-25T10:05:59.382740  / # . /lava-130414/environment/lava-130414/=
bin/lava-test-runner /lava-130414/1
    2023-09-25T10:05:59.389647   =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115becb6cd1e09798a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115becb6cd1e09798a0a49
        failing since 69 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-25T10:07:22.366052  / # #
    2023-09-25T10:07:23.825578  export SHELL=3D/bin/sh
    2023-09-25T10:07:23.846123  #
    2023-09-25T10:07:23.846333  / # export SHELL=3D/bin/sh
    2023-09-25T10:07:25.801816  / # . /lava-1012952/environment
    2023-09-25T10:07:29.399021  /lava-1012952/bin/lava-test-runner /lava-10=
12952/1
    2023-09-25T10:07:29.419791  . /lava-1012952/environment
    2023-09-25T10:07:29.419904  / # /lava-1012952/bin/lava-test-runner /lav=
a-1012952/1
    2023-09-25T10:07:29.512830  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-25T10:07:29.513048  + cd /lava-1012952/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115b3e8ca071ac758a0a9a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115b3e8ca071ac758a0aa3
        failing since 69 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-25T10:08:48.307110  / # #

    2023-09-25T10:08:48.407749  export SHELL=3D/bin/sh

    2023-09-25T10:08:48.407884  #

    2023-09-25T10:08:48.508372  / # export SHELL=3D/bin/sh. /lava-11613013/=
environment

    2023-09-25T10:08:48.508492  =


    2023-09-25T10:08:48.609025  / # . /lava-11613013/environment/lava-11613=
013/bin/lava-test-runner /lava-11613013/1

    2023-09-25T10:08:48.609233  =


    2023-09-25T10:08:48.620959  / # /lava-11613013/bin/lava-test-runner /la=
va-11613013/1

    2023-09-25T10:08:48.663871  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:08:48.680260  + cd /lav<8>[   19.316417] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11613013_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115b46da66668b438a0d96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115b46da66668b438a0d9f
        failing since 69 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-25T10:04:47.740980  / # #

    2023-09-25T10:04:48.819279  export SHELL=3D/bin/sh

    2023-09-25T10:04:48.821033  #

    2023-09-25T10:04:50.309165  / # export SHELL=3D/bin/sh. /lava-11613008/=
environment

    2023-09-25T10:04:50.310884  =


    2023-09-25T10:04:53.030448  / # . /lava-11613008/environment/lava-11613=
008/bin/lava-test-runner /lava-11613008/1

    2023-09-25T10:04:53.032505  =


    2023-09-25T10:04:53.033815  / # /lava-11613008/bin/lava-test-runner /la=
va-11613008/1

    2023-09-25T10:04:53.099954  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:04:53.100442  + cd /lava-116130<8>[   28.545051] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11613008_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65115b52da66668b438a0da1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-25-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65115b52da66668b438a0daa
        failing since 69 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-25T10:09:06.541705  / # #

    2023-09-25T10:09:06.642126  export SHELL=3D/bin/sh

    2023-09-25T10:09:06.642232  #

    2023-09-25T10:09:06.742703  / # export SHELL=3D/bin/sh. /lava-11613009/=
environment

    2023-09-25T10:09:06.742830  =


    2023-09-25T10:09:06.843332  / # . /lava-11613009/environment/lava-11613=
009/bin/lava-test-runner /lava-11613009/1

    2023-09-25T10:09:06.843517  =


    2023-09-25T10:09:06.855572  / # /lava-11613009/bin/lava-test-runner /la=
va-11613009/1

    2023-09-25T10:09:06.927554  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T10:09:06.927663  + cd /lava-1161300<8>[   18.471480] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11613009_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
