Return-Path: <linux-renesas-soc+bounces-28759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGIHDrkYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D991FF07F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B49D303F9C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B657F394798;
	Wed,  4 Mar 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7ZgGzRt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A766381AE0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624004; cv=none; b=r8ADv5JjKba/CjB4lN8eDXx4ifqJXPNRbBwR1w2M5kazIg++CrEkmIUqlryboL8IQk9BUGEUZkfnm0xBPq2sbakLVr7clEpGGphbGXuvIVlxOL7N8QCl4+tCzuR/aO1XG0iy/vR03bRcLKQpHwNWiVsNz1b4qwzHO2n2u1Xu/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624004; c=relaxed/simple;
	bh=7J8BI+Rcemp+dYpWVwgeZFFbGVyLChkGx1Fiw53IZOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COKSYkD0GbdDYOl73h3mBQ1Q6pX9OpGWxSu/+hFg93iOrwL0u7jq0HTsFE6z/be4639rKqq058tSwNGp//bplMmFmxVmLnD//Y0sUeiz4QHscawxd/9nPJ0PVxjQSkzRf5e2tet5pmVdMY3SMS5c5PCVkZ2vLipY4PB1TYi+GmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7ZgGzRt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c944bb62so381084f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624002; x=1773228802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du9uP6OMevudrQRpbTDGPlPaVO3wZDGVzS8mohLVAmo=;
        b=f7ZgGzRtQlvtjD3fbG3OyDbAO/ulW/6bWssmLr1rX6Pnnu2VVxpqkOZszYKdS6z96U
         1ZF1oAvdo13zrcVpfCJXNxJvKN6b7YBvNpWVhpB0Vj7Ogy9F7nRdg9+Zrvm5XKIJxZuB
         gWi7+csSXYNYF26Ege0xNHGQTM9Ohz268PrpX5JKn+SOSFf8zx300wE3FI898FbnrUYq
         SGNDrpvCmb3s4qCOnQ5kCCsjhqoelHXjJRiHFI7jcRKCN3R9l+m26+Ur2XplcHwJ3l5u
         vIZXVDtIIFGVE7Xroa17PyEspqUfD9eAT7X7TGDRj2H9vMTT/Dktevy8PZ8vvW0B1Qvr
         qWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624002; x=1773228802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=du9uP6OMevudrQRpbTDGPlPaVO3wZDGVzS8mohLVAmo=;
        b=kShLGT3rpW88F5iVEi6/7cvv8JMTDUEo06LreQKj8xmKEg8xMN12HeR1Lwe0uN2YnP
         GWsYvhdpyYhb25Cq+QHDb8tVxI7iafIjg+t3rIws7KH3RqAHUnZXs+42+pEtCUYkIYet
         qOa0P1n4rS+Jw6exrZ+zGRzFONCLgyJ0o+gwUN2c6NoJ8lIWIUVNcTGpbaWJgXrb4X8C
         1OecL76ICPUY9IHNqIyeqO5okMUKLjqz3T1k1K21sd4esxBJ82+s6BVMgo4kFIG9pVR7
         BPIQ5Muw2B6Ib5QLEhAjZ1XDFNLeZZI2srgVS4U1iX3UQTIC8fwPerBAxGcGfyLdC6xJ
         q+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvl59z1nNlTkp3xSnkwcyubUzIQVY1Auf7OVlR68zGeV4Xqe+EdIFl9Smz27gQv02zM9AvNjBI8oRyb5UfOuacwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DClwV5CizxOzBIwgT18FTlwPv4vOCHDfbpuhJyShMdDZgoil
	mnav2bb+YEj15K7c4S0ce584zjqyfEU/di+YBgvZ60o/d4F2rbEe7SPzx2n3fq49lxw=
X-Gm-Gg: ATEYQzy9gmQkGoI+YS7vZe+YUrqqrobfQrMWr8Iyo7hB8gmyjya+f1T+2+N8Xv/bnjt
	1KFxlGJZblZmlFrG2T2aJf9r+UXkEiHeSM5TIlZjdpcQq2ZnTjDVJY4lEwD6q3C/s2o87wKg+fJ
	5nllJgkc4KiZ+utJ4M9eBEw45/755O5m1gFhJr4CJhuqUomWmeXOa7v0re6RNkFhq5H2gYxUe58
	w3cjvObkyj4Wg4SSe1OvBJTW1T/vT7GsZMjk5gPlFF6lsl4GMXv6si4nF4YMpgiPJj8Lo03XcMJ
	7Vh/u/PVfn//nHsHmi8XDxWr1b1uumdrLqzuqFLeGD9B0dAWCAA2fmWb/RI0fIckGdV5ZrPUK+u
	OhxCrn6OGtR8EB5KbY8OaL3/zDPRjqD+vbAkbo7Fc8NMJxlT/jTcgke5AJvLiPt4k3T41IOyiX3
	YixNy1DcekhjM6j/jYMFulCP3TfSZpBX8R1Zv1mq0i9RGhReV/gGOgSOMwYxp5xnYyjvqPgFfgH
	LyW2b7yOE8Vkd3+IToumB+EvVl3XEFfkVvXSxrXuz9ea6Rl/jPZlHpHdQ==
X-Received: by 2002:a05:6000:2211:b0:439:b932:b445 with SMTP id ffacd0b85a97d-439c7f98243mr3379166f8f.2.1772624001639;
        Wed, 04 Mar 2026 03:33:21 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/7] irqchip/renesas-rzv2h: Clarify IRQ range definitions and tighten TINT validation
Date: Wed,  4 Mar 2026 11:33:14 +0000
Message-ID: <20260304113317.129339-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41D991FF07F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28759-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce ICU_IRQ_LAST and ICU_TINT_LAST macros to make range boundaries
explicit and reduce the chance of off-by-one errors.

Extract the TINT information up front in rzv2h_icu_alloc() and validate
the resulting hardware IRQ against the full TINT range
[ICU_TINT_START, ICU_TINT_LAST].

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change.

v3->v4:
- New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 444da7804f15..ce7d61b14ab6 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -25,9 +25,11 @@
 /* DT "interrupts" indexes */
 #define ICU_IRQ_START				1
 #define ICU_IRQ_COUNT				16
-#define ICU_TINT_START				(ICU_IRQ_START + ICU_IRQ_COUNT)
+#define ICU_IRQ_LAST				(ICU_IRQ_START + ICU_IRQ_COUNT - 1)
+#define ICU_TINT_START				(ICU_IRQ_LAST + 1)
 #define ICU_TINT_COUNT				32
-#define ICU_NUM_IRQ				(ICU_TINT_START + ICU_TINT_COUNT)
+#define ICU_TINT_LAST				(ICU_TINT_START + ICU_TINT_COUNT - 1)
+#define ICU_NUM_IRQ				(ICU_TINT_LAST + 1)
 
 /* Registers */
 #define ICU_NSCNT				0x00
@@ -508,11 +510,11 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 	 * hwirq is embedded in bits 0-15.
 	 * TINT is embedded in bits 16-31.
 	 */
-	if (hwirq >= ICU_TINT_START) {
-		tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	if (tint || (hwirq >= ICU_TINT_START && hwirq <= ICU_TINT_LAST)) {
 		hwirq = ICU_TINT_EXTRACT_HWIRQ(hwirq);
 
-		if (hwirq < ICU_TINT_START)
+		if (hwirq < ICU_TINT_START || hwirq > ICU_TINT_LAST)
 			return -EINVAL;
 	}
 
-- 
2.53.0


