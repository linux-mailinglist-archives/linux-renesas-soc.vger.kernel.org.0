Return-Path: <linux-renesas-soc+bounces-28438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGbqMGnpnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA0818B051
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7AC73156857
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933E83ACF16;
	Tue, 24 Feb 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvYwf+kx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07F2C027F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956021; cv=none; b=Yi33hni1Wwu6SfYd+p/pMkZZCM/2KcRrFB7gTQwIlKotSbVOIEddnEdUXQ6UgkcsbJBPcWGRuntxcGoba4Asi+eQ0QFu27ySCtUM2N7rkpqNRGP9pUORr1DbruAQjRmiuwhk97SRWTsnACi4IO7LWFs5TVNCfoiALoB+luk6Gbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956021; c=relaxed/simple;
	bh=KjNIxZDfk29h3mR+MAD58T5ut2z+8tDAomJXGU4ZnZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB9/66E4893GNEuA6X+58sUlhaLDqp4x3N+Tu507gjIS1yAnWs+7cQPkpoasnR5IYy29hhW2CMjwoGetrINXHnF2CsiXq4AvpgecCLBStvBM9z/9R1LvKWb5m1EvB2VKbHaryeH9Nsz9BreLWgCcexPBwM8Mvs7ubbvppZrVkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvYwf+kx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so55934935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956018; x=1772560818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3LGfWf9S1gCHsjzZpQUDOMcNhfS87CIOBQtN1E+3ZA=;
        b=JvYwf+kxZHX65gPDk5p16O1vjIZlKezFADSREK4291uREHfKVwOa+ODX3tSfslUbSZ
         FBxw2CBiSBK8Nh9EX5zGMx/ohK1j58uM065zlY72lyDjEwwUJfA1LkoeH1eexG/Agexp
         8gC1VsNpfBxvYdNN+FnHFHal3iK6QTGvoj+M9t1jVDCo+5hYzjEm+PF7dKH43ThHb35Y
         OtHl83YrGalmL4H9H5D4gFcc8ppueeG3Q2f3I1jij0OLkSJXJUjWMDLAa47c1HkDnrDJ
         4hpa2bP3TGdyyBvF1JEKZTUL1hGXt13kcjB+izSyD1hDRhq8n4Pw6pPqgxJsQiJy1uFK
         tFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956018; x=1772560818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3LGfWf9S1gCHsjzZpQUDOMcNhfS87CIOBQtN1E+3ZA=;
        b=e+gpxTqEyiq2AKhvVTg+ns58Bn2crVKLlsBvP6W+uCIPxOyHKLk6JNX54Zz62tlPKK
         T/ChRSe0p6IYrLEqgIWTM5RQXI59UmmwZhB0/XOyk/vRe81EOVaNL1aVOI+CbmloScjx
         moDBj7kY/6DDKyg1iVD0NzUd23IH6azE4JrbKBvibzSfJbNwCjDxC2Ao8NWx6+lBG9j8
         +Mu01G1VlbKyE1GZMcw3IDjy7SuSM/4mJv/mcxlyB+GRion4SclNNXvnAKj2nkOPZfC5
         1NY3wyo9SyOLp728Y1+Mlh7mdBjM1xuBSimGBpkkGFJIl/FwMhbGaU2kY+3lUhq2glcl
         KDWw==
X-Forwarded-Encrypted: i=1; AJvYcCXG80z7Yrj+hGOoNUZqOPPcM+Ng4Wa2EmxjRnBbqXyb1AsU2L7TBk1MQB6/fNQ1yVt/TQXnUrvuD5MDADn05Z1lzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIvo/XOfmCquOrr7/5HPkpC1JkeE+chwSMoq3udN2f7mQgtLn
	i4ttR/R7S+Jv8nTFQtaL2nueI3Jv6vmpkZL8jdgmtkgMIrscBdizcl+N
X-Gm-Gg: AZuq6aLxLAi3fFcP/KGro6dkaDHMi5prKxuTcLOoPu52opWrpA8i42otUw6OdpBR0tK
	ODTA4/xZ4Fje+CgWskeRA66AhXefFSBOZYvk1OB8rfPtBECiqA07Pdq7G8qTys/lNmTkmMkfh5+
	8Gd0qkdIKWaaOs/hVOZvZYFUr3Eu0I6/R1zDtzSVWSN5Zfia4S+Azbj6R+sHroXza51akVc/d3q
	tMdNmdjYtwkXOxiiauVCjFlbKlO099Qig7unz1azWu+rIWuV1EHo7aiKzgeZzbzYeSvsXf3wQzI
	0GCWuhq9g0mspW8sJSuyPUEySV1s9Dfvds/jGtKPYvxPZalAqFC6xX4qnEOLdyEDfAtaEcr9UO8
	23AEFI/fsD7e+tLdElb2l3wZz+XeKaus3kgcR8ewMkv2U+AubOm35cCzBfHrbqj67WiKfY/kNTI
	9eQ1AIiXbTWP7OGMMElGNKrPwXcvTjmGCvOV5cZ9ayrzMy0TZD9l/Wjn/WtDLMDmKmZRjw1sPe7
	wUkmCmbCinNeqkB+FholeNJdOcmz8Rjd5UPge75JhbglEyvhMHDkHtB3A==
X-Received: by 2002:a05:600c:c167:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483a95e9643mr184763575e9.19.1771956018252;
        Tue, 24 Feb 2026 10:00:18 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/7] irqchip/renesas-rzv2h: Clarify IRQ range definitions and tighten TINT validation
Date: Tue, 24 Feb 2026 17:56:15 +0000
Message-ID: <20260224175618.3160270-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28438-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5FA0818B051
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce ICU_IRQ_LAST and ICU_TINT_LAST macros to make range boundaries
explicit and reduce the chance of off-by-one errors.

Extract the TINT information up front in rzv2h_icu_alloc() and validate
the resulting hardware IRQ against the full TINT range
[ICU_TINT_START, ICU_TINT_LAST].

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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


