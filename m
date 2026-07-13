Return-Path: <linux-renesas-soc+bounces-35116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jsc2MGXjVGoZggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:08:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0E74B524
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:08:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=PJcM4ZK2;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 602A230515A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982A74195D1;
	Mon, 13 Jul 2026 13:06:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856F44189AA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947963; cv=none; b=W3k7Dnj0UY5DLqMPQP0EEeuZU72nsHvMmyNq/Q2SezpuMsXsYFcJC++8F+OmRNCgbs2o6wpI15XnsQmpW25VwiqqKlwq+23XiYh3iQ4UH5yROayJOig5/O8Pi4BchnxHnBg6KrsJpbUEWIAN3ub7jJIIwoy+M7kVpPvJ6axdZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947963; c=relaxed/simple;
	bh=rUKg2lEbEKF1/6fRaBq+MRXhYFcsSMiVFbDM59i1uYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQXTVhCiCAv8unc+9gAftqayikNRgfZMqcn4d9hbaxvXdbePdC7n1G6qKGiUGMi5upbqIddBYHfvXz8/VLH+H5Sty6CIhiEwpsEkVbxwN03JJQz1I7qe/Vgj0AlcYwadKGGJ9nV8VIuZMmHxtrXr/HTPs8cAKHw6O9BHz2xeDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PJcM4ZK2; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47dec32798aso3206165f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947960; x=1784552760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c25tAQuKLxSupdY9CktEZj3cba9VcnGd28lC32imf8=;
        b=PJcM4ZK2GkgcJ+n4l3XjEVtzBHZ/BdJcmbHGJFSRaGcJ//D2WMEU2AWM/ZxKV9DYoS
         qw+EaSNgIhz+Y9xkKYCQjMElzkd0DTOOAxtbvouqZ6ZUXSlVwZVEYguXhK3X2VsqefVu
         mHTJoowLfZnlbuoGG5bXn0bO+D4o6zZNcIyy5q/vGRHxyMUCUOVd0pH3vUbjbxoikRQt
         qLkCbBftTgZ0GZhgMxrmKwQh591K9pEleFfSosS/KDbiaKHY9S+SxHrQk3tnspn9Vb1p
         u+6Q6EckJlIKcVR46jhJvdAg9XdXCsxtpxKi4SNJzCe3xGWGzhlipCbJ3ljbW3fUg0sn
         drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947960; x=1784552760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7c25tAQuKLxSupdY9CktEZj3cba9VcnGd28lC32imf8=;
        b=nzgfBfUpUPuM6lBlArH5cqyvC0KIHmUiNt78Zi1lsVX9BJLy3IGCa3M5UjeYQ1wc2b
         GOKEqzKzo1W8kiPWWAenvRH5lPeON9R0Kys5VaGvRCGVXoFNalKwjZxMgJ1cdPNSJUYR
         l03WHs+/LgkAtkidLD0QMPlsXmdgWzUISDfP/VkW8XdG55cix3QVTHpapF467vs2ZIpX
         U6mJFm3DTpZJHPn9QW3sytUg2hi6KUpAM0AlfvPVc4H8qF9U8ruQjg8ORqDsmp/zTJbc
         6ruLKcIlxyvkJz+c8/Inr5bxppDUjbpiFFcTI6U8zGGqA60OdX8zl3/NvP5K3i4ER8FR
         fUkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5dcZjIvdlp6lYBOjkVEPz8w2NSgaVKmsI38c7TzFGi1+Vy+YuCoLux2L4K3GmX8Y8rch0MJm7Xl9luIp9d4Ul1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3lUyUOxTMPtWrnVqBwbI2RXAdZ1B4Z1/cE5IKOdTSt5D/Fd+
	oyULu5V8mJ1Q077NDv0jeN2g/rOOLb6Dn6rVZFfRL4N1lF6egVxEWZrrJvXR2AvgyWc=
X-Gm-Gg: AfdE7cmXHOHxenIQeSSc0Arn0dINoWYR1KLXyn2+KMBhQyK549rwTnr3jasxX+/YA/P
	obHLtZmkpXpI5n+bwdredkzW++cfcvG26WY0ZlMQqXbnmGpf4UPn+fBARbDiINLOmAX95WzU90m
	QBvNZCKzhVsWGENeqjAXO8PfjlE/2eZ2VFTxEx7QxmWaMN0mwhPdRo5RTCEYaqZF3xJmKFNlLaL
	UsIQv5F6YM4+/FGTYY/CMFTuT/UCwZUgk+iN/TJvet1v8pq0k7otkiBYVbOcmFZ7tKbJsfx7/GR
	72ieogO9LQG7GZRyDIJ/PkYl3Rihg3d3LXrS4gyctvapYw4XR+9hmwKq8pCxpmbsUOrVuW9SOlk
	WmZemBDUIHr1MI0n0fRT1mJcUUQ65zqYN0ZWqhVyER5kBiQ2PatBSptdgiBFh+I1lcXT6wLAQj8
	fAhieloiq1X17k1OkTfnkwb+gsN3P37I7Ud6uW4HRKK5I3W+YjlMemKuPP59lSOmP3BBIB3uOV0
	sE4dTBEQQ==
X-Received: by 2002:a05:6000:4283:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47f2dc8cd9bmr10407081f8f.1.1783947959860;
        Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume
Date: Mon, 13 Jul 2026 16:05:34 +0300
Message-ID: <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35116-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DD0E74B524

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power saving mode where power to most
SoC components, including I3C, is turned off.

On systems where the I3C devices also loses power during suspend (e.g. NXP
P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
resume.

Running DAA in the controller resume path restores communication. However,
DAA relies on interrupts for TX/RX, which are not available in the noirq
suspend/resume phase (unless they are wakeup interrupts). For this, the
suspend/resume callbacks were moved out of the noirq phase. Currently,
there is no identified use case on either the Renesas RZ/G3S or Renesas
RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
the noirq suspend/resume phase.

Since renesas_i3c_reset() is not called anymore in atomic context
update it to use read_poll_timeout().

Along with this, struct renesas_i3c::DATBASn and its usage were removed,
as they are no longer needed.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- restore it to the level of v1; the other scenarios updated by
  sashiko were already present w/ and w/o this patch and could be
  addressed incrementally
- updated the patch description

Changes in v4:
- used directly i3c_dev instead of i3c_dev->dev->desc
- fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]

Changes in v3:
- added renesas_i3c_group_devs_in_slots(); along with it, the
  struct renesas_i3c_addr was updated with i3c_dev and i3c_dev
  and the attach/detach/re-attach APIs were adjusted accordingly
- dropped DATBASn member of struct renesas_i3c
- used i3c_master_reattach_i3c_dev_locked() to re-attach devices
  on a fully occupied bus
- in resume, moved i2c_mark_adapter_resumed() after i3c_master_do_daa_ext()
  since it can update the internal driver data structure i2c specific

Changes in v2:
- adjusted the code to still work in case the full bus was occupied before
  a suspend/resume cycle; for that:
-- introduced struct renesas_i3c_addr
-- preserved i3c->DATBASn[] which is saved in suspend and used in resume,
   in renesas_i3c_daa()
- updated the patch description to reflect the new updates

 drivers/i3c/master/renesas-i3c.c | 38 +++++++++++++-------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6590da962592..acc30ed615ab 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -265,7 +265,6 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
@@ -495,8 +494,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-					0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1419,12 +1418,6 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
-	/* Allocate dynamic Device Address Table backup. */
-	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
-				    GFP_KERNEL);
-	if (!i3c->DATBASn)
-		return -ENOMEM;
-
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1435,17 +1428,13 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static int renesas_i3c_suspend_noirq(struct device *dev)
+static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	/* Store Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
-
 	ret = reset_control_assert(i3c->presetn);
 	if (ret)
 		goto err_mark_resumed;
@@ -1466,10 +1455,10 @@ static int renesas_i3c_suspend_noirq(struct device *dev)
 	return ret;
 }
 
-static int renesas_i3c_resume_noirq(struct device *dev)
+static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
@@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
 		       MSDVAD_MDYAD(i3c->dyn_addr));
 
-	/* Restore Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
-
 	/* I3C hw init. */
 	renesas_i3c_hw_init(i3c);
 
+	ret = i3c_master_do_daa_ext(&i3c->base, true);
+	if (ret)
+		dev_err(dev, "DAA failed on resume, ret=%d", ret);
+
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	/*
+	 * I3C devices may have retained their dynamic address anyway. Do not
+	 * fail the resume because of DAA error.
+	 */
 	return 0;
 
 err_clks_disable:
@@ -1516,8 +1509,7 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops renesas_i3c_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
-				  renesas_i3c_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
 };
 
 static const struct of_device_id renesas_i3c_of_ids[] = {
-- 
2.43.0


