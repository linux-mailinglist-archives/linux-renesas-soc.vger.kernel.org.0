Return-Path: <linux-renesas-soc+bounces-2738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C88541A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 03:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3E71C2191B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 02:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81446612E;
	Wed, 14 Feb 2024 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FsrW8fEL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F7153BE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707879380; cv=none; b=EbVVOOlIZ6zd5UMpYOmloJvr99qYQ436mY4KbJd5Kj6sbmL6z/9eMULjB3liNHLzi3Nry9thIS95k+bz93ov/ajn4YafPQmGcb6DhA9BQcZ09drUzlwIVgvKDRs4wbgV/846T9+vE1f9hlAoUB7KtGapXrAItODiw2LkzbraDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707879380; c=relaxed/simple;
	bh=rmDXuHeOM0owLMh+yL8CRMu9BEyDWYPOSjzxnDyxBYY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=snLG1pJIj2etbN50hTCSflVTiNXrZWt/v0NmplDVj/HcM4W68Dmx7L4ew+hnwoo5FH4U7RBBiDT7W4vfVfvHHdiO/Pfj2yxk92vYJtpklc4+HAjfBHZNMpOZkQXMse3ThvNBzYFs6zCeBNysB8Ir0XQFjlKV6ypWOjiv/12Sczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FsrW8fEL; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-598699c0f1eso3142680eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 18:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707879377; x=1708484177; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+DP7kffz6R7/hCCwUlSDTgqNRr55HxKlfq7nlmQ1CjQ=;
        b=FsrW8fELmmVo9sQx8U4hWVwerMk/mhq2b2fMICmwCoWn0MEPbfpE8cbhx6kZNlNKs2
         gMADSMEgi1BAmcgg4iIkNNWxjZugYDogI+VSMVPp++j7MtF7IMJdtZJvYyoUx43gsPHc
         ZvjWDxfSkkrbAoRPWwci8iWflOtZPQFmfoJUVuSRPh0UB/j2hATFZKdBhaTLjsI4t27E
         nowMe8dNKwrdw68rA5WEuclQ0VabGtJjCRYyANO5Pl4ncTzUrjc04Hli1hkcQVzMuDRp
         CxaNeodcjMp/U3nCiG7ojcC3lGlSbqIrcm1hl9OjGKIHdo90Viiiv3WSUMccko9+7jPM
         IlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707879377; x=1708484177;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DP7kffz6R7/hCCwUlSDTgqNRr55HxKlfq7nlmQ1CjQ=;
        b=Gv3Akws2igWWMmpB3kmsZUL7tWRdGCop0Ixadjw21MrLDV2pl44vRScN90PNRydyeu
         ub+7OGFwIoocOOqWrLRxklGc7N+ExN1FuCcZe0sPdCItCadDtMGAzuhWaBFxg8jwyP4K
         9szMojObV/H9kvopGgJu+eblINKKefZipXl8Dygy4sDkwFXLhG6HQCuu5XTUuMHtdVPg
         IqYkFjvent2ZfCT0ivzmM5yad773PaUANlp2N9lkBQ/MpRRPxbu+mvROT73S6t/bcag8
         ZASjonN/87WLdUS0jSpsgFAQcuyGwIPnh33PwR2DX/4Qeotw+oAR5R2LS0htoYPCm/0W
         o46g==
X-Gm-Message-State: AOJu0YxS2pD2XSj+qWUaBvq8GRn8H/HO1UsdA+x35YVoBo/MyiYY+TLs
	KEFeVaYxURYJbAvstCXJ5mQKnwOcGGeUL0BtorBrRy2lwX1Xv+7pkAUIu0MQBZA6bz0i9ItWQun
	p7TU=
X-Google-Smtp-Source: AGHT+IEhWxs6RdMvoGumDeGH4o54xY2d2mv1pvsmWnkUsmxd53CxP6LZ1g/8qpAqZ4DHDCeVrgI5cA==
X-Received: by 2002:a05:6358:7522:b0:176:92d1:568f with SMTP id k34-20020a056358752200b0017692d1568fmr1403488rwg.18.1707879377106;
        Tue, 13 Feb 2024 18:56:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWo0147JcIOmnDwV779ZnkygSQIJl1d+CqP0qfYFrxB+VQLYupGoYYgGf3+86gHU3N2gJQ2qmbW4RA+a72kF+hX0MFbQwTAloINCQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u6-20020a056a00098600b006e0350189f0sm8345179pfg.91.2024.02.13.18.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 18:56:16 -0800 (PST)
Message-ID: <65cc2bd0.050a0220.1b072.8592@mx.google.com>
Date: Tue, 13 Feb 2024 18:56:16 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-13-v6.8-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 50 runs,
 7 regressions (renesas-devel-2024-02-13-v6.8-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 50 runs, 7 regressions (renesas-devel-2024-02-13-v=
6.8-rc4)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-13-v6.8-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-13-v6.8-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f06417c37fba23ac48fa23f2d7383c6336788333 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65cbfae7f3fcb3ad71637026

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cbfae7f3fcb3ad7163702d
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:27:03.414838  / # #
    2024-02-13T23:27:03.515402  export SHELL=3D/bin/sh
    2024-02-13T23:27:03.515609  #
    2024-02-13T23:27:03.616090  / # export SHELL=3D/bin/sh. /lava-429169/en=
vironment
    2024-02-13T23:27:03.616405  =

    2024-02-13T23:27:03.717380  / # . /lava-429169/environment/lava-429169/=
bin/lava-test-runner /lava-429169/1
    2024-02-13T23:27:03.718513  =

    2024-02-13T23:27:03.729554  / # /lava-429169/bin/lava-test-runner /lava=
-429169/1
    2024-02-13T23:27:03.823050  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T23:27:03.823477  + cd /lava-429169/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cbfae7f3fcb3ad71637031
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:27:06.038264  /lava-429169/1/../bin/lava-test-case
    2024-02-13T23:27:06.065342  <8>[   26.220118] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cbfae7f3fcb3ad71637033
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:27:07.126630  /lava-429169/1/../bin/lava-test-case
    2024-02-13T23:27:07.153288  <8>[   27.308514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cbfae7f3fcb3ad71637038
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:27:08.385118  /lava-429169/1/../bin/lava-test-case
    2024-02-13T23:27:08.412383  <8>[   28.567279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cbfae7f3fcb3ad71637039
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:27:09.435774  /lava-429169/1/../bin/lava-test-case
    2024-02-13T23:27:09.462694  <8>[   29.617774] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65cbfad373547f88e5637020

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-13-v6.8-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cbfad373547f88e5637027
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:26:56.257748  / # #
    2024-02-13T23:26:56.359821  export SHELL=3D/bin/sh
    2024-02-13T23:26:56.360616  #
    2024-02-13T23:26:56.462122  / # export SHELL=3D/bin/sh. /lava-429173/en=
vironment
    2024-02-13T23:26:56.462887  =

    2024-02-13T23:26:56.564205  / # . /lava-429173/environment/lava-429173/=
bin/lava-test-runner /lava-429173/1
    2024-02-13T23:26:56.565412  =

    2024-02-13T23:26:56.570040  / # /lava-429173/bin/lava-test-runner /lava=
-429173/1
    2024-02-13T23:26:56.633939  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T23:26:56.673771  + cd /lava-429173/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cbfad473547f88e563703a
        failing since 22 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1)

    2024-02-13T23:26:59.603961  /lava-429173/1/../bin/lava-test-case
    2024-02-13T23:26:59.630888  <8>[   27.038298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20

