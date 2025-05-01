Return-Path: <linux-renesas-soc+bounces-16555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D698CAA5B0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 08:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750E21BC377F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 06:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B412F26A1C1;
	Thu,  1 May 2025 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPDfoJAh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC2230BEB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081224; cv=none; b=j2h2WeLdUk79QyjbGt9ku4qduuioEOMdsLsenNqOuFfuk30WJTKlzMAN40dx0luKPdsb7D8SJ4TpnV8vzxtIf6chHLviZeHEHMo9Nx4ZcaOnWjhFKI6Qhxe+mgMHmnvzx70ZKgxtoNH3xTPmTxWWj33T2tS9tZfJmTXhtthcUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081224; c=relaxed/simple;
	bh=PqcSp1qYTB2zhEvs0NUs7hpIPLVglR6pIXT7/h2sQGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVk3p+WZmDQI36XtV2k4NiQA+ao3Iw/HgY87BetF7EBpUOLuOzRRrSqhPaeMH7SViJKgZIjEyOKeJ4Y0N1c3UNPtW+FGNvZV1cuyQU8O3Y+qlC76u1FqXeBtB3Lwe8bcl/MzUBERa/2v+em7oHCufplEpkMGJ1O+H74ACZvoHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CPDfoJAh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=qQiFSuUNtOze0Q
	/nktt64M7S6bkSvXtSGHWCCBxYzAo=; b=CPDfoJAhv7BjXKKA97JQEzG3gmU5p1
	EFkME7KJxRaWuLREnUc4d7v/hXdvn7P4FBDM6kMUBCQm7+acJsmWcjDX50XB9X78
	iQmHozXJPbbXoiRgrM6WiPYC1ET9XmJuDs79T1ziasnDzQqSCXXx7AavIHuz9Hv3
	5ddBFhjDM1KjWgR1pkDpL1fes3l66XR3jl+lV2O0LQVYoufXYssOC1bh1JmwT3nG
	IK1zGdDct50B7gZpAlGfC89v6hTiGFbYLfMAUFhbpM+2aaldka0+reqLPrPkOGIc
	Vb8p/htszF0N7Z/MYoZlJkORFLppav2ylGVcGLkj3S0gEXs92n8lpwEw==
Received: (qmail 958397 invoked from network); 1 May 2025 08:33:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 08:33:39 +0200
X-UD-Smtp-Session: l3s3148p1@P6LNNg00LuAujnsd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/4] mmc: add '_can' to capability helpers
Date: Thu,  1 May 2025 08:33:25 +0200
Message-ID: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed previously [1], some functions also should have '_can'
included. This series adds that. It was build-tested locally, still
waiting for buildbot results. Based on mmc/next as of today.

Unlike [1], I changed 'mmc_boot_partition_access' to
'mmc_host_can_access_boot' because I find it a lot more descriptive.
Given that new name, I also did not see a need to rename the capability
itself.

Looking forward to comments!

[1] https://lore.kernel.org/r/CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com

Wolfram Sang (4):
  mmc: rename mmc_host_cmd23() to mmc_host_can_cmd23()
  mmc: rename mmc_host_done_complete() to mmc_host_can_done_complete()
  mmc: rename mmc_host_uhs() to mmc_host_can_uhs()
  mmc: rename mmc_boot_partition_access() to mmc_host_can_access_boot()

 drivers/mmc/core/block.c    | 8 ++++----
 drivers/mmc/core/host.h     | 8 ++++----
 drivers/mmc/core/mmc.c      | 4 ++--
 drivers/mmc/core/mmc_test.c | 4 ++--
 drivers/mmc/core/sd.c       | 8 ++++----
 drivers/mmc/core/sdio.c     | 6 +++---
 6 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.47.2


