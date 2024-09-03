Return-Path: <linux-renesas-soc+bounces-8658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8742969F1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 15:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51DC71F24452
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 13:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D4315C3;
	Tue,  3 Sep 2024 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QUUbFV2Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99584817
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370479; cv=none; b=gdRhHCb7lWMln9l/crlf1xVwCDUzeVhxdlMLEgpf2ei1fslXeICIpwPfBRcR/qqFHxmB8lzxiL/GYvMj87tdMa+nFXqh1nfBCq5WE2S84Lu/nEa9TWkjmbMFBbwWZ4blw1u8SgZ9/cbR9EXqSbnw73m2R1JFMeaAIn7s9HAOIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370479; c=relaxed/simple;
	bh=RmrtrlSu6l0yZH/sPjMXzzOooX56znLgu8+535uTe4g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nNLcmyr5hBQKBhWhitQPwjq+EN/lq5SCR5ZcwOiOzfDOS4xfVM4SMK3ZGhynW9oJr2qlUBrWXPQWe349+HZ9bKxTjHshmdx5SwIPbZXVLSpmC0Y1KMo/5GS2XiSYc34HbKktMAZeql3nsDy2ON9dyDhvti/mg67qYd2Vi1teIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QUUbFV2Y; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2054feabfc3so22860195ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725370475; x=1725975275; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bBD7sI6IYDVUUhS5JUBk2xcErQCXur2mM76D2rGW+Ek=;
        b=QUUbFV2YpjdblJC3humL5j0gib9rfjWV6sqKPCJp5h8WqBBzavQBNtlRt0OtNObcEk
         KhzJwwIQc43rWWAHF2w9c837uIGU/AvnFLXSCvGMoHDQLZ+shrsDOtkCR36/ho41MXwS
         NSZ2ESLY05iJJ3yFBaPYwoSFNkD8AAhBbcdlf09d2PtrTui+BnU+cNd85An0TcVd9etV
         O8nL825Wp1PUkXP8ZcYLI4KxEqDLtTYKsjJ9iZUXY3iRaybEDc3zDduR9KSk2TRGR6yk
         kJzzyTs9uph6iFYDu8z6Jcde+o14ULXsVfHe7mKHliIAglC+bMgkp3FnXz0g78WecjFp
         19aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725370475; x=1725975275;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBD7sI6IYDVUUhS5JUBk2xcErQCXur2mM76D2rGW+Ek=;
        b=GsyCYYiZbspVuYknzb5kFYEX7tykybhu5gI98qm4nVGSr5vQEFCJDUm1O79r32NIba
         i3klGPUXi0z93g+/iJacoQ/WeiLoszdT2+iysl56ensrkAi8JkYT38eOSaJwX4rqRM/e
         36qrjLoWVlvW909s3BSA7VV9hK7vP/QI79jyNKX1/7oKGJ3O2mgUdPlLEr6q2CmKgneG
         vA9zglcTlaDa1Zx4mdz7/wDC2ZLJuvHsrMOz94YlVmRVVTivTQan2x1AHGEJpudThHCH
         Li8m+TbGthWj+uY/NLRdSoZtZGdhNNbPTRhwuKrNtLZ2MFv9hXZ6Q6QEw5CkGAE6MIpM
         ff5g==
X-Gm-Message-State: AOJu0Yx5djtIs0cf0rtBC5r1qynLKvFEzfW0Er7dep1Fijd4K5BDBnf1
	tENBkW1ToHknJZqBn0TV8t08kIdgqqOnYDhoVOHXKvZBEj7yFrrSM2gvsJPZj8ZlPpSC/AOTvr/
	G
X-Google-Smtp-Source: AGHT+IHpmR+oGHXjOxj9Qu8eLfRY8BaCdnBRfcFhpcfj9wBBXUw3/4zV2KlZXFUEEs+5i6/rMEUkMw==
X-Received: by 2002:a17:902:ec81:b0:1fd:8c25:415d with SMTP id d9443c01a7336-2054463b6d7mr111172645ad.36.1725370475282;
        Tue, 03 Sep 2024 06:34:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b3122sm81777975ad.9.2024.09.03.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:34:34 -0700 (PDT)
Message-ID: <66d7106a.170a0220.544fb.a911@mx.google.com>
Date: Tue, 03 Sep 2024 06:34:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-09-03-v6.11-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 35 runs,
 1 regressions (renesas-devel-2024-09-03-v6.11-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 35 runs, 1 regressions (renesas-devel-2024-09-03-v=
6.11-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-03-v6.11-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-09-03-v6.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb506fd73109d2792435a811247040b2d00f379e =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66d6e1341738878d10c8685c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66d6e1341738878d=
10c86861
        failing since 0 day (last pass: renesas-devel-2024-08-29-v6.11-rc5,=
 first fail: renesas-devel-2024-09-02-v6.11-rc6)
        1 lines

    2024-09-03T10:12:40.981062  / # =

    2024-09-03T10:12:40.989901  =

    2024-09-03T10:12:41.094791  / # #
    2024-09-03T10:12:41.101825  #
    2024-09-03T10:12:41.203985  / # export SHELL=3D/bin/sh
    2024-09-03T10:12:41.213741  export SHELL=3D/bin/sh
    2024-09-03T10:12:41.315558  / # . /lava-1188110/environment
    2024-09-03T10:12:41.325572  . /lava-1188110/environment
    2024-09-03T10:12:41.427147  / # /lava-1188110/bin/lava-test-runner /lav=
a-1188110/0
    2024-09-03T10:12:41.437478  /lava-1188110/bin/lava-test-runner /lava-11=
88110/0 =

    ... (9 line(s) more)  =

 =20

