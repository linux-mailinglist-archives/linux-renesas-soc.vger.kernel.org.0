Return-Path: <linux-renesas-soc+bounces-6884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3791BF18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C3B28594C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825591991DA;
	Fri, 28 Jun 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o8l7ira4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AA4C3BE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719579534; cv=none; b=TzfVSJ5zT2lVYjrLM1L7JIcZ76fm9P3vLL2or/n/hzwUFvuPce/Va46klRn4eS0C+sGyqlVe9yW2Bvwg1VNuoDPFclTt9+7+ge87gYWIlgqbDceo9sN1rQty/gt2B0Vr7fyl+jm57dmxzognENqU6jdf/+2YA6T0x9szPAnXSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719579534; c=relaxed/simple;
	bh=eBGCcgEpKWHGWgJWZaM8M5UOBkQAFMNvBxCFm/a0TKQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DxkIkYLXjrLNrqlUb9k92d2JCAPhOB/LvI16tpYddLggtq1c4h/ho/MiYthaK//uHwcsXAkEJ7J/HJbib9W9QFxYScgPheM1j5TNStpPhl5JwQnyx1rUoT7bMg0akomAYKd8oV9Zr7hrQNc2uoDM8UgDgjFDaPhs8fqvV8OZtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o8l7ira4; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-254aec5a084so349214fac.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719579531; x=1720184331; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BcGcwp1vqmS3vaZhTB36/QLXQXvsV59kc5Yrj+vY974=;
        b=o8l7ira4hv3nTHRQW81NgXwphyZ6eIbDA/XBBQXh9vQ7powblyDd3Uu/jUTtiNB1zB
         kYtgMlgzKRvPT/ZtSEtHkbmvfR2lukzb5iihP0YANYTcxtWerjzFyo8uVqMxvDCTvCyL
         d/vNhSYVfgPgFZKfMES42iLZE0KM3PRnCLBOd80tn/zf8k+ras2fvzvnUiOJeeOz6B0K
         pPccX4mw3uFvKVHErfj8JW+sz3lfi0gRTqxIApoJOe25vdu/BP6aR9fhR8Gb8yfOQHRX
         22jl7rb1ovEBl98FG2pncis/oHWq+u0RxkgtFNX27DZzJ5DiVXvr3i/7FbG4c5zTt+Ek
         oKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719579531; x=1720184331;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcGcwp1vqmS3vaZhTB36/QLXQXvsV59kc5Yrj+vY974=;
        b=iMgSHPmfkovV4Zh3ZfArmMY+lEWNQJ+RqIC41J37NQ6Aq2194S4e4AXhBpusWBu0+j
         rCUAUZ1ImLOduNtgnvcgUUCPkIFIv2DULDUJUs8h4854QqajqUa3xED0KDLVNCd17Ge9
         0CMtL5TeV7gIaA17r12R+n4us6uSLKhdwJcP65DEbFyBDy1QMj5yxjkwsTs3eWR8P2q5
         obDuAJLWaSWBi2FoZ+GVxvgbmWU96DwINWnE/yrOIOifrSX/798st5acjMIZfSlfOd5g
         kv1/SDFrXnUb9iiiJy+znf2zP86FCGXNS+qemxjOOVlSb6zhUl2aXq2wx/kbPyYUMeoo
         YfqQ==
X-Gm-Message-State: AOJu0YzdTlFrNDyb+bJQ4CLci1laBcKJVLhzsUM0jHso2/k8DVnhByzp
	L0q54TPG24ek0Wh8Iy4tNvkbdYGYmSgBv8P7NO1jroeSYzCg1QYvsvgT37OQI9fZXEhbKVe8nsA
	h
X-Google-Smtp-Source: AGHT+IGEOblH96UWuCgD5EVZVQ/9hPa48+NfWeFJHWQmrTUKIwm7JZpbVWqlvjd1SbAuoaJS/NSToQ==
X-Received: by 2002:a05:6870:1c8:b0:254:a7ef:b714 with SMTP id 586e51a60fabf-25d019b26ccmr16611331fac.58.1719579531158;
        Fri, 28 Jun 2024 05:58:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm1507107b3a.212.2024.06.28.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:58:50 -0700 (PDT)
Message-ID: <667eb38a.050a0220.40423.47ee@mx.google.com>
Date: Fri, 28 Jun 2024 05:58:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-28-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 58 runs,
 2 regressions (renesas-next-2024-06-28-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 58 runs, 2 regressions (renesas-next-2024-06-28-v6.1=
0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-28-v6.10-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-28-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ae035db289ffbf97e32db0e86571507f9b79ee31 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667e81ad1cb31747657e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667e81ad1cb31747657e7=
079
        failing since 30 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667e80c4b744e54c2d7e707f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667e80c4b744e54c2d7e7=
080
        failing since 30 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =20

