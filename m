Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947C677D36B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 21:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239875AbjHOTee (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 15:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239897AbjHOTea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 15:34:30 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B363FE3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 12:34:28 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bddac1b7bfso17403525ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692128068; x=1692732868;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwIbKsgFAh/Ru6+Sg/ZgI2g0/BGgn+DM+1KCakKEym8=;
        b=iEgv946jwGIQRKvE5IAKmg72HkmYR9hZZccVdoqbXWKe4II2el6XJdtk43dgKEV5oy
         MSoJBEYC7EBllBFtg/adxBr0odt0Ud4RtdPnFEl2S5pjtFERTtjRHwkRbRofqCrrKwPh
         KFkaIsupyphcx3CMThBAQo/UxHezBS6HxXxVk6sY1NVpWjFYhLtnJSE5r8QCtoS86Xfg
         VPhGVYbiXylKErW/18/pVd3QTxsmT1S6tW9m/0CYD3JzmDNWD3Lbp9F4KysjGp6gpWxu
         Gc/7jC3KZBo7UeWxeFHOGCpY4oR3rEGmG62C/JpGB/N4jRyCoeNCUyzZfw3E7v3phzWh
         0Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692128068; x=1692732868;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwIbKsgFAh/Ru6+Sg/ZgI2g0/BGgn+DM+1KCakKEym8=;
        b=luWTaZnAUoLBqcnKKRZ1UhR2AjgOdhHiWX33/Sn4t7Q/elIeEn6vwL/tFTwdTX7D5X
         FMgVPk64zJoEE8vAawkNDhhBLf2gJ8I3KqFxU5n8at7BXsSunXNsQShZI8gBL972h8g2
         wv7M7XvhWjK6n+gz4C4AbyNU7L7CK75BhRh08r1q7OE8cf2a7ZxzgMiuCRX/AHUKwg+W
         hLanhq6bagmRDjE7dSEox5XR9fvN532LXFoOg+OgElxqamdD8Fy1aPR9SBTZ0sZ8fZI9
         9bZ0wrUCGx/lG0k4jOgDo3EdYwtYPd0GsM+fDFaT7mqz+Te785Se5FWbKJoOOHOYiONF
         CvWA==
X-Gm-Message-State: AOJu0YxZz59vFZ4ksGfga77zbjcC++fdVeBVPomzZofU/AgMlFXelW9X
        VCvbsA7V0mH2ODgV0VTmYo72dicsp4ki8WfQur9+gA==
X-Google-Smtp-Source: AGHT+IG3GuevBM1U65+EXQ9k6Aty28ml3IM1aZnfR2S1xNEtQf9ZZbmpgzEFWsfRcvLXGX92rV/M0A==
X-Received: by 2002:a17:902:6505:b0:1bd:d510:78fb with SMTP id b5-20020a170902650500b001bdd51078fbmr3439609plk.3.1692128067580;
        Tue, 15 Aug 2023 12:34:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x20-20020a170902ea9400b001b9de67285dsm11467494plb.156.2023.08.15.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 12:34:26 -0700 (PDT)
Message-ID: <64dbd342.170a0220.1ba3a.565a@mx.google.com>
Date:   Tue, 15 Aug 2023 12:34:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-14-v6.5-rc6
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 53 runs,
 6 regressions (renesas-devel-2023-08-14-v6.5-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 53 runs, 6 regressions (renesas-devel-2023-08-14-v=
6.5-rc6)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
fsl-ls2088a-rdb          | arm64 | lab-nxp       | gcc-10   | defconfig | 1=
          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =

r8a77960-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =

r8a779m1-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =

sun50i-h6-pine-h64       | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-14-v6.5-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-14-v6.5-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0eea67c2ea6d54fe356bf10e22a555c613bbb10a =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
fsl-ls2088a-rdb          | arm64 | lab-nxp       | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba1ef7736b8d3fd35b26b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba1ef7736b8d3fd35b270
        failing since 28 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:03:42.728615  + [   13.396869] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1243643_1.5.2.4.1>
    2023-08-15T16:03:42.728913  set +x
    2023-08-15T16:03:42.835043  =

    2023-08-15T16:03:42.936441  / # #export SHELL=3D/bin/sh
    2023-08-15T16:03:42.936986  =

    2023-08-15T16:03:43.037981  / # export SHELL=3D/bin/sh. /lava-1243643/e=
nvironment
    2023-08-15T16:03:43.038448  =

    2023-08-15T16:03:43.139447  / # . /lava-1243643/environment/lava-124364=
3/bin/lava-test-runner /lava-1243643/1
    2023-08-15T16:03:43.140234  =

    2023-08-15T16:03:43.144161  / # /lava-1243643/bin/lava-test-runner /lav=
a-1243643/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba1d22afdf64b4435b1f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba1d22afdf64b4435b1f9
        failing since 28 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:03:19.139548  + set +x
    2023-08-15T16:03:19.140144  <8>[   28.341226] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 997506_1.5.2.4.1>
    2023-08-15T16:03:19.248684  / # #
    2023-08-15T16:03:20.719711  export SHELL=3D/bin/sh
    2023-08-15T16:03:20.740852  #
    2023-08-15T16:03:20.741463  / # export SHELL=3D/bin/sh
    2023-08-15T16:03:22.635783  / # . /lava-997506/environment
    2023-08-15T16:03:26.111398  /lava-997506/bin/lava-test-runner /lava-997=
506/1
    2023-08-15T16:03:26.133364  . /lava-997506/environment
    2023-08-15T16:03:26.133814  / # /lava-997506/bin/lava-test-runner /lava=
-997506/1 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba21c1f846dddf235b1db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba21c1f846dddf235b1de
        failing since 28 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:04:14.937867  / # #
    2023-08-15T16:04:16.400012  export SHELL=3D/bin/sh
    2023-08-15T16:04:16.420607  #
    2023-08-15T16:04:16.420819  / # export SHELL=3D/bin/sh
    2023-08-15T16:04:18.305942  / # . /lava-997507/environment
    2023-08-15T16:04:21.762553  /lava-997507/bin/lava-test-runner /lava-997=
507/1
    2023-08-15T16:04:21.783128  . /lava-997507/environment
    2023-08-15T16:04:21.783240  / # /lava-997507/bin/lava-test-runner /lava=
-997507/1
    2023-08-15T16:04:21.866105  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-15T16:04:21.866241  + cd /lava-997507/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a77960-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba8058c597df02135b1e5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba8058c597df02135b1ea
        failing since 28 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:31:19.055593  / # #

    2023-08-15T16:31:19.155974  export SHELL=3D/bin/sh

    2023-08-15T16:31:19.156057  #

    2023-08-15T16:31:19.256475  / # export SHELL=3D/bin/sh. /lava-11292244/=
environment

    2023-08-15T16:31:19.256554  =


    2023-08-15T16:31:19.356971  / # . /lava-11292244/environment/lava-11292=
244/bin/lava-test-runner /lava-11292244/1

    2023-08-15T16:31:19.357114  =


    2023-08-15T16:31:19.369551  / # /lava-11292244/bin/lava-test-runner /la=
va-11292244/1

    2023-08-15T16:31:19.413014  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-15T16:31:19.428622  + cd /lava-112922<8>[   19.242667] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11292244_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a779m1-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba1f2b664046c0335b1d9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba1f2b664046c0335b1de
        failing since 28 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:04:37.518149  / # #

    2023-08-15T16:04:38.598719  export SHELL=3D/bin/sh

    2023-08-15T16:04:38.600494  #

    2023-08-15T16:04:40.091406  / # export SHELL=3D/bin/sh. /lava-11292252/=
environment

    2023-08-15T16:04:40.093289  =


    2023-08-15T16:04:42.818629  / # . /lava-11292252/environment/lava-11292=
252/bin/lava-test-runner /lava-11292252/1

    2023-08-15T16:04:42.820759  =


    2023-08-15T16:04:42.826096  / # /lava-11292252/bin/lava-test-runner /la=
va-11292252/1

    2023-08-15T16:04:42.890601  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-15T16:04:42.891093  + cd /lava-112922<8>[   28.516060] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11292252_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
sun50i-h6-pine-h64       | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/64dba1c52afdf64b4435b1da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dba1c52afdf64b4435b1df
        failing since 28 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-15T16:04:31.569231  / # #

    2023-08-15T16:04:31.671301  export SHELL=3D/bin/sh

    2023-08-15T16:04:31.672007  #

    2023-08-15T16:04:31.773456  / # export SHELL=3D/bin/sh. /lava-11292243/=
environment

    2023-08-15T16:04:31.774162  =


    2023-08-15T16:04:31.875614  / # . /lava-11292243/environment/lava-11292=
243/bin/lava-test-runner /lava-11292243/1

    2023-08-15T16:04:31.876704  =


    2023-08-15T16:04:31.893614  / # /lava-11292243/bin/lava-test-runner /la=
va-11292243/1

    2023-08-15T16:04:31.963494  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-15T16:04:31.963976  + cd /lava-11292243/1/tests/1_boot<8>[   18=
.601977] <LAVA_SIGNAL_STARTRUN 1_bootrr 11292243_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
