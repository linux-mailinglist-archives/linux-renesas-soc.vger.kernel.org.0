Return-Path: <linux-renesas-soc+bounces-35111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7jfF2blVGrNggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:17:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B071A74B717
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:17:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=kVcUtVWq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E025530DE989
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E92416CF2;
	Mon, 13 Jul 2026 13:05:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87D414DD4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947955; cv=none; b=KZrylhGlSdsxZgPVyu8OYyJudRociYrau9yNx7ESFGEvL8UDraLPl3ipMrW+COyDGkDsbi127IWS2+Et2EgTu9YrnIs/CGQs1cZ1ml0Q+VoBQf6ot2V5rx+sMhYKzqBrXnzh7aT0sGxY5YMgCMFWtHos0SKmEHDp0CNY5evAU0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947955; c=relaxed/simple;
	bh=vpQtCTf9lK6ZUysGw0BojPKDiQ0w5G9QuaCqYXbcuJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmwVlym2FBIdXp3DB48k9MZ4J80qNf3W758CNQ40wR79x+mDSrBEK7TJYlK1Zgqh4yvNndZmb1B71mNCqjZxOFz1gqOTsf4ivEmpM2Hp5hNeCQvW0rgTnsUWsi284r4Uu3AecOnyt61/ZDjRRe1sFn7c90EVu5bLZTZ8W1979m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kVcUtVWq; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1696979f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947951; x=1784552751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIEzViZhXjAraDf7Ayi3/ThvikdI1szu91oMmQWBOX0=;
        b=kVcUtVWqz4+2IYUTZRLOGopB2MOTMQJPnoo5pwatZXPEny6WksWCXuDWM9aurECGwr
         4SVCXoMD61wDQwd7KyTwQoFm79BQ2AULGwVr29FajrFUNCJJK+e8Rw+IeuHcYiWdcjuW
         McwUVRrE1mfjgwgqigAdN2kZdweCtmxYxhbCSzHXAo/G0NEqJcy8fW3blJ4v2tJLf46f
         y7DTdguH+8h8QZrvLjOe5wZRoUEp60DEsTMSsOIWMKWNamw3IrS1PBbl2WCaFk/gtc2i
         gmdyU/AFhvNOHoG31bpBOs5Qp0VIf99Nby4+0D7HjeoeADP7mz9geU4wuCWdBk6LC1Sw
         k45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947951; x=1784552751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIEzViZhXjAraDf7Ayi3/ThvikdI1szu91oMmQWBOX0=;
        b=IbsqY9S6KIyc93PVQdSyadxtoVR7QKvAlPKlTL/h/FylJn9yaIQFz9Ff7dR9Efb7EN
         TEBMriVr07J/tYcqb9/4cU0SihzcMpGbtF8FzKiTDUOS5tBd/y9dLtx28XJ+fMb8lCR7
         QdK6gdW3rS8N0AuNq2DaBrq2tONVGR0BtoZbhZQ/Ah9vS4pJv9LH9kdjpIXmKpJ9zBZW
         zR8eO+4cNntI3/S7Cmq0IHeOysjjR5o687xjp4RTtA0T3FKjE9FNCoq+XRWD76CAbIZV
         i40cRL48fjwK1FAbgD9oKk9Bx7Xfvl/lwBIgQnoetZTWBPBseO2yAgy38DhdNoj4T4Kd
         bhqA==
X-Forwarded-Encrypted: i=1; AHgh+RqUXQhwT3vPbsx7OwhEiRGzlbFEyURLaOKcS04MzbOLJNFIfnj9He0DYZ+6F0frtm3mFFAAOo9ps6WGYWsZ4wrjAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3iJqUL2m2u7vOO085BqU93Fbid1DqmT3m8qafpouZcVdEyiB
	2YFZOAS6330bZKqRJnEtFvkJMzQCdUFTR008Zig+9o9ntG8n4LTZjftC1zccHRQrMNEnRSuFsVR
	Xk1XU
X-Gm-Gg: AfdE7clBodXtG4NsVeKsV5qEUDp31QkAobreze50Fva08c5T61RNV+PJWlD4UetOPxX
	YbC3dWer8t3kMerJiVGak0CKyoOn07g/n0ROKvBFXx+fHLt9Pb6ExUzzWWj0saU83CDwLwVVU/Y
	LAiCL7OjCNpBdbdjpyi7GsfKMOb1nujZQYGNTg/J4vCKfPnV62ERi2n/m73HDO/82g6O646EyrE
	ZRx2l+Lq1N+EoNLPAPLqd8/PWTt3TZgM4qI3WbLbSR560XvhhuhNVU86dsS6AvMCcH8NUEPUebv
	mliB8nqsX2ssrWAYOHwHieJ60mVTxFsMiLT9xRXbdESlxNFTNPntbXla5ZD71yXRrHSCRbAz1RW
	NPvQtGtiEzojWx/ufxFtU0yS6kCG5dG13bEqUgdf7lCrITW3o1/q1taN/zMMow8kv83svtriaj+
	G7La/Gw6EiYwJR0AsPv7BrZzvXy3KQYJPsvGzYRJLteS/klyktKiOF5Ycqo8UdsxVULcSMQS8=
X-Received: by 2002:a05:6000:2902:b0:473:1ccc:15bf with SMTP id ffacd0b85a97d-47f2dce2fcemr10893103f8f.42.1783947951174;
        Mon, 13 Jul 2026 06:05:51 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:50 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 01/17] i3c: renesas: Check that the transfer is valid before accessing it
Date: Mon, 13 Jul 2026 16:05:29 +0300
Message-ID: <20260713130545.568657-2-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35111-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B071A74B717

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas I3C driver uses an asynchronous model to transfer data. It
prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
The interrupt handler dequeues the transfer, updates/uses it, and signals
the waiting thread.

If the completion times out, the waiting thread dequeues the transfer and
free it. If an interrupt fires after that, the handler may access freed
memory, leading to crashes.

Check that the transfer is still valid before accessing it in the
interrupt handler. With it clear any status flags and disable all
the interrupts to avoid triggering the same interrupts again.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- introduced renesas_i3c_irqs_mask_and_clear_locked() that keeps
  unified the IRQ mask and clean path
- updated the patch description

Changes in v4:
- disable also the interrupts
- dropped the Rb tag

Changes in v3:
- none

Changes in v2:
- clean the IRQ status bits before returning IRQ_HANDLED and adjusted the
  patch description to reflect this change
- collected Frank's tag. Frank, please let me know if you consider
  I should drop your tag. Thanks!

 drivers/i3c/master/renesas-i3c.c | 52 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f39c449922ca..38b8428f464c 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -433,6 +433,21 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
+static void renesas_i3c_irqs_mask_and_clear_locked(struct renesas_i3c *i3c)
+{
+	/* Disable all the interrupts. */
+	renesas_writel(i3c->regs, BIE, 0);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear normal transfer status flags. */
+	renesas_writel(i3c->regs, NTST, 0);
+
+	/* Clear bus status flags. */
+	renesas_writel(i3c->regs, BST, 0);
+	/* Read back registers to confirm writes have fully propagated. */
+	renesas_readl(i3c->regs, BST);
+}
+
 static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
@@ -1014,6 +1029,11 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1054,6 +1074,11 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		/* Clear the Respone Queue Full status flag*/
@@ -1138,6 +1163,11 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1184,6 +1214,11 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1234,15 +1269,13 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
 	struct renesas_i3c_xfer *xfer;
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
-		xfer = i3c->xferqueue.cur;
-
-		/* read back registers to confirm writes have fully propagated */
-		renesas_writel(i3c->regs, BST, 0);
-		renesas_readl(i3c->regs, BST);
-		renesas_writel(i3c->regs, BIE, 0);
-		renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0);
+		renesas_i3c_irqs_mask_and_clear_locked(i3c);
 		renesas_clear_bit(i3c->regs, SCSTRCTL, SCSTRCTL_RWE);
 
+		xfer = i3c->xferqueue.cur;
+		if (!xfer)
+			return IRQ_HANDLED;
+
 		xfer->ret = 0;
 		complete(&xfer->comp);
 	}
@@ -1259,6 +1292,11 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
-- 
2.43.0


