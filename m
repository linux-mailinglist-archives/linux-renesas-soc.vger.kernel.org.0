Return-Path: <linux-renesas-soc+bounces-31022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKkoNFtk1mnIEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:21:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7782B3BD97F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6874130071DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ADC2DCF55;
	Wed,  8 Apr 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBVsyJrb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDD3D3487
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658073; cv=none; b=pbzZo3MsGkAGcrTSEwKUuQM3AgCZ5UFqeVRWJgyS4J5LjdMg1F5X5tG9ckfMJSTzE0YyC5cmQ2WyKQRY1HeBPKk1AT4UJ8Eli+lBsBa9uQ4Ua4nI2ltYWQ7LzbdeTEDTnjvUIH2A7+RXPtHHZDmIXzyHFSx/Zq3qT4nm2uTdpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658073; c=relaxed/simple;
	bh=ddrfr3rql9m/sbOnBCJC/YlBY3/WX7/HgB5dY7+ixvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpvILY7Y5x42V3xb78ifbIdIJlwz4hkVSWpD7TtfVhQAOtzrf1shcndn3sWlt29sq5aJbbDfNLCm1RRL0jE3dYCvxdphtpXaRK4V2aUARvALllDij0BRuOZbvf+fpYpVZsHeHqepGzAFfZNLk7+H2wfcVcTu/HvJXqA8QcKN+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBVsyJrb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a041eae5so34080595e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775658070; x=1776262870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xt7/zv+UwHJyWIBrUUqp/D/ZXiUTMuYqdObuX9zLVHA=;
        b=BBVsyJrbKPFtcy2Rz7Hey1WwovPgkvZo0SNnfjnoz7ULn3mZ9b2p9FMFDo1ODG68pL
         kT0IRnGeh6RKsujwalXC79uC00tL4TBmRJ7GjNYBp7/7vbqOe20CGoClunKp8vh157bQ
         02Ult0lXYwTr/CxYzCv08r7zOBheaw59tUo9R+vOTUthMzKLMgwyiyzDE6rUhawQ5m1d
         f1GHt9tTcySsDNuAOtMKNkNA97UxQiV5etToZwM4SeCT+HaqUEtLMRKqeO586ltdG4eI
         M2hfYwaCQbYplzs8nSBUnEhdLRAf2HI3yjU8sf6QqtrcubFbyCbsg8CURLJI1YNM6d06
         5rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658070; x=1776262870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xt7/zv+UwHJyWIBrUUqp/D/ZXiUTMuYqdObuX9zLVHA=;
        b=sDgrwj+g/k6CWSiUrDNDhgkE78DoC/SMMHuAseANNLCwNgcrUL1VsFGjI8egixhyYi
         YuscFAugozld7BLqHPnbyEMDfCzba1e9A3XanCz/VtZWiAzarffsfEwI+sMeKwsISAit
         ZkKmSabE53lxp0uIhR3sNw9xYE1Lw8OraPpVTo3tJylaImh8zyBT8WjXocOdcXM4PJ63
         phz2+6qGYaKEhBnfeJe04FyyG7CwA9of1RUiqqLLl736E34RKOH0xFp2Uxsf+kWL/3Ex
         ndnsbXIGQNks9Y7e39/jJBs5tAUG4d1Qz8i4531p33RGheKO++zySU1v9U//1JaQifct
         3Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCU+oXbsd0JzF0D+gGSrQ19svFJWYq1Rd8i/75UYHemsuBp6kYdfPXQ4Rnew08zKuEsqCRFUATAxkVpo8mK4n3WY0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIR2RO7irajgdg8QQR2HDKlqZbW/AXjbBiRw6DzH0ng5k+L4+W
	JbACdbmyloXg7yizV/90GKVwb+zRZegAz+dqs7gdRig2Tw0gsaojCzUw
X-Gm-Gg: AeBDieuc3NnlRZNFQeT7Lvs2v+hVjTtKt+deza2fhtA+jZlqTnuJdK0gT+yxK1dI/m4
	Y/bK+YwKzCFeEQMgejtz5CzV+j8pMlz4HZQJS+0x0oA7k4E5vIt+Sq9YlmTCDDyAeKvbPcBJ185
	3PDx6mWZSKwx8pZSNATYz1Duo6+wKjY1dP9SbJJyI/WQeuLBxzLqIlu0rNlnoTN1Xemtfc7VtWt
	WRevS5nYdGZFDjczOmkyC/yteOjakc3TuqlH1YnYzvMoN6tZlSqf0cBLcW4eEWFOOPmIL79PMra
	/vFik0/QhufxeaIurUFdky1wFPB6xPjpNTb+JYRDsG6W1TkBBuDR3infQ9G+qz0InFOKnSyX/cK
	evHQgdADjax8wCS2Z3QIyZIm8uUwzzikqMKwy1oxeHnvW0f5ARZxYDDvCCwMav1ap9jTqwzwILO
	GhSTcFSA5t86BfDDJgtjbYRIKruiMoUfir3vtnwVWgkxaDyOyfVGVZ6scTiQ==
X-Received: by 2002:a05:600c:a318:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488997dd54fmr202593925e9.24.1775658070197;
        Wed, 08 Apr 2026 07:21:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:f65c:8080:131a:202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm60474467f8f.0.2026.04.08.07.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:21:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>
Subject: [PATCH v2 2/2] serial: rsci: Remove goto and refactor baud rate clock selection
Date: Wed,  8 Apr 2026 15:20:59 +0100
Message-ID: <20260408142105.310210-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31022-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,sang-engineering.com,vger.kernel.org,gmail.com,nabladev.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.984];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,nabladev.com:email]
X-Rspamd-Queue-Id: 7782B3BD97F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the goto done pattern in rsci_set_termios() with a positive
conditional block. When baud rate is zero, the clock selection logic
is now simply skipped rather than jumping to a 'done' label, eliminating
the goto entirely.

Since RSCI only uses a single clock source (SCI_FCK), the multi-clock
tracking variables (best_clk, min_err, brr1, srr1, cks1) are redundant
and removed. ccr0_val and ccr4_val are likewise dropped, replaced with
hardcoded 0 at their write sites, as they were never modified from their
initial zero values.

No functional change intended.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/abPpZULsXhRmXTX9@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped the check (abs(err) < abs(min_err) as it is always true.
 * Dropped the check (abs(err) < abs(min_err) as it is always true.
 * Dropped variables best_clk and min_err as they are no longer needed.
 * Dropped intermediate variables brr1, cks1 and srr1; results are now
   written directly into brr, cks and srr.
 * Moved dev_dbg() inside the if (baud) block.
 * Dropped ccr0_val and ccr4_val, replaced with hardcoded 0 at their
   write sites, as they were never modified from their initial values.
 * Scoped variables err and srr locally within the if (baud) block.
 * Updated commit description.
---
 drivers/tty/serial/rsci.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index a0858bab0822..c2440fd5c02d 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -217,16 +217,13 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 			     const struct ktermios *old)
 {
 	unsigned int ccr2_val = CCR2_INIT, ccr3_val = CCR3_INIT;
-	unsigned int ccr0_val = 0, ccr1_val = 0, ccr4_val = 0;
-	unsigned int brr1 = 255, cks1 = 0, srr1 = 15;
 	struct sci_port *s = to_sci_port(port);
 	unsigned int brr = 255, cks = 0;
-	int min_err = INT_MAX, err;
-	unsigned long max_freq = 0;
+	unsigned int ccr1_val = 0;
+	unsigned long max_freq;
 	unsigned int baud, i;
 	unsigned long flags;
 	unsigned int ctrl;
-	int best_clk = -1;
 
 	if ((termios->c_cflag & CSIZE) == CS7) {
 		ccr3_val |= CCR3_CHR0;
@@ -265,23 +262,15 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 
 	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
-	if (!baud)
-		goto done;
-
-	/* Divided Functional Clock using standard Bit Rate Register */
-	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
-	if (abs(err) < abs(min_err)) {
-		best_clk = SCI_FCK;
-		ccr0_val = 0;
-		min_err = err;
-		brr = brr1;
-		cks = cks1;
-	}
+	if (baud) {
+		unsigned int srr;
+		int err;
 
-done:
-	if (best_clk >= 0)
+		/* Divided Functional Clock using standard Bit Rate Register */
+		err = sci_scbrr_calc(s, baud, &brr, &srr, &cks);
 		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
-			s->clks[best_clk], baud, min_err);
+			s->clks[SCI_FCK], baud, err);
+	}
 
 	sci_port_enable(s);
 	uart_port_lock_irqsave(port, &flags);
@@ -289,7 +278,7 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (baud)
 		uart_update_timeout(port, termios->c_cflag, baud);
 
-	rsci_serial_out(port, CCR0, ccr0_val);
+	rsci_serial_out(port, CCR0, 0);
 
 	ccr3_val |= CCR3_FM;
 	rsci_serial_out(port, CCR3, ccr3_val);
@@ -298,7 +287,7 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	rsci_serial_out(port, CCR2, ccr2_val);
 
 	rsci_serial_out(port, CCR1, ccr1_val);
-	rsci_serial_out(port, CCR4, ccr4_val);
+	rsci_serial_out(port, CCR4, 0);
 
 	ctrl = rsci_serial_in(port, FCR);
 	ctrl |= (FCR_RFRST | FCR_TFRST);
-- 
2.43.0


