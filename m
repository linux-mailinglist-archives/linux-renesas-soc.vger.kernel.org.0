Return-Path: <linux-renesas-soc+bounces-31207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YENfG6Kl22meEgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A43E41C4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D1B1301727A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1A32DE6FF;
	Sun, 12 Apr 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI5bR30Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58048CFC
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002439; cv=none; b=DA9InlTze3KklEdWeNo+VEVbzyY1siagMwCXoT/dAnqu7uAge5wXaUW3hL6JtuY0Ap8XeEdLudQhrnfclrfLkJJ3e3T0jbhogNsnd5ziotcVciL9AvptuGDjA/Fdzif/Od9vU0ri1ZvMXiY1CiQxwdeub0wEfIx2mbsckOa9c0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002439; c=relaxed/simple;
	bh=mMaYpBdeS3NrnBsa8EFUtFNqHp0YZ5Ijols8OmB/8bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmMCdNP8EUhSm3XiMWfzmvDJIJimk4N+jTjv57NvizzyXit86NzI0qdFevvWtnXt9mtLWDGqQnnt5QZLS5Mvz7AiHzaO61oEHtv+I1kOGqpTNEVpudOAqFkVHZ3l/GfixNlC/FNjsn1fpllpnjiX3e4JM27Ka/c69l2lHGCOhrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI5bR30Y; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d77f6092eso73526f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002437; x=1776607237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djfGmhcRSmnW5HG+zxzJcYSHSvITdldDVooGPXKJOns=;
        b=QI5bR30YUjbZ5gSlXKisLdrZaqkKT6WWIy8suRZ7zTf654taup1D0826VTYpXQAiZZ
         bupr4Z0cLs4PA3GqHHnvXcIjU2dbJR3X5CV7t0U8lt8h5c80TKMiNP0Z6CbxTZfJG4uV
         H1Av5vM8S0tMFUExGE+yww+aNJU8RyU3R73IAGzKpTXq1trtfl1VE5SeUseQeX17bSrs
         xpoEl1BgtaD7dYWDmJ6be0DBGYW1MbznK3takn5uOLQYGCuPaPw1Z0bSv+w6Ck6yWJ8f
         mFiRQeAvTwrLwgaW0v8BNUdMF0ZdG0T8FxuHAuHT8WGcCdfMnfoYZCNY8LY8d6nFGm+U
         8UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002437; x=1776607237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djfGmhcRSmnW5HG+zxzJcYSHSvITdldDVooGPXKJOns=;
        b=iCRohyJeHf1cbOI3Ctlv0ENq3Kfi2ywzmP/k9wOdhiIxb13eHpKca6qeAWDVPKSRlS
         bIqUe/gF/uBdizoW1E1a+B/Nb1OasQOrRc9Lq7cT0LgYCw96tHI6aOKb6X8eXaaRhn+n
         NJ/KRZhhXLMfD4rKd4L6dh+J/8HK0OMFB5nsn9rH+rH0czFqGBu9p4MsqRdgp3rIVDSd
         GAqqw6yp1AnQtH34oxhRCxVY16C0DyF+Yznkr8r3B7FUNZ2KFaHVvc726oXfu80J0lDl
         2ROkjbo/ew419CRgoBIHPnhLjFpvVM1Ch4cPmhTjcXc9kPoUvYvJDZaANt8W/Uo21JeF
         G7Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/Yuy6Upp5sTMzyKRdNc8sJY7Ms5daSuMTNFSM8n4Ly3AnG+IL1as46VnEZuaLjRvSLxy32vjKQcP8phy+bSmFhdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwetvewJv9NJuFqtaTAawxb6vovAKmrartY+bp6UMkXsZERxLCJ
	wo8ywJtMjI5sA0zoEpH2YT5r/ZvsWpVebYZmy0P3M8+rFi5kusHRo2YG
X-Gm-Gg: AeBDieskE6X3M5w0Owzl+ysGfYEUeFiCXKWFrWaG1BriOUErYntnFrp0mnqxREeSJAv
	8a1qcIWsW7rygbrqD796aRqZt5ZAke7oyQ3waV2c/Ddg71fPCwRhnvpvOR/JkdAgtGI2QleH8Dc
	Qir01navJrT+vI4/32Lrf4Lg2xB5usvzvTk+HYW6qHfBt6odCY+q3O90xQisCW6Ct25KHJJBi0w
	1Xgy59l4vALnVCP2x2bb8IMRjMPiJCWpTYvBhb7RXqrUPw8YtYnUNwGS0Xs1MBoEe045v/MKb3G
	qm2IsZfcWYG6ozPyjUNYnkSDGYC01X/2K86QBdZUAGU74RAm4UyisQpooeUHD5VkAXWwJ3pkcU4
	hWvv9YXqsQTEVdcDkXc19uSxhDVyicE7q0Rsrijccc4B7ML5dzZ6/mGfiTlAvYEKw4qo/U715s2
	GUYtl30HH+FyyV2H+ZQxZgdKF+YPfdDyWgd4iPbAqJ/TfPNlOf
X-Received: by 2002:a05:6000:220b:b0:43d:70b3:7ee2 with SMTP id ffacd0b85a97d-43d70b3811emr3827998f8f.1.1776002436522;
        Sun, 12 Apr 2026 07:00:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6956:2074:5220:4650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm26127538f8f.27.2026.04.12.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:00:36 -0700 (PDT)
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next v3 1/5] net: phy: call phy_init_hw() in phy resume path
Date: Sun, 12 Apr 2026 15:00:23 +0100
Message-ID: <20260412140032.122841-2-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31207-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,armlinux.org.uk,vger.kernel.org,glider.be,gmail.com,renesas.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: AD3A43E41C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped, so
phy_init_hw(), which performs soft_reset and config_init, is not called
during resume.

This is inconsistent with the non-mac_managed_pm path, where
mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on every
resume.

To align both paths, move the phy_init_hw() call into phy_resume() itself,
before invoking the driver's resume callback. This ensures PHY soft reset
and re-initialization happen unconditionally, regardless of whether PM is
managed by the MAC or the MDIO bus. As a result, drop the redundant
phy_init_hw() call in mdio_bus_phy_resume().

Additionally, in phy_attach_direct(), replace the separate phy_init_hw()
and phy_resume() calls with a single phy_resume() call, since
phy_init_hw() is now handled inside phy_resume().

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change,
v1->v2:
 * Updated commit description.
 * phy_init_hw() is moved from __phy_resume() -> phy_resume() to make it
   lock-free.
 * Dropped redundant phy_init_hw() call from mdio_bus_phy_resume() and
   phy_attach_direct().
---
 drivers/net/phy/phy_device.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0edff47478c2..4a2b19d39373 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -396,10 +396,6 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 	WARN_ON(phydev->state != PHY_HALTED && phydev->state != PHY_READY &&
 		phydev->state != PHY_UP);
 
-	ret = phy_init_hw(phydev);
-	if (ret < 0)
-		return ret;
-
 	ret = phy_resume(phydev);
 	if (ret < 0)
 		return ret;
@@ -1857,16 +1853,14 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	if (dev)
 		netif_carrier_off(phydev->attached_dev);
 
-	/* Do initial configuration here, now that
+	/* Do initial configuration inside phy_init_hw(), now that
 	 * we have certain key parameters
 	 * (dev_flags and interface)
 	 */
-	err = phy_init_hw(phydev);
+	err = phy_resume(phydev);
 	if (err)
 		goto error;
 
-	phy_resume(phydev);
-
 	/**
 	 * If the external phy used by current mac interface is managed by
 	 * another mac interface, so we should create a device link between
@@ -2020,6 +2014,10 @@ int phy_resume(struct phy_device *phydev)
 {
 	int ret;
 
+	ret = phy_init_hw(phydev);
+	if (ret)
+		return ret;
+
 	mutex_lock(&phydev->lock);
 	ret = __phy_resume(phydev);
 	mutex_unlock(&phydev->lock);
-- 
2.43.0


