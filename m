Return-Path: <linux-renesas-soc+bounces-34637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNGANsAXRmq7JgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 09:48:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8096F45C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 09:48:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BV018Qxe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B86EA3009E3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 07:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DCF39E6C6;
	Thu,  2 Jul 2026 07:38:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668F39D3DA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 07:38:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977918; cv=none; b=oXwGX7dkct7wzsRGhwBcvKdfoHXVTtT9T3cNNExdLomofB3mMxJuMyjPN/jLKpgjgDAnp6zwLGcyyF0Mc1MjMNOx+R/61oIrjJo4ugE6AVkCq6naAloGXXmNDNa84myX1kLa70YCtXCdfX2aW7vX2V879m2W59PiKh0pQlzeC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977918; c=relaxed/simple;
	bh=DdLjUC1ksuo+PVzG3yADpMg7xDZKtpZfVtK9cx+fcI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Em/pYFr+CkeHuo5xd/Njni8dUqX6/7vwP4zh2jZrlCBe4rw4tspto5L4CfOkxZ/1iIlaUZeuNIeoG7PdjvPNCR0vhsug/6tA+GqNsIrtHHIsMBSjYahh0inwAkpSG5H5GMqbdHYYaH1PccqUKtyuHRnp3eQb89tVcpBiJd4pjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV018Qxe; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4745492ed3aso908890f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977915; x=1783582715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=BV018QxeEXIfBas2KL/xdTtJqXoWWriDanZZ4iJX997qalMvcQiqzP1vRBTbmzJ6M1
         A2AoDO+ze0OX5y0Jix4VuVGnpsUXakv6MgT/GQ5BOobpuzHBTV39ovrniCk8U+8xBJ3y
         D8XMiaDUCMJdsiXEmZSQQaKUmdbCjAWmKdwgRzTwiPZ0TMh92IzRLwnsqQvTRFTZYPdt
         BghKH7W7WvCpIMt2xZ7stfr67IV7TcnJCmwizWGumZQ7lxZnjLTymyeW7Gj+rd0BVTli
         HZb1F1UCjPZbOt30UldGwXrO2MLa0e6/yLHjj0I8YjgHI76eHAHK/LulyX8s0gyL7/oZ
         CFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977915; x=1783582715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=MYvM8zYwpw2E4qSo/FyOIp9T39f4MAaOe0TSgfqDZC0g1uCC2XfH1tAtf0wz21A+/T
         c93ckXQJrpKlDIUYRGrPnLqfbjQyNcUTq8s+bk3TTZUJsJdauT4AgbxP4SCvpvQBF3dV
         Z2pY1HpxoNpOORgrv1nRrpsFMZJ4Ogl8s77E4tUcPNo9m9Saq74icZPsNlBi6WlsXBHt
         5XuCdzCtUG9zWYgP3M9urC5tLbHcykc0aBi7fBllgjkFBUDxuU6BsQ4H5S0+5cUgwY+A
         PBFJhU91pOCJCv00v44BRUM+lcZd5YjVSImYj2kcdsxiOLs2XvMkdTeUseJUYO8mrouR
         x0hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtthMYq0r0grujfEa75IZQOZFDwXQayK2nF151nrceR1rDsCdjXHDs5py0JvRyb0H95p5vi0c8WMAY9zU0mcFO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CJBevsalYs/J+lDzoe1mrK4rzVtavAITTQfIRaxTq5cSBIrI
	vIdLR9apFTPYP/N5Qs9QD2UC6rc8XTqkHalYJDxP+Q66z+zW1FpdRoTo
X-Gm-Gg: AfdE7cmKsJsHJsmKrVys8Mra2UGUsBBXE86rpn5SYTNljr4WdSVzmU0gpk9dZoRbmtF
	v/xoiQPmBynyS4RDKgLPtrFd2IIr90R6JWbjYoXPd5arVqW9uA8ZFfqixcbzmmg5aOicPouDmlw
	tHqCnzZq5NMCTvCndjEwYgqJ0AezACWSk+8oSiwKvyOvk+/B1mWpVOU/DiWBL3/T4zQnU4psvOT
	wx746JmjutApHbJV81TOQnCBIIQpXt3htjaabIGmNZs3A6hn3mw/5HXIFSOAW44S6Y4CTV3M7/E
	no8CewCM5zesgESKpD9IVQZ21sLKO4wt4+C81qErFWw5TaBnMGS/yqsd+DzIjWRmmwHuKgFqgc6
	oQHu9NAD4ADVO7MchBvBjKJoDD/azcwWg0t3mUK5X4Upsb2lPWfvv6YPfZjeaoO8i2NRvFHRgcB
	Fmwf7KxC5D2/kib6iQ0OYBqkDT+rgXD88Od6w95Q==
X-Received: by 2002:a05:6000:607:b0:461:9950:da50 with SMTP id ffacd0b85a97d-477574b0300mr7823320f8f.11.1782977914687;
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:8d97:896e:a65c:20e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd0b1sm6331170f8f.35.2026.07.02.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fan Wu <fanwu01@zju.edu.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Thu,  2 Jul 2026 08:38:29 +0100
Message-ID: <20260702073832.175047-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34637-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:p.zabel@pengutronix.de,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert+renesas@glider.be,m:fanwu01@zju.edu.cn,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,zju.edu.cn,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF8096F45C9

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before hardware_exit() and
reset_control_assert() in usbhs_remove(), so the PHY is powered off
while priv->phy is still valid, rather than after hardware_exit()
has already cleared it.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved reset_control_assert() to avoid synchronous abort
   during unbind.
 * Updated commit description
---
 drivers/usb/renesas_usbhs/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..51d3035f82be 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,9 +813,6 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
-	usbhs_platform_call(priv, hardware_exit, pdev);
-	reset_control_assert(priv->rsts);
-
 	/*
 	 * Explicitly free the IRQ to ensure the interrupt handler is
 	 * disabled and synchronized before freeing resources.
@@ -832,6 +829,9 @@ static void usbhs_remove(struct platform_device *pdev)
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
+	usbhs_platform_call(priv, hardware_exit, pdev);
+	reset_control_assert(priv->rsts);
+
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0


