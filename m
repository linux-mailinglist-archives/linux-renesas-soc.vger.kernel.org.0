Return-Path: <linux-renesas-soc+bounces-6707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2591539C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 18:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CDB91F24759
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 16:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465A819AA7E;
	Mon, 24 Jun 2024 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ueKfp4vy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14A1EA87
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246291; cv=none; b=b+4RyB66b6z23Q5QdmqlZmxOj33r6ZiMnGZP8NGLohLpKj3/nYWIr4m313fOqnHRizsNW1tstsenFo38VIENLqShachsOHf3kb19t9/JdXNMdT+RHVzxfp7qftmkyNjJ1zt6aeH4WNPGAhgqgzrmQPNrtWIRqkySSUXeEOQfbJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246291; c=relaxed/simple;
	bh=jmorZjkOITSh5+a6JGsk57uvNFepaXy+auk1BJ1CHiY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=czhlplQQ987Ft1QyRTijaDBkjgiibaRRTwMiNO4EWZoY4ArL3rztH8VQAVeMHNa36V0jQcFjpQfefKXdv46AR7G9AdsvRKER5F/KHGNVCriERhvpOOlk2MRVJCdLqh/ruiaJZCpFP2PssHrthPEE2xBADMCICmDJNYdcTDKKLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ueKfp4vy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f480624d10so37612055ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719246288; x=1719851088; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gw4GnbW4ZEGg6TKumpUDpXOlF+j4frR7HwWss3MUZUo=;
        b=ueKfp4vyRd5IGWpUxWcTIPwU7Rf3g/1QqilmnXGNoxubQloA+hj9gKNn95p4oUqg6B
         I5Qb2mD/+8cd/gLSx3j2hiiXAUkVwQSh0CSCxe0pGAzIAETu2OU0xtbeiMzct8M/UvnU
         ehaLG4O6tIlD7pEOmX/4x7jKSM188qt5jIeT+K4CyD1ZUebglSCmUFKjNZQjhXTUuvEC
         J2/POACB4Ggx1MEkHVZyJPDK/F9/QYv3AxORESa821WNdaY+zqg9Z0xxDozHSq57se86
         GGZWnnc8QHi5rar6IapNGA8g2kuVp9hY9Xn/SmkywQc15o8W17KI8CzoY8tJzLmzx4Yb
         BjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246288; x=1719851088;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw4GnbW4ZEGg6TKumpUDpXOlF+j4frR7HwWss3MUZUo=;
        b=HWAznK+1Ctvcrdj9VosbhNBsVz7Dokn0XLCiNLisGAZ76iks+NjadbsFaky58ItIEo
         6IIJCIGXOxAdQFaz7a6Ilf+gQX+TAxeKVld8+v3sHolx92aDagMpQa+6ceYg2Wmb14UQ
         mxrGCnWsMe/jZvLuNrcI1fUKum3sA9IJ0+qOlN7OOoUMmp0BCftAAwy65XFdz23Ld47I
         91YTzwjzqeImRRa4CCf+eTGmPIbwpnBOcyVMMZW9FJrR9jc+gz5SNtbrjFDdt5SxhBJJ
         pvNuODe+r8FXjuj5Y5oJTi/Vr7ZEHgBkUSnQGdZR1tmUfNk7pKyXpdDH/MQnjtD1jrF8
         TDWA==
X-Gm-Message-State: AOJu0Yz/GxOYTUVnIv69a15zOk34Bc7y0DfNH2koT5mK4tzIjseyiDWW
	/SvB1BBnyhiJHrHMpeSxZozKerYXpnHpTCMHvQxmMTqkQ4WR6eH/GwV7S/2FNT0dokzWV0AI7bn
	e
X-Google-Smtp-Source: AGHT+IFU8v1d+PrU7Z3AYT/lwKZxIYc2npMCYfQRmPbTPAEtO8eGO5R2Xh9J67DqgoXOo2yBn0FP7g==
X-Received: by 2002:a17:902:c086:b0:1f8:393e:8b88 with SMTP id d9443c01a7336-1fa1d6acb3fmr52939855ad.67.1719246288477;
        Mon, 24 Jun 2024 09:24:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb5e0a3esm64892805ad.215.2024.06.24.09.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:24:48 -0700 (PDT)
Message-ID: <66799dd0.170a0220.73a8a.ffd8@mx.google.com>
Date: Mon, 24 Jun 2024 09:24:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-24-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 21 runs,
 2 regressions (renesas-devel-2024-06-24-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 21 runs, 2 regressions (renesas-devel-2024-06-=
24-v6.10-rc5)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-24-v6.10-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-24-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9df0887a05742a221abdc725c5a62f1533694eee =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/66796e241ecdb78d387e70fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-24-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-24-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66796e241ecdb78d3=
87e70fe
        new failure (last pass: renesas-devel-2024-06-17-v6.10-rc4) =

 =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/66796edbf772820cc27e7080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-24-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-24-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66796edbf772820cc=
27e7081
        failing since 154 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

