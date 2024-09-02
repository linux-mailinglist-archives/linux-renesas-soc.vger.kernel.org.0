Return-Path: <linux-renesas-soc+bounces-8615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C3968BFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 18:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5F91F237B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 16:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E066413AA3E;
	Mon,  2 Sep 2024 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZWr+byuz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094BE3BB50
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725294171; cv=none; b=EnrhMu9g+7It0lYI2q9yFJ2jaqnpx9h9dp4dugfvTVGdbPM+6Y9LBixkbCvd2kaosUbajLTNsTxm2b08x7tskx+xMZBDhcdWqYag3euaXL+SChsMIBCt8YMQl7XMJh6WJnmIAvdFw9VPW+KAKW0VJmyoxBA4vY/umhgR+3dMC9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725294171; c=relaxed/simple;
	bh=WxGuCH88s7GkNo8d78gvi5Gljr3KxM1cyZSpg4Wiv3M=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hY7181SVA3fIFDQQ88HAtyn+tZJyVjPtkoq3kh57N3q3ODY7QwJzajkamc6594zdUqIg1x0/ih6Xv6FoEz8+FP8Ndgxw5vb3w/HfeFxxOh0a03kK2ZSLQWheCE9cQqOPbHGJqosjSoFV+MX8bDNwsUewOGNRk68zyl4neogIveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZWr+byuz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2054e22ce3fso13752955ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725294169; x=1725898969; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=50pvNw1UIEbg/Ce04PLGRqGdfqtsrSKqAeF4nVV9oeQ=;
        b=ZWr+byuzoXUtLKRDGSXGId/UFh69c9auSpyo7Rc6s/VVzhycBbel7vQdDFuqSljxm0
         qO9UNpKG9IFawskzS8r7q7yDdtREgG8bIu7fCwsKf0kE0uPJB9j6ghWA/cvK/t9pqxk1
         yTtknFuyJVnJCaoo6sj7Scv49NufG4pLvVgaHcKvbjQy9VOB7egy65ql1bQdidY7V/SW
         CDEHmRv2qDF3W3Py72hdwXmq0pOl9pxg+ieU8l9SJ5TqoNTlURUYVwHNnvG3FxayHMCF
         Tkyi2L8waWJ4SPA1TpT07uKeLHbDOkr1VMsrEHHMRI7D0tK/VUenc7kQoKsyra9sxmGd
         Rw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294169; x=1725898969;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50pvNw1UIEbg/Ce04PLGRqGdfqtsrSKqAeF4nVV9oeQ=;
        b=NQ/NEZGNq371PDuTdao2huQXgZZ+MsDoGHWtWrdvmXDgauSLMuMKB64ADQn7FHHkhC
         qxIK7ZilKpjEg8rQmx7kjwrMFiK0hZfL4ntcSv6Bix9wZCSKL1V2azhvZRzB5Wjj0FdA
         zipr2ojzPaz85zF/qyk2Sl973oP5rfacA8YERBBOWszjgJJz4Jkbe6x0olHMuSTb7S0D
         vJ882ChNIlaITRLvqdmqzhcQyhfd7f8mbJDrSgcff9mEEWEtWnq7Bnv7M2VSTPKwRqEE
         hFK6fosHsu4BpZrVp+lXZ6lKYaITKaXuWrZstZDYqIhk6IwLVjZfVCCJ7rPAdMY68hgV
         pzlA==
X-Gm-Message-State: AOJu0YwiRvXpf8uoBIUaj9l5Gxi02vxCXRYs8xbEbKbBYwiHdl6ieg2v
	OxJSJ8EPfqEAz8F+9GW5o8xAEbXVerCTBm+g9riYS1KGbAsFUkjcOWw+3yfUPdD6n27Lh0N/sbx
	/
X-Google-Smtp-Source: AGHT+IHkikMV8Up+E5p8q2PalKA9ieVQrXv+LgKC4wvmiUOtoHtVjMf/e/w0Ubz7nNq0/LmExBQkkw==
X-Received: by 2002:a17:902:c94b:b0:202:1176:5e39 with SMTP id d9443c01a7336-2050c4891cdmr148925905ad.56.1725294168730;
        Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205528931ffsm34034015ad.45.2024.09.02.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Message-ID: <66d5e658.170a0220.231a0a.7b39@mx.google.com>
Date: Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-09-02-v6.11-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 16 runs,
 1 regressions (renesas-devel-2024-09-02-v6.11-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 16 runs, 1 regressions (renesas-devel-2024-09-=
02-v6.11-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-02-v6.11-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-09-02-v6.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      284f4e0d3f0ba80fe5eb5563807d39c6eec0432f =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66d5b509dcd42e2e6dc86872

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-02-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-02-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66d5b509dcd42e2e6=
dc86873
        new failure (last pass: renesas-devel-2024-08-29-v6.11-rc5) =

 =20

