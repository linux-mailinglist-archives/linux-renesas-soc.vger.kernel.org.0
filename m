Return-Path: <linux-renesas-soc+bounces-31191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO6uKPJa2mmB0ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:30:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D133E054C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62CAB30069BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98E33845C8;
	Sat, 11 Apr 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZczkzRqQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DCD3859CA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917803; cv=none; b=eOev5uBiK/6rz5f39CGHZXKH+cfqfkE+FoimDNEAFfAir+LCnnhQCTzokVZak5Iip5NxNcesiA0Mb9Pa2g4C8IE9Nnvp491Y0mp/oh5x86GqXaLXldCXzzETdBNKdlhqEltGv1kcblT8rnXZVkB1h6aFYe9iW9kniwIbNeLNHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917803; c=relaxed/simple;
	bh=I7otHS2UuBibAyk7ztbchnygQDdAGqIo613LgXlwUo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdXsff/O2D05wavwm6mE3mxLNYcxWyEbfESUX13qiPOzANGmuv/0oefGkeJYXgYwqI2QgjrupTD567mBKwFHkDKIhYFbMCmGxBJkfi6wyAK/Pp4CQh/mtGtk2CfUHE8bhaAi3e6A6xE8i63fvIAwwtL2ZSCs99s6OijgJtWvjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZczkzRqQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso1781924f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775917799; x=1776522599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfsfBk1yzNdC/+yEaYnXqko1EBtHRLDfqU2U7CZrU+k=;
        b=ZczkzRqQMKa1cCeHcr4QKh4IVLcWKs8b5c2UnZZzW6TM6tGTlNQmYJx2XgQCpJS1dA
         WXKduUoOWttSIlwYkkH7+xXbix55QMltQbxqKyuxYNVW19HznOTENe+qhoYKWwRIciyw
         P2bbf+YT2fztRbnS4nHUNaZG6Qd3nMAKCHQvChTADn6bfIu4IxdeePGF+tsWjUx9FcNh
         0Yg18GxDw/l11N11ztP7sMZRC3ABhf3LkHoVQIkOUuop/vIcDdoDqjEj4DX8N3VGwSig
         ZDK3rIPNos6LEHAT9Gk6nceZLHAk69ywMvIV+mKMAvppzHX35HhY7qR2DFcQei8g12A+
         eKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917799; x=1776522599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfsfBk1yzNdC/+yEaYnXqko1EBtHRLDfqU2U7CZrU+k=;
        b=e4Ctk75Uabi8NCNcP6GGydvrhHxrqI6c98ZwHfSuJRD1oDZTyvu26c5S4wQGKW0zSv
         mC36GXIy4ikiAefWRktjMTGqFQhXEQKyH5l/YkcrRnfFRkqoFRjVjtomlggDfMEkNRGe
         izRAkLYgfOFtAEUNbCyWxow0Odeh1wGmlsp3SIGTF+KfFSDxzd0pOiMC70YIxUGKDO8x
         J9rWFfC5CBNnoMd5cFWEYz+Et6aNH5Tqb/zkIHWJ2sZTfyylZf4yLhy3cGAGQSQ65ZbQ
         kXQkInk6wJNObcJEhszd3xRkVeFYeG922vUFgq3FjvUSZqGX1STAo0MaK2s9YtUyAjDR
         Jg5A==
X-Forwarded-Encrypted: i=1; AJvYcCUoRcoaxbqfpPrzgjY+rUBs86snjMNBZKanInRYtI7LKQMk6MRJ8+yIRtPbYcPM2rqzStbvBN9NtNpJ5zuCTHlvVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyls5MGwjVJwPnlZIrYFWqcP/rOMdWBKb4d68phSnGlzlsvjIvk
	koaAmF18YIyfsy59Lue2rfe/p7JIrJDbyjJu/QRWNJmuvnRUlzjTSrq4
X-Gm-Gg: AeBDieup1wfBFNiFIY4scDsyp7/q1SAbo8BSzXdtW18GmWaiRrfke/tKJnQMzgsMG3x
	enicpA1jLKXIH33lPSKMwl0FJd7r2y/I8wU4jtFYOL/yHkdnHDv95ssLKwz8Up7jY1rxOdGjB36
	a+igVb4ZQrX9l6brgb1xkjSTfBDnP/6/DkuLEQSXFWxR0FUgoDm/Cx5yUyccg+A9H4l21ECQS7Z
	gwLFO972Yh+zc9PacYb0lGVAPT+17aDpUeeXiPmfJcByM7XUKZB/iQztjcy9b8qo5tniCIUBHfX
	pCAmIWM/hHn0q6nLWO0i5wxD4Duy8xbooFc+kYtto529GRWJQCyjQk7W47K/B0OETtwTVmNMTNS
	x12+uAVTdGsHMfGSUip6A8fysPNH7wiCTI7WarNaFFbpCpsMtqGWITzCbE/exOYIabYtUARUp83
	z5W/65TwkKHgF+fPofWnyrdHLFyH1fBTg=
X-Received: by 2002:a05:600c:314b:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488d687c076mr80986065e9.26.1775917798783;
        Sat, 11 Apr 2026 07:29:58 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:1ef3:1f1e:3a7e:32e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58a414bsm151270785e9.4.2026.04.11.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:58 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: phy: call phy_init_hw() in phy resume path
Date: Sat, 11 Apr 2026 15:29:53 +0100
Message-ID: <20260411142956.88343-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[bp.renesas.com:server fail,renesas.com:server fail,sin.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-31191-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bp.renesas.com,armlinux.org.uk,vger.kernel.org,glider.be,gmail.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58D133E054C
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


