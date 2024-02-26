Return-Path: <linux-renesas-soc+bounces-3190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E25208679B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 16:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120071C2B05D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 15:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB0412EBE3;
	Mon, 26 Feb 2024 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="l3ejvJvz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104912A15C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708959603; cv=none; b=ClUjD0FYiU5H1f0QMh5iJpXAtbXnR9ChrfwrqtcuRBbwcTsgksJYPm+m3kymUGaOXoIRcGs1kkvSCbmGiEjKAjG1F+BSt0sfyGHxPAGXa4zUU867pHbQmhXOzM1j4xNf0K3gSPzIYXzbYfg66ZqE1krWcwfMdJOC6GlMeKKq5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708959603; c=relaxed/simple;
	bh=I3w/h4/XbjgvkXBGb7/7OREYX87V6Mk5eOcuUTGKohE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fIAgbDmCZQk+TqXCtgdIiwuLp2cfVUT+3YpaTJ1PDrUV8olHPnj7HcPu139lf7kXc9kdE2fsZoJqplnAjTl6uPHKjZrqQ1mxRacnQcFrn69yRYjXT87GQaPqHCMQE2lVFj1t7kj6PV/Y7pi7CEumM1NhYJe1Sb//IPB73AYRsEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=l3ejvJvz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso661850b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 07:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708959601; x=1709564401; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x5uVnWDlMBrcaFh0PnMWk7ZJSVMelARHYZ60lYKQouU=;
        b=l3ejvJvzKfHQQm56hg2zRwt3pJcf5yN1XVYgA3cEPL4Rmczz+Aovx3o1S4V4Btz0/A
         ASAn1pcd1bXiweiux7C09F7Euu/sYDH31WbU5kNOQBB3a/vIKtLp8rPvuyH2QS8/rlFO
         VYZd2dDF6hBhQBFygGOMzKmXmI6a9ULayDyKjEc4EWwnkJ8gNephWcCauyBq0XzSljlQ
         uXfaKZwhjMDbN+f2h7JSfDh/VTER9ZPMGZRHxLifH/oZWA9PZe8pHpX8D1vF9zYazFjK
         sQvjsG7lSU+GVtY42etVAkHb27ahjykzd3AJ69No0x7oqeanvPU6w154xh3FoiEX+djQ
         WHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959601; x=1709564401;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5uVnWDlMBrcaFh0PnMWk7ZJSVMelARHYZ60lYKQouU=;
        b=Ykx8Yy0E/WE9o2StgGsIvwP4eDmnzGcz+NL83qowbb/C/Lo+ZSbfMHXDRXgMMQQRpG
         p6ImLwjCMrD4+w55pHJlJCQwCC9A4/Bg6nPJbu0wwCj3F6yuR/etiTimCucnT/L3xsR9
         tmHURsB/QrJYYeLlAZIeoe5FJdmSwp9Gnt4eJ0eRRA0CNsiNdygjtvQ7YHNhto8nxxfz
         uUI54VO3cfWYAHFix8J5hbkPrm+Mkt4eUbeMDq/iGUVquNnDvuCkZ4bay3EikdG6TpOb
         adakhms+AxV+hUITP1HSnXSWWnr6q/q1PhEo0OiH7M8kN+L1IrHxLvwdwNXvystwhteI
         mcTA==
X-Gm-Message-State: AOJu0YxSmaCuWy1Qg2nIl9H8nTCM7T2fXnoM93wD3WcuJ6OHUun9F3KX
	SqLgd8Pw4BkP3XuuQhINxMroQ0upSdcNLQAUJKGi6lYcAjl+V6O1muf62dt8kcV4jq84omQVp2o
	G
X-Google-Smtp-Source: AGHT+IHXl20iwia0zVGB91H/pLuZJtGsn930csZ9ljCNqxCWLBTBECqMxYfuxijmXPBauY2HEnkN6Q==
X-Received: by 2002:a62:d45d:0:b0:6e4:8921:6327 with SMTP id u29-20020a62d45d000000b006e489216327mr6490213pfl.16.1708959599175;
        Mon, 26 Feb 2024 06:59:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78083000000b006e508b6a13dsm2808955pff.58.2024.02.26.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:59:58 -0800 (PST)
Message-ID: <65dca76e.a70a0220.b0f7c.83c1@mx.google.com>
Date: Mon, 26 Feb 2024 06:59:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2024-02-26-v6.8-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 55 runs,
 8 regressions (renesas-devel-2024-02-26-v6.8-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 55 runs, 8 regressions (renesas-devel-2024-02-26-v=
6.8-rc6)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-26-v6.8-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-26-v6.8-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      df55710c54e7da1e6dcea88778f12afe8740ff34 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc753b79b6dce2f763704a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc753b79b6dce2f763704f
        failing since 391 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2024-02-26T11:25:23.658010  + set +x
    2024-02-26T11:25:23.658180  [   13.448994] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1029151_1.5.2.3.1>
    2024-02-26T11:25:23.765817  / # #
    2024-02-26T11:25:23.867326  export SHELL=3D/bin/sh
    2024-02-26T11:25:23.867995  #
    2024-02-26T11:25:23.969047  / # export SHELL=3D/bin/sh. /lava-1029151/e=
nvironment
    2024-02-26T11:25:23.969548  =

    2024-02-26T11:25:24.070797  / # . /lava-1029151/environment/lava-102915=
1/bin/lava-test-runner /lava-1029151/1
    2024-02-26T11:25:24.071360  =

    2024-02-26T11:25:24.075193  / # /lava-1029151/bin/lava-test-runner /lav=
a-1029151/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65dc7689226418ef33637090

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc7689226418ef33637097
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:31:02.619568  <8>[   20.158271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 435361_1.5.2.4.1>
    2024-02-26T11:31:02.725110  / # #
    2024-02-26T11:31:02.827294  export SHELL=3D/bin/sh
    2024-02-26T11:31:02.828014  #
    2024-02-26T11:31:02.929517  / # export SHELL=3D/bin/sh. /lava-435361/en=
vironment
    2024-02-26T11:31:02.930258  =

    2024-02-26T11:31:03.031670  / # . /lava-435361/environment/lava-435361/=
bin/lava-test-runner /lava-435361/1
    2024-02-26T11:31:03.032822  =

    2024-02-26T11:31:03.050386  / # /lava-435361/bin/lava-test-runner /lava=
-435361/1
    2024-02-26T11:31:03.095317  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65dc7689226418ef3363709b
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:31:05.169187  /lava-435361/1/../bin/lava-test-case
    2024-02-26T11:31:05.203629  <8>[   22.732220] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-26T11:31:05.203806  /lava-435361/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
dc7689226418ef3363709d
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:31:06.262689  /lava-435361/1/../bin/lava-test-case
    2024-02-26T11:31:06.263133  <8>[   23.770655] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-26T11:31:06.263435  /lava-435361/1/../bin/lava-test-case
    2024-02-26T11:31:06.263658  <8>[   23.787734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc7689226418ef336370a2
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:31:07.339675  /lava-435361/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65dc7689226418ef336370a3
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:31:07.342898  <8>[   24.884177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T11:31:08.401577  /lava-435361/1/../bin/lava-test-case
    2024-02-26T11:31:08.402057  <8>[   25.904739] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-26T11:31:08.402343  /lava-435361/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65dc7686226418ef33637026

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc7686226418ef3363702d
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:30:56.576251  / # #
    2024-02-26T11:30:56.678494  export SHELL=3D/bin/sh
    2024-02-26T11:30:56.679242  #
    2024-02-26T11:30:56.780641  / # export SHELL=3D/bin/sh. /lava-435357/en=
vironment
    2024-02-26T11:30:56.781367  =

    2024-02-26T11:30:56.882834  / # . /lava-435357/environment/lava-435357/=
bin/lava-test-runner /lava-435357/1
    2024-02-26T11:30:56.884059  =

    2024-02-26T11:30:56.903547  / # /lava-435357/bin/lava-test-runner /lava=
-435357/1
    2024-02-26T11:30:56.956567  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-26T11:30:56.956787  + <8>[   21.057167] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435357_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc7686226418ef33637040
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-26T11:30:59.393086  /lava-435357/1/../bin/lava-test-case
    2024-02-26T11:30:59.393304  <8>[   23.480642] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T11:30:59.393465  /lava-435357/1/../bin/lava-test-case   =

 =20

