Return-Path: <linux-renesas-soc+bounces-3470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD6871F85
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 13:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB1728517D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 12:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E23E81AB4;
	Tue,  5 Mar 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KaoPsZfx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219758AB6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709643168; cv=none; b=UghMlEpbJ1jvVmNhdAmCzM3nfMOce2e5YDsdkmZf7mdaZOxf75tJhF7WhFyGVI+biAOwKd+sIikmcgKHFUXlEQ6GR+mkJsgNd34fWqeS5jnlCa4SQVvU/BEwquwksW0E8VcS2u6f7LwDUxpnlXSPLhkioGRHfecsYRJnuYTtfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709643168; c=relaxed/simple;
	bh=NYK1lFs9R1JaBe3hWfssGjH14JG/KUlg+sMrK2movOI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=bMgA7EIdhFy9S/yo9UGnLAGmPI1+8ApFbZXeBd90tP6X9dw/xs3f3N6Gd7yx0T9M3IqoZp272u/1cL19giWt3AH5iMUvfXvAfHzk2Aa/2PPo2mMsKGqnzzkzG8iZKjBtAYyox/E0dJhGj04Pqr4BDvWf9TtomqE87DonJX8jg3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KaoPsZfx; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso4008645a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709643165; x=1710247965; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jpeQG316aBmDqm9s8pNBkjjHtHPMVNgrY3tvhBPMd2M=;
        b=KaoPsZfxDfDqcZ8jizJLgZRh/V93vhBmFLy9rqV4v2QhKCGyaWL2uZ5wONzuT7d8zk
         S8UlEl8x5+ehutt9oqKd1oEyg6c2k21py8lFyPWOD5CSM3zoMrnUXdi+tH3JfpypXre+
         RUPxV4xRL8n+egFIJCLvPAlpZ+RwE1j4IM84go6Q0shlP0ley2P20ZQf5M7F/P9jryKo
         8VDDXdtAM71WexvXlArxPoyI6U5yNMFvwqIfu/tcDqklaKFhv+7QR2iU9qXQdyjR7O0F
         x/Is4T5YnfqU6cvhzdXZrVn4kFuiE0OTB6WsjhhWAhkE1jxA2k009Jm9MJ6sovuuO8lE
         IrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709643165; x=1710247965;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpeQG316aBmDqm9s8pNBkjjHtHPMVNgrY3tvhBPMd2M=;
        b=PulkjejLPhGn10uL3FaUej4VK94MYqPkOrsZOVM1HRcYCzTHbdFEEwWFzmZljszin6
         7Udw0MrHvz+NkqYAt3y4YfI9DeBD/MAbrUlRP0zefHIA5YLjv73qY56hdfsZLpc/RQy1
         9N7jB/6QbEsF/D45mGwA+uDaRzFN2G7Rgetzz5UYMOlZBcteV7eEU7d/5Ce0GuhajLAB
         jyn+fYlY8ny8L1bRDQlZbZFqtBmpvpOspg7jLAiHVh1fTXJbhWJi5MKPZljS+ApPUpDt
         4VwzBGv4VdvJCGzDVIvWUL5bOp1sgDvvOpHk6nrTfW7NgKG+dV/OhiYQpKxNFtUlyGF/
         Zoug==
X-Gm-Message-State: AOJu0YwNr5AZDBeRgwUhtN7+a0lsYc0QV991tVc9rq1yWPAv8vsScsaN
	4sh6JT6q1SIGA37aG2X6DG9+u53RxZi8aKSoGKhy2BeCpuu61t6svmQ3aLOhqcumWZklJR9FkLG
	JNNU=
X-Google-Smtp-Source: AGHT+IEwQLV62UTsnxJSs2o7DR7j5OLxJDQXohSf3+Ad4GXQknkmA1TETrZjFWLV5SnlTRropenafg==
X-Received: by 2002:a05:6a21:3403:b0:1a0:e089:e25e with SMTP id yn3-20020a056a21340300b001a0e089e25emr1706351pzb.46.1709643165274;
        Tue, 05 Mar 2024 04:52:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b001dbb0348733sm10655339plk.67.2024.03.05.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:52:44 -0800 (PST)
Message-ID: <65e7159c.170a0220.526e2.8024@mx.google.com>
Date: Tue, 05 Mar 2024 04:52:44 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-03-04-v6.8-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 16 runs,
 1 regressions (renesas-devel-2024-03-04-v6.8-rc7)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 16 runs, 1 regressions (renesas-devel-2024-03-=
04-v6.8-rc7)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-04-v6.8-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-04-v6.8-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a101ea53f7984907ab2f8b22b5a294f8d5992a3 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65e6e2b7a06a2c6b044c4324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-04-v6.8-rc7/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65e6e2b7a06a2c6b0=
44c4325
        failing since 42 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

