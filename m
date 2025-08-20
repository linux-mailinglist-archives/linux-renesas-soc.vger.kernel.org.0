Return-Path: <linux-renesas-soc+bounces-20772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1ADB2E3B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F951C84D23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8F534F46B;
	Wed, 20 Aug 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNIKBHOL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11FF225413;
	Wed, 20 Aug 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710302; cv=none; b=MwB3V6kWYOAIXWoSNXb7jyeM1fiab1mIwm8EGnxSdy3NGulE07eDekkjU2C2HOQi1UffWqcc+pwzjK6+riO3psdyAYbTk2hIidZYXyDelYZI3vJw8UphPnL64pg9Zpvm09o1HHd8xf/x5CXBVUqCmYjVNzW0U3uomY0uWrlDoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710302; c=relaxed/simple;
	bh=hm/95sgIMQAu67G9Bfl9rcMGl31poyUITbZxq98oZd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRSnjMvsACaZukNWIMCkkvFufadDd27WCMxVLmysA/fBW3sdE3m60n79Db7bk/4Tzrc7XTGnIf8hWrGBwbI20+ADNJBIJ6mtr4f+emOIRcPix+bbZOgKs6ge5cBnUAL0a15ulRyPEQFwchqvnwp5k2iKPef4/5Gq6qU4IoChwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNIKBHOL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so47744f8f.3;
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710299; x=1756315099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhNTnAISlb922fVFTYDB8lOALQY3uJnPTtqRlRuZWp4=;
        b=WNIKBHOLLxHAYr4/tgrpf1pIik0yKQ2zYS3FwkkDrouXRd5FdU/CS1oYqI2KGsITHx
         jjj/6/5zuPGEsa9RtR7snC/nAMxhZXnmYBAKmu7dj3P7iGOVyMxG06806tXFoFVvfROC
         WTRtk2TcGto/mjTpQxmq4XOdRuzEEFuOJnzeALsnOOVIplI1XzPng6jE9ZT9kWOXtohx
         m0Xtsqyi3BZ3WfNuNl2jg0+KmXqP7M7yCiNeQM/NaZybFkow0zGqAWaLzxiDI331uZmv
         KRKYKgY3UQc3pArjlELfP91xdRJZxG7O+tiLLq3TjYDwhrBkV2TriGqYd2G0otzpwxi3
         dRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710299; x=1756315099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhNTnAISlb922fVFTYDB8lOALQY3uJnPTtqRlRuZWp4=;
        b=VucYxLLZODCDtrZd9ySJF/IrQdyWsC//ZaptRF1bKzM9gJw1A/f5mRek4N2RIUqmWa
         jqip4XLTjEwtWXBoVgYlcDM40vasaQvl0/AwDNmNbDfFGkbv0Y2e2xAropfR3v6ZIsob
         4N4itKA3yXukQuhZFZO9eiHyF4wRcyPUuoChjzQjJ9BzaK/7iEXKYrFqsXyrmGz07asx
         dY7eEkbj78Q9y77BK3VvwaF7uP1xL1AOLDhzzl/FXjj14cipypl0R2RD8m3vPjkSkVGD
         9unsF3vQvYKFxdul9YWWEQq8L7mgPMzNlPAoKLes5KYMsmttEAwOvnoE2z4rXirrpZZD
         DMGA==
X-Forwarded-Encrypted: i=1; AJvYcCWYau4JgxVwy6FWmp16Rvb/s4ESHSNZx8lAOj3GlM/SVMdDiT4krTgjO7jENix0JCtf+0d8ub3F5sUd@vger.kernel.org, AJvYcCWgxqV5AOqYFsz/uJSEti5rOMxzpW8fbCt14KzhIab4Ge46iZhTkj2Hefl8xYcyEck5qwbn57qAj1SrYvA=@vger.kernel.org, AJvYcCXr70A0RYOHVgxJrWEZfKlJjlxkZoovaLllpHYfgHC8y0H+uaZrYgV7Vt1XBrIsApgYZz9KrbBsOqJOFsVicND7rqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3PhmK698xbmRLrBXTc+VcE+ZeW7WGFBCbXYdEacJG0Rhr3uU
	ZfXim5XOJemJ3hU29Xe3v3YyibWak/hSVGjXKDcpBSQMU2MVrCinTv2R
X-Gm-Gg: ASbGncvo0X1XeBVaZzX7kOw12jOyhPZkY7B+XXDnEWOqdj3BDID44Nm3d0MTzgU2jLJ
	uvo/Uhx1woVz1Xfjs7mlBmX3TLT2a/1NLTNRkAFu7D9Q3mZJRAjE9HxH09eDR3V/3fxQlr9Hpwu
	r52H2B+4a4bbsvURMrUgrOxisuWzGS24O+Z4JhHtBFGmqhJ+UhvQuuhddz6z9dTFYN6zdvXsQTh
	mK2xkS0b84q2JenpAxdBWUJFmcKJOPbwzTEtjpgBpSbPL5ND2xG31LkSriK6vkUIsn2ObZrSgyN
	kGH2oaVYgTYWLGmkIxtw4b3KUnw1iXLmUIoDBdLhxds96eAic7hxv3GNjfwR2dnTQIdLQ9YKTLJ
	/VuBSVdg9arM+gKW3rsVLWOrOVxI1SL2W5LebXGVFfPkN/dncoNC0iO8HSJZYFDJiJzie2ugbOw
	==
X-Google-Smtp-Source: AGHT+IHcItk2Xm/oFGfxL2F1n1Q+y3DB8VpCwdEWdMl1fY1aCoM4+3ZFaDjK+Cgum1bFC7h+Hj+osg==
X-Received: by 2002:a05:6000:1449:b0:3b7:8362:fed8 with SMTP id ffacd0b85a97d-3c32bf5d582mr2707715f8f.2.1755710298989;
        Wed, 20 Aug 2025 10:18:18 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:18 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
Date: Wed, 20 Aug 2025 18:17:54 +0100
Message-ID: <20250820171812.402519-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some SoCs (eg Renesas RZ/G3E SoC) have special sequence after
xhci_resume, add .post_resume_quick for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/host/xhci-plat.c | 14 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5eb51797de32..7191a63dec2a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -74,6 +74,16 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 	return priv->resume_quirk(hcd);
 }
 
+static int xhci_priv_post_resume_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->post_resume_quirk)
+		return 0;
+
+	return priv->post_resume_quirk(hcd);
+}
+
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
@@ -509,6 +519,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
+	ret = xhci_priv_post_resume_quirk(hcd);
+	if (ret)
+		goto disable_clks;
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index fe4f95e690fa..4c2a89bd83a1 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -20,6 +20,7 @@ struct xhci_plat_priv {
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*post_resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
2.43.0


