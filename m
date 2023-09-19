Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBAE7A5853
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 06:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjISEMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 00:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjISEMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 00:12:19 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC510F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 21:12:11 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0ecb9a075so40998865ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 21:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695096730; x=1695701530; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3PzweyvIrRYm2+Q5B4+nlj9WEyY5hYcd4LNA7eJKDhM=;
        b=yd6M7ih4UmgF1nfxIdNT1qGz92la0I8Yb1IJtlZrxVNb6WknVSLo2OaBWjcFpt87sK
         7RzzTHlBTVl68MBbiAVAi/daYDdyiSlmxEXxrCzMS+rjEfuubeCLSsw8+hWjcoVGlR9R
         DHfXIQYgTlTzLsAJ1lvS2EoqPejvAKN3O2HM4ucmgvYNCs1UsfxlG+qn/YkwcQAmn9w0
         HkuRf0apJoj/bDO60GePY2TZQG/9xD219OZgdJXVtbUmx80h9Xyx0Mc5izDzJqtQ/nCo
         VNAj2lTVqAfjtGyG28jOR7BsUlTFKCj8F56fUApJrs1oxgp5UKS9XQlPoHRjhK3hJ3w9
         QKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695096730; x=1695701530;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PzweyvIrRYm2+Q5B4+nlj9WEyY5hYcd4LNA7eJKDhM=;
        b=E2cFakg7qfUml5mCPUTct+O8Rm660Y36TIgzs0Q8EHHmihCUj7sqN+xUHECHv+smA5
         /oa5ZcAsFe8yxYR5xLzkhBcuvc9rS9I71gRvq6DU1rTyfm9mGyxikVjIr42AhzoeNQzV
         EYlOhrzjh4+ePXKV+3A90krt0Vbs7Ui+RFe3r/VyAxwgc/KpBYkI539kXfTnSl27GGVG
         tlmQ5sF0TLUSJNskKwHjr9Nr62+dfT+5X3lQudqXOOWLCWHxuMzgi51GIsOikLy0sd/y
         FK2SQwdk3NYPgMbzxfj+cGwN/mWAD3e0fXclCFKqfhGQ8CjoKTwcLOHx2MQ2YS4Qjj5j
         4yoQ==
X-Gm-Message-State: AOJu0YxEurvD6Diqj8A7zs0XqSvqZO+/dhUba7PmC6soTCa1pOSssfUG
        HFrq8rsv9enzp5UaxKmfYBnar8OWIkGCpaMhpT/fcg==
X-Google-Smtp-Source: AGHT+IFKfbjw67Zx0FNRR656MgoFhTjjIihUW6OGj9tiyC8U4mRvNlbI00Nt7ilVXagENmB948kW1w==
X-Received: by 2002:a17:903:41c2:b0:1c3:eb43:65bf with SMTP id u2-20020a17090341c200b001c3eb4365bfmr11018502ple.32.1695096730086;
        Mon, 18 Sep 2023 21:12:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c20900b001b87d3e845bsm3136101pll.149.2023.09.18.21.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 21:12:09 -0700 (PDT)
Message-ID: <65091f99.170a0220.efd60.b09d@mx.google.com>
Date:   Mon, 18 Sep 2023 21:12:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-18-v6.6-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 50 runs,
 5 regressions (renesas-devel-2023-09-18-v6.6-rc2)
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

renesas/master baseline: 50 runs, 5 regressions (renesas-devel-2023-09-18-v=
6.6-rc2)

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
sas-devel-2023-09-18-v6.6-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-18-v6.6-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fe3d2aba2ca99151d3a1233d3b75add0f559e0eb =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6508efa3abf7c101768a0a44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6508efa3abf7c101768a0a4d
        failing since 7 days (last pass: renesas-devel-2023-08-28-v6.5, fir=
st fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-09-19T00:47:09.178631  + set<8>[   25.599178] <LAVA_SIGNAL_ENDRUN =
0_dmesg 115999_1.5.2.4.1>
    2023-09-19T00:47:09.179036   +x
    2023-09-19T00:47:09.287802  / # #
    2023-09-19T00:47:10.453228  export SHELL=3D/bin/sh
    2023-09-19T00:47:10.459365  #
    2023-09-19T00:47:11.958347  / # export SHELL=3D/bin/sh. /lava-115999/en=
vironment
    2023-09-19T00:47:11.964424  =

    2023-09-19T00:47:14.687951  / # . /lava-115999/environment/lava-115999/=
bin/lava-test-runner /lava-115999/1
    2023-09-19T00:47:14.694689  =

    2023-09-19T00:47:14.698440  / # /lava-115999/bin/lava-test-runner /lava=
-115999/1 =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6508ef6f9a0d0592938a0a54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6508ef6f9a0d0592938a0a5b
        failing since 62 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-19T00:46:21.645265  / # #
    2023-09-19T00:46:23.106813  export SHELL=3D/bin/sh
    2023-09-19T00:46:23.127740  #
    2023-09-19T00:46:23.127976  / # export SHELL=3D/bin/sh
    2023-09-19T00:46:25.080176  / # . /lava-1009907/environment
    2023-09-19T00:46:28.676628  /lava-1009907/bin/lava-test-runner /lava-10=
09907/1
    2023-09-19T00:46:28.697506  . /lava-1009907/environment
    2023-09-19T00:46:28.697616  / # /lava-1009907/bin/lava-test-runner /lav=
a-1009907/1
    2023-09-19T00:46:28.789882  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-19T00:46:28.790098  + cd /lava-1009907/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6508fb62b26262e8078a0b7b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6508fb63b26262e8078a0b84
        failing since 63 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-19T01:41:42.572637  / # #

    2023-09-19T01:41:42.674636  export SHELL=3D/bin/sh

    2023-09-19T01:41:42.675328  #

    2023-09-19T01:41:42.776733  / # export SHELL=3D/bin/sh. /lava-11566204/=
environment

    2023-09-19T01:41:42.777427  =


    2023-09-19T01:41:42.878863  / # . /lava-11566204/environment/lava-11566=
204/bin/lava-test-runner /lava-11566204/1

    2023-09-19T01:41:42.879976  =


    2023-09-19T01:41:42.880950  / # /lava-11566204/bin/lava-test-runner /la=
va-11566204/1

    2023-09-19T01:41:42.946612  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T01:41:42.947120  + cd /lava-115662<8>[   20.402456] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11566204_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6508eede3dd5f46fc28a0a7e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6508eede3dd5f46fc28a0a87
        failing since 62 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-19T00:43:59.549540  / # #

    2023-09-19T00:44:00.629667  export SHELL=3D/bin/sh

    2023-09-19T00:44:00.631625  #

    2023-09-19T00:44:02.122445  / # export SHELL=3D/bin/sh. /lava-11566195/=
environment

    2023-09-19T00:44:02.124290  =


    2023-09-19T00:44:04.848049  / # . /lava-11566195/environment/lava-11566=
195/bin/lava-test-runner /lava-11566195/1

    2023-09-19T00:44:04.850413  =


    2023-09-19T00:44:04.857103  / # /lava-11566195/bin/lava-test-runner /la=
va-11566195/1

    2023-09-19T00:44:04.919563  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T00:44:04.920064  + cd /lava-115661<8>[   28.528621] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11566195_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6508eecc44a45255518a0ac3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-18-v6.6-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6508eecd44a45255518a0acc
        failing since 62 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-19T00:47:59.315683  / # #

    2023-09-19T00:47:59.417898  export SHELL=3D/bin/sh

    2023-09-19T00:47:59.418594  #

    2023-09-19T00:47:59.519984  / # export SHELL=3D/bin/sh. /lava-11566207/=
environment

    2023-09-19T00:47:59.520692  =


    2023-09-19T00:47:59.622178  / # . /lava-11566207/environment/lava-11566=
207/bin/lava-test-runner /lava-11566207/1

    2023-09-19T00:47:59.623272  =


    2023-09-19T00:47:59.640037  / # /lava-11566207/bin/lava-test-runner /la=
va-11566207/1

    2023-09-19T00:47:59.706078  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T00:47:59.706573  + cd /lava-1156620<8>[   19.345449] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11566207_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
