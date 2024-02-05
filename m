Return-Path: <linux-renesas-soc+bounces-2321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2215684984D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 12:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11FBEB2454D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 11:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C881C1862E;
	Mon,  5 Feb 2024 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3Sl6yZkE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2018635
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707130996; cv=none; b=QJs+ITxzrx8neln898JvqZiO2lyMyISDP2HWciSSFPv/i2i5AnMXUrYYspn5NBLHDYbN4rhJsUTCzRPMpUX22F1OQZu6usW/sLdskLUMNHZstFZUE7KN2K5VCVBwVzjojyhJkd1dJa+VjvlbpFarqYHgyWdZq+sYU9rQxLWj5DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707130996; c=relaxed/simple;
	bh=TSsQ8YgYPdfSgaQ1KG667Brp2mtDq2+JkEl13zvrIzI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NELXEUEUTqe2xnxNUl9FR7bSmMHg1ZCm9stVhTGZNkPzpDz4CZeIRXgNrPEjCdbQ3dBsucSpiudBvW2wOnPG7byY8iPL83iL9NERmeTt6VnTViObjuutGzoHn1st8OTpLgT8bAqz3v7guXT9dIuamEXvCHJN2znbON0fwBsZHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3Sl6yZkE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e04d24bd39so289048b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707130993; x=1707735793; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CdKmbfxC1eo1Q4btwvkYwIVpdQznlgL6xWwaDVIh8Ns=;
        b=3Sl6yZkEORUljkHZhDLbmN7g7BCL5WR5QrwWydUOy3tGV+KS4I7kUtzrgH699UHGty
         lJeSNXz62GjmR/4iei8oHMeKPQC509AN19LBKmGMjdIYt1sy58JbOjXSBDDQ4XWYZNOg
         Xq1gbMF2JMzmdb7SmZ7ZNp2UWccwvwT9wzGcfXQB1040oxEr5y5ffKiBG4vVbBgCxHEw
         B0yOv7MZjlTJZyLWs2MO6yLUo70W//gdrSXd0EfDc7qSo4iudk3fTIWc+rsNr/xOZmOa
         Gxa8xB5Ix4pRkHgsy4kgy7xbLq3czjzVL5UQ//dSrUjVpwc1fziPzfb2nQjJqk6xUg3s
         9bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130993; x=1707735793;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdKmbfxC1eo1Q4btwvkYwIVpdQznlgL6xWwaDVIh8Ns=;
        b=NmWg3+32lpidlUi4m8aiFBlCduSt+Iu42+dN6O6CgZcYUt2CY8Qhb/gzTPJn5a3GKT
         Gn4pBp7lDGeFZvgMqT7j9oxo1F9jnnyxDWwwhHc9xeVEduWx89m9JgCW/sok7aAIM4iS
         yZE90fnjLeV6Z41JKzSfKVG4RvzuGKtuNJX8orRW9xJtErZraqBAKk6OoCpOSE9pgD+K
         UhyGrdwyAtMZ3Z9KUzgDovoiJiSeElyzpL/udx7r8GkhEBZvAzZp/MTss91K6Emxc2vS
         vAmVdaozOmXeY9EvRScNSn45bzC6pWJ+HYU2/jTA77J5c7p18o324nv9y68DqZnYcgXR
         JVSA==
X-Gm-Message-State: AOJu0YxKEV9yNqzee4xdKD6gP7qDa4uOGgKK0ZPUXoz5CGq/LWRS1QU4
	e/EFD1MVPZVDM9MatkrxAB5ZQF/JpV3DXTjuRQohmlRhTASdYM3OrJgrQm3DMI7Ch+9qkWSWrKo
	k
X-Google-Smtp-Source: AGHT+IFmu38bUi8tnWi1S/K/pjfd9ojsmgsj6y64HZESdttM8ykSEb61WVLC0DNdfw6Eh/luNL2ySg==
X-Received: by 2002:a05:6a00:d54:b0:6e0:5170:4d62 with SMTP id n20-20020a056a000d5400b006e051704d62mr177508pfv.6.1707130993593;
        Mon, 05 Feb 2024 03:03:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXXyycX2ny6AMgihw5oM57u7RQ7WXprx4JiPgnGXTfgOPeAXQGNC8zvuzcbvVi7sQvdJv01aec0Dq8CsJVNjhstPGajYDRoej8tGQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id le10-20020a056a004fca00b006e02f222c2esm3745474pfb.30.2024.02.05.03.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 03:03:13 -0800 (PST)
Message-ID: <65c0c071.050a0220.75894.8bee@mx.google.com>
Date: Mon, 05 Feb 2024 03:03:13 -0800 (PST)
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
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2024-02-05-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2024-=
02-05-v6.8-rc3)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-05-v6.8-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-05-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5ee5c13dd1cd222d2add58f1546f05b849c402ff

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  621c2d3115d40a1ba0b53668413ea21edf03a5ff =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c0b501c51d009a6200a08e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk33=
99-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-05-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk33=
99-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230623.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/65c0b501c51d0=
09a6200a08f
        new failure (last pass: renesas-devel-2024-01-31-v6.8-rc2) =

 =20

