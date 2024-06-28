Return-Path: <linux-renesas-soc+bounces-6870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF91991BC02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 11:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D021F22768
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 09:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53569153810;
	Fri, 28 Jun 2024 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="I28BZ0+k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40215358F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568703; cv=none; b=HI8AhBjVHbELgVULNlgaXhr3FOqIvAm5Bmfch1CcXGlpNM8GsCT3GRaxn45rw5WS9CPK2ghTo3Ys1YQVduB7suP+MGuYevOzR0aFfanT1CHRnTgpGXqKi5T/I9WUorqoF0UwKuwjZ++gkzHaigTwTvqFtj5NNkm4VnXG7lO1yT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568703; c=relaxed/simple;
	bh=cPuYKm0YSC1bLHpklv2OpSJ4DO6yrwZaDeYYafFez1Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AjCGoqt9QZVEwin7J0iyJQIHxaKKEaLnZI2MTrna9yoCHnSQuxmiiFa3nn73L4FaACkmYX10HKbgHohEwoEqHLoICog0mFuwDN1uzHcuPNdwEV0JRP8JAmdrsv3gR8EtAHm5Q8b58t+7OyS6z9t8Bf1FlPU93XmERyfNqpxMUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=I28BZ0+k; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f9a78c6c5dso2434265ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719568701; x=1720173501; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0SUObzsWWq/B5GyviWOL4WRZwHR21PTRZ+q8cjQkElc=;
        b=I28BZ0+kB9njltxHmhzuFlMy7MQ/v0LUewXG2aF1kkjeXrRCs6S8p6cwdur5TEseUp
         aNUypnS31528aygsnw+8v4sgaNan7BCZy9jSyg43H8AH6nyT7DesG6mJuBIgrm/3vIQJ
         llQNXRJ8lM+mYxff2Ggttf/sXZGr8i4Alelig3sA95uq1rmgs67RwnqGzwBkPjTPquun
         wyTuL0E7NgsZas4ngsydxyJUK4P06YeC6HBRUgDsQ30iOIMUQ+Nfouj3rV1gpoGDLAk1
         6uiySMZrfM+IZ7uc6xszIn8YksYml1FuDt7lBcoFPI2HxCURmgsK8866FhHwYY2fFLSy
         hzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568701; x=1720173501;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SUObzsWWq/B5GyviWOL4WRZwHR21PTRZ+q8cjQkElc=;
        b=LSYXAfwglIcLysupL/P6coK9E1Pidan/y/9Ue1ABGCuHyqqkbDey7oscn64yT+Vi8T
         fs9s5RbtRfuhcTLBdItl5zh0b/QdB5iKMFxVeH8yD+HNq7kJJ/gu6yeA7HypmucTsQ9P
         Q/8z1C42sWhRJ3Wu9Jfg1G7JZ+Fo3WLYjJV0Md2dujv26DOcnuenVadvIFEN/3QD4CFR
         rFreQyNRsmDj41Bbr9xTZGwIKQbTouW1Fm3M+Ra6WliJAr7/llEoczd0Gx+OgYG50wCF
         HIBqJXoUHmyzCiAEC0AuMNrF4//oETAN0lE1TIk7M8ft/V+68GwqtBypuuiyNX2MBMdl
         UQ6g==
X-Gm-Message-State: AOJu0YzDLt0jZqb32Ug8uSbHpH4YTXiEYy9Qhp+WqIPr4/C9SYWgLXFt
	aJZ3pAGqt/2EJfYqqM3KgxORqzbrW8En05+vIU6EbOAK98PyUP57JNhranYw95kjvDJ3WUkV/C5
	a
X-Google-Smtp-Source: AGHT+IFLo12LPyBqVpG6wPctVAtxndJ6tCAtoMtJL7feenc7QM6+/Dbk+d7NXlyNokqB01SQ3FbJAA==
X-Received: by 2002:a17:902:a501:b0:1fa:d77:21f8 with SMTP id d9443c01a7336-1fa23f158c6mr113196055ad.42.1719568700515;
        Fri, 28 Jun 2024 02:58:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e2ea7sm11531525ad.81.2024.06.28.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:58:20 -0700 (PDT)
Message-ID: <667e893c.170a0220.c7d8e.37b9@mx.google.com>
Date: Fri, 28 Jun 2024 02:58:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-28-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2024-06-28-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2024-=
06-28-v6.10-rc5)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-28-v6.10-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-28-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b697d5470d57cfd6ff3e1388699cd905334a9220

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  c8f327ce9cb504a6c2185487d576be3d5254556a
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a44ebfe43edc96acab22a19b6a8850eef9202eea =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/667e83b016f945d62b7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3=
399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-28-v6.10-rc5/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3=
399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/667e83b016f94=
5d62b7e7077
        failing since 3 days (last pass: renesas-devel-2024-06-17-v6.10-rc4=
, first fail: renesas-devel-2024-06-24-v6.10-rc5) =

 =20

