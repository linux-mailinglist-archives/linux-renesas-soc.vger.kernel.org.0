Return-Path: <linux-renesas-soc+bounces-6338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053190ADE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 14:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9184E282749
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1AF19597A;
	Mon, 17 Jun 2024 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CjWevRMO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDC19597C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718627076; cv=none; b=QViao32VXiVyeUbbE1y1D91DTWsDTPPZc+z0Mfefe1pHy4n0ffyQS5fpdNF12qm64yXfEdhHiDXskjEQyl4xAi+C3wjKff7sdQX/pb2bKxDgl/J2W3pcBMWEpq5cFHsySr5Y4UHRMSp42/M+ER3c5d+ql28aK2fTdBjWAG3TVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718627076; c=relaxed/simple;
	bh=iWq3LfeBFEDQGLVZGTJtQc92G+V4cX0T7Q01o7USwUs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RCwtoaO9i3medRXZJwV32gD7KkE+CZz90Y48BWiteM5TJq52CHbqphRfYjZXpGyN0Pw+Cffe1pRaC1DChe8FFpaJJZN3XbbWUJhzxoDkiEbEDpg1S7PAuA/uXAVPZUhb8FC9JklFZPO5RlAhhwHbxIgBPIEKRlNdIPbFn87m4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CjWevRMO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f700e4cb92so36973995ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718627073; x=1719231873; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dgyywN7jlo+pY1HD/zntoRbfeCgZZz2Qpg0FhIxmHvo=;
        b=CjWevRMO8rvCz3qOsHuaw5kZYh03bV2yQz5syRAbjfOK8r1BsG8H4Z5jUHkWj0knA4
         MiOxFqIZFknIsNtvdnhobjvYjWMzYvuE9evJ5s1LeoO4cNw06/EbKj6D6ymnxx3UnD2K
         hk5RISaAu1mlzlyZFWqpdCDeE6GxRisk+pdOwPDwfe2liJX+GRnZ7Dfw8HYZ0QY42Cpc
         +zokPcNrLWD2o/63c5u29HNJkIgIzgUgmlCo6OPIb+GG/BD5KqMzeT9Jwh70Jn+mSAiq
         ZqGOVYewC+TIAkHiI++1w6izqpOYqUQGu1sqgDTAmtdDtn4OzUfa4S/5sFgBp6aB6KKK
         W/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627073; x=1719231873;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgyywN7jlo+pY1HD/zntoRbfeCgZZz2Qpg0FhIxmHvo=;
        b=xLMx/pjFVPdIb/YC770wNJoJZbfxC+IrAduIIhzEm2IPY9IDdaq/iDHI/4HoGxdpUL
         L24+FlDW/ByMaS08UaBa9VxJaN5lJDtWlCXBcVLHtobgZRmBmNeXEpZd9NVa3PpOOd54
         WN8gxyMxN6P3lW5Bs3he8C4Y6QYmJdgHxDzltfCZ+tuM3X2+j6Ck3BoLoJZ5DP56SJQ6
         uhuezHsa8lJbsFIDr97Z7D6fXpEpwzb2bLbNWe03KpXn5kUCuR4lBcQ/mhjEubIzo9yx
         D393oOJzDWG2mA74UcJaTAknpWOciq5cgaGzJjfm6BQcKgX9Kljc2EnX+K/NlIQ4nrDg
         agwA==
X-Gm-Message-State: AOJu0YwLKh98pC25ZeznVymt1AkJ6hGl1Q8RPzZsO6sjB8gzhbTod2OH
	Xi2yd8pxlvr/P61Y7dzXyxeW7But+2Jhj+m0nWbzX24N/3D3cp3gxnmUkI4G/9vOzQp/Mr68Cs8
	tqKM=
X-Google-Smtp-Source: AGHT+IG6AfnqIIF/v4UQRUvBmlhd9EJk1t3UwuavjMO5VjObeMVejpHOTpk6p10oU7N8KmPIQ1yxiw==
X-Received: by 2002:a17:902:bd45:b0:1f6:f96c:2f20 with SMTP id d9443c01a7336-1f8627c7cfamr98192015ad.36.1718627073198;
        Mon, 17 Jun 2024 05:24:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855eeeab6sm78421405ad.161.2024.06.17.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:24:32 -0700 (PDT)
Message-ID: <66702b00.170a0220.1bc41.49c0@mx.google.com>
Date: Mon, 17 Jun 2024 05:24:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-17-v6.10-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 23 runs,
 2 regressions (renesas-devel-2024-06-17-v6.10-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 23 runs, 2 regressions (renesas-devel-2024-06-=
17-v6.10-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =

meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-17-v6.10-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-17-v6.10-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d94f2b83d8f763608dc1f5c5cdd5e4d262663292 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/666ffb45e69eaf01177e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/666ffb45e69eaf011=
77e708d
        failing since 146 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/666ffc513adeef36b87e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g=
12b-a311d-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-17-v6.10-rc4/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g=
12b-a311d-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/666ffc513adeef36b=
87e706e
        new failure (last pass: renesas-devel-2024-06-10-v6.10-rc3) =

 =20

