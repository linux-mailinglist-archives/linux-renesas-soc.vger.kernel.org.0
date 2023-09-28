Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A9A7B20F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 17:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbjI1PTD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 11:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjI1PTC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:19:02 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D6F8E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:18:58 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-692a9bc32bcso9640770b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695914337; x=1696519137; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dixc0XiOOUmINr3vF9vuxqlBrV9oml9lil2/rz8iJ6U=;
        b=rPMXREw+N+bPLrA+Ot8Gpb6fsU6ahJ5LlI+7Jmhcj427xO4IFH/Eva0p/N02m/ThcH
         Eu2kCIKMxCe/g0w6tamOAlUIyppYaMmSzhu5r3rtacZPXY/uymlRAXcB0s+PloILIGcL
         69+V9rh9SWq7ojOoBfiFjY3IOcEbPjhaRfWXPbxGXy16gaZcZS4ffXoFm8E6Vrcq7tTH
         l1DjFmTzGHzWzUXAo/hq1srVUrKRHJDJscAWiOA94I5OauLSqb72HX+/mepmansSVbl8
         y/s4G4SCIrteCdFd0ePb1l1KQubsSZfFoqKMhRLKAvdy0CU+11MQRn/ALGtdk69eQPVO
         sRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914337; x=1696519137;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dixc0XiOOUmINr3vF9vuxqlBrV9oml9lil2/rz8iJ6U=;
        b=xDStHRC023QJ1PFHRLvfETd3C+ydCdzJuUc4HBylU8XAi9IUmPCDYTcBWpX2FswMef
         V7Whjwl3VdmWtEhFf4eQuz4QUliGlLcAZoUROEn7ZciW9gFM/U6xKq05G2VYyHrDbDm6
         COa2gs6Fr/dltVjax3rdFVr2HT0aDhdgM2uU2zGL1xEW+/fG8QgnLp7gspONIIz+tPca
         rV5DPccvzynKzg74gum8ljEwQiJT9c6bNoYVmGQQ0YPeoi6Gs1g8R/WFUPYEJTIxvCbg
         Sdz/thJJY+guSXQCVqn6Koi15ieS4MP6WSI4Idl4Lg6axhEYpCzLV5N7cKGIQOwlS31Z
         JW8g==
X-Gm-Message-State: AOJu0YzP82mmPA6eMRvj9R+0n97R9rzot7MKWusdsHLO4pjxoF/MA9kr
        keg1yPcP2BFirls9xXUsZERGaTtGU6/esvnalh32NQ==
X-Google-Smtp-Source: AGHT+IFDcjP7BKjl2ICZrAxMoGEWjkYrrHE84Mi5IoLoyMEAqEiUugTLGi2pK3t5jzenoOuUcxrdNw==
X-Received: by 2002:a05:6a00:80b:b0:690:3a0f:4164 with SMTP id m11-20020a056a00080b00b006903a0f4164mr1590541pfk.19.1695914337495;
        Thu, 28 Sep 2023 08:18:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c12-20020aa781cc000000b00689f5940061sm14053745pfn.17.2023.09.28.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:18:56 -0700 (PDT)
Message-ID: <65159960.a70a0220.d1e6c.83e8@mx.google.com>
Date:   Thu, 28 Sep 2023 08:18:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-28-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 50 runs,
 6 regressions (renesas-devel-2023-09-28-v6.6-rc3)
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

renesas/master baseline: 50 runs, 6 regressions (renesas-devel-2023-09-28-v=
6.6-rc3)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 1      =
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
sas-devel-2023-09-28-v6.6-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-28-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      19d8182ea9c525553bf08fd99003f62430e68ec0 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/651568e9b4955b67b18a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651568e9b4955b67b18a0a4b
        failing since 16 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-09-28T11:51:48.903627  + set<8>[   27.766493] <LAVA_SIGNAL_ENDRUN =
0_dmesg 138195_1.5.2.4.1>
    2023-09-28T11:51:48.904026   +x
    2023-09-28T11:51:49.015027  / # #
    2023-09-28T11:51:50.181370  export SHELL=3D/bin/sh
    2023-09-28T11:51:50.187494  #
    2023-09-28T11:51:51.686880  / # export SHELL=3D/bin/sh. /lava-138195/en=
vironment
    2023-09-28T11:51:51.692979  =

    2023-09-28T11:51:54.416891  / # . /lava-138195/environment/lava-138195/=
bin/lava-test-runner /lava-138195/1
    2023-09-28T11:51:54.423648  =

    2023-09-28T11:51:54.440027  / # /lava-138195/bin/lava-test-runner /lava=
-138195/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6515697f15290b8d6a8a0a5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6515697f15290b8d6a8a0=
a5f
        new failure (last pass: renesas-devel-2023-09-27-v6.6-rc3) =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/651569367d809b77928a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651569367d809b77928a0a49
        failing since 72 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-28T11:53:00.004186  / # #
    2023-09-28T11:53:01.463947  export SHELL=3D/bin/sh
    2023-09-28T11:53:01.484391  #
    2023-09-28T11:53:01.484528  / # export SHELL=3D/bin/sh
    2023-09-28T11:53:03.437524  / # . /lava-1013952/environment
    2023-09-28T11:53:07.031107  /lava-1013952/bin/lava-test-runner /lava-10=
13952/1
    2023-09-28T11:53:07.051707  . /lava-1013952/environment
    2023-09-28T11:53:07.051817  / # /lava-1013952/bin/lava-test-runner /lav=
a-1013952/1
    2023-09-28T11:53:07.092360  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-28T11:53:07.145415  + cd /lava-1013952/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6515687da2e7ad033a8a0aba

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6515687da2e7ad033a8a0ac3
        failing since 72 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-28T11:54:19.943375  / # #

    2023-09-28T11:54:20.043796  export SHELL=3D/bin/sh

    2023-09-28T11:54:20.043933  #

    2023-09-28T11:54:20.144360  / # export SHELL=3D/bin/sh. /lava-11635191/=
environment

    2023-09-28T11:54:20.144511  =


    2023-09-28T11:54:20.244994  / # . /lava-11635191/environment/lava-11635=
191/bin/lava-test-runner /lava-11635191/1

    2023-09-28T11:54:20.245217  =


    2023-09-28T11:54:20.257466  / # /lava-11635191/bin/lava-test-runner /la=
va-11635191/1

    2023-09-28T11:54:20.310767  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T11:54:20.310866  + cd /lava-116351<8>[   20.297924] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11635191_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6515688ea2e7ad033a8a0adb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6515688ea2e7ad033a8a0ae4
        failing since 72 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-28T11:50:37.245628  / # #

    2023-09-28T11:50:38.325387  export SHELL=3D/bin/sh

    2023-09-28T11:50:38.327259  #

    2023-09-28T11:50:39.817306  / # export SHELL=3D/bin/sh. /lava-11635177/=
environment

    2023-09-28T11:50:39.819182  =


    2023-09-28T11:50:42.539273  / # . /lava-11635177/environment/lava-11635=
177/bin/lava-test-runner /lava-11635177/1

    2023-09-28T11:50:42.540642  =


    2023-09-28T11:50:42.555954  / # /lava-11635177/bin/lava-test-runner /la=
va-11635177/1

    2023-09-28T11:50:42.609328  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T11:50:42.609404  + cd /lava-116351<8>[   28.513884] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11635177_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65156980f7c15a7dd18a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-28-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65156980f7c15a7dd18a0=
a43
        new failure (last pass: renesas-devel-2023-09-27-v6.6-rc3) =

 =20
