Return-Path: <linux-renesas-soc+bounces-18728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B32AE83DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E307F1887DAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 13:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9CF261574;
	Wed, 25 Jun 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FGTXhiw2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85328633A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856984; cv=none; b=qIf0xqwHREtIRNA+HkOZbsHBsc7qBi6PQBxkvtwIufy6UymXtppSFsWsvu49D7q0HI0U12RHPsjzPxulBFoHVwrSTh3Zd1Zc6MmKbkf42dQpnX8/EE9HEqmGpR4X5dLNYfCxY3KPl6HTNS1la4ok2EhMJS+AiRs/9LExzfvinhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856984; c=relaxed/simple;
	bh=ogogJaNFJ5Ko83pXERqm24qqsYFAPRbM7OscAGCOE9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhcCmjHIs4iomtNNjmynHkAxiNN0Exf7cQdOSYkLCFBq21rPqejrlGbdCRqI+Gsqq98gIaxl5G6iAy1fX1l0Nv1ouXPsyzYqW60xjxbxvP+S9fd32SNzJCRBhwlBgUHLu77emUa3HwugmpoMnyRX7/WtYWABBB1W7LRcUBQU+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FGTXhiw2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=k8oYde8jBg12yq
	AerZtMMzm6u6iRIFfAW8REbLGj/ME=; b=FGTXhiw2xytR0cHSDr+BHcVFJ9nheQ
	FvT55GqsqAVOjqh4MOWlYyxkrA7CihMZK3ZbX2s1DiWjKzSZHrgqx9ULapg/gHqL
	+7c4bM1S79jP7NiFsrSsr9RK6wglaUjDvNJgMGXsXvqUazT4XOSedhmZvAQBtFAo
	294T9ibR02fyW5b5WCywkooeteorc4sbtAw5Edh199PL/oceGodmaTsGNQEiTcDr
	RJa5V759hAqTJ6wGM/gamlV1vd/6PYQwvL+tMp6O1fBfdDD3Vgupnt+1U27D9mw9
	trFEYZWMb5e4oPHPfFTuKD4cZsEXa5c7J+2gQ/aipNkLdNHmwcHpIvzA==
Received: (qmail 658971 invoked from network); 25 Jun 2025 15:09:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:34 +0200
X-UD-Smtp-Session: l3s3148p1@kTbvJ2U44pttKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH 0/3] i3c: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:18 +0200
Message-ID: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

This is based on 6.16-rc3 plus "[PATCH] i3c: don't fail if GETHDRCAP is
unsupported" which I sent earlier. During its development, the issue
became apparent. Automatically generated and build tested only.

Looking forward to comments.

Wolfram Sang (3):
  i3c: core: switch to use SUSV4 error codes
  i3c: dw: switch to use SUSV4 error codes
  i3c: cdns: switch to use SUSV4 error codes

 drivers/i3c/master.c                 | 20 ++++++++++----------
 drivers/i3c/master/dw-i3c-master.c   |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.47.2


