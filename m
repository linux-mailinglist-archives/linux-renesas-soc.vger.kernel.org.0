Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55D876258D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 00:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbjGYWDk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 18:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjGYWDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 18:03:07 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4D63585
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 15:02:38 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bb119be881so45926285ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690322545; x=1690927345;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EIHnj3+Ehobbzy1QK/xvTtsz8RHITeUUqIU4UmH3teg=;
        b=bo/LTAMjMGMyOXvtaO+ReqBXa4Tv1MHG85LTS/tG6tEH+kQnzXV3kXqpYOnxEEnvnG
         J32+NmS80DyB3OKObXZq7mAGEtPJ8MnMnDjwKedokfxZUN6Smqnrldf8pqVKjdS0mZ29
         YshTwhKdkZ4IhTpZwDsuXXwuZrU6JiXBjc/GykU6EqAMJoq/w7EIcsuW9S+6C9BoUacB
         5S8xjPDO4N6zvsmqZHNXMKLn4Zz+wap3G3AJwmbfH68RCcML4UWrX1Y19zGcuuG9JWTU
         Bq+5UYKTh1NBY0kxmID3pKHz1b0Z5ACfcJYhtkC/TLZoWu0JSEStZ2Kzvyx16OKRbmHo
         /Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690322545; x=1690927345;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIHnj3+Ehobbzy1QK/xvTtsz8RHITeUUqIU4UmH3teg=;
        b=cLOlY3/9q5CWXz6K/DpRpDo2tjY4UA56Xwf7IjWMQcivKr2pg0zlKJ1ySBO38tP7OY
         PI1n1UR5ynTDpc7G9Ot/Zuc7Sq0tSrjR2Gtjj80YpIj2JZV2iGvbPyvRfVsUcZm5l/Bc
         9P/bjb0rQqnRSAtsy7CMRIAgtOp5pywRN79AufmXkb+KBfCKF1EZvvlJTuqixkOMVmOa
         1Q+nmwLq9S/1aTJHkaGmLTyfwWWeusXcpRC9Z07Hp0RoW7Z815P7bjo7SEOTb6KUshNm
         NbHpB2JnZFciUCZomCxIsV5w98sM95VlXJcNkcrMHSruDySSyxuhvEgQH1rr0BxQh250
         LMhA==
X-Gm-Message-State: ABy/qLZyqtz5antNp2XRtTsnCw+CPjDXz2R5dNem0aolR/TsfGUciPAa
        tKFtkeT7EolbZDdtJ+s+xa1V4pS9EWZ0yaPYJHTlrw==
X-Google-Smtp-Source: APBJJlFjg/LOnvcTagc2PDWgHuK2KyqGYXBMDsM2mgNWZ033QGmlINUSeQbfbFKdW/CfXzikIx+fiw==
X-Received: by 2002:a17:902:7785:b0:1bb:9f0e:7b46 with SMTP id o5-20020a170902778500b001bb9f0e7b46mr421007pll.1.1690322544746;
        Tue, 25 Jul 2023 15:02:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c94500b001b809082a69sm11612865pla.235.2023.07.25.15.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 15:02:23 -0700 (PDT)
Message-ID: <64c0466f.170a0220.d42de.5999@mx.google.com>
Date:   Tue, 25 Jul 2023 15:02:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-07-25-v6.5-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 50 runs,
 6 regressions (renesas-devel-2023-07-25-v6.5-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 50 runs, 6 regressions (renesas-devel-2023-07-25-v=
6.5-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-07-25-v6.5-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-07-25-v6.5-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c942fe31c99b1322f58c89a671f5a780c36e80ee =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0158fd5c2b457fb8ace3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0158fd5c2b457fb8ace3e
        failing since 7 days (last pass: renesas-devel-2022-09-05-v6.0-rc4,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-25T18:33:44.304453  + [   16.035280] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238113_1.5.2.4.1>
    2023-07-25T18:33:44.304751  set +x
    2023-07-25T18:33:44.410615  =

    2023-07-25T18:33:44.511888  / # #export SHELL=3D/bin/sh
    2023-07-25T18:33:44.512335  =

    2023-07-25T18:33:44.613322  / # export SHELL=3D/bin/sh. /lava-1238113/e=
nvironment
    2023-07-25T18:33:44.613766  =

    2023-07-25T18:33:44.714751  / # . /lava-1238113/environment/lava-123811=
3/bin/lava-test-runner /lava-1238113/1
    2023-07-25T18:33:44.715545  =

    2023-07-25T18:33:44.719813  / # /lava-1238113/bin/lava-test-runner /lav=
a-1238113/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c015380e04ec05198ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c015380e04ec05198ace1f
        failing since 7 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-25T18:32:03.852559  / # #
    2023-07-25T18:32:05.315215  export SHELL=3D/bin/sh
    2023-07-25T18:32:05.335846  #
    2023-07-25T18:32:05.336099  / # export SHELL=3D/bin/sh
    2023-07-25T18:32:07.221501  / # . /lava-989090/environment
    2023-07-25T18:32:10.681145  /lava-989090/bin/lava-test-runner /lava-989=
090/1
    2023-07-25T18:32:10.701913  . /lava-989090/environment
    2023-07-25T18:32:10.702023  / # /lava-989090/bin/lava-test-runner /lava=
-989090/1
    2023-07-25T18:32:10.784734  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T18:32:10.785024  + cd /lava-989090/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c014f0505be13b128ace1d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c014f0505be13b128ace22
        failing since 7 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-25T18:32:44.336796  / # #

    2023-07-25T18:32:44.438973  export SHELL=3D/bin/sh

    2023-07-25T18:32:44.439600  #

    2023-07-25T18:32:44.540951  / # export SHELL=3D/bin/sh. /lava-11138168/=
environment

    2023-07-25T18:32:44.541645  =


    2023-07-25T18:32:44.643017  / # . /lava-11138168/environment/lava-11138=
168/bin/lava-test-runner /lava-11138168/1

    2023-07-25T18:32:44.644024  =


    2023-07-25T18:32:44.660788  / # /lava-11138168/bin/lava-test-runner /la=
va-11138168/1

    2023-07-25T18:32:44.711188  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T18:32:44.711684  + cd /lav<8>[   19.200588] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11138168_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c01508dfa45620fc8ace48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c01508dfa45620fc8ace4d
        failing since 7 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-25T18:31:16.753094  / # #

    2023-07-25T18:31:17.828901  export SHELL=3D/bin/sh

    2023-07-25T18:31:17.830612  #

    2023-07-25T18:31:19.318493  / # export SHELL=3D/bin/sh. /lava-11138161/=
environment

    2023-07-25T18:31:19.319770  =


    2023-07-25T18:31:22.034467  / # . /lava-11138161/environment/lava-11138=
161/bin/lava-test-runner /lava-11138161/1

    2023-07-25T18:31:22.035942  =


    2023-07-25T18:31:22.050784  / # /lava-11138161/bin/lava-test-runner /la=
va-11138161/1

    2023-07-25T18:31:22.066675  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T18:31:22.109800  + cd /lava-111381<8>[   28.510130] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11138161_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c014ec0b85b80a088ace61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-li=
bretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c014ec0b85b80a088ac=
e62
        failing since 43 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c01505dfa45620fc8ace32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-07-25-v6.5-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c01505dfa45620fc8ace37
        failing since 7 days (last pass: renesas-devel-2023-07-11-v6.5-rc1,=
 first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-07-25T18:32:57.028974  / # #

    2023-07-25T18:32:57.131103  export SHELL=3D/bin/sh

    2023-07-25T18:32:57.131811  #

    2023-07-25T18:32:57.233221  / # export SHELL=3D/bin/sh. /lava-11138171/=
environment

    2023-07-25T18:32:57.233932  =


    2023-07-25T18:32:57.335377  / # . /lava-11138171/environment/lava-11138=
171/bin/lava-test-runner /lava-11138171/1

    2023-07-25T18:32:57.336455  =


    2023-07-25T18:32:57.353248  / # /lava-11138171/bin/lava-test-runner /la=
va-11138171/1

    2023-07-25T18:32:57.421314  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T18:32:57.421819  + cd /lava-11138171/1/tests/1_boot<8>[   17=
.132462] <LAVA_SIGNAL_STARTRUN 1_bootrr 11138171_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
