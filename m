Return-Path: <linux-renesas-soc+bounces-31784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE7wDwMs82n7xwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:16:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C74A0A47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64984300C5A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16993AEF3B;
	Thu, 30 Apr 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il9l5Jln"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4727EFE9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543724; cv=none; b=GwYeDsZCIS96vjpyBEbRremi5/+zUnrG0W3avde1Gbt85CogQQQxzIKFNKI7Q+3OCyTMi/aDNyUs8jIuI8tGaldnsGYC7yAHbXHUH0rGUqJh2bxjU/RCErxYpSD7mRBa/1vM80spoMntnPwnjaWX3plKuiTD7E66vDpvTIxvhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543724; c=relaxed/simple;
	bh=CvWbtYBi8ENn+U8ThAwDO3/26YkOEu1S3TBFGLINxNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhfBDc9OaoufcbZngriNp5Ggwr0krKR84XDclNk2RK8IPju+zCJ3OH00OGrTadsfd+CqVds6jEnzj24C5N5RT0t1R0ru+kAIqD0ShesWhtCI9Kn5Tu7kWVFunxCClmgbxZ4V9zjFqyt/evm59WOZJBHMdh35QFfdXgpOtZVr/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il9l5Jln; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso6771005e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543722; x=1778148522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChshJVS8LUKfqw0vxyMwMMt0DdEqRzBhSpf+u1agpg=;
        b=il9l5Jln6gt+vOQ+qmr4fQLT5Qq0qk8ddEfjWX7KObljQnCCf5qz9WsRt2p9KQk3rv
         bgcOhshi79vKd1FpZh90oM2L264neOo8aQ1OHhNUzBfbd3En3ahShkkYzf+GbnV/zwrM
         LylvLvSCg2LSxKGV0zrhyvh6Qwj2uRQBFDYpI/fNVfPD7IWpXNiKUKPxr/llbWp8/QV6
         QWHE+ghWLWfeZEL0ApN4apGvUYB0QDymizd1YRcWBrqoDPkWkmoN2TroHPtwsPfNKpdX
         IwsU0VFZf24kvJVMNnNmHrEmf1L4+PLaOvi8fCbAOdPMso69Ace3YC2d8lfcqkbeyp9Q
         xolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543722; x=1778148522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ChshJVS8LUKfqw0vxyMwMMt0DdEqRzBhSpf+u1agpg=;
        b=s3WvAVKfW5BHzSj7DWXWC8T6+57FuT17ss6s2nTB1PqfB3nRVriThh0ByRTVGKLx7D
         T1vUae+15mmSmcCFwzaCyyR/l/ldfSdJM4RembaSFDmoCGsxYHVOOTwJS9i40evYdEnr
         +vZRjrTvOX62w8xVF4n4thvMV1ja9Vi3HqqFX3bP626q7rXA2z69cjlfbcg/Pzf+eRLm
         8Nlhwe2YPayOxYQ2oQRVU2zhflDsXWhDn1Y37B2RCf5vHbb6WOvP9wx1huJg/A5IlzcI
         sG/t3F3mCMCt1ccLDK2stD0CpaMlakAYFPbby/DOT7XM9HzICcJujn4fcxbs83242h+a
         yaxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pzCs7VW8mWRljuGAN4nTqq2cwDTGLI6QSb57zwnfbHSsDU2kyqOB5NTMBiQ79y/ENY0T4wCOG0zEMYq23UVuDXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGI3keq5MRYJR1wAnmgYj9M9U2RN5mm8IXT5pDFGJtEuWBfLh
	CyvBrU39OOgBoY5D2TvMPE2ZynbrEW8OykOqGZnjNqABdZ8Fjl1PpbWr
X-Gm-Gg: AeBDiesTaAauCPsYkBDSlnSP6cAnZsu2/TBhXr1FPueeh1y9mOBImnmt+wVKVnrnABx
	UiaANKIoY8d512weKqm4e8V9UOYvOAKLbcaY/Is/W+AOBwmakspvYA9Pq3hv1I8+OKtX6kuISVy
	3j6TD7EVvBXBfj/+wvqZTByV4sivsYX/Dwq9/cm9wVzdiyqfyJraZVng6Q67gHxi0rsdG0zjDK3
	XqllLV3Du2Lg3SL4yI7KWxtRjY6Jd3gEL8C8oo5cP0GzoB+J98wD32UREHqOrRn4cFLQSQMZqbo
	3dM1ViqIOMxqwbyJXDehgvK93ZYjP2AeA+MWWoRrNzf//g3CkcorYcDiga8MrKKjEedn1R3BJsg
	qrLcINb07SZhQrxrgoG03KnfidVcizV8gUKTcoNXrSRg5FR1ABiFtXShImHFYOk3to4iRev2/rD
	ViClhCGc53lVmDuWIV6RI+7ZMc+erLYdGMhSjwqD4v2jiTs6yXqlx0+W8S
X-Received: by 2002:a05:600c:3594:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-48a83f6e20emr37376795e9.2.1777543721451;
        Thu, 30 Apr 2026 03:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm60925245e9.7.2026.04.30.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:08:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
Date: Thu, 30 Apr 2026 11:08:16 +0100
Message-ID: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF9C74A0A47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31784-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add R9A08G046_IA55_PCLK to the critical module clocks list to prevent
the clock from being gated during suspend, as it is required for the
interrupt controller (IA55) to function correctly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index ce9503c3cfd1..0004b9516fdf 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -312,6 +312,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G046_IA55_PCLK,
 	MOD_CLK_BASE + R9A08G046_IA55_CLK,
 	MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
 };
-- 
2.43.0


