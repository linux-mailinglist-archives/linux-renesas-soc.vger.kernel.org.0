Return-Path: <linux-renesas-soc+bounces-5348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69C8C4344
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 16:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC33F1C2042A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 14:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D796F153BC3;
	Mon, 13 May 2024 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sWbneY7V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29408153823
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 May 2024 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715610435; cv=none; b=kochj2eDVPeJfkbn1cJ+72ByS8ZnbCDK/Cf5yJSP9SH59eqIHaJuQ5oo8QoOV5q+pCs9Tiw9tzqcQ7kbVVrBEE8AYBPMJCmwtulpd1io09hr+nOB9QHMlq3ebKNKCIdaC2AyiY+XVobN2Rw6h9tBNRwRyOBXhpYde4oYd9p3xTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715610435; c=relaxed/simple;
	bh=Z6Zhnw2C2JW+3oa3mO/NImPRzF6Q1FojJy+ADq96Xt8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PxT7lE3nNm3ejskk3HsCMYZGQ0ACk9Yy0nLuilv0S9H9wOdM0sgPbfbHr4jcoPdlz/f9x8b0dLvLcl8tdgNmdGhAdWkglNtnfcnqFwpdVFuoDK1ZFpuwFbC41DSCxqc9mVVsHXV/PK1kgUXv9ITIKHxWjX4LqKGy0ILSMw/9huA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sWbneY7V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ed835f3c3cso38888635ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 May 2024 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715610433; x=1716215233; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy9TBOmPQho+WE50knV0d4ZU07pwhuWhKBOlyFF9GFc=;
        b=sWbneY7VOPywnVqm+BOo87rNhaX5Uaw/Tm70pej6RsfxhkoYIKXEXfbYqtolkITABj
         dbSAmuMDwfW5L3rwJ1v8CR6cfq55j0wsXD0lRPIMpEGueAP+tTiZbIYJqOzE/HhTP0mg
         C/TUr54MufDNXac7x8qrDHNqQT+QFC02oR1XTvkAQA85hv42rH/Nqt6cegeo7C2K5YOX
         xQyGqtbngJOy6VpcdIAj0mZVAuu15w+8GfPb7qAd47m79g2U9KeQCCvHavOPyQ3A8rhi
         0cUCCphnCQWorlReP55UG04xNUhZX9aAIuFOl+n2x11n+jRMgXLNTuMxSBBQBGimIOQy
         3bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715610433; x=1716215233;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy9TBOmPQho+WE50knV0d4ZU07pwhuWhKBOlyFF9GFc=;
        b=OA0QAnoO/hCtNIDsFMWLq8/02tikPb02ctb9XC3UoCGpFyhrPTA/MHJsZtQsCaPgK3
         plMxl08rilYDJIF3dF5gfnqoFEEzPIJui2aUK9zJrJ18RSux6n57GeKi/hGuNOGkf1Aq
         DB/735sDYDs6PeQt6PpwXbhKFxoheawdNtW7QaG8REpGs6N27GTHhouA6CN83A4vZQZK
         LTlY5XlrGiEmiXwPSsRUCISjKHTshnqoAqU0yZJN9WBGZdvS9i57gv4ynMmivr3za0UV
         oI90qeI4iYGu7pnj89X3c4lvU1T92OzckejDbgYrX0nKT5PO1E4uYOwXxPVoq9/mBubk
         QpyA==
X-Gm-Message-State: AOJu0YzZz2qaalFgyZMYybB1avprHWD7OoUTsDZtanc4YK3WAPEKA/47
	L0YaZQJBvHi9Th70lmt7qkhd44AdoYohel01fOHQ8RpPrmlsxvPCIXjV6rzrE3NKhx2ZVARhYeg
	HhLLl8A==
X-Google-Smtp-Source: AGHT+IE/aCkScooe4O+irwnBZ34vTnLNH8gyTjcy2bOmr2aGnMPxKCvbNe1EffwLn2oqdmF9T85Z0Q==
X-Received: by 2002:a17:902:ccd0:b0:1ef:442c:a023 with SMTP id d9443c01a7336-1ef442ca12bmr141656825ad.38.1715610433151;
        Mon, 13 May 2024 07:27:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad7a49sm80085795ad.78.2024.05.13.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 07:27:12 -0700 (PDT)
Message-ID: <66422340.170a0220.4d83f.433f@mx.google.com>
Date: Mon, 13 May 2024 07:27:12 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-05-13-v6.9
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 24 runs,
 1 regressions (renesas-devel-2024-05-13-v6.9)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 24 runs, 1 regressions (renesas-devel-2024-05-=
13-v6.9)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-05-13-v6.9/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-05-13-v6.9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e6bc5a03785928d2da81ba779676e044da5217d7 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/6641f462a0fabf28774c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-05-13-v6.9/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-05-13-v6.9/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6641f462a0fabf287=
74c42e3
        failing since 112 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

