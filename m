Return-Path: <linux-renesas-soc+bounces-30271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yORvLoEpxGmZwgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:29:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4F32A934
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFA85301384D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AFC316902;
	Wed, 25 Mar 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKD0PHgC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01325327C13
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463339; cv=none; b=Xe+glTj4owbcEJNKg/IH94fS0b8YGWOb/4Nh+V6kQBynguuObP3o1c85azSyZiJ+fxMzAUYC7xNN+8h9Actt8Cbfpm2L4fZky2uScvIPSj0sd9N7vMnDEna/g0hhl0rWvHwyDsNLFcx2GGh3KztNYCoEbIq52/BzFLFsVNUm1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463339; c=relaxed/simple;
	bh=UL+AURT5jtnyYGqcwNV5lnfBTznUkJN4teJpL2nnBRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmZvpcDetFWigPrumVkXgoDyQfXcUV2H1Rxf1v4YTTgjsnZ0a8PfMUSBhrJjWrCwT4ayHq+4InyaSJpQ7imckyVJGSZpi4xunetTt4DaKU8WsWjT0f18IgGkppT4oaU7KKgmw7BuHCfl72lb6lmpudxeHX3USJTBdnQPNJKWjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKD0PHgC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b9675d36so1683525e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463336; x=1775068136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9O2lEmcvtjMRERfz6Xg1r++Ms5MKOHzkz+QJWi+Ruis=;
        b=TKD0PHgCZzTdw5pkh6lvZevpQA36Og0S0B0by4ekbmE2xZIaB3L6IrJEpZConwpxtb
         243k7hMvGQHNshLEBqBqGw2PQ6OMGySau/VfyennzjW5+ulrW8eoKparQqW14yXZyH/E
         GdCYIhXQJAoh4waWFFzgLdOVPwrlUt47/BiAK5mmI0qJuUsxbZIFNo7/WlpBHfpUzfSL
         6qpaFjdUELbP2M7jXRPATcBJNQn8dDimw4LLvrhtft07ShsMT0avLvYL/wGI0JD++lxI
         cFpZtWcveDW/gEo9DFxpAMuwnSqVndSChIoGIbttX2H+vM6m+BOrsRtlXzRf+pdETBum
         /HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463336; x=1775068136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O2lEmcvtjMRERfz6Xg1r++Ms5MKOHzkz+QJWi+Ruis=;
        b=sXHheFfxNtxGKU+cH0GaVaLKE1XVShIB1I5O3UiasK9TTegzMKHMH5B3k46jg6Pq4y
         tQkxDcD/aE+flyTxx+o5Sfoqw9JXxzsNhwddMLkP1pGSIQ7jKrnBKFZJJdI8UDnnltUD
         1aCtri9i7F26YR7Xfttjzbx+sjWgiVrkMdteEvpsJClVmnQtT1RG/z9y07WpmfSVruqT
         EkrHTmnyxwiHl6HkAA2+LfXYWgAU9fHxaFwzgR7ACe22t2jJrX1kWep68Ke+n2llB8uE
         7oO3CJz3XlGSHfjy8IDP2QHO7AFnAFZYYuq8M2yHwDP1UzqSUOQVq+eBoo7+eAY1p0Mg
         Q3xw==
X-Forwarded-Encrypted: i=1; AJvYcCXt1o2eGTJehqEcAiUlUNH6OS/OUSxMuHl7p0zsZj6Et0bgn2WlXgxYVFyd5GesPXzBpPJ/pIwZuspzzIQoENy7LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrF95RxC30f6YPMUwYhThHfokOanusQWLsDfHdOKp90cFZ6HIc
	onIMIsCmxpOhvyyyAoKFaqOmqBJB0TP+B+UBqqQN/0bQSXaAHxbYRcvm
X-Gm-Gg: ATEYQzxnJdzD4k+4TlzyxoALcNQeyrs5eRzSOxZ1XONVK4cfOcEYDvGElZoCaQlcI+3
	P8RZRKpb/W7KTt3R95kbgfXXhYQtL46yP2/g/tOMhiHh0qxKcQ0YfzfS24kkcqN+EQPAiRLGMIz
	h+aqWiktQaKiv2mE1uwhio/4O85JwYCYnFU/WHyd9mTSEYD8S/BbEVdA6VAEIAoicbDBBoLf7m8
	d9iITGXmJxcmxiYeMzt2NJsG9/3KMpQqUEn3RIZeW3l7mYNqqjiDQnQBG5A7e+ALToTLZD6S9Ud
	tbWGPPdD4FVWeJfju7XxNEVHvBhsT6oRmO7+IW5V54MJAjkpwnGsqzfSz4rtYE80NpXhiHCPG5R
	hwaJkA1xMyghjaRFAUDE8GSNJiQGBP2bUi8m5hrkEW3hUWIRlVnm1528Qw0wgwpVnxspH9E34dM
	563X9+xCf9Pm1rfOJfLb14HhEvltm9ARQqt6p8ZUIZNKgOze/N4YLHxW5CA0M=
X-Received: by 2002:a05:600d:1c:b0:485:3fe6:2209 with SMTP id 5b1f17b1804b1-48715fd4de3mr56752805e9.11.1774463336200;
        Wed, 25 Mar 2026 11:28:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871e5ec998sm11924135e9.6.2026.03.25.11.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:28:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
Date: Wed, 25 Mar 2026 18:28:47 +0000
Message-ID: <20260325182849.84660-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30271-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 12D4F32A934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_pinctrl_pm_setup_regs() handles save/restore of
{IOLH,IEN,PUPD,SMT} registers during s2ram, but only for ports where all
pins share the same pincfg. Extend the code to also support ports with
variable pincfg per pin, so that {IOLH,IEN,PUPD,SMT} registers are
correctly saved and restored for all pins.

Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Improved the logic.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..e20d199833ee 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3001,9 +3001,12 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 {
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+	u32 pin_off = 0;
 
-	for (u32 port = 0; port < nports; port++) {
+	for (u32 port = 0; port < nports; port++, pin_off += RZG2L_PINS_PER_PORT) {
+		const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[pin_off];
 		bool has_iolh, has_ien, has_pupd, has_smt;
+		u64 *pin_data = pin_desc->drv_data;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -3012,6 +3015,11 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 		pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
 
+		if (cfg & RZG2L_VARIABLE_CFG) {
+			for (unsigned int i = 1; i < RZG2L_PINS_PER_PORT; i++)
+				cfg |= *pin_data++;
+		}
+
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
-- 
2.43.0


