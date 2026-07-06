Return-Path: <linux-renesas-soc+bounces-34779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a+ZJKkIBTGoregEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 21:25:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF2714F05
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 21:25:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A1GLNsvf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FFB833B0296
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26CD43B6E9;
	Mon,  6 Jul 2026 17:52:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734843785C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360322; cv=none; b=TxIxgJ4Drp/35vT92stCi3YNAin9CqWLg3l5EI3zNyEvero9kzmWuxHjuvI9+9MFi8DlNzSZMtKcjwbpGNT42rlZuPcabXLZ0bPKSChswIs2WWKFfGhwEvnsk5k6nqTb/28c9O28luyFJN9yYlFeOC1lSvYwHbpqBVRoC8G3ukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360322; c=relaxed/simple;
	bh=QMah04ZBO5ZXVgG9Muakhs6OxD/VtMaqtNEOgvvADOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyUZnCSk2uZfJVkaQ+A+cAOpjcMzJ5pEDpu2eE3QtmDvpZyLeMGlKQ4YpgKxAqELJmQWln3lgllPLW+rXMOfoAdlSWOZ22vhI7f/uApWozfSPwRLCqmN0Zp7OkldUNXVEXO7PHUnE4I4w0ynwAI3F+0jmF2BwqIzTz3h4fL85Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1GLNsvf; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so24203625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360317; x=1783965117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/fwXpI6iIGxV/MTqyxK5kkeBD4l82eYDyYr3TZjkyA=;
        b=A1GLNsvf1RsZWWCIAdckrjs/x5Xk9+qJU5Te3KnDsY57CSGR5IuTZcfXZ597erVKCv
         yozC6HduAzDM4hhwpLoMEhhX0+g5BjUMiwmpyfZnStsuYgPz3xuCsmytFCUEQhXI1dLE
         uQTFHfDeFfiGx5VBnRyrMdbRqpbUf6KAPsTMhuLlUVHknDNvPO9C3Xg25cz6GYGD740j
         V+jXA+WydLnvM14RVhwJ5efgsy83LqbBItmH4MOtrP31BZ9NX+WlMcRG+EGSn8uVIrsW
         +KF6pmWpCUpQoU5b/IeNpA7J0kpLB7Ozirk3sM38GCPZabHoucWvuhIPizT+eQ48s+pV
         8RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360317; x=1783965117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/fwXpI6iIGxV/MTqyxK5kkeBD4l82eYDyYr3TZjkyA=;
        b=ETOuU509tJHP7cpqiGphbB8jocHYsPMDFWfc0gmOjf2HGhhFoijgIYIT70w0KfPLN9
         IkQ8bK1xQia0sL7ZOFGSle4CMGMJNcOD083HLoWvDUW8UOHTyLAILmXK3deLU9o0B8c+
         BMNe1K/iAAU/z5n1MeDq0C3A6l4zFOukQBDSbWixmOcZYR3OD9d7w8iO863oqqyXy7t3
         ish3PUi5NUQGWnw/AqoRMNYHryQEXhgd0USIu6YVcaSDXl8KZD5I+gZ83IiERSTN2I9q
         2lVNwSVRmtV1z9FB6WqM4B7isHJ4h90LBl1GPQv7nL0oKLGG2unEh6huTfguf+Ajn/Wg
         Vnxg==
X-Forwarded-Encrypted: i=1; AHgh+RpM4dHm6PbCRE4M52bjDX7J9GzJp8RuXxGdgpZl9q7a4XXinykP49McuD+T0gv2yfaZi3LRLl7g86lljRXQKTwELQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25uFFtOh4mRECd2DCRkdFwF5gL2HD72UyqQavYRGQZ1kQjCqV
	x5ld1ZWHzKJn+KWlvJSY9U/gdPzwfQN3M26oOygrdhoXoGqWgIUig50m
X-Gm-Gg: AfdE7cnpPV0PFn6OYuTepZCaYlPKqTDzDR0FMlfzEWp6lInNUgsL0kLZP1QAAJHBo1b
	oUDAxA6t0tmLMdidT+MY4X5FmhcW+ZZeG6zR6EtehS/u25ALKprPPzjBnVisooTEWPxktqWTH5q
	YSBQ+x5B4HinUlkuHpNU96PkHJHpsl/3VLivUdTS+SDhOdh3+eBeW8LWeH4WN+k0wX9O70mC1nk
	EBilfoIJBbtSrLeLLWkc6GMJ9uH3kU8SlrCPotovrAY+KAY1FrIZj1yThcA02sWGP3VUb0aB6KA
	+f0OaiomYfVytyWnHSuQ9bygXt6NeZk4sPEjAiKU8NWj5HEluzCj5io1RT0DSkh3/M7MOMTSx46
	V63LEuwNhRONZpbZb8S7YBGfqBaJZ2tmgK906NxyjgXNQVVtpsmJYlYlgaK9S/emBGIm3AidaN+
	nB37chCuhTDiLPvS+EzI2VUYDSWEyaO+0VRmPHfZTSVn/Ivq3p6iI85WsvDtSADLGGucmeVR2xf
	KSDY3NK1dV2vU3nbQQ5s9AK7kgKLiyR8Vpvmw==
X-Received: by 2002:a05:600c:a00a:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493df038767mr18739685e9.2.1783360316953;
        Mon, 06 Jul 2026 10:51:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 10/12] rtc: rzn1: Consistently use dev_err_probe()
Date: Mon,  6 Jul 2026 18:51:36 +0100
Message-ID: <20260706175138.12587-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34779-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DBF2714F05

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 27a92c77f071..f6272eb5a896 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -482,10 +482,8 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	spin_lock_init(&rtc->ctl1_access_lock);
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
-	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
 	if (irq == -EPROBE_DEFER)
-- 
2.54.0


