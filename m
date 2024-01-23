Return-Path: <linux-renesas-soc+bounces-1739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E642C839A13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 21:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C2428F23A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 20:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5DA82D97;
	Tue, 23 Jan 2024 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QZLgghqu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8882D8D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706040835; cv=none; b=N+qocuur7Rm8RHrG6STGQ5oXXhr4D8AC3mtWk9CtVeW53mk7VExjxhx2QH0A1nM/WDAZNbfL3dQ220n5QsHAVEBmzSBr7kaibRkZHvCsLN9CJSTgk923X/QgZEv4IB/pc/PvW4RG9judP7bPrGQaqtRcGJlAvbOGvj7Bk9lvb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706040835; c=relaxed/simple;
	bh=o9XlRYusZU1oLoY9dBkIUQdTPWzdpkofRH9jK+7f+Hw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=f0YeWAR+LN6pECDhC22EQSs+WCGJdBZxS+CMSGSR6sboKt57pKH2AqLSgqVR7VJx2vA+a+0g5cWPA8clNBMK/ChgjXRxZEx01ZJ59vnAx3sFIwo/qf5l17aBsjDYL3lBQgxESvlQ3AilHg3vo/rbWX0DikVqLuTwlOy/AmKxNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QZLgghqu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6daa89a6452so3209651b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706040832; x=1706645632; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TZE4IIx7/X/JheuSfj663xMAWRz3w7MUreSCR+gVQoE=;
        b=QZLgghquCsvEkSFDLUGl+riqqBOHE45ktBhdxBO9zCak5uOeKcW6c2/zcJfH35Phii
         V2uIEA+340mzmYAtY6U/i9otAEtRxFMc/4V8pjrwQGYWe5YJPRL8CvrZl/eoa+Zw0In9
         eundUK/CuNhORDnHsdK9t3ZO3NQ9MFgkh2ObMflJJ2KAsE5eyx97YTYkvm61Cp7O29WZ
         3Bq3GawADlWkZC8J4BjY0PvlWddMumun4wg4v4LyD/DP0KwJxks1UlDeSe6MTkWoiFjT
         hz09nOimtcvLbnJ/eW7trghmh0LyuIx6VJAaNQkrKfB24FghcpnAk8OkXx6Sz9ZoCmht
         W39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706040832; x=1706645632;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZE4IIx7/X/JheuSfj663xMAWRz3w7MUreSCR+gVQoE=;
        b=oexBw0Kkv2iA03BZXhmd1xPTWOB8Q1PIk4nf8sV5fv335sgdbBfHmmYWBHcPe5zhEJ
         m4dzSO66QdLygVe43OpIYtzyBgGp6LSXWXoVz4ksASvX7QqlxCfv3gDotrvQMWAI3A7j
         0eKVzvX5MyjixJ2thneu0HwhU/pzs4q5iZIlKypx4DQoeUEN2UTvh1CfpHU+jD0HlS+B
         muUVC5BrrfxvxqUNx9TkQlr+IXzu5S3bjel3IP8FNz1MBoND/xA7GUVy1V0E7PgdDk2e
         Veph+GvW9btJVRgENsENkiWhdwG5BQAO8BLec4K7qfHErRdYFHuCmvHxn2RTbgIOibi5
         xSCA==
X-Gm-Message-State: AOJu0YzEbj9RS4ZV8Y0jZbeg2PxO+QGNGf/GpxhCB/wGcNaiNhmT+XLe
	1CkleslQ18CH4m+n4TRWEC/52rLD3hUAr2MXXwhlpFoa4qq/enlsHXC7tQpD/a2P7VvJUL9SDb2
	CwO8=
X-Google-Smtp-Source: AGHT+IHM+hknIZIFVvjncGQ/CO2duayXJjTkVQFLYYzTIPfaXovCx3zXouQ48Z276ETzhmJx2T6Kkg==
X-Received: by 2002:a05:6a00:1384:b0:6d9:ae76:c612 with SMTP id t4-20020a056a00138400b006d9ae76c612mr4711636pfg.50.1706040832185;
        Tue, 23 Jan 2024 12:13:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fh35-20020a056a00392300b006da1d9f4adcsm12064966pfb.127.2024.01.23.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:13:51 -0800 (PST)
Message-ID: <65b01dff.050a0220.5df2a.c20f@mx.google.com>
Date: Tue, 23 Jan 2024 12:13:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-01-23-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 29 runs,
 7 regressions (renesas-next-2024-01-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 29 runs, 7 regressions (renesas-next-2024-01-23-v6.8=
-rc1)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-01-23-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      66d34ad1da6f6b42599b3a9ccb6fee311d4f7ad8 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65afea80ddf8471f5052a401

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65afea80ddf8471f5052a408
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:41.642650  / # #
    2024-01-23T16:33:41.744835  export SHELL=3D/bin/sh
    2024-01-23T16:33:41.745619  #
    2024-01-23T16:33:41.847101  / # export SHELL=3D/bin/sh. /lava-421083/en=
vironment
    2024-01-23T16:33:41.847815  =

    2024-01-23T16:33:41.949243  / # . /lava-421083/environment/lava-421083/=
bin/lava-test-runner /lava-421083/1
    2024-01-23T16:33:41.950472  =

    2024-01-23T16:33:41.994358  / # /lava-421083/bin/lava-test-runner /lava=
-421083/1
    2024-01-23T16:33:42.018298  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-23T16:33:42.058237  + cd /lava-421083/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65afea80ddf8471f5052a40c
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:44.270957  /lava-421083/1/../bin/lava-test-case
    2024-01-23T16:33:44.297910  <8>[   26.128273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
afea80ddf8471f5052a40e
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:45.357723  /lava-421083/1/../bin/lava-test-case
    2024-01-23T16:33:45.384677  <8>[   27.215749] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65afea80ddf8471f5052a413
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:46.617365  /lava-421083/1/../bin/lava-test-case
    2024-01-23T16:33:46.643647  <8>[   28.474602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65afea80ddf8471f5052a414
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:47.666857  /lava-421083/1/../bin/lava-test-case
    2024-01-23T16:33:47.693942  <8>[   29.524761] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65afea835808755d6752a4d5

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65afea835808755d6752a4dc
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:55.981066  / # #
    2024-01-23T16:33:56.083267  export SHELL=3D/bin/sh
    2024-01-23T16:33:56.083990  #
    2024-01-23T16:33:56.185378  / # export SHELL=3D/bin/sh. /lava-421084/en=
vironment
    2024-01-23T16:33:56.186083  =

    2024-01-23T16:33:56.287275  / # . /lava-421084/environment/lava-421084/=
bin/lava-test-runner /lava-421084/1
    2024-01-23T16:33:56.288168  =

    2024-01-23T16:33:56.292545  / # /lava-421084/bin/lava-test-runner /lava=
-421084/1
    2024-01-23T16:33:56.396260  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-23T16:33:56.396686  + cd /lava-421084/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65afea835808755d6752a4ef
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1)

    2024-01-23T16:33:59.324380  /lava-421084/1/../bin/lava-test-case
    2024-01-23T16:33:59.353446  <8>[   27.098332] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

