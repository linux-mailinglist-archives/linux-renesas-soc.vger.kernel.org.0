Return-Path: <linux-renesas-soc+bounces-2409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA9484C180
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 01:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910E51C22E4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 00:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A0C9441;
	Wed,  7 Feb 2024 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OZV98hCA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F58F62
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266957; cv=none; b=Kb3rpSXhBUTJZkexQWpF8rkUkfGA4q3/FEN2oHUgFYrRM4W+l+kY0HPwjTXbka1ulnjix4zF1/MevKQHRWEli5KA2Kl2ZNDfEs8ovJzGp4FE6cJziDShDPu9UqqRXAOQ1k4fTwx/Ormd/0U6kCRNrl/oO7bq1IujArbsPlnl8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266957; c=relaxed/simple;
	bh=VW1KHTnNBe+uMBFixsImFC3qUrOLWvcKBXSRkTOpzj4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=bMcobmAzY3ig5q89oB1gov8U4QaSEgdzdTomkmdsaLEJQ5YK+nek+OsKKjyOgXvsEOBxbkJatZ20LF6CzAkddgyQ0omAA7XoKGsw6zfHwv8T/ElSFu0ndkZ1IQNEBdoyKi9xezJC8/oKDTIm9je7IEHUW+Ss8KzNtlnZco8AHwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OZV98hCA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d918008b99so1015025ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 16:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707266955; x=1707871755; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ht+L6qBj9XG+KSDIBFL06tWruJmGroPA8WQ/Xv3CQM=;
        b=OZV98hCAt/cQnCs3jBcZEAfL6WWxWa5GHO48ei6Dg4jl7wFHr14u9agi3ejvPgoXG5
         qeS8iTDdCjaep+djJ6wW6GZYL2glATIOX8zh74sMoaEoV8sk0gOtu2RceXIGxcN4vkS/
         WzCGcjwXq2xTudzLf7I3dMpBF4qekg4KYdHUIuuoYVIucEAdndimKQYLesKw2k4uLgJV
         1CqpswPET8BDdpYblGgjX9dbXr5gfpX8n/0RLZykPUmvtkxr0oYRlT/HgxM3ZFYF/VEC
         0fzGEy5VLz8SG0jRmCv1AAX5hpRklW4m4bsTWqZj97xvc1EJRWeHSFvHrjT5JTRwpcWJ
         IVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707266955; x=1707871755;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ht+L6qBj9XG+KSDIBFL06tWruJmGroPA8WQ/Xv3CQM=;
        b=a9dJNDB88VoPLAeBl/u7MIi9BchXZfaA2OXuznGKTAvNRGiFNcLS/5YoaZ4u0h39nN
         /5p7xZTHix9//D6yNc5gqlHHeF3Ka0rj/JTF28R9/QM5Mr3igLs9d3ytZ6qhyVLjMi+I
         XO5JaUJFW5N/ioh0TZXajHaJXiNpsS8QCbdMXy/Ytb2CM2KKVHQiispt60eQWnnCYDMt
         s3qih/+y9FeftGKYIEvMyJ8vVlDibsV9VLwqZ/FQCmHJeUYoWbK63P7lhWOU6cgaUSnz
         TkWTBkBLs01wq678SCIdNFyaGerJmvu1yFke8EiUIQPf8Po6OYeuDnRQ/LdMknz7l85O
         lrAg==
X-Gm-Message-State: AOJu0YzuQfgTYuQ8HPOxH0HY0CLHr7wEEPs3mFco8MkGC2w90BkvJIpf
	A4G6SrLvAPf2dfBnxIeVkUWiaE88dsvtWpoVeAEccBegSmfCmXBngT/CSQ5Y3plvyevtfyEY8OH
	E
X-Google-Smtp-Source: AGHT+IFF5dAc5ievKti4L9nOHtw2vjIXrwPB9InoZxFKxjkW2XHRV7/RFdm8lAP5eoDD87pTmST7Kw==
X-Received: by 2002:a17:903:1251:b0:1d9:6091:6f3b with SMTP id u17-20020a170903125100b001d960916f3bmr3379164plh.47.1707266955156;
        Tue, 06 Feb 2024 16:49:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhFHh2a8ZVElUZDD+5lNXfhlyf4K4SyjYyRiY7bwACm8iOSNJ3N8PbVEKyz6yPVb/i7qpl/YSXF518dMtD6XX/jksmEiX1m+YPEA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001d9a42f6183sm143196plk.45.2024.02.06.16.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 16:49:14 -0800 (PST)
Message-ID: <65c2d38a.170a0220.65214.095c@mx.google.com>
Date: Tue, 06 Feb 2024 16:49:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2024-02-06-v6.8-rc1
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2024-02-06-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2024-02-=
06-v6.8-rc1)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-06-v6.8-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-06-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91487349a9c3f75c983229f900978df1d14e7ff2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  75254bf2390c10644ffb35a90fc8f18f196f9f0c
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0830aa737c4447599d9cd5cf3d2c759e8fc73569 =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c2c8ca714cb5531c8e1f42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240129.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/65c2c8ca714cb=
5531c8e1f43
        new failure (last pass: renesas-next-2024-01-31-v6.8-rc1) =

 =20

