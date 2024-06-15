Return-Path: <linux-renesas-soc+bounces-6288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA39098F1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 17:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B90A282CFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 15:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A7749640;
	Sat, 15 Jun 2024 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ffdN6XxA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5F4963D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718466061; cv=none; b=oN/LJ4b3FG6/QijjmT28keEW4Yq0Gco3KwgXhwkn0owd73XJkJ3OTcqEtrMj+iaRQymTQ802DPB5MSQckkUfYip7FrYp7lyWauFGueRGEkIGDR2SvA1ytV7rHUeEMNTuHMPrZWPNwMAIsEDzAkMT55KYxI8IckBjb/rqS/0gD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718466061; c=relaxed/simple;
	bh=e1MxZIXxSGLX5ytZQnLe8KwRDFEl7rx8tMTC6slkUTM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FPYNp1Q0SRpGMhcCz2B2q1dEVES9WnY2hQtMjMpzEAGqq0Bfxmt7fIsaz/LWULzej83GSl8GJcBC3kymSLaN4ziVldxp2FP73JNcMYE9c2fgQ+Iy7vQy6zIqCD1ABlIHvppvfDTdun5xV4ItzUtEOtyM3lrnJbPULPjd9URTBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ffdN6XxA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f4c7b022f8so28269515ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718466059; x=1719070859; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=88J8/WZdzAfrLSc2pqCqEWRP1Ghz6FERMpm7BsXwrzw=;
        b=ffdN6XxA57wEJJJRsbvsHNVtoC5cXuBYvJyoaRuZuf11dvSov386+DesDpV/f0qcTj
         gZhlqOKVVPXz/+1mJ4+mYDmIA5K90USq4p7Q69SCK2keZml97S//A0+5YzIC9Tea1nfB
         rbK1yF3Ia/jVCyVSMpuslDg3/1EXh7yPJxYkn8OOdg/HV7/agYGEtBv8l3viivlrzJMj
         5Kzo71DSfgSJdM+WO0JXynQqXbz5r+NbPX3TuaaiqpImLRcNUlQ1dFjLs8+psg8GEwJQ
         r68o8Fm5Un8DBN2IcZWMcwouIqrX3AQNYdXGD2qBdZ7aHI32lSGJXrKHgKiV/9mKcb4w
         5y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718466059; x=1719070859;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88J8/WZdzAfrLSc2pqCqEWRP1Ghz6FERMpm7BsXwrzw=;
        b=t+eAsd0BEkjrKDOrl2HjHKGfyhGxFwh3QpqB4caEN5DkpaXJDyfktq6aMhqVcm6cJa
         a/ans462fn9LYWgMMr61b8vBa0Rs/0ZmNYC/r2ToMyVrmPNKQDIIj3UzrKV5j/QtdW31
         ll14foD4b33uRoG9iXZ37MSINPq62kjqoZ6y1RxTAL89ROAN16kVjKk2VEq2lPaDH1/6
         DvujyNawRHijZ1mfynoND5qyoVcmNId2wWv3RGdQxugO/cQTH9qs0X5Q/TNZMd6hQ1I0
         q/PmefI6aqdE4kj0kVwdezxKZx0eBfIIyU9Bu50I65OyJEkH1Z3rYmcQ6uwIKKyJoce5
         KipQ==
X-Gm-Message-State: AOJu0Yyqq29/OS55G6LoKGGQAWtEHZug3lW+wfUr8anNc2CYSfD38Y1O
	NjpaORaMr2J0uuiKmdumMl9d7EU1vQsKs6sXuXiagPdSajC+caij5DV4vT6DpBbSTZrUcmN5IuD
	G
X-Google-Smtp-Source: AGHT+IF9MmwcSpGjNwr6BHVnTz1X4JYKYQdupcDQEjYrSHZ85BVSrvZVt7PTshUkoFR98wW2HMM03g==
X-Received: by 2002:a17:902:ce8f:b0:1f6:3596:7c61 with SMTP id d9443c01a7336-1f8625d4ad9mr63998675ad.2.1718466058880;
        Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f17968sm51149015ad.229.2024.06.15.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Message-ID: <666db60a.170a0220.aed4a.ea87@mx.google.com>
Date: Sat, 15 Jun 2024 08:40:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-10-v6.10-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 25 runs,
 1 regressions (renesas-devel-2024-06-10-v6.10-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 25 runs, 1 regressions (renesas-devel-2024-06-=
10-v6.10-rc3)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-10-v6.10-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-10-v6.10-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2487f042931b26238ef51e0f0c02cb59a2d57047 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/6666c0ae0f84667f9c7e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-10-v6.10-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6666c0ae0f84667f9=
c7e7079
        failing since 139 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

