Return-Path: <linux-renesas-soc+bounces-1033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92983812AD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 09:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A08F2826FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 08:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60762575B;
	Thu, 14 Dec 2023 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="l7afLZ6d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38D910B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 00:54:51 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d375714590so122915ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 00:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702544091; x=1703148891; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uD033f1mccPEBWOwGi3nPbKZM3yYRGF24glWCl48AdQ=;
        b=l7afLZ6dU3M5xkOJXNLhCoq2L+9YAwrItWb+9rUyWZ5/lRXpRC4+L5TZXae0ujNkRh
         rt3jM9AwEPF6UJFKTYUojIo9/LyoYh49w8zAZwPxEl71RWbCXWJc2kT6y53Pq3esE9Hq
         J6ecdCf/r2v5k5VOXx7GosPlEE7UNnVe5XB9CwEODG13qn7kCEUFnjsncpWlmsWgi4gk
         AHEB63QWcdQs5K51Qxfsd4Vokwp/Mz9/bfv6Z25BEk8aNv1BUahMADsaCPG9gnfE6dzf
         TRF1GNxf+lEl+uk9KQRAJby8Iu2XAn/xOxeXfmOpbl71zDAczwZg7Xd1uEoEUxycP2UB
         uuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702544091; x=1703148891;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uD033f1mccPEBWOwGi3nPbKZM3yYRGF24glWCl48AdQ=;
        b=ZN9BgSIsjaNK/Gm9QsxN655BXdcK/5zAGZN+BIDoj6K0A/MNYkunOl/J4qeRE6sxBY
         qDdKeXJ0RYnm/5upRyuMF+vP2+fNHVPAGsyuCX572eol2T86G8TvXBShCnUstw2gUkl8
         RPOoHDxyBE0QyswMbDyRoosbx6b1pSaCk1gAtUBNwjHIzca3Vp6FeWQE73PlnLDznb8V
         H1+k/BbjlgaJ+Mk8aWmvf5R5hkrTMRch2a/Y6bDhQZ1q+Ft+yGRE2OmufSgzt7Bc7WXL
         gKpztQKcuCZ1wmh187IW/IDH1I+Maki9MoR9iFeeoK+4pdhkQOCMmTJqvswzLlr2kExZ
         DU3w==
X-Gm-Message-State: AOJu0YxWb2Vyos+h9GEC1+uLVLPg++uJJmBeNpWWdp1lU/boV2CZoZko
	OMJMhx4qtp+LVM0WZcpBZXDxSo9fHGninL+kXWrPTA==
X-Google-Smtp-Source: AGHT+IFZCU954uiLSPRICjJZWg8V1wtHBexep10mPdgsv0j/BU1sYZalfBr1A5zmOY2gLh1mk4ZS8w==
X-Received: by 2002:a17:903:1205:b0:1d0:68a:4a12 with SMTP id l5-20020a170903120500b001d0068a4a12mr13431214plh.15.1702544090804;
        Thu, 14 Dec 2023 00:54:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709026b0200b001cfad034756sm11775704plk.138.2023.12.14.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:54:50 -0800 (PST)
Message-ID: <657ac2da.170a0220.65190.4a62@mx.google.com>
Date: Thu, 14 Dec 2023 00:54:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-12-13-v6.7-rc5
Subject: renesas/master baseline: 61 runs,
 2 regressions (renesas-devel-2023-12-13-v6.7-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 61 runs, 2 regressions (renesas-devel-2023-12-13-v=
6.7-rc5)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =

beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-13-v6.7-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-13-v6.7-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1e74160baa46ca7c62ff5587ac23167e5c5e2316 =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/657a92aa666792ce04e13477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657a92aa666792ce04e13=
478
        failing since 2 days (last pass: renesas-devel-2023-12-04-v6.7-rc4,=
 first fail: renesas-devel-2023-12-11-v6.7-rc5) =

 =



platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/657a94af715b8eff38e1348f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657a94af715b8eff38e13=
490
        failing since 2 days (last pass: renesas-devel-2023-12-04-v6.7-rc4,=
 first fail: renesas-devel-2023-12-11-v6.7-rc5) =

 =20

