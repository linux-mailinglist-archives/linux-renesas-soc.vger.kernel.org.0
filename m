Return-Path: <linux-renesas-soc+bounces-8967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190597AFC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 13:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76302871AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 11:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE881E4A6;
	Tue, 17 Sep 2024 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0gKP9osN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5990E291E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726573007; cv=none; b=LSb8vyi9HOZDh3cyMjJvwcuAKfyv5HjAKl2toCHBx6OK8YLC7S30XNNgpd574++3bilu1lFK/G6tcATpykj5ZMAQ5GUD1ngcZYiGafrQr6Kq7yNE5VuXxADbK/bxD8dO1kIq9aP6xhyRZAhqy1kTHX/IkuGx7vhUWlesT/u22A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726573007; c=relaxed/simple;
	bh=AVpYUSv/M0Nz0L5yCYu5409kJ82Pr2yGJsYGWj27BO8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OxE70xSlLEee6QUsRv12xRDKaCfTiqdyd3NfWBnBjdXR3/9yPVnRraJuKCsV1FXWKRyJxlq06pt5gQUPHDST5GPUoVp1ukk0Nhz75bbG1xZzI+aWaeoyc5THmXOZAAPe0AgvJlH3OK6+oY73KyMcHASDMvapRU52TLVFtJk5chk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0gKP9osN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2057835395aso63579965ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1726573004; x=1727177804; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ytFz/Le23IvwjyVjcVdRwOI+PGoIFEmnH8MKvRbnSlA=;
        b=0gKP9osNJ0z2kxs26vbWvNrD8EGbq9IY7SwCpLC+wmmd8T022RLD/OZE77bgl4f6z1
         20TjvVdBV4sZVmW+71NZpjfSl2rz6yhFLEfE2mL0t2pT/c6U2BvmM3TXx6mfzda5aLiD
         DhERDjdyWKmPJwgqwwHwshFCOJAWN9eZ8cWe2BFW2VnWmdRqdwrPpW0pbjr2nGOfZngR
         RwDKGPzNwODXtwU9qCo9tlqSRL7gszcdhH8opmnfPjtVf9MdgOiMbUTtEZwmzSOiv6t5
         IOSkRCFdXgXiIX1Yd6CVk96HfnOq1UYb4J3wWeEG2GRyVCc0dWw6e4ODMKQ4iArXnsI8
         Rphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726573004; x=1727177804;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytFz/Le23IvwjyVjcVdRwOI+PGoIFEmnH8MKvRbnSlA=;
        b=XdEcim0UuPKz4urb/PsrLtVLtF4WE7p9JA1QsHK797soigreraP+5206BOZIYB3iKI
         gcfnk0zvSWRL1d6993XdvFc/ITS3yENyEpuFqVM5AzWTAdQU7XtZ5ayd5WG2fgTf8QQW
         19pDU1gmr8xu6jgh7E6o9/6n01WQtLuYTz2xn2QExHUhbJddFt9kun6arBERhfgB1O4W
         oAps/qFXoKugI89gOmD6ftDgxoRNR/zhzhkqRpjcDyaU7aXMyv6m9wpseg7RRco77jMX
         IrWWsa3WZRJdIKu3g0D2hO/jDznNf7Klb7yjs3jqkmTCbBrWGunb2KCJGicoJSeqTjck
         jOtg==
X-Gm-Message-State: AOJu0YwaAfuqQ+d7APmo24BY0Qnjpdf8v1eHd2l7ePms7Uyzsdc7I/VJ
	zFxjyFg0oU499d0aFYhtOLIwBmCz1pFSkCu/2ic40uL8Ul55DIlEb/TIIuICZq4el3rHp7ozkzp
	n
X-Google-Smtp-Source: AGHT+IHJmoDE57EGwI8qTLljeVKZ+m+RFZ+y4QT6M4U718NB+YXabZ3oQyxOVph78X9EgemYTRAIAQ==
X-Received: by 2002:a17:902:db0d:b0:207:3fd0:13ec with SMTP id d9443c01a7336-2076e333029mr228856835ad.17.1726573003952;
        Tue, 17 Sep 2024 04:36:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945dcc2esm48670415ad.28.2024.09.17.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:36:43 -0700 (PDT)
Message-ID: <66e969cb.170a0220.2e8bcc.f753@mx.google.com>
Date: Tue, 17 Sep 2024 04:36:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-09-16-v6.11
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 14 runs,
 1 regressions (renesas-devel-2024-09-16-v6.11)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 14 runs, 1 regressions (renesas-devel-2024-09-=
16-v6.11)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-16-v6.11/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-09-16-v6.11
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f3faa03b1df0ceadd96a121b2b72e7c0fd78fc20 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66e938ba2eb99c3c63c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-16-v6.11/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-16-v6.11/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66e938ba2eb99c3c6=
3c86856
        failing since 14 days (last pass: renesas-devel-2024-08-29-v6.11-rc=
5, first fail: renesas-devel-2024-09-02-v6.11-rc6) =

 =20

