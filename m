Return-Path: <linux-renesas-soc+bounces-1740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE3839A14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 21:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78CD28F2F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 20:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E23D82D98;
	Tue, 23 Jan 2024 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lWPMQOtR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64A82D91
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706040835; cv=none; b=r71Njz4flW5NCIhKooOtv2l7n3DFqBZ01BIxJJv7WUhfzfXHiCp9T4BZiG0RIDchUOuAc3HXvEgBbtMwuU2Mbfj5Q6h4sWj2Sz0kSPa+70Na02TtoVd2QqHWLNyhop/8sRQPCjKZmVbLtJxA/7xiCRbf8RGKHosmsmcuV2pDlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706040835; c=relaxed/simple;
	bh=Qr/UVsdXSgp8aFHAebRGuUxPYazEDJUO1M08TIUzEis=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gDUK7qqctUYB54CaI+BPQpxPUMAeWg21HDsBL6FptCDDsYHpxl5tT5yL7Nzmv/RXaXw0TK+rFRStLAbGG5kaCDKPo1vURZrc/F30NZKja9Fl+y7s4QiyFfRfJ6t8oHsz+HRlQYpLj3c0EXtqqDlz2Is2all1YPaq1mCNIzD9J60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lWPMQOtR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29041136f73so2439897a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706040832; x=1706645632; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/MGQ8xXaGcq724SQMR5mo+SksmmTjg81oTeU3Iww1MM=;
        b=lWPMQOtR3lSkOPGZOnDA5JYeUlpZ0N2l3hC/dKfurINPi+var6xN/wD2KStbkxoU9W
         DqEsiL0e+a/hod61QF+BeBaUSvhO03sTyn2pE/HTXBQl6Xmht7tErcPvvi9GOlGBfHUK
         hrwBDt5OKpFe0sg6TTU4TvmP4t2Cl4bUXEJw6Z4hdBj4bqsijywqDifxJN7w+GJMc6Mv
         54Te6Yc6MA5KofKvNJ8xSIEbjrU3Huz7GxiL4FVd3y/QJ9zqSj6pYmC22Ag+BgZ6QYOJ
         BT+BAWBfISmL0iT4jOGW5l8P+TdTvIX5lJfWKP34oW8g7CW5qEv6lTGwkqyHgKsvrjRm
         JNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706040832; x=1706645632;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MGQ8xXaGcq724SQMR5mo+SksmmTjg81oTeU3Iww1MM=;
        b=tfqdyx0QpByOJtMF3VnjbV5g23cXfrl+5wUR9dtsW8DcfRywfhmE1w50qWQV+rV05T
         YxuMXkSbM3gWX+VQNBqoA6zhbrfC3yRA+b//tuSshPeLVWFwfTqkOTtnz7TyvSDeEjkl
         vMmR/8XRFIwNGBJQEctqMFmhEZ62FJ/zUxcXoPNo4usdi9uoq6CZaxCuPZHZ1nIhgNru
         p+cTb+fhtaf5m4PbvxX+oksGmXyf46qKIxNX10VzKenM1V5bwtOu4+NljdyXAYkcO8EW
         +VMNCYUAaotYlCGd3VJ03T8rpdYfIQEKR5aNKE3Zx1erhO2x4ol2Os5yZ/NfT6YNIpWM
         Uupg==
X-Gm-Message-State: AOJu0YyzlFRX8JCm+531/e2LGpYTe0NHz1gTjIRZoNu3wPHj/4WuKoA9
	12acElYcEyOygiE1JNiktAr1XIuy6jK+RqMCzlQh1eN1lEP8OmHZ5QmPHyK2+HT6yPvn1qilsuD
	/bWE=
X-Google-Smtp-Source: AGHT+IF/cbzFvyqGoBPX+jLGHNG71RsjFeZRsAn+Zsg4z2QxatRKj1fqB9SbAV2WEK5a2PaBcEbs9g==
X-Received: by 2002:a17:90a:e607:b0:28f:eee3:b7f6 with SMTP id j7-20020a17090ae60700b0028feee3b7f6mr2965506pjy.52.1706040832687;
        Tue, 23 Jan 2024 12:13:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sz14-20020a17090b2d4e00b0028db69af4a4sm12143312pjb.4.2024.01.23.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:13:52 -0800 (PST)
Message-ID: <65b01e00.170a0220.b27e1.b53e@mx.google.com>
Date: Tue, 23 Jan 2024 12:13:52 -0800 (PST)
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
Subject: renesas/next baseline-nfs: 13 runs,
 1 regressions (renesas-next-2024-01-23-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 13 runs, 1 regressions (renesas-next-2024-01-23-=
v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-01-23-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-23-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      66d34ad1da6f6b42599b3a9ccb6fee311d4f7ad8 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65afeb5cccae0be4ab52a485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-23-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65afeb5cccae0be4a=
b52a486
        failing since 1 day (last pass: renesas-next-2023-11-28-v6.7-rc1, f=
irst fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

