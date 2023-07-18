Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6077572EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jul 2023 06:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjGREuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jul 2023 00:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGREuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2023 00:50:01 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9187EBB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 21:49:59 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6b9defb366eso765355a34.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 21:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689655798; x=1692247798;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8g1U/vpzJ98WqgKkQsm2HyhFRi+Sc3dwnex9a1bzjZA=;
        b=IMQmjTy0iJpu1Q72uxNJLhHtwat1mVzHcWG3tmwsSHXjqE2Dn3vnDmu2mfoIHwVRqb
         xZUaZcoqt0FuZAVnRSlTvtHy1jBwhChnxnyGUe0N1zYpmp2RK/xDlB6tYAG7QROiqKnv
         xvddKVPwRHB4QeIRv5ScAAKEByh8c/nsAAlB+EruKBSTEfrdFtNkFIX35fteSN2S0MDb
         KfIjBMm3ci44QsVRw/zahW0afQ9PojxpNVzlrBAENeyVLwfbBkZYluHtjtWb8vohwgMC
         kBuFB88vpe1aup1wk1QRZBkMBnh6b/Zd5aSG9DavzYsTOXENzparyFgWKbNCt3+RtdUl
         Cmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689655798; x=1692247798;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g1U/vpzJ98WqgKkQsm2HyhFRi+Sc3dwnex9a1bzjZA=;
        b=AUzz86thnhf1RiNi+7L1FkTaTN0kFO0/SNRQ0b9zGXsKuSrVaSOkNSgxLN1JK4lz+u
         vN1Y4cW2+TTyGb5FhECPL1/yEfvz9BM+/1dSGyApTAIxely3hoEWUB1M0GUF0KvWMZFA
         wFjfbagAsd9MJNGoo1PJJ6anUDywRMz+aCBJAaKo68H4S8YY6mZIrB56edDyn0MR9XTH
         yfP3HLrij80WhZQILVUi7TJQkCPOH8PqFheFk/4c/IZZty0PvnTVH5EQbFfUaZ8ucwiQ
         ckQGtfczLoM31c1jRMyj/AFlQ7Mw/5ZKP+7mVngH/03Bs+lc0jUuIy9O0Dj8JZpeRD3A
         MQgQ==
X-Gm-Message-State: ABy/qLYpjfsxc8O7WNSw6PPFh3ImTy6wZ5nkWFuN2BYZWKB2T4E98Qi4
        BV5eUGPhGOoQ6jsaMSqdu10YlAsBMuhT2hAL2VQW5Q==
X-Google-Smtp-Source: APBJJlGPyLYHSbH8SVasPbQzKAxgsiSKQkyHGhMnk138jMdlg7QemtgwsYYG2xlapObuG0LEGlWe1g==
X-Received: by 2002:a05:6358:27a8:b0:12b:da97:aba6 with SMTP id l40-20020a05635827a800b0012bda97aba6mr10125914rwb.24.1689655798285;
        Mon, 17 Jul 2023 21:49:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b0063a04905379sm592295pfd.137.2023.07.17.21.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 21:49:57 -0700 (PDT)
Message-ID: <64b619f5.a70a0220.bfad2.1e49@mx.google.com>
Date:   Mon, 17 Jul 2023 21:49:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-07-17-v6.5-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 52 runs,
 8 regressions (renesas-devel-2023-07-17-v6.5-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 52 runs, 8 regressions (renesas-devel-2023-07-17-v=
6.5-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-07-17-v6.5-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-07-17-v6.5-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ab47fb8f0efac6bb296438ebb8917a4706505e3 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e8f01a730935c48ace43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e8f01a730935c48ace46
        new failure (last pass: renesas-devel-2022-09-05-v6.0-rc4)

    2023-07-18T01:20:31.800765  [   16.057997] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1237047_1.5.2.4.1>
    2023-07-18T01:20:31.906129  =

    2023-07-18T01:20:32.007299  / # #export SHELL=3D/bin/sh
    2023-07-18T01:20:32.007705  =

    2023-07-18T01:20:32.108647  / # export SHELL=3D/bin/sh. /lava-1237047/e=
nvironment
    2023-07-18T01:20:32.109051  =

    2023-07-18T01:20:32.210012  / # . /lava-1237047/environment/lava-123704=
7/bin/lava-test-runner /lava-1237047/1
    2023-07-18T01:20:32.210677  =

    2023-07-18T01:20:32.214739  / # /lava-1237047/bin/lava-test-runner /lav=
a-1237047/1
    2023-07-18T01:20:32.237786  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e8b17970bbd7a98ace2e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e8b17970bbd7a98ace31
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5)

    2023-07-18T01:19:26.469775  + set +x
    2023-07-18T01:19:26.473007  <8>[   28.377427] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 987081_1.5.2.4.1>
    2023-07-18T01:19:26.581101  / # #
    2023-07-18T01:19:28.045729  export SHELL=3D/bin/sh
    2023-07-18T01:19:28.066669  #
    2023-07-18T01:19:28.067132  / # export SHELL=3D/bin/sh
    2023-07-18T01:19:29.954297  / # . /lava-987081/environment
    2023-07-18T01:19:33.415541  /lava-987081/bin/lava-test-runner /lava-987=
081/1
    2023-07-18T01:19:33.437001  . /lava-987081/environment
    2023-07-18T01:19:33.437419  / # /lava-987081/bin/lava-test-runner /lava=
-987081/1 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e8e61a730935c48ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e8e61a730935c48ace1f
        new failure (last pass: renesas-devel-2023-07-11-v6.5-rc1)

    2023-07-18T01:20:13.613379  / # #
    2023-07-18T01:20:15.075668  export SHELL=3D/bin/sh
    2023-07-18T01:20:15.096179  #
    2023-07-18T01:20:15.096404  / # export SHELL=3D/bin/sh
    2023-07-18T01:20:16.981526  / # . /lava-987080/environment
    2023-07-18T01:20:20.440118  /lava-987080/bin/lava-test-runner /lava-987=
080/1
    2023-07-18T01:20:20.461067  . /lava-987080/environment
    2023-07-18T01:20:20.461220  / # /lava-987080/bin/lava-test-runner /lava=
-987080/1
    2023-07-18T01:20:20.545551  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-18T01:20:20.546177  + cd /lava-987080/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e86f7b53717bbf8ace1c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e86f7b53717bbf8ace21
        new failure (last pass: renesas-devel-2023-07-11-v6.5-rc1)

    2023-07-18T01:20:06.414302  / # #

    2023-07-18T01:20:06.516476  export SHELL=3D/bin/sh

    2023-07-18T01:20:06.517229  #

    2023-07-18T01:20:06.618626  / # export SHELL=3D/bin/sh. /lava-11104944/=
environment

    2023-07-18T01:20:06.619345  =


    2023-07-18T01:20:06.720754  / # . /lava-11104944/environment/lava-11104=
944/bin/lava-test-runner /lava-11104944/1

    2023-07-18T01:20:06.721793  =


    2023-07-18T01:20:06.738513  / # /lava-11104944/bin/lava-test-runner /la=
va-11104944/1

    2023-07-18T01:20:06.788749  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T01:20:06.789278  + cd /lav<8>[   20.232575] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11104944_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e8977b53717bbf8ace41

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e8977b53717bbf8ace46
        new failure (last pass: renesas-devel-2023-07-11-v6.5-rc1)

    2023-07-18T01:19:00.971718  / # #

    2023-07-18T01:19:02.051876  export SHELL=3D/bin/sh

    2023-07-18T01:19:02.053758  #

    2023-07-18T01:19:03.544582  / # export SHELL=3D/bin/sh. /lava-11104940/=
environment

    2023-07-18T01:19:03.546395  =


    2023-07-18T01:19:06.270533  / # . /lava-11104940/environment/lava-11104=
940/bin/lava-test-runner /lava-11104940/1

    2023-07-18T01:19:06.273021  =


    2023-07-18T01:19:06.280381  / # /lava-11104940/bin/lava-test-runner /la=
va-11104940/1

    2023-07-18T01:19:06.342740  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T01:19:06.343253  + cd /lava-111049<8>[   28.547977] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11104940_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e96f07dd8ca7ad8ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5e96f07dd8ca7ad8ac=
e1e
        failing since 6 days (last pass: renesas-devel-2023-06-12-v6.4-rc6,=
 first fail: renesas-devel-2023-07-11-v6.5-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e9844315d45e3a8ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5e9844315d45e3a8ac=
e29
        failing since 35 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5e8847b96d342098ace35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-17-v6.5-rc2/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5e8847b96d342098ace3a
        new failure (last pass: renesas-devel-2023-07-11-v6.5-rc1)

    2023-07-18T01:20:20.378064  / # #

    2023-07-18T01:20:20.480215  export SHELL=3D/bin/sh

    2023-07-18T01:20:20.480935  #

    2023-07-18T01:20:20.582370  / # export SHELL=3D/bin/sh. /lava-11104935/=
environment

    2023-07-18T01:20:20.583068  =


    2023-07-18T01:20:20.684529  / # . /lava-11104935/environment/lava-11104=
935/bin/lava-test-runner /lava-11104935/1

    2023-07-18T01:20:20.685689  =


    2023-07-18T01:20:20.702678  / # /lava-11104935/bin/lava-test-runner /la=
va-11104935/1

    2023-07-18T01:20:20.771263  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T01:20:20.771759  + cd /lava-1110493<8>[   18.343905] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11104935_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
