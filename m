Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15A17C7ACB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 02:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343497AbjJMAVC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 20:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbjJMAVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 20:21:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AC2B7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:20:59 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c737d61a00so13525005ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697156458; x=1697761258; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8GXffbdHisoarB27AnMApncm46fftwJh73HQF2EYeA=;
        b=hjGPLhAjg3mxTZZOn9LZ5Tutce3DwbhOxFA8cXiu9ZzGKbYdfCLcX3ESS3ARlMBRj1
         Gq+slzaMyFd76GEWPvwJWZn39LI735M6mUu6vNTBbR0yEbh0Cc0eEncH/cCeGdM/ouyL
         kKPnRNiNMge++mowM+RjNgqcIltR1dUY3csOw7U+ULntuCqkSBQNm7WGgluJqZlGdq3w
         fDuSg+DovJ9gEfajuZc+bCD1yYSyuIxxRfuznwj6j3WG5fUCktKxtycQ3J5450xOfowM
         DXL5MKZCl46yFQHfU7z9ugyuOIbsrf9WNj90MULej0L2/YOCW4cmjNbocQANJ/3snIBf
         IYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697156458; x=1697761258;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8GXffbdHisoarB27AnMApncm46fftwJh73HQF2EYeA=;
        b=T5R8qAgnNZ33GLY8o5WEplzYFme6QrTqpUkeDLpm8lhc8q441wiwEmvOVMnAp00zdI
         Y9c8ftuCJNKga24BHX/hxbfU8y/0X34pKxrA6Dzm0lwuX104KlBWYft/hWdze1GNpqdX
         KXULj/MQDZ5zllhSZdrBgKnlaiVshUYTSgOEaXam7KLX2Ritd8UtRwYpOJx6/t3KTWP3
         Bn/3I3rPYdQwknRN1z+5283L+jLUm1hY9GbfvHPr75Ip1FUWDf/7eStF44FBVDdMZtV7
         AVKD4XH51YJYBhRA6m8RsH7yOXKiIaPGp5pU23PeweiFrBu8qhF70UA3VPcF6NXp2DyG
         FFTQ==
X-Gm-Message-State: AOJu0YzlLpQFOGHUMrfR4RQuMQZ0P4n0Hcp+yYs1kYG2ugpFg7uJhTqO
        sxKxvLaF78jkqEzu4XQ14ugAelhQbe9aEPKpIoZDFw==
X-Google-Smtp-Source: AGHT+IGYYAYAJleK647T2yFlz7UP/2E6TO87IPFPyKDyoeXC46HaNoTHGI8Igh1GAzEbSyVWGRaong==
X-Received: by 2002:a17:902:f688:b0:1c6:3228:c2ca with SMTP id l8-20020a170902f68800b001c63228c2camr34059265plg.29.1697156458187;
        Thu, 12 Oct 2023 17:20:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jw7-20020a170903278700b001c61e628e9dsm2576353plb.77.2023.10.12.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:20:57 -0700 (PDT)
Message-ID: <65288d69.170a0220.d988d.97f6@mx.google.com>
Date:   Thu, 12 Oct 2023 17:20:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 50 runs,
 4 regressions (renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6)
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

renesas/master baseline: 50 runs, 4 regressions (renesas-devel-2023-10-09-v=
6.6-rc5-11-g2f3e3edcf49e6)

Regressions Summary
-------------------

platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig | 1          =

r8a774c0-ek874 | arm64 | lab-cip       | gcc-10   | defconfig | 1          =

r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =

r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2f3e3edcf49e6363f99490192359aa6662bf55ea =



Test Regressions
---------------- =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65288768804d9c24e3efcf30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-broonie/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-broonie/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288768804d9c24e3efcf39
        failing since 31 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-10-12T23:55:00.373862  <8>[   28.588640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-10-12T23:55:00.377073  + set<8>[   28.598449] <LAVA_SIGNAL_ENDRUN =
0_dmesg 167055_1.5.2.4.1>
    2023-10-12T23:55:00.377655   +x
    2023-10-12T23:55:00.486769  / # #
    2023-10-12T23:55:01.651307  export SHELL=3D/bin/sh
    2023-10-12T23:55:01.657497  #
    2023-10-12T23:55:03.152485  / # export SHELL=3D/bin/sh. /lava-167055/en=
vironment
    2023-10-12T23:55:03.157986  =

    2023-10-12T23:55:05.868832  / # . /lava-167055/environment/lava-167055/=
bin/lava-test-runner /lava-167055/1
    2023-10-12T23:55:05.874576   =

    ... (14 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip       | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65285d39734879164aefcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-cip/baselin=
e-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-cip/baselin=
e-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65285d39734879164aefcefa
        failing since 86 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-12T20:55:02.142223  / # #
    2023-10-12T20:55:03.601763  export SHELL=3D/bin/sh
    2023-10-12T20:55:03.622186  #
    2023-10-12T20:55:03.622312  / # export SHELL=3D/bin/sh
    2023-10-12T20:55:05.575275  / # . /lava-1020011/environment
    2023-10-12T20:55:09.168521  /lava-1020011/bin/lava-test-runner /lava-10=
20011/1
    2023-10-12T20:55:09.189113  . /lava-1020011/environment
    2023-10-12T20:55:09.189222  / # /lava-1020011/bin/lava-test-runner /lav=
a-1020011/1
    2023-10-12T20:55:09.284090  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-12T20:55:09.284240  + cd /lava-1020011/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65285c890cdd841bb9efcf78

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-collabora/b=
aseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-collabora/b=
aseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65285c890cdd841bb9efcf81
        failing since 86 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-12T20:56:26.687985  / # #

    2023-10-12T20:56:26.789676  export SHELL=3D/bin/sh

    2023-10-12T20:56:26.790334  #

    2023-10-12T20:56:26.891521  / # export SHELL=3D/bin/sh. /lava-11754423/=
environment

    2023-10-12T20:56:26.892237  =


    2023-10-12T20:56:26.993458  / # . /lava-11754423/environment/lava-11754=
423/bin/lava-test-runner /lava-11754423/1

    2023-10-12T20:56:26.994469  =


    2023-10-12T20:56:26.999863  / # /lava-11754423/bin/lava-test-runner /la=
va-11754423/1

    2023-10-12T20:56:27.059798  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T20:56:27.059964  + cd /lav<8>[   19.441486] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11754423_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65285c9250750c99a1efcf01

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-collabora/b=
aseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-collabora/b=
aseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65285c9250750c99a1efcf0a
        failing since 86 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-12T20:52:37.981367  / # #

    2023-10-12T20:52:39.060665  export SHELL=3D/bin/sh

    2023-10-12T20:52:39.062385  #

    2023-10-12T20:52:40.551793  / # export SHELL=3D/bin/sh. /lava-11754410/=
environment

    2023-10-12T20:52:40.553078  =


    2023-10-12T20:52:43.271499  / # . /lava-11754410/environment/lava-11754=
410/bin/lava-test-runner /lava-11754410/1

    2023-10-12T20:52:43.273750  =


    2023-10-12T20:52:43.289662  / # /lava-11754410/bin/lava-test-runner /la=
va-11754410/1

    2023-10-12T20:52:43.342842  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T20:52:43.343322  + cd /lava-117544<8>[   28.504346] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11754410_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =20
