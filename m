Return-Path: <linux-renesas-soc+bounces-4259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D618979B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 22:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32297B23957
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 20:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68131155A2A;
	Wed,  3 Apr 2024 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HVPuOgWI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD94155759
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Apr 2024 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712175647; cv=none; b=H9bWMTfQljHPpq29BftgQQe3Fy7HoLE7LEr8UDFeLU/mhQwX/mlbMiVHh2VnNk4SablRpbEw3tcC5akikD8EZ5YuUy5wzIljiSG1U9FXs/UOUI83wamSJc9GWwzGKNJ8X4zPVLDYIiDzpp4GWqctRF+UD0PNaFk7L2WAOsyxUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712175647; c=relaxed/simple;
	bh=LS99K70csvonoDjDyNVHrqgu0UOPEE7c0LrexzeZo8s=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WCjn/aJDl5/FGZ/O6v9Er8kPshtUvRehWOnKPysR0R2DPi3Aha3hQECl11S8vOpokvHzPrgVY/dxbSM2RkYhqMrVVQuCu9RPUP4hKyIadA0X68U2PVWda6Z4Q5x6Rf7/auCbEdHmnRvzWY4j/f3/WfxTFQM38eTyHZ3TYWNawCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HVPuOgWI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so229082b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2024 13:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712175644; x=1712780444; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DkfGWE6fAzEHoYFEK95VmF3t2RmEda1jN3E65+cX7Vo=;
        b=HVPuOgWIlee9QuKdTFFHpH6wWTPab007Bn1XBxJfRgZorHX9cDsqaVapKB2WQ42tWQ
         JioSkXlju7kLuGXyKEwftKdUBMu3miGdzxJN2kmNvCtc4UUmvMnaV6+LF0g8Sre8++vv
         JXBcWz7lmZYnwLGAwBl/YyyiRBme9Bd5NJgtqeZAjRwjIa16mK8/w5qsRi2edbwFuDaD
         MGwlVnKaEvApVPac2BjVRQ+IvGdpzw7ELvg3upt2yQOdDuOGdcxwVa+d7IK7DddecdFV
         WVDfylsCVO21xqcLm0v6cX6i+i38sPFQ32lx3xNfXoZiyWuGB7zZ7zgFAv07RezWXy8/
         x00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712175644; x=1712780444;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkfGWE6fAzEHoYFEK95VmF3t2RmEda1jN3E65+cX7Vo=;
        b=VHpWqVJW5i07stF5R6+zPHOFgzkzizBM94kAuNZnyGfpjEx87EztjI5CJC0TwwDmSt
         oT/j/GQkEVo2kueBqD9wFDWp5qqbN1xHIkTIIQdWBbAxfwJelXhKa7cHjX6Vydny2vaS
         Cs5CUkydQyQkV++5DDPbQ1ta/J9t4ftbSz5brxU6HOMgfQ/Sj8qrcXuXwymUnSNsF4D4
         mH6ELVwZjIuCaPcmjBSwnesG878uXDpwHcKMYTLo7KODIwlXNsnkDLKs+BKUwTWwgIE4
         7NouguXaxfxi3DcpDQZjG44MOi+nz5FaY3YS9nsdYxaboClTrbT4OLZGiFiDfHAJuKxE
         Ar7A==
X-Gm-Message-State: AOJu0YzwRS0aQwrU6AB5j1QAe1jQNBnUMfEGVOlT1LwrH1DaNpP1NlSe
	bLmPSwl+CWRORrOZm9SeaEibSQkCqzebmd8VGxC6v0OF0NIeL8tv5MptvKFwrDRlT7qLAtIhOg6
	qyUs=
X-Google-Smtp-Source: AGHT+IG4sHXcWOvjO7qQunP24RlSsYlMDWVHoAJZBz+DVr75gMURa3Zdj6gBsC5h8tCYI+3wyfbV0g==
X-Received: by 2002:a05:6a21:6d8c:b0:1a3:a99a:cd56 with SMTP id wl12-20020a056a216d8c00b001a3a99acd56mr815300pzb.38.1712175644242;
        Wed, 03 Apr 2024 13:20:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z9-20020a63e549000000b005cd8044c6fesm12031909pgj.23.2024.04.03.13.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:20:43 -0700 (PDT)
Message-ID: <660dba1b.630a0220.0990.263f@mx.google.com>
Date: Wed, 03 Apr 2024 13:20:43 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-next-2024-04-02-v6.9-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 59 runs,
 1 regressions (renesas-next-2024-04-02-v6.9-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 59 runs, 1 regressions (renesas-next-2024-04-02-v6.9=
-rc1)

Regressions Summary
-------------------

platform        | arch  | lab         | compiler | defconfig | regressions
----------------+-------+-------------+----------+-----------+------------
bcm2711-rpi-4-b | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-04-02-v6.9-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-04-02-v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a31e004a082c9eb21f465a657a1fc56c85e74e6d =



Test Regressions
---------------- =



platform        | arch  | lab         | compiler | defconfig | regressions
----------------+-------+-------------+----------+-----------+------------
bcm2711-rpi-4-b | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/660d894e16a8d27d244c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-02-v6.9-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-bcm2711-rpi-4-b=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-02-v6.9-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-bcm2711-rpi-4-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660d894e16a8d27d244c4=
2db
        new failure (last pass: renesas-next-2024-02-23-v6.8-rc1) =

 =20

