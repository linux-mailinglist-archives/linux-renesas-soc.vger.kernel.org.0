Return-Path: <linux-renesas-soc+bounces-29560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMhFA8YcuWm8rAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:20:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 321002A6811
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A9A1303933F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3878E1DF742;
	Tue, 17 Mar 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKXKWBWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5E37F759
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739042; cv=none; b=EqNTnTiaCwu0F/lBc4yM31o6XaTqFZCfnTOrirCU4SXuZ0WKC4n9x6c44zOrK0CziJRAaEhlXIe9WBgjq9k2/1o334KzeqesY4piSj1W2I2tc//kIqe+4SoOQN5iqTkWzvGpwikWceTUj331oTIZucGPkfRdkoDWMLNUEfQEgaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739042; c=relaxed/simple;
	bh=Aij4QSJbc2SHAAPiNK0v2C11MArAEMRU80yQFCpR3G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m71ok3I1q6FpRwjlfOH/JHb4Df6Vb0iTi8TvR3tMZDYIg7CKOkPti4j4BT3CoD+6cpFUNi+cOxcvtaOgA05m5e8645bIcKmJCfpGTa1E75ZP74nXzwXMrWQEom0yPGIKwYLW4N6w79xgzM5bXBQ8uc9quf822RAsi2Vyw/zqZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKXKWBWC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48540355459so52484805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773739037; x=1774343837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYRJV2+dt7vDmdQuBVN01b08iS8nDG5cKKiaKd33MSU=;
        b=WKXKWBWCUaikIYbdNje71JunXeIbmHQlSWKrKIPNjz1Lpay3OsGq+BoOaNGPnpahLu
         fcFGqWzumXHz+jq8m5qLeo32CuSBCXNhQ3df/zCjnrdCeMZ0WkckLwb4M0zvUsPfRJLT
         GuVwkse/cqUVwZc9jPEn9TTQbkA1h5RtiQwyyKvTtgZ1nIN6iL2OdzCCbGOmmDZEmuzs
         +DVPnuXNPmZjtSEXRrU/MruMpI8pzeRGNTal3UG7pp6CuHKnwdLzU02Htaq1wYwC7t7s
         6soSnQDSGZ08EFMRwx242jkjafkbu7fsfBNSvkp1+89K9T1fwjR/i36dIIg1MRk2HvfR
         9/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739037; x=1774343837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYRJV2+dt7vDmdQuBVN01b08iS8nDG5cKKiaKd33MSU=;
        b=N62L9lfZiCqVx2ny8iXc1IRzL0laLGvJ+jtivVxlaD2JWc/o0forHFqhlL+GIvXALo
         TSwRyC7pld4C/nfTiK4QO++TUFmyGy3wlkEUMY9blW11aEA9EYrihVJFBdvIDQ91Okyx
         /5y5WFNsu/btwc/oZwbfW0hVU+SZNzzK9gfxfdSCX2adAroMEfBw1BnPfpXsTEZ/dKWx
         F4kwCsWzU6bSMYtzyvbNhcFPMZGJwgrizMm72ItOYlmeZE6RYs0GWPH+++sSwzE/egAF
         XRbW8v9UCNDTB73iycYaokUjF9NUzN3Wk0oE7rAchvK1tPSM8WPHWLFO/WmFPawkJLP2
         D39Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhxda4gwEtScMliHbLVtBp9Q8P7CnxZ/jPVKdt5TzEgN1syyeW0W61OgJqquNLxUVPVs5Lky9jr/MOG+MafM6NAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kFBZlGMmdE8yzBE74R/VQ3x5iTy8rXQ8iDgYVFk1/XlexLbD
	DJK8MFYsIuOLR0TLBp5USkCZHjMv78u5zVK4cdAkt5EIa2+cVxOLg8no
X-Gm-Gg: ATEYQzzHxmexSFWWITJguJ8SWeV6b0s1JII4gZtueXb0ABmXyKV4xe4n630qH2lkhOj
	Q2EqpQbwt5bd4FyORfMu6k61LbwnM6SL2RYS29hzvAv3nDynWKKrs3L2B4z4YcHpvtSxfYq1a7R
	mwtqrjSo5gD8Ho6/1aFRfNNSiZ31iOmxUaDkJEOrnX9ejZ/Zikvkr3TAM6dbaRUNA2uPx8GyOGa
	7K6wSl/jWes6vh0vw0dcHO5taeYQGAhDmY9Lid+THSAINFMf8f7thqaLZ9CslX9lmBSpANw1uGD
	LyqNbf/OuMcx1CQ6sTGn9nnd/EMUwgPKnkYGEDbvMp1jN0T0etCk46gm4yltvecW0G3abqZSd/K
	C9/PpVkNiHux2ZIOZlxYDCEUqg6dvP7mdIm5GVLBNp42yuIFirnf/ROM0QBMhJuvl8xQvdzTdmG
	3G6P0laiGgQ6YA4SlUfgt1+fvhi19dxewkGkDlJpxk3MPrDZl/
X-Received: by 2002:a05:600c:4ed1:b0:485:3d43:7c9a with SMTP id 5b1f17b1804b1-4855670e6dcmr282009045e9.25.1773739036875;
        Tue, 17 Mar 2026 02:17:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3d427457sm27555028f8f.3.2026.03.17.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:17:16 -0700 (PDT)
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
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
Date: Tue, 17 Mar 2026 09:17:12 +0000
Message-ID: <20260317091714.141179-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29560-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 321002A6811
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The driver uses rzg2l_pinctrl_pm_setup_regs() for save/restore {IOLH,IEN,
PUPD,SMT} registers during str and it handles only for port with same
pincfg for all the pins in the port. Extend the code to support the port
with variable pincfg in pins to save/restore {IOLH,IEN,PUPD,SMT}
registers.

Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..3e5436acdbbe 100644
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
@@ -3012,6 +3015,12 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 		pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
 
+		if (cfg & RZG2L_VARIABLE_CFG) {
+			cfg = pin_data[pin_off];
+			for (unsigned int i = 1; i < RZG2L_PINS_PER_PORT; i++)
+				cfg |= pin_data[pin_off + i];
+		}
+
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
-- 
2.43.0


