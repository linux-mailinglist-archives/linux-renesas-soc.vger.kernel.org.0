Return-Path: <linux-renesas-soc+bounces-5782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135E8D840A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 15:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74722B20BDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B380915C3;
	Mon,  3 Jun 2024 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zckpldLy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E912CDBF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421691; cv=none; b=V582X3FpeZzTLyz3/fMP2G7QJwBZ0fnU9CxD1sjLL28/WPIXw7iGfyOZqqhGla4m3lE7Z6DJL8ddQstCVibsIitzI8M6A04rg3CYRwdbCfepZy2HSNB+eaM5NlOwaadvACuwc2VLmAO0mDtgcz1VUDrH62TCv94jyrWOGFTHNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421691; c=relaxed/simple;
	bh=Uj/HLRTXaZdy7Pcxwq0mHdvmXFQQR7xVYSDyrM0mDKk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=lVa5qrZPm7Zbxs86VnXvQ/qg/liVkBq2ChbyjnejTesx8JilbJXYOQz7VrVHJBJFoNOHMH3yATVFihZ+a9UkP3xXYO6oxIDmosTEnvRugM8dqA6BjUIPCSM9X6MciksQA5W2VKfr4Kv+22+/UKK4i5KLsI5iynvm7MyJQjtwE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zckpldLy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7025c5e6b94so1174044b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717421689; x=1718026489; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vPXeHipZalnfRCRvK8THIJh3uTPzwhYUsjAnj20szI=;
        b=zckpldLydVinzf3Lqmcqiq7b6Gjpi44WZezgmUINvlr8CoeONghrsjM59atOn0sTCB
         5XOZIfWS8fOku/BmtHGkoxlMNwlPzsM11uXW+wSKWnNY+QwGTJ+H8bSN8h3umi6lmt3q
         330cbrTEcXcnBtE8m3Wc/iTrTdMQnW7j2myNWLR2NoBafOf++N6jK4JOSvtHj0j441UP
         isqb5X66p222Tk/CwDFuSz6RDfelKzQ53gtRe9GFxHO6BxOCZe0NayBrMrPUvk5ydCKs
         dMK7AbTibeZZ/GP+XqCf9oel0qS+h2ko7yLzwZDPqbpSzlQQmBqB5klNDmQEha9D3Hdd
         aVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421689; x=1718026489;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vPXeHipZalnfRCRvK8THIJh3uTPzwhYUsjAnj20szI=;
        b=lA47VnXG2h04aX2p1tXz9M40+jJqz8ARRlcHqtwkyMI2+qg2KuVINB76AFqJ126nmc
         swp3HcFWfIqHQhuk5ztnjwhcrR7zwmqnDTl41Q2ZouxpZAco1Wfycs5H2shCJesEfveC
         5EmiQqFWV0htMompvr8PtMWFtindZqcD7KzGtFNvJeut3vNIGlTu+BFfk5Fe0AgDV7hY
         lkrcfdMgo7BZvtS8/ktwzmBTTwgswzx3bb/c87TUWED8BW53BCkCnnhC8k/0NVOkympu
         Sy7zBAgsz8JzKKw2FNnoaA8PvU3hB6eEnjn4hsdE42v+UAWYTmAOzc3qHKKvvWelKrvm
         NkYQ==
X-Gm-Message-State: AOJu0YyhZ4Pry3ibNyGtWLH6Lx8EDU21pViuSa4g3O/ViqN3jeh/VNk5
	t/akO5h6VASbqsXigPsrqvJfTyQsDSOP3ercZNp0kJ05vE+EV/zmpCNkdZWwbHF2a7Etqiumxak
	v
X-Google-Smtp-Source: AGHT+IEw9DVyKqI31kd3i0u+P+uVRahP0ARzHQ+pzi7PcXMi+sdxo+tmCnjNuvRwEvYnGYMn5WyImg==
X-Received: by 2002:a05:6a21:3284:b0:1b2:7bc0:a850 with SMTP id adf61e73a8af0-1b27bc0aa3dmr5791393637.49.1717421689122;
        Mon, 03 Jun 2024 06:34:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35937a4dbsm5348963a12.59.2024.06.03.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:34:48 -0700 (PDT)
Message-ID: <665dc678.630a0220.40c69.d08f@mx.google.com>
Date: Mon, 03 Jun 2024 06:34:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-03-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 22 runs,
 3 regressions (renesas-next-2024-06-03-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 22 runs, 3 regressions (renesas-next-2024-06-03-=
v6.10-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-03-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-03-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f86b864474e417c53c64c4b33ca4e1192aea03a3 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/665d95ba5042692cb57e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665d95ba5042692cb=
57e7070
        failing since 5 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/665d986ba23f86d5687e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665d986ba23f86d56=
87e706e
        failing since 5 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/665d971334e1f4bc347e70e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/665d971334e1f4bc3=
47e70e5
        failing since 133 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

