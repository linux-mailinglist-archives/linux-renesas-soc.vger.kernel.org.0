Return-Path: <linux-renesas-soc+bounces-8657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46330969F1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 15:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685EE1C216A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 13:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD2E1CA698;
	Tue,  3 Sep 2024 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="isL96qKD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB00615C3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370478; cv=none; b=rYDgF1aadpKAx5aMSH0Goog3CDptNHiOptfExxY8jU+umkXf3ZLNa3MAMSLvGxNgKJThgtX+UlNQJPmAoBT/9UbyyESnQ8nNpRIRCPrSxcLLMwCY2dPkuUa2r5RwEa3LxjdFvtgDLhMthoGlSP0g4m6QfG9BxFoDD2RHi8xm7DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370478; c=relaxed/simple;
	bh=/RTVhHlG5ATFFlWD38GCLF2zUJLjpCo+cb++bha2OBQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PexzjRpEUe8Uu//IY26m53AoGsDne2Mh1u4Pw+qb/ZSYg+vAexL2iK8k58RROhmmzOk2bmujuU6vzjSLr2TXMI57v22nhycxzvqGNI2QnVl61n7MXmybSuhMTB3sondFPY55kdx+3us50/DRarwCkSGgnJibYP06FCKuFk+BumI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=isL96qKD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2057c6c57b5so11335155ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725370476; x=1725975276; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iglHY/SnaLeG2WoFG79AlF7QL+75frmF9ulKT6nJEWs=;
        b=isL96qKDdTh5+HJwujBiTvqyONQhYAYXD43YLizCwFhPigUhGmUrnwHEre3XCc/MOh
         ggb+kVlx/RwgZ++sL1Z3B/mBUMi9ljzBOKhCMsc7DUqeLwKPkYAv52WQXdTON773rCGJ
         RltXrQHld1jcWvSZkqkHfcgv57sCuWef3qeSdBl4RT96shsfhgdEfOE/Lh/hTjd181YU
         7JFK+Efmijd1Mj1nh1z9u+/vfD2ZBdQzY8b88oVR597eZKUF1uGEJuQDcLrZ6+FmENLX
         usPR0mkXLswgofdiULiX56eMATcrgRkgCuS6wFmPYoCtqvaAfAabsAyt5RJDGGmunQEa
         rxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725370476; x=1725975276;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iglHY/SnaLeG2WoFG79AlF7QL+75frmF9ulKT6nJEWs=;
        b=gDvrTZ++jLvJXhZrWQUxFo951w4MNbpfNkQBQNbu3rHe3hTE/TmxPLGHcrTYjkzQyP
         KPk4XB8pgn2iQOoVhIBnb7I3IsBBQWAiRLV0YaBy7X3jJ1XNU+ek1Tm6VE2NSZoj+DJl
         d8dlZh+8Pf7uH2mb+3xhTjKkkEAlZ65SB3PH5iCLCVJUjU7Z+Abz8ARkldZuZ1MU1/hT
         2hV94SJVA0NfpUTfsD+4xo9ZaRm4OKivpsc+F6vFFW/udSL8nfwrhs/Zmimx9OJjQMKZ
         aFF3Sw5YWY0XL4O9ts/X/RbyE7bjRB19Qu8059MTseKGEaRdeowdjmpTzE/CAFoAKmUR
         4knA==
X-Gm-Message-State: AOJu0YxpkKKPCcnlkJX5V26KMBQFcEQX+8c5IkQHGVnyyjJ7ps0Ey4sd
	SGbX13IKwRsDnI3hPFmICbVp6yTV5zaLvMSW3wwouHEDB0yPKosMvp/dVKoeTpTpjB2aQbf18NE
	c
X-Google-Smtp-Source: AGHT+IGmtVBfJRqjmfuEeHvtPWOaI56azQ2DB7X/r3BHIM2646PuT0dWfKP27eSAt7nTCiejSFjAHw==
X-Received: by 2002:a17:903:22c9:b0:206:8d6e:d003 with SMTP id d9443c01a7336-2068d6eeaa2mr50321135ad.4.1725370475429;
        Tue, 03 Sep 2024 06:34:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2054066ca17sm55522575ad.300.2024.09.03.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:34:34 -0700 (PDT)
Message-ID: <66d7106a.170a0220.261998.0c2a@mx.google.com>
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
Subject: renesas/master baseline-nfs: 17 runs,
 1 regressions (renesas-devel-2024-09-03-v6.11-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 17 runs, 1 regressions (renesas-devel-2024-09-=
03-v6.11-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-03-v6.11-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
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


  Details:     https://kernelci.org/test/plan/id/66d6e29b17dba89f49c86ade

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66d6e29b17dba89f4=
9c86adf
        failing since 0 day (last pass: renesas-devel-2024-08-29-v6.11-rc5,=
 first fail: renesas-devel-2024-09-02-v6.11-rc6) =

 =20

