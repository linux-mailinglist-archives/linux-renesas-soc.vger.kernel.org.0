Return-Path: <linux-renesas-soc+bounces-33821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gvPqA7tTKWoCVAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:08:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5466915C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mjuG3zTN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B952308CA55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F84403EBA;
	Wed, 10 Jun 2026 12:08:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C43F9F44
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 12:08:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093304; cv=none; b=cWJhmZbge8Mmle1TEbPcshIgGDjVjzAv8TPSiwjmjUYSXeyigks3DkXjxxPhssVaMJKJgPdvZfhhZP5H8o+NRRwpA7M3WcgX6E99MDje+aeEVCCV/y2wp5cktkFyNxRNTisDsns+82J4Qgb3mhveMxQbpxODawA18CIH1IfiOMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093304; c=relaxed/simple;
	bh=gRYmgtFz61CTrLJuMU4IYn49sqh/BxMTge3k2DLT6VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mOVe3yVIBdeSfFA0GNg9+SI9XSXwHb0ynFfKBza8cT2jrrB1vq1JDCuA67bAhY/O1x1vgA8ZdoZ/dYgG1Fr3bHp2GaVxj3TYHXrOQkt7RNMNiX8wYiHPw9I21EuOtCZwoqnVfY+4fTrPotRF/9IogZwezu9NgRP202pEGkXHu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjuG3zTN; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so47730385ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093302; x=1781698102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80QEDLORROQQ3BtM7atufx0QxPfqyLlC7mZSU27RJko=;
        b=mjuG3zTNUBLBgsU8IRHbC/KxEhLb9EvKhWRQ3zzw4UCyE3WsmhIvmzUKejEsTjwtLj
         4slYDGA9dKxPgFfNWp4vi925PpOVptqgLRk/qFu/CLI53NtVu+dsa43yuhKdpzZOkGYg
         6lRZS5V49SsiwRLe9975mKlCef/2eFHL60j+pMf+vso0oZ6C0Pq3sUCCi1yi3dRc9pw6
         RTsTugwej5zGkkzBbgK1dxHolLFQ6LDOH3wCKst+ZeG6keI/0RrppQiz55m2K7HS0eRe
         sv6KPDhig03jCoVv6jYdhiivs0gQUCH5TaJcvTlwKdeKEQ96unI3yR+PQ1qkxO3hpeeS
         W6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093302; x=1781698102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80QEDLORROQQ3BtM7atufx0QxPfqyLlC7mZSU27RJko=;
        b=SqfuzP6XPmS4UL/IoUu5jvqjc5ydpDFbp9Utl+4KL6D8BSNGYu7BL2dxB+ryZTnYAc
         DfXht89mP0RcmW3qFLY1v+ibB9/90iYnu1MoLHyaf/I6Gk3G+HnE96U1VsWJ3x2gv6ed
         ZOeJDKe4R9scxHoqEpjUt3nZreJIiW3kULenhpqQAwXIUE8b7SaLsTWkCwy91Lnl6XCL
         erNJ5gDurbqUpg9/NRayR8wgt9V7taXmhjktnqgqG1hXQeU86c8/OKpH3GXjCzS+IZNH
         JGZ3fikJ/aPnwa9RB5RJDTkHHF5TdAYu5Kq2FSf8nL9f6NOyPqHPbPFH/Z/Ep29hDIuz
         gtxA==
X-Forwarded-Encrypted: i=1; AFNElJ8IYTsycYdzdTn4QQx+N7qKrtxo9k4fyvLTvUlcGbUvmIgDAJrvMEhwI/Cho5khz4ND1VzUvLVBtJB7oKORgAl/AA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzluyv7emhFilgY+MnjUEK33rfCaMe21AE0cUqUIJujQAaN36Hs
	3WDMcI2oSIxDbh3fSxmJHCbp6bCAWPNU4c8hmN8NqXLocVBOLcYHeWGI
X-Gm-Gg: Acq92OGcfGaVzk/gy68JhjtKw4FK4ZrWuUnZCGEgJDMZcCbG+CZleJi8P7FTGi/FrFR
	sjxxs6dplakieOGWk4yppJBQHvemAMxRhP1CWYy9dHtXniw78Q7bzcPqVsGxnHigynXNLdbjGbk
	FbHX6ELT/OUC3UXWBmtkq5/uMZY8E+NhXcSFJegBB0Q5IJTLohh8z/yN5KSIKzSv8aSq7FBq9qX
	NanEO77l8Z6xXSPCClRjQw8ABwHzIYZegUGQlVehPe4c8p2hbmSaUtdS1FmDB7uwP9I1fT+iwPm
	qpjvoz0Y05aipff8AxvdFN1nP9wD2csh3UOih6Kg7s++RzxxJf8e6VZUOeAjqn0e8VgVlbbVcze
	qX3hQFbJpzorDFhHlwNYLhiJ8H/tPLpssBwG0AiIhMdkGvkU1W487MR8Tk7DbUqskioPwx8Kbh3
	p6ZE1T+Km8Uch9J5NOTUSsV8VUu1aaWe28SltadKnt+7+Etbr8W9awnSipQiwmRryYqtzEWaou3
	+SYXOV2Dtq9wku3yhumLMewxzzb
X-Received: by 2002:a17:903:291:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c1e8332c1amr297123285ad.36.1781093302066;
        Wed, 10 Jun 2026 05:08:22 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm236919415ad.21.2026.06.10.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:08:21 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 10 Jun 2026 20:08:17 +0800
Subject: [PATCH v2] spi: rzv2h-rspi: Fix SPDR read access width for 16-bit
 RX
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com>
X-B4-Tracking: v=1; b=H4sIALBTKWoC/22NQQ6CMBBFr0JmbQ0dpaIr72FYQDvAGKGkxUYl3
 N0Wty5f8v77C3hyTB4u2QKOAnu2YwTcZaD7euxIsIkMmKPKVV4I9wnYC+cnFgddGiNV2TYnhDi
 YHLX82mK36sf+2dxJz6mQjJ79bN17ewsyeX/DQQoptDQFmUIhHs/Xbqj5sdd2gGpd1y+FR3q5t
 gAAAA==
X-Change-ID: 20260605-rzv2h-rspi-3c8dd168fb72
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093299; l=1688;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=gRYmgtFz61CTrLJuMU4IYn49sqh/BxMTge3k2DLT6VI=;
 b=Z+SHh11T+eA5g1RF+ZYwJotSyzA1VacKym9Yev1/NlWp0pPW5TEmvnNIb3baEQ7riX6bDcxvJ
 Drcb+TNYyiJAB5polxXgzeDhTZuIsPh+/B9R+yBMqobOTRs1uvBPCAW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33821-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:geert@linux-m68k.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56E5466915C

The RZ/V2H hardware manual (section 7.5.2.2.1) specifies that read access
size for the SPI Data Register (SPDR) are fixed at 32 bits. The
RZV2H_RSPI_RX macro for the 16-bit data path used readw(), violating
this requirement.

Switch to readl() for the 16-bit RX path to conform to the hardware
specification.

Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix comments from Geert.
- Link to v1: https://patch.msgid.link/20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com

To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-rzv2h-rspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 1655efda7d20..6ed3fad873b8 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -135,8 +135,9 @@ static inline void rzv2h_rspi_rx_##type(struct rzv2h_rspi_priv *rspi,	\
 RZV2H_RSPI_TX(writel, u32)
 RZV2H_RSPI_TX(writew, u16)
 RZV2H_RSPI_TX(writeb, u8)
+/* The read access size for RSPI_SPDR is fixed at 32 bits */
 RZV2H_RSPI_RX(readl, u32)
-RZV2H_RSPI_RX(readw, u16)
+RZV2H_RSPI_RX(readl, u16)
 RZV2H_RSPI_RX(readl, u8)
 
 static void rzv2h_rspi_reg_rmw(const struct rzv2h_rspi_priv *rspi,

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260605-rzv2h-rspi-3c8dd168fb72

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


