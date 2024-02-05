Return-Path: <linux-renesas-soc+bounces-2324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 275E7849BD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 14:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC291F244E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 13:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA12421C;
	Mon,  5 Feb 2024 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SU8I70dn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668722EF8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139996; cv=none; b=JFIOQ/ieOreHO6tgM1/iD/ArTRvpisw6559L+lZERHZMAT0fY0jo0SM6yWCd7AGbTZtPGrQFsYbd/tpuXNpiPMFlLi0nfqCOYfpyh2FqLyuzMNnspR8qwvoqdmouaETRGTIb4ZTMZHjyCAcd0IATdFaMxZRYZkhbWiGP9H8QvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139996; c=relaxed/simple;
	bh=lM2L/PLFhgfkjJyMCu3M6Q0lEQRigQS/Y9BRQrzzJJw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=O8NZsGRaExux8wtIMi3B+OXmVZ8rN3ptb7W5nxgXhkZtJpaoCoIl1FPLXFJZLY7vjA8pIOvT9Yje4vL8v0/bRrTH7m0Pm5LXRroJfMy1sy9eORqWi2lsgqzmYX7sPaPXVU5wd97vXpJlQ2alwW6T43p4ph1d3KIJblZwLk8m0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SU8I70dn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d99c5f6bfeso8583785ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707139994; x=1707744794; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/WxQpk112SS/tEHuSsUPklzr+9y5fJF733DkNv87Xz0=;
        b=SU8I70dnDD+iCEGY3+q5nwa41tSaC95CwSLXHj10fuj6GtzpYmbkMacpHFHJxujs/8
         D7KGuWq8Lhc6drk3z4x6HAag0aeCJXAOykMez18Ht+pTlkJ0uyFdrOPW+WgXYW5usRRk
         gX+ShuNG0dr+uybO7ZfRKKo4S/QQo8TAI8VREPqPsqWhV7dURAr6XI4jS/ID845SPdne
         3gFR2LJyaqMwzcR9FzKN/aHR5KsPvV9FxFI7/JgB+HqvAkH5ikeqWaVXrjZnw5r+DugH
         iP8qkG39KQsTcgiZA9GhFKLjY0qguGGRTtr9cF0dsErhn3QNyvgMsX397VBFYoAFi0Td
         pVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139994; x=1707744794;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WxQpk112SS/tEHuSsUPklzr+9y5fJF733DkNv87Xz0=;
        b=DMSZHzBPiaKCkp3TfaoNaor8DKGPrJcG5Xan/Cb3FYsbB4TAIPKOBbovh3JlTsKYxq
         nWU1L92Sjxu6Tw2+ac//J53OhlDX+jAdwjJFtX7tuiBlnKUVcwYfK+1CzCnWSpxz1nNj
         ZhV1X0WxYV6epEXEUEzP3peOk0BvUbXgmb8tMnv6xgi0d9w+vRX8dBjnGRDthhL1QdZ5
         HQy4umrRE3U2Ld7VfHTXhGy6jKc1I4X3ESX46Bkgcwh9nN/Xe6EaYbz28KPx9jlmuQ0s
         f7YdXpllMwKritS9ZDpj3jPDf2fLXPrKcQ1XAIUqM8Sb6pkcDrJlDUqzmk5bjrX57S7+
         G30g==
X-Gm-Message-State: AOJu0YwiANILrYZYLGetNATSeM/Bp6E0xejjfVU0ZRjCUGZ1Gqk57OQ+
	BMrHGQ89UCOAwvSyHm2WJCAcaxu51GTerVvHhifXhb9vbiDSaTzP9xjE/uGqYRR3I5e28DZANDg
	I
X-Google-Smtp-Source: AGHT+IGhCVFwuov3kIM8jkaSZHKvxqAZ+OLpkQUWu0perYFY/eQ9iYTtyc8BF2bgTvtamqclH5hWUw==
X-Received: by 2002:a17:90a:fa16:b0:296:b5f:edad with SMTP id cm22-20020a17090afa1600b002960b5fedadmr8023344pjb.22.1707139993829;
        Mon, 05 Feb 2024 05:33:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWybYWLqdd1vhTAvwFNXvIh4/y2kjoNhdhLVXWhWP+OASECmTjLCqRFqPZZC5UgvRgvQslg4M9p1gQHLYQsHMGu0tE5RTCFff7Ssw==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ct24-20020a17090af59800b002965b5a09b9sm5237477pjb.0.2024.02.05.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:33:13 -0800 (PST)
Message-ID: <65c0e399.170a0220.843d2.f603@mx.google.com>
Date: Mon, 05 Feb 2024 05:33:13 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-05-v6.8-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 25 runs,
 2 regressions (renesas-devel-2024-02-05-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 25 runs, 2 regressions (renesas-devel-2024-02-=
05-v6.8-rc3)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-05-v6.8-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-05-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5ee5c13dd1cd222d2add58f1546f05b849c402ff =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c0b1cde03293849600a03a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65c0b1cde03293849=
600a03b
        failing since 83 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65c0b3bcc9dff8ec5e00a11c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65c0b3bcc9dff8ec5=
e00a11d
        failing since 13 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

