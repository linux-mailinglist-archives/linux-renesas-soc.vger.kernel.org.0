Return-Path: <linux-renesas-soc+bounces-5568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA48D27CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 00:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4661C2159E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 22:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8676C28DC7;
	Tue, 28 May 2024 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cHwCPmOU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD513DDAC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716934661; cv=none; b=joUNdnKTvI9KFLBJ29T6HeYVWXlnXBBq5tOTO7Cfq2zpoWngW/xaInvhy4LfSojRIix5Dem7CH38i4LONGvLWG2eqPGn5ARaOXamkpkq44ubJS/L/xV6wX9bfiSL1Ml18cCRCD0qOC56tTRPn8fU8FkwJV3sStZXtr27TlPPlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716934661; c=relaxed/simple;
	bh=g5mT3ldu690iGAE2WUI8+WYBqk+VHXl9NOmi38kTzCg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=D6g2lW0INmuSgbTzQDdvfST8n0FJn4RmzR+P8EWjXO8dhQVbBeGfaVhAn34kJcrGIwHxcnveLjP4mNTME/FmXeV5TunC0RQN0pcCEj7BLCASxc6qef+MvJ+fo5xHeVH32F0E7+SRfKKDktZfrBsdFaUtSXrlhrOkrhR+H7MwicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cHwCPmOU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f8edde1013so1155850b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716934659; x=1717539459; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pUgGz582RuBWBlmvvPWEC797cfGMfBYUKJGTY2fo+LI=;
        b=cHwCPmOUdl6XoFlulvOrdLwtbqJZV4lA8QUkxuQqi8qZEiPdqWLFiAAIatoEJjYlOE
         IIMGtMvEnVLfPF8GR07p6FNkqDIKfVBoEBeZNPxpKtsFeQNzu3sj7HYpaXa66tgmfab4
         GCXk1+sI+KEkRNvF2bZXuL7jI8mLofQYxuzx1H9tUDNNgL3Ewj8+HeqpslLa3AxIpOQY
         tZ4aFtXowhREiaHqFLNqVawFfL9rKGuOEcUfUCFV5/VwzVYgMkrRQWj7NH+Y2fy1YJ5Y
         vhc/Z8kW7GUzdbjXMs0hrkt5HpiqmxS+pwOdD1l/jm5S3QK0OZ80XptSj41E3c9PLDNc
         wfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716934659; x=1717539459;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUgGz582RuBWBlmvvPWEC797cfGMfBYUKJGTY2fo+LI=;
        b=fH1v9sX8vGm0iVOxR7rCEXNiSquddHwWvVizojg4EivCH8pUHFDtDF1qGiFEQ+nuhA
         wECy5nFet2S2v8rKvoYlBl+MoPU9TbNz10uITpQif1j+GG0YcnXNfsl8SM30eff7hZ51
         kjl1Xc7sfyBZcwGJ+PmpLwJ5fcyPHkoXMdUoNjVUPHIKYvacU2jm2eF0Ij3BON8Z3a7T
         kZVWak9Ia0r3M2w1RjETYWvH0uB3ZwADmCbdcFxVl3eI/XulGyl4VkswI7XcARuk6EJX
         ThCScJPpM5/SlwcRJyAakhpZzVXbmYKSNmVdEJN+4Thw4cVhIeiOX6iAA9XNJMPZC22D
         Nzug==
X-Gm-Message-State: AOJu0Yy5FHiWPkZPEbKVZbaUc4LArFv2X+wDGRROqM486nwnjKymXCll
	/4uvTRRpD2IHsoiDMtXdcIAQ3OX01uXoaX+uEr7Y3CYR4r2dSGDYecLKn5/XJkJmEbL+R9rCNOZ
	o
X-Google-Smtp-Source: AGHT+IHMAHT2AWDSQtGy6cDZvLGhc6EV3oplfRExilzRKQmlQpMgKLQOyrwpUy+/9aFQUdvYGdIWrg==
X-Received: by 2002:a05:6a20:9483:b0:1a7:2f39:f0cf with SMTP id adf61e73a8af0-1b212d31773mr12897704637.26.1716934658591;
        Tue, 28 May 2024 15:17:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea8casm6843890b3a.138.2024.05.28.15.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:17:38 -0700 (PDT)
Message-ID: <66565802.a70a0220.4fc49.1c2e@mx.google.com>
Date: Tue, 28 May 2024 15:17:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-05-28-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 19 runs,
 1 regressions (renesas-next-2024-05-28-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 19 runs, 1 regressions (renesas-next-2024-05-28-=
v6.10-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-05-28-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-05-28-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      852c50b833be0bd569be538cefe43db8e827db12 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/665629f3e59bb3c0a37e70b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-05-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-05-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665629f3e59bb3c0a=
37e70ba
        failing since 127 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

