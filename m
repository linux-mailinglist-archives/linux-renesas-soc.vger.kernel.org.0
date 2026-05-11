Return-Path: <linux-renesas-soc+bounces-32403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCmqOYclAmpooQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:52:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89138514B0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 831D8308F69C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E7E4CA29A;
	Mon, 11 May 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ2Zzveo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4FE4CA267
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525474; cv=none; b=BZTNapqW5olQSnwIYdxbewQCgQiywJr0+bS09D77IDj1vQib+nm7oYRzcYFvB+Fu4UKS3oD154khHZoKvxcTjtnqtwpCP+3V51sFAu2tQSXc3/SUha0JzCUHsNzdEG1/xYbEWoHl3BmJhvBGAcM+Zh/KFssfWr9cfpolD/UeVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525474; c=relaxed/simple;
	bh=nDJAbJCFuUB7OnJXjKjnKvBkXflAc5qn8SUxoJPyYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTRoKYoxjd0AM1A6VcADVdrJCbr/jTLI5/1CD8UKbpj/8y3G4Sck73qHbijIUMeFxaLOXPKwG7XjYOvjXXFMaVBCiQgFh3A0tsKAMjb9rCeAx04uisPONTQ47kTBPToe9QkVzM9hB+cy14rjszg9x7Ygr2SUpxAiQx9Fxv/yhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ2Zzveo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso28889365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=jZ2ZzveoTEvVY1IJ2YGdes/ZtrfZ+Oi9pw5DbzFjU9kA6j+d1PsEiJn6u6aqvs+KzM
         7R19IjFUsajdZNxYHYEhleJP3YRFIJ7x8OHCHGlEuDEQk9nLYDsPa5TTJ05QO5DlD0JP
         /p0MDO/7JtDv5UFR0yTJJmkojv21NbEnIQJ6lOSa27bJF50RMuFZfWinUhNYGoPc8n4b
         uo+CpSj2tgwXHNL9qNQZsgve0P1EqfraqODUUHoMo/OESO/DQ+lL0zlaEalVPzsAZPPg
         /aXgqEG4XTpNYQSlyoA7SfJWSrc9/MSnzdm01DR1gvDFqJUTaOprc7i1Msy2Cwd9fvZb
         g/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=arJxkd5VYXTljik2hwriFWjwdJVmwgWLR5k03mzSvy3tAoQulmvGdDu9gWGQBTcEKY
         emQJa1WEFNUiH9EaS5Io2aN/mBgAbj/HH7UgcpI/SbnAQLGHv+CfkweAZW6XwooTAL+4
         jdO8GRDqg5TV2C9qL8tidqd2FuNFbUXZnAYbkEBFJV/FYLZ3gxDy0i2SReKQAO3H1KF+
         lJw2ruoHZjAloInA8+G1t8etjIuHLxsWnnKGaUvxYcQ4/2Ov9SEjSa8sceSRAbMbrgXS
         Wi52w9N2+GbAY9wLdcrZUzjAPOYHA1zF7vaFv8/LwhN5uDXCYcGTEZzBpGvIkl17/PCO
         O2KQ==
X-Gm-Message-State: AOJu0Ywrxl30pEW6NOPhKKCWmik5Sdf/NAOUHhY9K5rp5AhE2N2K/TAZ
	8XQiYQFOW6/tuYHnBaxp5gGba7yS2rPSCcFsZwOaiVfIjcxeny1FaK60
X-Gm-Gg: Acq92OEvLSEQH9iFAguJ3sMQxtKQnnQLYjJL/WX3fwgVuwRB2PmCZYOD3/RCGl/oF6z
	HTJZlJatEWUL1yr0rL8rVvHsTEJC6W/d1NEg7VFguJFNcbEE/Q1gVUP625F/LQvolI7f+YhWiJh
	h/D14zPHIVK43NrOWb1lyA0h7SIUmOp46uLFbyrD0hGAGykufLdJWfMjLcx7OqRleS2ff9Y89kd
	IkHQOfi/CSWhF8ENUR2o5vpRvWE0UdGZXxGEm4Hu3NaMW4ICwEPh7bzvxIMZx44zqqM4hqX0NSO
	pJLmme6gfqafVfg8kRQZ/xkdZfSZLYeiIUQppJG+JdoPXEaYS1KgSpkeLExToXjpCmiH09WH5JM
	z8fsSdDQrmW0RWb3dOo1I2g8XdueptrGYeWH7BKNXRy6hlxbRgsAlCVeMsbNZ7bbHofS0FPsAjf
	KwrTZ78siOhnRPJsI4cfzlNuSgCFSCGu2mrEU+KqZkOP+ZBluykx0FEXBVVSOt40wUKbLTSCC7J
	cLpOa1+lrjwtPjzW3hqIVDXgHw4IR4M22dE8qH1V1CHsBs6
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e706e0168mr119438945e9.26.1778525470462;
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Mon, 11 May 2026 19:50:55 +0100
Message-ID: <20260511185058.1926869-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 89138514B0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32403-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0


