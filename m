Return-Path: <linux-renesas-soc+bounces-30062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAoWFS3gv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:27:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76B2E9307
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1789A302BA6B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3F12F546D;
	Sun, 22 Mar 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It35YV74"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0467B3803C1
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182271; cv=none; b=OpRA2QV4W23G6xKUHzrVIraQru+EMAaYoESFh63Hp9NBsjQ4edItUPUfm5tmuHQxVw5BJd9rzUFK2RWc17cJhC1+dL6SdfmTHtsEEo/8G6TYjsMtMPU76UNvQEv4xb33BeQV/XDhIbzUhj4ZypR5rBC0HvhcH1nAJOCaR3NoYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182271; c=relaxed/simple;
	bh=UpRxGcWa3iAIEJufXLdXzxJHuZ+CAyQYllpOl9CaWjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caV988iOQrx4EiN3n1HdiUqmejEsYDcnzhuKoPdzQHagSKjukxwLZ/PunSA+UUZ3gEcflSqMtkavWrqLFmJ3c5HqkC3TNcMgW5bOBy4GxA4svHrn2LcgU9k4Z8LRmuu9hmjJkgrcTpVx1CLIZHVRfIcNilAq/N6KOewDqkqAplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=It35YV74; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so3261731f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182267; x=1774787067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtD9Mcdy4IAm2SWHw0ZQYZjstkdltAVZToJLw8rGIV4=;
        b=It35YV74yHXHik0umay6p6qi5XR7VjeeJt+Q4ffgh9Kw5Ja8ywu0klGfugxclget2F
         rlA9vJSGc0gG8nKYbQceUiQipjPFlBMRqyZAi1YX5zZsVEp/CJjVJzhBk8UgYlRs/I09
         LzWtUwG/h+pJNxGL/P1ty2ufKSLlsx6pyWQR6vMFv1uyoQXISi49BcRPdZVOW+uHACo6
         MSONaGgSTz8wzlPnuflHpQ/3C4cmZpacNUKIhUDnQGNe/OojlbbmjnEfNUoeCAeDxObf
         8xTn2q6WTxEhjnE74Jes966oAhjbORsVLPitV0NCLRdzSslQbNk3D49gp4LpgCr87C4V
         M0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182267; x=1774787067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xtD9Mcdy4IAm2SWHw0ZQYZjstkdltAVZToJLw8rGIV4=;
        b=fO0/bc+NlbI/NwurZ4aaYt6K3mO3h1YsEQL3ZjlFEKDc8e07yQYscaIRGNNNKyUOZm
         myNX6TW5pNgOao7FUfPotvmmU4tcT9v0/ZYx2HLWdbseaFndftKC14DlL2XcvN3TiMiI
         nbZvP1ATEMtN98f+v2ZnB8Aw+dpXgfOh2FN+sBHEIyU2Obp24Kl4Z+mKGy3diF2fq/s8
         DcSMpN4Wh472Dn56TsKf0G767zJVeDK7tG2eYlLg7HWV96p/4lzRha2XT1nuk6JOsI47
         GO1KNBdJPGf4GCTKXukCJ39t/yB0ksVXime9f98yvYeEPATJ6wa23C3oxdazgnPlJuvj
         gBRg==
X-Forwarded-Encrypted: i=1; AJvYcCX2sY7f4ytYvZWi35gGHPKs+g1y1LjRYlF5SPjYHh+ttoYyjskZhTLSUOKjd6sn9eqCEkqc3pPl2QDU1yaRGABvOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcLbMb/QFDUoBHhtlooA/S8CivL4gIM98Q3XsURC1czbRIj6c
	+WKKq+1VAcbkR0XNM3cuZZVW1q4GwqTyG31MSDL1QxIRtlqsQC8bUuSj
X-Gm-Gg: ATEYQzzgu3BWrCcAmoXn4V9K3j316Z9aVbIWSo8Bs0LrtgD65GhUJGkSMpJhShfupRP
	YLme0VfrdHPynb4CJ1CY5V0S9mi4mWsNnkY5zbnPygSc78DDl1RU/iEKXeLSCfZUlF7Rg9cb0NE
	7cGGlWH9pFsKtF0MIwILtzT77e4+mHDmPP6+QTqcE4fEwAfsZLKY2I0HTpUOTlxaEPWZZ0ofdQE
	T6JUIaepXzLMPl9IDctbqHgpat+gvSUTazXdPLo7cfDWfwJeVeczj9zYffgFvXl6bLYHV6D8Yxy
	5cRWLaRFXKSDqTinq4eTXBoC0AwVHAVy4Ph/I2xqh3ejKbkCLxFrPDEzzSmnnSEW5xjdb1l45d6
	Tkdh6iLELjrj0ixFp3A3zkOL/GZjbrxCoywIJvHUOBRn3iNfv4HXuHQttPoNY6/y1pewRjZCzsp
	hhi2qMcXEJqRauQezJ6UQ8kwL/x6X+aT7HALRBVlYg17XznDhy
X-Received: by 2002:a05:6000:2890:b0:439:cc06:e134 with SMTP id ffacd0b85a97d-43b64242520mr14855907f8f.24.1774182267272;
        Sun, 22 Mar 2026 05:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant IRQC_TINT_START check in rzg2l_irqc_alloc()
Date: Sun, 22 Mar 2026 12:23:46 +0000
Message-ID: <20260322122421.132474-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30062-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: BA76B2E9307
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The check `hwirq < IRQC_TINT_START` in rzg2l_irqc_alloc() is unnecessary
as the condition is already guaranteed to be false at that point in the
code. The outer `if (hwirq > IRQC_IRQ_COUNT)` block ensures that hwirq
is always above IRQC_IRQ_COUNT before reaching this check, and since
IRQC_TINT_START <= IRQC_IRQ_COUNT, the guard can never trigger.

Remove the dead code to simplify the allocation path.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e73d426cea6d..ed8044b0a339 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -491,9 +491,6 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq > IRQC_IRQ_COUNT) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
-
-		if (hwirq < IRQC_TINT_START)
-			return -EINVAL;
 	}
 
 	if (hwirq > (IRQC_NUM_IRQ - 1))
-- 
2.43.0


