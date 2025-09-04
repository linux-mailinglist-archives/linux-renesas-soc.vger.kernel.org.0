Return-Path: <linux-renesas-soc+bounces-21332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACDB43A88
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7066C5E1A7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3864B3043DC;
	Thu,  4 Sep 2025 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eICCTkSX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353C302CA5;
	Thu,  4 Sep 2025 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986146; cv=none; b=P63XQ7yR14uJeXjPSQH7xjG5JRhVrkVsEI+2Uupmzq5AiTphQ6kyrUWrYlNNfhqnbXORWKFkG9R2zQCbX/67wMPR5yGEBxbw/lzvdWdtyyWmyyqIEaDvfQ+SLsctd4/IH9L+Lr9i22/j9TjmIhR4GyuVdjn+IOVuNsLRY4GcBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986146; c=relaxed/simple;
	bh=eFODHS41jGkqjrhxq56OXpjb15eDwVOmG/RZDKiylZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTjFyhYZJuoeIIdSJDpHh7wvTxDeWDj8ubxTcPYRerT+fbyCFCcmb7wKyZu+gx+nvnEAkQRaEDyv2iYbIMEBh0cXoVz+ljSb818/TmE9fgmWIMs3GXkn8y9HUMILG1xNmulbev1ietFLGMb9aGxqVkGvgIJetq6PQA6LDD7JRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eICCTkSX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so6812055e9.3;
        Thu, 04 Sep 2025 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986142; x=1757590942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br/GeUSBxQ4fkBRlP6Rmc7sRyHBnT6q4apu3DwR+X1M=;
        b=eICCTkSXkvoSgi8xr8q2DAAtqtpTi4rl5Q45Vba+SLdVhEYq/cd2tl4M23YeaPzPAi
         7T0i/3+WcdONKIc3jx+3E7jeKkLlUmJ2XMEoLg0Pm8Ukf6ExHIts9Y/bL2lGOgHI6Xko
         I2fLKZDjMce6exsoLexUVC6rUjRRa17sIotkauOhLTdF+Q+yJ7FacmIV9Gvf0CZ2CQ44
         iIJnybMGZIFsKO5+H4ZZ8DBI+0+BvOrgZWiyCvzarXUQDlyZtyo/8jDCZxgWtxIubxpL
         1CEDm5P4hJgLWNEAMm4nuurBB9RQ7p7aTGc8BoOI6fLHrucFE9jFuHeCFfQtHmEsr/Lu
         xUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986142; x=1757590942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br/GeUSBxQ4fkBRlP6Rmc7sRyHBnT6q4apu3DwR+X1M=;
        b=TffMIlOlRYH3i4Zk4XY82YtxqOgCYtzWA2L/rTRbP6xhgkqXbU5Y/KwxNfxjoNEdbN
         50BGWKMLZmvMHay3IQa5/CWRO2eNz2+Zu6hS53DDzau2CK6/cy9UwFAKsWIvPJLsWGc7
         5ODGwc1GWTaV1NzooiCS+FvC8rTDj1xruXGBEutEOdfh/vVNZIcAk+iIAgPPrXlVG/JS
         pvvCqcJdq7ZyyWqbYosuY1YvtKPucY9MMwldbJV+3jv3xNNu/stNilavhqhpc05gXcCF
         ENSVdYEjTDMVOACqPBpQuTsdmGPDXlJALmxepXSwCfCSgTW1jH52esjHjPP4X0pWoe47
         SPmg==
X-Forwarded-Encrypted: i=1; AJvYcCV51T8dFBsuMieTpbkKZur+neDlfZJyLfjSka5zwgJjAGh9ffO75784sitPjK51lJKnS7gnm39BzF2u@vger.kernel.org, AJvYcCVeC+w2i8wgV5IAGqVIXrdkA8g4y4T5euWM+zvwu7kjXGfxAYFUADvE6I1QWrMW7RbryxAv6P5OhnZBWxnc@vger.kernel.org, AJvYcCWRdG0NNmc/6flyJMoiBXpZp3TMrBKvTgUdWyIxD2A6BTi42GGtQPfadW9S28yD6oNBgr2+CzTo@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvNNn85BZM0AllIZKYjQ6d8eesI9qSXUw3qtm+7fUBv72OYvH
	nL8kckcw25uvW5Yc7xDmt9bPo1AcmOdW/BSLkL0OKlu0NgxLrrmmQh2d
X-Gm-Gg: ASbGncsI6T8p//Aa99kgt2ejLsr7t9gHmZjMR/zk21YxBPSaNTsBqbvPE9Vxm+6NvBN
	FaLek/7Qq16dXVTJoUIGoz5RMeUNKxl4FH3531r2PqKvfZa30DA6lT4ZJy4Oo3RtzWUZOGskFTg
	oBQDdgpm1iEcI3gK5dIg/l6tJaTGQq6DYk1mjptnoM57xnHzIN2Tpp7eP+w4VtOvnukEWaaHmW4
	l38jMooRfjl8fq4g+YqEhaQdbN8F/bEiVSh/y4sA5krc66PX6XLdqMUfzOA/jTvpH9mGqu7LNbU
	dboOvs52BMJYXWV0cklrNVPPQKmTwUlxBjBQWEPZOFHM7c5uMmSJ5NiapvnRapkw6vLoEUulwEm
	S0GUJL0si8VJ/e3cVhZqDX+UdtzpdE4TAyEFikiB+0ZPNkHe0sSHQW2eqIw==
X-Google-Smtp-Source: AGHT+IH1Rhds8wPr7vv+vRh/ADNHbNFcCaz6Q3slnA0Pgm5E/DJb5tc8jwVNErxClGjf1vFCWql8mg==
X-Received: by 2002:a05:600c:1ca8:b0:45d:d2d2:f095 with SMTP id 5b1f17b1804b1-45dd2d2f316mr9984675e9.19.1756986142386;
        Thu, 04 Sep 2025 04:42:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 8/9] net: pcs: rzn1-miic: Add per-SoC control for MIIC register unlock/lock
Date: Thu,  4 Sep 2025 12:42:02 +0100
Message-ID: <20250904114204.4148520-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make MIIC accessory register unlock/lock behaviour selectable via SoC/OF
data. Add init_unlock_lock_regs and miic_write to struct miic_of_data so
the driver can either perform the traditional global unlock sequence (as
used on RZ/N1) or use a different policy for other SoCs (for example
RZ/T2H, which does not require leaving registers unlocked).

miic_reg_writel() now calls the per-SoC miic_write callback to perform
register writes. Provide miic_reg_writel_unlocked() as the default writer
and set it for the RZ/N1 OF data so existing platforms keep the same
behaviour. Add a miic_unlock_regs() helper that implements the accessory
register unlock sequence so the unlock/lock sequence can be reused where
needed (for example when a SoC requires explicit unlock/lock around
individual accesses).

This change is preparatory work for supporting RZ/T2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d97554e203f0..86d4dccd694e 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -155,6 +155,8 @@ struct miic {
  * @sw_mode_mask: Switch mode mask
  * @reset_ids: Reset names array
  * @reset_count: Number of entries in the reset_ids array
+ * @init_unlock_lock_regs: Flag to indicate if registers need to be unlocked before access
+ * @miic_write: Function pointer to write a value to a MIIC register
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -169,6 +171,8 @@ struct miic_of_data {
 	u8 sw_mode_mask;
 	const char * const *reset_ids;
 	u8 reset_count;
+	bool init_unlock_lock_regs;
+	void (*miic_write)(struct miic *miic, int offset, u32 value);
 };
 
 /**
@@ -190,11 +194,25 @@ static struct miic_port *phylink_pcs_to_miic_port(struct phylink_pcs *pcs)
 	return container_of(pcs, struct miic_port, pcs);
 }
 
-static void miic_reg_writel(struct miic *miic, int offset, u32 value)
+static inline void miic_unlock_regs(struct miic *miic)
+{
+	/* Unprotect register writes */
+	writel(0x00A5, miic->base + MIIC_PRCMD);
+	writel(0x0001, miic->base + MIIC_PRCMD);
+	writel(0xFFFE, miic->base + MIIC_PRCMD);
+	writel(0x0001, miic->base + MIIC_PRCMD);
+}
+
+static void miic_reg_writel_unlocked(struct miic *miic, int offset, u32 value)
 {
 	writel(value, miic->base + offset);
 }
 
+static void miic_reg_writel(struct miic *miic, int offset, u32 value)
+{
+	miic->of_data->miic_write(miic, offset, value);
+}
+
 static u32 miic_reg_readl(struct miic *miic, int offset)
 {
 	return readl(miic->base + offset);
@@ -421,10 +439,8 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	 * is going to be used in conjunction with the Cortex-M3, this sequence
 	 * will have to be moved in register write
 	 */
-	miic_reg_writel(miic, MIIC_PRCMD, 0x00A5);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
-	miic_reg_writel(miic, MIIC_PRCMD, 0xFFFE);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
+	if (miic->of_data->init_unlock_lock_regs)
+		miic_unlock_regs(miic);
 
 	miic_reg_writel(miic, MIIC_MODCTRL,
 			((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask));
@@ -625,6 +641,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_port_start = 1,
 	.miic_port_max = 5,
 	.sw_mode_mask = GENMASK(4, 0),
+	.init_unlock_lock_regs = true,
+	.miic_write = miic_reg_writel_unlocked,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


