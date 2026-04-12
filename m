Return-Path: <linux-renesas-soc+bounces-31210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG1RKAGm22meEgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:02:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B053E4207
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB24B303DD5F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C26837C923;
	Sun, 12 Apr 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ4zZV9I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70214318146
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002442; cv=none; b=tCugOcCV3Xr1Z3YY4J9D9+eAV82mXxK+tA5tU4Ynk/QPdoS8eGFZ1XHo8wnPO9t4OyYOKtmgIiT0GYny88JyuPtRVrO4syJ4sfz9JiYwul5E8ODgrBC2VDMCaFCZx2iXrzLnqRWLvg9AeMDSfEpj5YS3wWCf4kMIDoZGUJYGiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002442; c=relaxed/simple;
	bh=3+I/QmdaT5K5uAqSVBg3ntKJt2qnVe2AOfqKzgGLZfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tI6/gYaiYQ7I7OaYZkDsfyGvTtCgxucW7aQOlJuVH6BVcBb+C4NBp74nCLP7llACYP3tnsrfexft8BYZdXubKFR0g52ErqjNLbzoSL0CCk86zAQnXuLhEjbgcoHA0sO3P3NrQxutqvncOk1reM64CHxXvu4FCiAcmNR5p5T/RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ4zZV9I; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d572f7437so2303096f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002439; x=1776607239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+LliZVhUSquTF1adZHkj/J/X8yfecCPswdZw6vA+og=;
        b=cZ4zZV9IuEGP2L2S6dG/j8a9QbLDzSkZPNzdAK5pbdxxOCS78eS3iXPYnG0Xngnhh6
         PCKSpfUoTVq1KZ8vpGf5L4ZaLce5/OVJaW3b1AOLqYfy7NgMAKsy3DBq0rmyU5ZRbrwJ
         +rOQ87bgaEqBtc8neWAzKnc2VG9Yzt1UBAx1sT424UGTIyC+/sbI+peSxX5I0SKazj4L
         bJpfrNinpT1D1fcWy7CZzB3mnNooHH9kFbtDFJ+IArTfrRUV0thJs6nLx1NmxRBD03wZ
         sKFSvf2/Lk0XhNs+B1aqYPUZJEMsOCkJxBnjjF/8JSNGRiJa5MBLheBmZZfSdjlahYeO
         gqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002439; x=1776607239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8+LliZVhUSquTF1adZHkj/J/X8yfecCPswdZw6vA+og=;
        b=RV6kCWxFsOfre2atZ76PRV/rOPzSEiDYfc5Bb9SPoln1xN8ca0om7WP248v4SPyAMR
         c1NYFXrtpvLd5lLRuLepA5QVkSDOtF1sFNOhvh+oPE1lQLDiIZh386lUxSKyTahHu+Rl
         Yd7YHDMe0xxlDUeauW0BePqp6Reg1XyKodjSPTe09ZCcFPtpVgnJP0XgLQnjcP3LaKnr
         SEg/SP+i43Ke26tbB1bWu4Td36OJc7nBLNuzDuF6uMGWN4X5AGrVoHpIKTqmfHYfBx2q
         78QwpI+Xyy6PiXdfXbh4QlG4DJy2f9Gydt1wtAI4ZXyOrW35SDkJxJO5dQLiqV/v+JXR
         0Anw==
X-Forwarded-Encrypted: i=1; AFNElJ8vwnJ6ARB8oIlaOM8RvODkAjV/K9BzRLR6zxdE7KlN5exn+GB8N2ZeVx7bXqUoC8XUD5VMGhBelI14C4exI8kjag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76h4Ntm0xW0sj1TaYF30riAQs2+89xWHrMG0cHREum4P7URpW
	p2RcQxhkS4fzymSDNJYsuh8o7FJLZRAvRRK0rcBeWSt3ZmL3HVTjTSX0
X-Gm-Gg: AeBDievrnAv83+P6zbDgJ2Kvr1phj16Zm2NjA5aHWhBQQ6/lPelU4wicL6a937N4vnd
	ZmRFoEqOPs0JlJnW6HTm7zxZgTFIUae8aP64agomF16w1Q30+LMKRa9USgyt42/TcYNVCgpoWlB
	hX4k40Sg9Zr4PIwg4k3X9CrT0CRis/MmE5TiOcwGdKKsAyj/EaLXsNyNkNuxiuD6fAi4KsC6Z6W
	CSM0IttBQJlj69ttYsBSnjcj2CLKKPR+ADLdlV+Pp+Qam11SGlnH9hD4bdCOsO9O/04ko0W/TFu
	d4OJBAwAI8T97GrcvWBoIBVgDWsr308ed7MdImjAoLvA7LM31sw8Ah9w7ujzoeFFgnA30RWQYfs
	LGRSauEQFLzk85ECBUmlsZm7qaKZRKWcyhGj77WVZ0n36Ug4gvJMdChhmeoCsKwUSqVJdEwUeDa
	5UAw3j58xRkctwmj9XWiEp8mep6TZwCdE67ycF188fVz/DXF47
X-Received: by 2002:a05:6000:4201:b0:43d:7828:1f81 with SMTP id ffacd0b85a97d-43d78282302mr700830f8f.41.1776002438686;
        Sun, 12 Apr 2026 07:00:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6956:2074:5220:4650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm26127538f8f.27.2026.04.12.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:00:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 3/5] net: phy: mscc: Drop unnecessary phydev->lock
Date: Sun, 12 Apr 2026 15:00:25 +0100
Message-ID: <20260412140032.122841-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31210-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,armlinux.org.uk,microchip.com,nxp.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 00B053E4207
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove manual mutex_lock/unlock(&phydev->lock) calls from several
functions in the MSCC PHY driver.

In vsc85xx_edge_rate_cntl_set(), phydev->lock is taken around a single
phy_modify_paged() call. phy_modify_paged() is already a fully locked
atomic operation that acquires the MDIO bus lock internally, so the
additional phydev->lock is unnecessary.

The remaining three functions — vsc85xx_mac_if_set(),
vsc8531_pre_init_seq_set(), and vsc85xx_eee_init_seq_set() — use
phy_read(), phy_write(), phy_select_page(), and phy_restore_page(),
all of which operate under the MDIO bus lock. Taking phydev->lock
around them provides no additional serialisation.

Along with dropping the locks, error-path labels are renamed from
out_unlock to err or restore_oldpage to better reflect their purpose.
In vsc8531_pre_init_seq_set() and vsc85xx_eee_init_seq_set(), the
redundant intermediate assignment of oldpage before returning is also
eliminated.

No functional change intended.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added the patch into series
 * Updated commit description.
v2:
 * New patch
---
 drivers/net/phy/mscc/mscc_main.c | 41 ++++++++++----------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 2b9fb8a675a6..75430f55acfd 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -486,15 +486,9 @@ static int vsc85xx_dt_led_modes_get(struct phy_device *phydev,
 
 static int vsc85xx_edge_rate_cntl_set(struct phy_device *phydev, u8 edge_rate)
 {
-	int rc;
-
-	mutex_lock(&phydev->lock);
-	rc = phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
-			      MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
-			      edge_rate << EDGE_RATE_CNTL_POS);
-	mutex_unlock(&phydev->lock);
-
-	return rc;
+	return phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
+				MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
+				edge_rate << EDGE_RATE_CNTL_POS);
 }
 
 static int vsc85xx_mac_if_set(struct phy_device *phydev,
@@ -503,7 +497,6 @@ static int vsc85xx_mac_if_set(struct phy_device *phydev,
 	int rc;
 	u16 reg_val;
 
-	mutex_lock(&phydev->lock);
 	reg_val = phy_read(phydev, MSCC_PHY_EXT_PHY_CNTL_1);
 	reg_val &= ~(MAC_IF_SELECTION_MASK);
 	switch (interface) {
@@ -522,17 +515,15 @@ static int vsc85xx_mac_if_set(struct phy_device *phydev,
 		break;
 	default:
 		rc = -EINVAL;
-		goto out_unlock;
+		goto err;
 	}
 	rc = phy_write(phydev, MSCC_PHY_EXT_PHY_CNTL_1, reg_val);
 	if (rc)
-		goto out_unlock;
+		goto err;
 
 	rc = genphy_soft_reset(phydev);
 
-out_unlock:
-	mutex_unlock(&phydev->lock);
-
+err:
 	return rc;
 }
 
@@ -668,19 +659,15 @@ static int vsc8531_pre_init_seq_set(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
-	mutex_lock(&phydev->lock);
 	oldpage = phy_select_page(phydev, MSCC_PHY_PAGE_TR);
 	if (oldpage < 0)
-		goto out_unlock;
+		goto restore_oldpage;
 
 	for (i = 0; i < ARRAY_SIZE(init_seq); i++)
 		vsc85xx_tr_write(phydev, init_seq[i].reg, init_seq[i].val);
 
-out_unlock:
-	oldpage = phy_restore_page(phydev, oldpage, oldpage);
-	mutex_unlock(&phydev->lock);
-
-	return oldpage;
+restore_oldpage:
+	return phy_restore_page(phydev, oldpage, oldpage);
 }
 
 static int vsc85xx_eee_init_seq_set(struct phy_device *phydev)
@@ -708,19 +695,15 @@ static int vsc85xx_eee_init_seq_set(struct phy_device *phydev)
 	unsigned int i;
 	int oldpage;
 
-	mutex_lock(&phydev->lock);
 	oldpage = phy_select_page(phydev, MSCC_PHY_PAGE_TR);
 	if (oldpage < 0)
-		goto out_unlock;
+		goto restore_oldpage;
 
 	for (i = 0; i < ARRAY_SIZE(init_eee); i++)
 		vsc85xx_tr_write(phydev, init_eee[i].reg, init_eee[i].val);
 
-out_unlock:
-	oldpage = phy_restore_page(phydev, oldpage, oldpage);
-	mutex_unlock(&phydev->lock);
-
-	return oldpage;
+restore_oldpage:
+	return phy_restore_page(phydev, oldpage, oldpage);
 }
 
 /* phydev->bus->mdio_lock should be locked when using this function */
-- 
2.43.0


