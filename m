Return-Path: <linux-renesas-soc+bounces-34326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0MlnB2BbOWovrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB766B0E70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EjnnqKHx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0F433024E45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0563CF1ED;
	Mon, 22 Jun 2026 15:56:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6B3CDBBD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143785; cv=none; b=Pshao9oYH2eBWq4ZtSKTn1gWhk3KRMXwZjAsQgf0s7FsyQKiGAm1LLaknv3RYQwjonpcMfhnLkqFTeaI1VczVyHstXfC9EVnCUjcTfbFsnw98Sg22fiQrB9FZy6UAOPeCcCEQYyBQ2OEw5btP2vaZmgTSCnKtbrrdSg/ZBbJZeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143785; c=relaxed/simple;
	bh=3pSYeI3Ov5IRhZN7PCvd79JnHMNr4PlXkUDxKRt8tI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY+BW4XidNV31BqyhAywbTz1dyQPU6kcjgE3HOXbGmqEG5FIj2bg8kT64wMXgAFQYWNYNE9rEODSHzgEBA64KMHK3rlM5kUvJP0HVQ5u48dpCpmgT5UpQPfF8xZRc9RyXdQmQycGJF/4AMMdAPolpKznw8C4cM56Ws/g/54qQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjnnqKHx; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4908b92904fso66148605e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143782; x=1782748582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChpsRMDYahXFwT9HY/F/ClsapQx8Ght63tpNspUZit4=;
        b=EjnnqKHxFMn3+GARy6981Una4OSVlrsIqseFfgapE3J+8LPFgEnM12L6IJjxcQRfD6
         CTfhw2hvEq6mUmzOZUak8IXwd4pQiAfuxRnUX8XmS/SIa1ASlh65NeFnmaG7k2GE9BqB
         RlGJv9IVwr351z4twYh5+PGaEzdEfAKisvkEFWI7UZxHQ25jYpGfTSWmGlH+TzcCq8tr
         sgR6MdjQ5waleuwpDaqRkePHoIo6C3A5vtwOPJDxAlEdzm72CYFNzWP5SvpnpZl/17iI
         O3PEuiY/z4+Q9/thXGfcVc6TjahjCxpTtZ3B2hZNLsqoxhfy3KZkhNpLOd/0E66Pjy7y
         m7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143782; x=1782748582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChpsRMDYahXFwT9HY/F/ClsapQx8Ght63tpNspUZit4=;
        b=VYmY0DuX07ZzG7g1deXXTPdjsO6+ZH7vIGgNT6loEf2yCmKpaydzCXy8MR6H799Nkg
         xsU5u0K8pUZfqPYgpMiD2P4qFWUYUxXJAx2kbuuroygIkyibvsEzG/efgE9ovH5H+/g3
         lCFa51f/0sQo/zLgpwh47VZRMdJxDg9K0rMijG/zI7mlydM2z0B0dR20xrbI9XOq3Hd+
         3b7Ln8Y7hBcdwFkfKxwLZYZej2G/9FKfTdX49p9hgSm/WD5PZMkNrrrf0/Ajlr68jbRM
         4YETxHvrpAFRPhQleHc6oaxsgNhk1yZvcZ25FayHm91/rVCQfdJn88HWsQGN6zI3s8Eo
         Pn7A==
X-Forwarded-Encrypted: i=1; AFNElJ+CAABUO31o2wM8wA/A0O45oPYKSTtanzON2qFmoTcc3NyFr1RHDZQez04MH1d4+YHfVntMtGMb22EXBo4R2bo6nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3dDD1zdrY/pPMqNCLFMbUOcw6h1P7inwP/25OjfpXJEc7nPI
	c5Lnt9MtAOQ2gPpBN71yrb8KJ4FDEXhw97n/gW0ptRES7BlQ4izlV4Nc
X-Gm-Gg: AfdE7cmWCcovahAXfi/MqW4rT48b8eBvuEStBWQz2W7D0iYALQCrQjSp/OBwvfHcWxT
	TU8fVlUfkVk1K129j56M1p2c4c9uwGWizC3TpF7eRWd6LJ+xLzlLwLQ1yq1QksO90X9ak2zRVO6
	pk7mdUtq0qLLGuh/1HLccPurOypJUUOAYhNbRqwKQc1soYHSPaykbwPQQSYsE7nLfygQ2ZE2ZqL
	7jZ8dbIxvTdspsj2+uAkTlvZtR5UWMKErl1rkn8LIQBgT1xPhza3oUnFfQGr6JaLJAN4HUj8Kmv
	wa5wwi3YLexVZWQ0GMt3B4Z5nzgPaVsWZqJ0H8ACnUhZFSab5QnmMhOXSzhesTMZuK2hhRbow2q
	BxQI2nRNpupAT4J3UtD71G60cjAwENpQed7bAMHRwhCj6LoswzZYmq3FDr3ztbyQEa8HnREsWzJ
	O+YJUxx4Z9hP7HHt7Z8jwWs75BBeehyK/BXfGPUA==
X-Received: by 2002:a05:600d:8654:20b0:492:4fda:7720 with SMTP id 5b1f17b1804b1-4924fda7824mr88441745e9.14.1782143781438;
        Mon, 22 Jun 2026 08:56:21 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:20 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v18 06/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
Date: Mon, 22 Jun 2026 16:55:57 +0100
Message-ID: <20260622155610.184271-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34326-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DB766B0E70

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has an internal clock divider active for all modes
except HS400. To compensate, the rate requested from clk_set_rate()
for clk relative to clkh must be doubled in those cases so that the
SoC's internal /2 divider brings the actual card clock back to the
intended rate.

Introduce a TMIO_MMC_INTERNAL_DIVIDER flag (bit 14) in tmio.h and a
divider field in struct renesas_sdhi. During probe, when the flag is
set and the device tree does not include the mmc-hs400-1_8v property,
priv->divider is set to 2; otherwise it defaults to 1. The divider is
applied in renesas_sdhi_clk_update() when computing the rate for
priv->clk, replacing the previously implicit multiply-by-1.

No existing platform sets TMIO_MMC_INTERNAL_DIVIDER; this patch
introduces the infrastructure only, with no functional change for
current platforms.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18:
 * New patch using flag.
---
 drivers/mmc/host/renesas_sdhi.h      | 2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
 include/linux/platform_data/tmio.h   | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 438b2a7afe76..6f6b41fbe91e 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -102,6 +102,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	unsigned int divider;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e9767aa83b00..8890859d0777 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -185,7 +185,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	clk_set_rate(ref_clk, best_freq);
 
 	if (priv->clkh)
-		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);
 
 	return clk_get_rate(priv->clk);
 }
@@ -1231,6 +1231,12 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	dev_pm_domain_start(&pdev->dev);
 
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
+	    !device_property_read_bool(dev, "mmc-hs400-1_8v"))
+		priv->divider = 2;
+	else
+		priv->divider = 1;
+
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
 		return ret;
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 868a21842fa5..6c512e96e192 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -53,6 +53,9 @@
 /* Some controllers have tuning delay */
 #define TMIO_MMC_TUNING_DELAY		BIT(13)
 
+/* Some controllers have internal divider */
+#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


