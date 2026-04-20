Return-Path: <linux-renesas-soc+bounces-31425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGE8JZ9E5ml/twEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:22:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031642E164
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13AC638B0AFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2772364E99;
	Mon, 20 Apr 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EunOhYiy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090E364023
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693875; cv=none; b=cbVP99dxOlgUYWHxh+RSGODa7y+fCPXDcqhgFOquGFUBKLOHyEAHGN+NJLY8VQP0sNXeJOQtyR7ef4GC4nbaajSghtJbYiJIS+MlEfS1i9VDtFypjMDMLJmN8rjA+9tE2Ee8vZBqVUxq4Ikw9jshBARwps1U5sx0sNUoN5NJ5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693875; c=relaxed/simple;
	bh=WhVlfvQ+oUYkxqpp/mJeaygvYrQ033hUNsGCTAFD55A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5FugXQg4bUZQ/avDfCJXa6Tokpzk9O9nJSitT7g0pD0ptcbS8ZKhiXWGzqB2KkIIaSMhN3iewBmE6qEY3IacWaljmcgmfs1dworaHbzAheMvI43Giaafzre/xyfd8jXyxWNBDTsTRxmvInuKUcgqTdOFeep2bDTT5lgsJVTZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EunOhYiy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2369435f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693872; x=1777298672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xlUWWLG1M1rjcikyRUpJDrhDMsJpX4br6B8/dQ92cY=;
        b=EunOhYiyMSQjLBm5v5xhbAxdCCA0xi3+1DsqZfd1YqUsWURKfjyWnv/+hndysNpxnZ
         +UfBesEu1IbF3DadOCBbsIdUhyAcvGHfaeA77TNl0G7o1ik5vvUX5QMvHAYFzC9mDTw7
         arhifiXdtAsXIiUgLniHIHYWkkQ+m5SO740okipcU2bs3Q9VbqQnsI0uUbWMFv/mdlRL
         ZBVIJhycT0r9inUUvIiyBW/ettLQTcX6Lj87y0yye0GOP3JMUZO9T4BPrxjmSOrTkFcq
         lBkZRPubX86b75cnVnMj+YZ6c4gt6OQdj9uiJv+0Cj+o772U9Fps1Fpj7zQLCMoVHwyA
         P0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693872; x=1777298672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xlUWWLG1M1rjcikyRUpJDrhDMsJpX4br6B8/dQ92cY=;
        b=k1HJ/DygllMmYAdlNUVutAWFvUju10N2WdhvGyzMRULe742MdLaHaIysAB71z2x1yM
         r/KYEyyLNI+BM+YxIUxg2991egZyE9wdbNGhKGlwRDkT+W7YuWNE7mwEsSX/WGjpN7ei
         FNSFukb+LZkuanpPO4g/e73HRvN9u0WFEiGjLX7I0j9v9uT41VfhUApcQ9iNA6ICJr+h
         bA+a3oQLofmKb1N3BI1uuQQbDbrbjNm0XEZj9zDIumGm/w5Bc8uzbmd1ce7c+cmP3saL
         9vGPePJK66/a/Rk5C75+a6WM9Bg2WaLGw8WV4CKrYh9QKzoY4hXSw3YoVE1QlAWo9hKO
         DiYw==
X-Forwarded-Encrypted: i=1; AFNElJ+MYpV93+c6cNiGSKxkc4P/nongHxXcf/idVmNwXcv8zcZknWNg3jo9aWKUSB3HfloLbAF9LNBGW9GRGGs95gAeXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMRnExW93xfG39w29w5krCk/UArYXOtTTnY7t5zClM31Eauvv
	0NR/CAIT8nkYNcrW0XyVhP5/U9Th9ZEUDQNivGAWL8ggDv2GTOuRxopD
X-Gm-Gg: AeBDiev2uOgiNRsXT2oSest1mOgscI3PiIxK0PMSXlczQNKE3CkgLww0X3pBHMXSDDj
	kJvVdE0rEq/xUVFm6CAoraF6aCGQh6ksovXNRXG87JnMTJCba+4rH62B6z+Ophkm82wb1L+NzMo
	bZdSPnw8q959e8ulNOfEA71d2obnJc2ZYy2mp2pWmk/ZeTCQkrLaNrPGQ0djBFZvv/bFwLARksY
	xutH/zz+EUDBx07RwcfCS1dAofiho7nHqpClg76b1nQw2116KYjoKhP9rbb4C26BlPmiZMZK/m9
	PwikFfIZqt3akLh1R26zc0Hfqh1jBITSMrZif7bUBs4nfupCTbLawKqoqc/XbU6z/dVhm+y2BvZ
	g+dK/ufBKr6+3pxG7FvlGYGHs9sQKKrEgwd2CyNpDZhil55a7TbB9ploBNkXBUevrQvRwjgIptH
	SdsO73/+VT+OK2gsVDGSjBrxX2ZHRilbDV2R6fxZeOPJSOv9meOXgCRfoev0XA7fKJs3zm4w==
X-Received: by 2002:a05:6000:18a3:b0:43d:7ba4:6b5a with SMTP id ffacd0b85a97d-43fe3df25a7mr19214923f8f.22.1776693871973;
        Mon, 20 Apr 2026 07:04:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm28377778f8f.31.2026.04.20.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:04:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] serial: rsci: Refactor baud rate clock selection
Date: Mon, 20 Apr 2026 15:04:23 +0100
Message-ID: <20260420140426.237865-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31425-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0031642E164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Since RSCI only uses a single clock source (SCI_FCK), the multi-clock
tracking variables (best_clk, min_err, brr1, srr1, cks1) are redundant
and removed. ccr0_val and ccr4_val are likewise dropped, replaced with
hardcoded 0 at their write sites, as they were never modified from their
initial zero values.

No functional change intended.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped reported by tag as the goto statement in rsci_set_termios()
   removed in the previous patch.
 * baud check removed by previous patch.
 * Added missing macro CCR0_RE while dropping ccr0_val variable.
 * Updated commit description.
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
 drivers/tty/serial/rsci.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..444e89696310 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -217,16 +217,15 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
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
+	unsigned int srr;
+	int err;
 
 	if ((termios->c_cflag & CSIZE) == CS7) {
 		ccr3_val |= CCR3_CHR0;
@@ -267,25 +266,16 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
 
 	/* Divided Functional Clock using standard Bit Rate Register */
-	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
-	if (abs(err) < abs(min_err)) {
-		best_clk = SCI_FCK;
-		ccr0_val = 0;
-		min_err = err;
-		brr = brr1;
-		cks = cks1;
-	}
-
-	if (best_clk >= 0)
-		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
-			s->clks[best_clk], baud, min_err);
+	err = sci_scbrr_calc(s, baud, &brr, &srr, &cks);
+	dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n", s->clks[SCI_FCK],
+		baud, err);
 
 	sci_port_enable(s);
 	uart_port_lock_irqsave(port, &flags);
 
 	uart_update_timeout(port, termios->c_cflag, baud);
 
-	rsci_serial_out(port, CCR0, ccr0_val);
+	rsci_serial_out(port, CCR0, 0);
 
 	ccr3_val |= CCR3_FM;
 	rsci_serial_out(port, CCR3, ccr3_val);
@@ -294,7 +284,7 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	rsci_serial_out(port, CCR2, ccr2_val);
 
 	rsci_serial_out(port, CCR1, ccr1_val);
-	rsci_serial_out(port, CCR4, ccr4_val);
+	rsci_serial_out(port, CCR4, 0);
 
 	ctrl = rsci_serial_in(port, FCR);
 	ctrl |= (FCR_RFRST | FCR_TFRST);
@@ -315,8 +305,7 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	rsci_serial_out(port, CFCLR, CFCLR_CLRFLAG);
 	rsci_serial_out(port, FFCLR, FFCLR_DRC);
 
-	ccr0_val |= CCR0_RE;
-	rsci_serial_out(port, CCR0, ccr0_val);
+	rsci_serial_out(port, CCR0, CCR0_RE);
 
 	if ((termios->c_cflag & CREAD) != 0)
 		rsci_start_rx(port);
-- 
2.43.0


