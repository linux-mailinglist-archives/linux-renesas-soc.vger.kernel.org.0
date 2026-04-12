Return-Path: <linux-renesas-soc+bounces-31211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPxxKaCl22meEgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECF3E41BD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBBA5300462B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9E737CD47;
	Sun, 12 Apr 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUff0ua9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936A37C0F3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002444; cv=none; b=PTRHPqfB/MBuud6FCNI3ADQL8RGPo1o/Xba1mTMKzgyc5VYqEAeje2JHcV4xYP8dqi+n4URErpA1puP4GRmP+76xAnHRHTvo2GI7RoR8tA18bWo5UjoZLxL96YDefui0jWJr0Rnd9Xs8Klgvj4ybevoo6b+Ns/R+sZbd2FDPSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002444; c=relaxed/simple;
	bh=O65OagGdcA16yR+KSOfnD4PCfCavizX1V42BiBKUV8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SA3zOy3bbpBHZFq9R2N3MbmdYKLzhpWW4AM7wsGuoWWbP/Oqh6QOKYA04RIVzvgVFsksy7VkDnsDsR1Vfu7gpTcZdynu2lHxOXNWZy1FSpz84aTfSKaQAV6PkO2Pb10X+A7YSjze7DT9KcjIPVk3TtdWH9UAab4xU1vNzzCdWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUff0ua9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so2098791f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002440; x=1776607240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y8BPxcQ6465X542UsdBcHUWpSqQuKocfLy0RhQWsQM=;
        b=aUff0ua989g5wLFcLWbqU6i8o3EiBg2BuKQYse0W5uylFQg4fDJEwjFSdNABw0JEKW
         uSTHzvi8Uf/6c6AgB64pEgW0id44P55BAIPH6QKJ633+w5kZiGu/enV6EQLkwTKazmUW
         Krz5UCrzSPvEljOVXDmOEHAryrAMHRton603+xeCnenFvCQB6H1onR4poPX7IwUFvek2
         IsalReChqGe2eSAkmcnL9dXjlpVk7mabC+L6oXhNrqQy4ATM9bupVO4WgVRReI0i5nQz
         +CxV0LcLcZghuuq0qRSojspnP+iaJYTLOJvLq0gO3c2HybcC/hMpyOcggJB9LX0Z8ttb
         brNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002440; x=1776607240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Y8BPxcQ6465X542UsdBcHUWpSqQuKocfLy0RhQWsQM=;
        b=lXqkAx9rWQt3ig/WzbSAQUmG/AuXHq1D8V/SipiN3H8nFHxPqe3DrEYVMRIegJIJg+
         zRPEUGUXXeLKP0ldnHEia/CCbEmn7H9dVEbUphUBU7BFFE3mntdvG5kN8GpHB0Wcs1eM
         sGPyRQNtYoVvzBCpdJbdORveHlnLjlI9YTr5O9Z7LDr3TuUDw2fEOhTeVnQQRk4F8XU+
         9XnHKqf3B+g2NFAcCxUSK6CwChJ4HD4o+qX8X7pjEy4Av5nDPoGUsGSbonHxWEQmUCXb
         mHo5o9e8hZkbGy83DZy5LAp2P//XjSj+oRWNWmPY46scerj2x3R0eMh1ypFiBjp4elcE
         bQgg==
X-Forwarded-Encrypted: i=1; AFNElJ9p4FbkrkmIMwgg0L3/KJVTGYC855CIE7hfYIqSe+wCZb4bAXfv8jvT1kkcBSUSfS+pFWfgTrSn74YFUQDrqj98+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfSbDB0wbELaukOt+QrUgfCA11JTLL6hx712pKW4jRObXZVQ5
	58NwmEWwzpRkgR4f1DmAL4B7LYEjqA9I5DSDVOlH6GkT4sLdRJIkJ0WE
X-Gm-Gg: AeBDievP4evzEVJbrnAFBczikWDRRAp//cZOCQ7gj+BKeMbKHhqzD9XsTH8d6/zg2de
	W4TlYHpZpTAA6Kd1qL8UKmpjI8mY34lIKQ1rBQG8GFhgArgVbumd/UXKrXnpKjgBety4SNcdsj6
	pPWkhCAZR/XkRJGSXRy1tN2xQE6eqKnFJk+3jCRrJm/4d3vLihQG7jQqz0YIq6eTKefFkOQhTLF
	AQAQs+CFpmaNLsE8pL/o0yV4LlAVNeGkKBn7zEsS86AQ4X4VKizcyNN8cKj8IBysKoa8hmgBpuX
	rvyTG/7UNOVoWp/atdnY5Oyu2PGipcZXe/SveQ4jlGHGbal5ht+l3yPBRb6Xlapqy3oxA2Kxn9X
	IRW/i9wU00jvoyQcuf/OxWYSz/UtPyf8sASXeK2hHJECqDEJqYdmUlZLtvuKYI0I7h3plLWYCWX
	PrGUVbv0mi3aBXBOkEcEBovEhSjwZl0/ddYJyt3hggiBT5VhE8
X-Received: by 2002:a5d:5f46:0:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-43d642c088fmr14267673f8f.41.1776002439898;
        Sun, 12 Apr 2026 07:00:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6956:2074:5220:4650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm26127538f8f.27.2026.04.12.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:00:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Arun Ramadoss <arun.ramadoss@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	UNGLinuxDriver@microchip.com,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 4/5] net: phy: microchip_t1: Replace phydev->lock with mdio_lock in lan937x_dsp_workaround()
Date: Sun, 12 Apr 2026 15:00:26 +0100
Message-ID: <20260412140032.122841-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31211-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,microchip.com,armlinux.org.uk,vger.kernel.org,glider.be,gmail.com];
	FREEMAIL_TO(0.00)[microchip.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 4CECF3E41BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

lan937x_dsp_workaround() performs raw MDIO bus accesses and must
therefore hold mdio_lock rather than phydev->lock. Using phydev->lock
here is incorrect as it does not serialise access to the MDIO bus.

Replace phydev->lock with bus->mdio_lock, and switch the phy_read()/
phy_write() calls to their unlocked __phy_read()/__phy_write()
variants since mdio_lock is now held explicitly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/net/phy/microchip_t1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/microchip_t1.c b/drivers/net/phy/microchip_t1.c
index 62b36a318100..afb4e8908b78 100644
--- a/drivers/net/phy/microchip_t1.c
+++ b/drivers/net/phy/microchip_t1.c
@@ -337,9 +337,9 @@ static int lan937x_dsp_workaround(struct phy_device *phydev, u16 ereg, u8 bank)
 	int rc = 0;
 	u16 val;
 
-	mutex_lock(&phydev->lock);
+	mutex_lock(&phydev->mdio.bus->mdio_lock);
 	/* Read previous selected bank */
-	rc = phy_read(phydev, LAN87XX_EXT_REG_CTL);
+	rc = __phy_read(phydev, LAN87XX_EXT_REG_CTL);
 	if (rc < 0)
 		goto out_unlock;
 
@@ -353,11 +353,11 @@ static int lan937x_dsp_workaround(struct phy_device *phydev, u16 ereg, u8 bank)
 		val |= LAN87XX_EXT_REG_CTL_RD_CTL;
 
 		/* access twice for DSP bank change,dummy access */
-		rc = phy_write(phydev, LAN87XX_EXT_REG_CTL, val);
+		rc = __phy_write(phydev, LAN87XX_EXT_REG_CTL, val);
 	}
 
 out_unlock:
-	mutex_unlock(&phydev->lock);
+	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 
 	return rc;
 }
-- 
2.43.0


