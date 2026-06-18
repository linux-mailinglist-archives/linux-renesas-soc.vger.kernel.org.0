Return-Path: <linux-renesas-soc+bounces-34213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t9b4DRo3NGoLRwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A25586A21CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZWYMJoUT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCED030799CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECC13603DF;
	Thu, 18 Jun 2026 18:19:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5F42D0615
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 18:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806798; cv=none; b=KY0XQzcO8SCIbSP89ciFcgSCN9Ig5vSTradMNQyN4zmoCm74wb4ZyLvFuFEynvCLJ0i7erq2gbXUDPHCN3Ckw8DlSc7MH7JCp3A0IS/GHx2Rg0PI9BQBdh0aenUPvqx/Rj7kzrPi10a+hTrrf1a2iHYNZqlIKxQonK1ecD8S6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806798; c=relaxed/simple;
	bh=b4B2aAPXjFcZm4viQ8VErxMoAUkUXzajX1LKhP9+dGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTxKipXD1esapR6TfdUt4Sqi/TI5/Ml6njwFFugqB51YjxNkEDVwDXE6DMGBgkXtEMU97AOdsFBuPJhgIcYpmDcANHFEJPBMEBTPjza0rDrkyvULqxiqhBRmtaxw1T15XpYuHDsPOWyF8q3ZGIvM9QFUEit5m80hziqybR339Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWYMJoUT; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222fb062bso11629105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806795; x=1782411595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je+bUAIFJJ6yiVa2DEiSRqaNrFgeBh92cBnao5ZfEsw=;
        b=ZWYMJoUTdljLj9kmLpels4RuXlDpJ3sBgp8xtiE4HO6npnp9kIgnGCuNyr3Hs+Ec/b
         bdQThxXNvyOlVIo74TFA/Mf2Sc2tTGalKwCVmmfNpd+IlaVQcWe4T3H452H/FM2mn/Ep
         ieDLjLdlp03vaOQEthPQu/ZwdekZBcsvN3ogUcy2VXpY+fdWVW3+hHrkbQsO+0bUVZMi
         ArD3/9OMPMhlFzpC13Oy6wx74kxzvZGA+sZiFpasbrNib4RXB55xnwaaWisxADBBz0nP
         Ara/zH5/brXH8e48edONgZQw5JVsOSmL8vSteuyX7DeOdn1xRQFuQVyLiQF6ihc7NDbu
         yRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806795; x=1782411595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=je+bUAIFJJ6yiVa2DEiSRqaNrFgeBh92cBnao5ZfEsw=;
        b=SGESMUeTrJNetTXZhV7f35EJt6yBSsTjAMUgbTOuq25qIy9h4Vx9lPWM/JJciMxyqa
         p+113QCAhSIYo/R+JgbAMUtT8dYOH3ZhyoaX+SiaXTR1HadrXbom8S2rhdKh4hd9dCjW
         v0+aYz+mWXfzOgJllDq7UXrQS2Qxco6MsQvOIsIANrgif8VNBnBXmricj+JfAyq5zbfo
         bUGezctf2kd+v33rRzPEAAW989+qf7c74JASxIHTVgBYQgUPVySs+sjddzhqcPE3Db77
         tQ/CT8erMznYJkRjVMRK7HQ/2cOaHp2jHv/hcEfnEwQL5anYMbUKknJ/R36CnwXRM3K9
         /NWw==
X-Forwarded-Encrypted: i=1; AFNElJ9IYobPt8/fSR7QzWw9cGMLW7aSUbapwA2fpb7R2RS6TQre6G+1xV3BSlJNvNUQemT9wDlkchTblOu5YSIQ9bdHew==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxz5xzyngot5KxwQt/lNHsyiwq/rHNgUSu9FlFtxW7dgU/HreD
	7daBz12UPNfHoNkH0kqYbQgnVgHNi764BxLE8kTv7N435+4we/OybGkm
X-Gm-Gg: AfdE7ckEbFnP2EqcG4GHAp1tojKC5t7Afa7t4D4jHr8zxzeKfbjWQH/uCf41WQJAmNA
	oMdTI/NnnZ8mvLnxosLzaklWbxoaiIEYvJKxpQbKT7fJq7fT/UxOGrNn8tBQc6Dby3lOSHZB/FO
	q98DrpXn/kbTfeDvfo45YKVjF/ZobPrh4IBEVEYje5/K3WKqICASBGPZHeCG3g0z/KucPtljvHd
	118jpxTAG7stEWtFnuXs8gX80Mvz4NX9zaBjqvFmUWSpaQCGp13SNsbQL8L5YuEQKxzXodzLO69
	dOlW3n+Szpe1CIRjsEU1zAfXSf/R0RdfAcJbnPQQVmfRybukYzoMYNnGWiv0yOApa2O3WrPP3H1
	eTdUbWGRcz7tM/7yXeasft8SaOGTPtcR+QDi9M/C/gmWbcB20qlB0VjnHuuzqtqxYrEJCZn2uO7
	MqQcujzFMR7HjPkZZZvjdsXzSF4MOzCpxwni3XPCwLmEoAHfIvAlw21X39HRPZLxkUKrQ841PLA
	7GUbKmmsgbfXE9J2ztoo6LNgfYqs+LYbWbHjg==
X-Received: by 2002:a05:600c:205:b0:492:2fa4:2563 with SMTP id 5b1f17b1804b1-49240e9a7c4mr149795e9.25.1781806794628;
        Thu, 18 Jun 2026 11:19:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Thu, 18 Jun 2026 19:19:47 +0100
Message-ID: <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34213-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,microchip.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,glider.be:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A25586A21CB

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0


