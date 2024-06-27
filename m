Return-Path: <linux-renesas-soc+bounces-6849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C991B22E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 00:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47329B2178E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 22:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF851A0B02;
	Thu, 27 Jun 2024 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GnETzs9T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88E61EB40
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527128; cv=none; b=SGUe6OMMBRT4CgR1hmbK4NBJve+jMHD61+SJXhYTISGLSN4mcwlVmKzRj6FQB2YQpDoGuuNMbRF4ux/L6P8/zuyG8RgRE9QPSTAIuRNUEIhjHEdiEbXZAh6abPzq3aZYtBfF8Q7ur/l1I3U2racLMMGLWvsKjGaoSAGNFRgOFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527128; c=relaxed/simple;
	bh=yilWR1IL9Vak8c4NhwBEU8NwE2QEaIJeqk4BZ765Dnc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=BnfN9oUzEeRpz1RiBUGoM41ocTJY0np+XnnB/I81rQnuiYXpqjE18yq30U8NnxLNJXccau1j2Ypbcp0z4gZoVcSiN5+Smtevp6nX993PzJ8Yr7X8WKrMDT7DYdF8N7YRB9ikIdfMQ2DV4eDhvg0bd0ik5Uqajc/ZyFLqcZ4xmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GnETzs9T; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70670188420so14306b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719527126; x=1720131926; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zenqMPugFaLewDh6wkt1UlIdo82JWBhG7q4FNGSuEg0=;
        b=GnETzs9Ty0Q7H868bqFIt6+3iiiyY0Y2NsEcu5qLLBSjGVJIGF0QWrLdqg9JpVhDwv
         bW4GWgyQLwGdQPLgxfVmHnFcPGCu8q+w5i+WVMSMTR6x1f9IpBhJTlKmKRQTplar5Pv7
         Y5IVfXNeqzIowRqwdS3ejyV6Qude6OFtaEo+cdRQ21qDjhLOFfD4tE30nnOk873tcTTO
         avj19LQWRVIvGiBZqI57ncg6sfyRcWQzlLW920UmNfgMQyDt87saUPk1RSeEieSCFm/i
         qS4d5+3m1+lCKglW7ipUuAaEKuNgDKsvcXQ9RE4/fkfTJZYFBOdjwJk3Ssbn7/rb8cg+
         3F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719527126; x=1720131926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zenqMPugFaLewDh6wkt1UlIdo82JWBhG7q4FNGSuEg0=;
        b=jfbyHTIutv0VtGwUS8jm7wqTZNQD/mtE1KoVn+mWSK/Hyx3KJtNA+l92xZZRGFuHDa
         9B8SGj0IAdXlHiJ+sWLB5t4fqHpmGUO/Zd88czrmwiH/izpqQtZi5CuGQQ5hKayiXiHi
         ci9qpI5Xwx5fNIORFzxXvLwtLU+KtgBWIjjAl/JnI2v79pHeZk1gHt7gi4J5ihbGEaDh
         t9es35yQ75oU+PHqp58bzb+OseweUMo1wN6QTJ/EYLPfBeNWTixe0kVsxuOEjhQsfGOj
         bHu6WXrSHukuacw4XBz2dS07slDVPk74Wat2hKI90obIzPJFrO9ywCJgNoTRfoOgM8N4
         dDbA==
X-Gm-Message-State: AOJu0Yz65orotU/cDkXzg6KNoWs45/gvquV9IebcZUDWdup1J6QfNG3t
	F5Nyai+cXIFO/esoRj0e87x+wRjYLVl6khDsIOQka21DZ2+VqslXdm6IFPQxT30ANbf0ZzD4pmf
	g
X-Google-Smtp-Source: AGHT+IERMpqJ9OzZo+ueAosqvRWQxV0NK4kutANg3ueH1nTLTOwbHTbSxzgEUzk21wjz60DlD7XVqQ==
X-Received: by 2002:a05:6a00:22cc:b0:705:ddbf:5c05 with SMTP id d2e1a72fcca58-7066e52a7cbmr18629009b3a.11.1719527125695;
        Thu, 27 Jun 2024 15:25:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080498946bsm220710b3a.200.2024.06.27.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:25:25 -0700 (PDT)
Message-ID: <667de6d5.050a0220.28813.12fe@mx.google.com>
Date: Thu, 27 Jun 2024 15:25:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-27-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 20 runs,
 3 regressions (renesas-next-2024-06-27-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 20 runs, 3 regressions (renesas-next-2024-06-27-=
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
s-next-2024-06-27-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-27-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91aa9e4e18c70bc2160b63e403932a83226dfc67 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667db6f862adc88e8a7e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667db6f862adc88e8=
a7e7089
        failing since 29 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667dc03377d2f4d10d7e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-imx8mp-ver=
din-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667dc03377d2f4d10=
d7e708d
        failing since 29 days (last pass: renesas-next-2024-04-22-v6.9-rc1,=
 first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/667db772d5c9e596e87e71b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-27-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667db772d5c9e596e=
87e71b9
        failing since 157 days (last pass: renesas-next-2023-11-28-v6.7-rc1=
, first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

