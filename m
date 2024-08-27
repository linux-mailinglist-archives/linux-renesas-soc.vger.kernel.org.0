Return-Path: <linux-renesas-soc+bounces-8368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F78960AE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0DF41C22465
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A118B19CCE7;
	Tue, 27 Aug 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zOLpZSv0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B61019F49A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762834; cv=none; b=tzwCH4A25149FkKXcK4nA2Vdoqltdie/oORBjk3e9JONEBkN5u6F7fVc91SM4Gtv7Qa4lRBk8xFPXgH4K9SfCsVPLYELgs+Vt31720WBTPMlpOt7rlhwHdDT8jXVUYD0WfraRsVqSzNOBbdZDl1ys190OjQvMHhzBZnTnyHVLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762834; c=relaxed/simple;
	bh=DpuQWR43Mhoh38j+n3GK+VovOfQ9BJdvONA4ul2XIgQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pm3SodZkpp4ymxqPV15afL0vovG/v5l9HpwApf9Bhy0E2dE1jMJOKxL+J8aJ0EtF/a5zRzfSSG4bk9DxKEcEomASn20ggzf0CZNe4H8uprGkUTEvONzE4mnQWvyRKJ4H7KGO5t1u8GWPutqXYX6k42mGf6A1nJpQ429RcWUTfRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zOLpZSv0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d3e46ba5bcso3957403a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724762832; x=1725367632; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2pLFd/Y9N+4o2y5Um+59OxeaVMEVHT76CROh6h2ITks=;
        b=zOLpZSv0ZTGV3ZvdnFFuA5d5kSwANvx8thD0kjXTT6uofGxa+19imyN6UJ6h50QmgJ
         3bqtAWjzF3YqktYSCMvGRjeSl8wUT7KwB3q/19qMfrGhEHUknubOdpqKxV/Kdmm848m4
         WqFF9IxL1TmyTAi4+Fjw0Zp+lw1THffm2+6cOsE/5arzC0L1n6+Lo0vOlW19B3EbPTTQ
         PZ+YSQsuyzocLTB077WRV2WNesobyorHCGarLLpUCfIVhuylOrXACtYEA3AQdHAyFfoP
         hgSFST7liDDZzDYFQeCCKu8np6T8N/kPq+fdAtIYBzHOu6zMWlRxEwBtBzfJVaK2WUoY
         bvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762832; x=1725367632;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pLFd/Y9N+4o2y5Um+59OxeaVMEVHT76CROh6h2ITks=;
        b=nd428s5dFCw5Y9Jk5b/dT0uPVMc6NLADahu0rXnKmQJacZdBnJoeTOo1kHS3w2HYe2
         2kyEYemJ7Ja9ymMzM4savvdM8WjJg4Eh005yfo/3ZewDd+CajhDYco8MEZqv4g5D3pAW
         +FQXD8RRYrUow1H0E3E8s1HeLCVJoo8JbU8SpConc+C/8VSQi601m8xADusf2D0paa+Y
         eXggO205fXDpaJLzuAlZPeFYEl+4kBqMX3rBFyHrBYr53VRlTc4S0dHgRy6yFuK+44aR
         0yxjv6qOy/qI2j/xmOvVI/hPd0DMRpuMt2sozO22n09h+O0eRyZKGSRiGrdXEXd50ArF
         8pvA==
X-Gm-Message-State: AOJu0YwIYN/2RsTb5xpZpvYOj5li0jUWlPGJBhrFsyq+A/Yzoinyva4S
	tsmtd15qnpUOdueeOfC6IyRSug6cZlJ96T8n9jVydCatQwwtnRPRjGZltO17xNzLd/9iXbesQEr
	kip8=
X-Google-Smtp-Source: AGHT+IGHD8UnTfcaJYovIxP1IjoL4pRWN+LoAxaBhdssZemgXCuQfRvmKj8cmImhql+9edwvXUwfVg==
X-Received: by 2002:a17:90b:350c:b0:2cb:4e14:fd5d with SMTP id 98e67ed59e1d1-2d82580b791mr2731348a91.17.1724762831515;
        Tue, 27 Aug 2024 05:47:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613a3f2dfsm12033244a91.27.2024.08.27.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:47:10 -0700 (PDT)
Message-ID: <66cdcace.170a0220.3255c1.cd1c@mx.google.com>
Date: Tue, 27 Aug 2024 05:47:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-08-26-v6.11-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 7 runs,
 1 regressions (renesas-devel-2024-08-26-v6.11-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 7 runs, 1 regressions (renesas-devel-2024-08-2=
6-v6.11-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-08-26-v6.11-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-08-26-v6.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4c0157fcf00f49c74c677252100ceb2c476d1519 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66cd9965d66a4a6e21c86993

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-08-26-v6.11-rc5/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-08-26-v6.11-rc5/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66cd9965d66a4a6e2=
1c86994
        new failure (last pass: renesas-devel-2024-08-20-v6.11-rc4) =

 =20

