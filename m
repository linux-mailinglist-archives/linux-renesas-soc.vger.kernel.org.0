Return-Path: <linux-renesas-soc+bounces-32614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ9zDJivBWpUZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 13:18:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3727540E4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 13:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 342903045DFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 11:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6995A3BF69C;
	Thu, 14 May 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkKjoRyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3B3B5F59;
	Thu, 14 May 2026 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757201; cv=none; b=mhmX4sau2cJFQ8SvHHz0yG1HBeCPoKuNstOkIYYRD3uOIYqMXuqTOjVfO/q+Xqdrcdvtp92BKmKbZSWAiRSknEaogImFvk3TGn3FGbO8+iawPRw7FM7EWzAo0qn8V4Ufa1pBF9c8yQexw+zmxC1ITyqqCsx4dgD8r/YCqEvh1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757201; c=relaxed/simple;
	bh=bblMRRwpL/BHL7M2X7h7NpG+0FDdQqbcJFlkEEghtTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqYScV8Yo645yfh8Eiskk4GUCTUzEnjaAJY+yQ8GdCbsS4M8i+5/f8JAeGI1iGaxTgJj0X6gKGFcRQWdVhP5hR3JawtDasPX45ti+1VoMHfMfXr/bD5gOn/sSTJ3LnqWaQ/cuWMyhwgQbLcuwFXkIEiA/r/AodmZ/qHHrep6Ek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkKjoRyf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61560C2BCB3;
	Thu, 14 May 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757200;
	bh=bblMRRwpL/BHL7M2X7h7NpG+0FDdQqbcJFlkEEghtTk=;
	h=From:To:Cc:Subject:Date:From;
	b=hkKjoRyfZEYNQ+4a6QfjMeqH/R6O6XF4hxQL0DeMYyJvHaW/5t5T5OuS1Ru50pONI
	 Ka6cPJwECSFuuQ5yreCDTa5mmhY9Ro5WDM2yyN/HO4AM0ZMXsA0Gbvpvn7muwk7nC0
	 rF6gzBtudmYchQp5dRQV6pjmBhJI6onhsvXFAdovxdUXL/zQYxbRR0pq6SnOfLOm/r
	 Iawg/RIoHPIH5VRxmEQauDe2dGdfu6/xi0Km2EGrJKo/CjHLsi1464B4vaxraT0oFO
	 V2YMzrdg+cqeQW9xyQO8FKTM/Z216sfA8HuHDaCB2iw0nIMHjBMVXf09gUIDV/r5Of
	 oH4fTD4W7H5mw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context
Date: Thu, 14 May 2026 14:13:00 +0300
Message-ID: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B3727540E4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-32614-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nigauri.org:email,nabladev.com:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The OTG PHY initialization sequence needs to wait for 20 ms at a specific
step, as described in commit 72c0339c115b ("phy: renesas:
rcar-gen3-usb2: follow the hardware manual procedure").

Commit 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
registers and driver data") tried to address various problems in the
rcar-gen3-usb2 driver and converted the mutex protecting HW register
accesses to a spin lock, leaving, however, a long delay in the critical
section protected by the spin lock. This may become a problem,
especially on RT kernels.

To address this, release the spin lock before sleeping for 20 ms as
required by the HW manual and reacquire it afterwards. To avoid other
threads entering the critical section and configuring the HW while the
software is waiting for the OTG initialization to complete, introduce the
otg_initializing variable alongside the otg_init_done completion. Any
other thread trying to configure the HW while the OTG PHY initialization
is in progress waits for the completion instead of immediately returning
errors to PHY users. The IRQs were also disabled while waiting for the OTG
PHY initialization to complete, as the interrupt handler may also apply HW
settings.

Fixes: 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data")
Cc: stable@vger.kernel.org
Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
Reported-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 163 ++++++++++++++++++-----
 1 file changed, 132 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..bdb64726f4cf 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -15,6 +15,7 @@
 #include <linux/extcon-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mux/consumer.h>
@@ -138,12 +139,15 @@ struct rcar_gen3_chan {
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct work_struct work;
+	struct completion otg_init_done;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
+	int irq;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
 	bool otg_internal_reg;
+	bool otg_initializing;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -386,32 +390,68 @@ static bool rcar_gen3_are_all_rphys_power_off(struct rcar_gen3_chan *ch)
 	return true;
 }
 
+static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
+				       unsigned long *flags)
+{
+	unsigned long timeout = msecs_to_jiffies(25);
+	unsigned long ret = 1;
+
+	lockdep_assert_held(&channel->lock);
+
+	/*
+	 * The OTG can be initialized only once and needs to release the lock
+	 * and wait for 20 ms due to hardware constraints. Wait for the OTG PHY
+	 * initialization to complete if another PHY executes configuration
+	 * code while the OTG PHY is waiting. This avoids returning failures to
+	 * PHY users.
+	 */
+	if (READ_ONCE(channel->otg_initializing)) {
+		spin_unlock_irqrestore(&channel->lock, *flags);
+
+		ret = wait_for_completion_timeout(&channel->otg_init_done, timeout);
+
+		spin_lock_irqsave(&channel->lock, *flags);
+	}
+
+	return !ret ? -ETIMEDOUT : 0;
+}
+
 static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
+	unsigned long flags;
+	int ret = -EIO;
 
-	guard(spinlock_irqsave)(&ch->lock);
+	spin_lock_irqsave(&ch->lock, flags);
 
 	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
-		return -EIO;
+		goto unlock;
+
+	ret = rcar_gen3_phy_wait_otg_init(ch, &flags);
+	if (ret)
+		goto unlock;
 
-	if (sysfs_streq(buf, "host"))
+	if (sysfs_streq(buf, "host")) {
 		new_mode = PHY_MODE_USB_HOST;
-	else if (sysfs_streq(buf, "peripheral"))
+	} else if (sysfs_streq(buf, "peripheral")) {
 		new_mode = PHY_MODE_USB_DEVICE;
-	else
-		return -EINVAL;
+	} else {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
 	/* is_b_device: true is B-Device. false is A-Device. */
 	is_b_device = rcar_gen3_check_id(ch);
 	cur_mode = rcar_gen3_get_phy_mode(ch);
 
 	/* If current and new mode is the same, this returns the error */
-	if (cur_mode == new_mode)
-		return -EINVAL;
+	if (cur_mode == new_mode) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
 	if (new_mode == PHY_MODE_USB_HOST) { /* And is_host must be false */
 		if (!is_b_device)	/* A-Peripheral */
@@ -425,7 +465,10 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			rcar_gen3_init_for_peri(ch);
 	}
 
-	return count;
+unlock:
+	spin_unlock_irqrestore(&ch->lock, flags);
+
+	return ret ?: count;
 }
 
 static ssize_t role_show(struct device *dev, struct device_attribute *attr,
@@ -441,14 +484,11 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(role);
 
-static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
+static void rcar_gen3_init_otg_phase0(struct rcar_gen3_chan *ch)
 {
 	void __iomem *usb2_base = ch->base;
 	u32 val;
 
-	if (!ch->is_otg_channel || rcar_gen3_is_any_otg_rphy_initialized(ch))
-		return;
-
 	/* Should not use functions of read-modify-write a register */
 	val = readl(usb2_base + USB2_LINECTRL1);
 	val = (val & ~USB2_LINECTRL1_DP_RPD) | USB2_LINECTRL1_DPRPD_EN |
@@ -471,7 +511,11 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 			writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
 		}
 	}
-	mdelay(20);
+}
+
+static void rcar_gen3_init_otg_phase1(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
 
 	writel(0xffffffff, usb2_base + USB2_OBINTSTA);
 	writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTEN);
@@ -510,6 +554,11 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 		goto rpm_put;
 
 	scoped_guard(spinlock, &ch->lock) {
+		if (READ_ONCE(ch->otg_initializing)) {
+			dev_warn(dev, "%s: Got IRQ while waiting for OTG init!\n", __func__);
+			return IRQ_NONE;
+		}
+
 		status = readl(usb2_base + USB2_OBINTSTA);
 		if (status & ch->phy_data->obint_enable_bits) {
 			dev_vdbg(dev, "%s: %08x\n", __func__, status);
@@ -533,9 +582,15 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	unsigned long flags;
 	u32 val;
+	int ret;
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
+
+	ret = rcar_gen3_phy_wait_otg_init(channel, &flags);
+	if (ret)
+		goto unlock;
 
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
@@ -548,8 +603,22 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	}
 
 	/* Initialize otg part (only if we initialize a PHY with IRQs). */
-	if (rphy->int_enable_bits)
-		rcar_gen3_init_otg(channel);
+	if (rphy->int_enable_bits && channel->is_otg_channel &&
+	    !rcar_gen3_is_any_otg_rphy_initialized(channel)) {
+		rcar_gen3_init_otg_phase0(channel);
+		disable_irq_nosync(channel->irq);
+		reinit_completion(&channel->otg_init_done);
+		WRITE_ONCE(channel->otg_initializing, true);
+		spin_unlock_irqrestore(&channel->lock, flags);
+
+		fsleep(20000);
+
+		spin_lock_irqsave(&channel->lock, flags);
+		WRITE_ONCE(channel->otg_initializing, false);
+		complete_all(&channel->otg_init_done);
+		enable_irq(channel->irq);
+		rcar_gen3_init_otg_phase1(channel);
+	}
 
 	if (channel->phy_data->vblvl_ctrl) {
 		/* SIDDQ mode release */
@@ -568,7 +637,10 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 
 	rphy->initialized = true;
 
-	return 0;
+unlock:
+	spin_unlock_irqrestore(&channel->lock, flags);
+
+	return ret;
 }
 
 static int rcar_gen3_phy_usb2_exit(struct phy *p)
@@ -576,9 +648,15 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	unsigned long flags;
 	u32 val;
+	int ret;
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
+
+	ret = rcar_gen3_phy_wait_otg_init(channel, &flags);
+	if (ret)
+		goto unlock;
 
 	rphy->initialized = false;
 
@@ -588,7 +666,9 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 		val &= ~USB2_INT_ENABLE_UCOM_INTEN;
 	writel(val, usb2_base + USB2_INT_ENABLE);
 
-	return 0;
+unlock:
+	spin_unlock_irqrestore(&channel->lock, flags);
+	return ret;
 }
 
 static int rcar_gen3_phy_usb2_power_on(struct phy *p)
@@ -596,6 +676,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	unsigned long flags;
 	u32 val;
 	int ret = 0;
 
@@ -605,11 +686,15 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 			return ret;
 	}
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
 
 	if (!rcar_gen3_are_all_rphys_power_off(channel))
 		goto out;
 
+	ret = rcar_gen3_phy_wait_otg_init(channel, &flags);
+	if (ret)
+		goto unlock;
+
 	val = readl(usb2_base + USB2_USBCTR);
 	val |= USB2_USBCTR_PLL_RST;
 	writel(val, usb2_base + USB2_USBCTR);
@@ -620,27 +705,41 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	/* The powered flag should be set for any other phys anyway */
 	rphy->powered = true;
 
-	return 0;
+unlock:
+	spin_unlock_irqrestore(&channel->lock, flags);
+
+	if (ret && channel->vbus && !channel->otg_internal_reg)
+		regulator_disable(channel->vbus);
+
+	return ret;
 }
 
 static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 {
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
-	int ret = 0;
+	unsigned long flags;
+	int ret;
 
-	scoped_guard(spinlock_irqsave, &channel->lock) {
-		rphy->powered = false;
+	spin_lock_irqsave(&channel->lock, flags);
 
-		if (rcar_gen3_are_all_rphys_power_off(channel)) {
-			u32 val = readl(channel->base + USB2_USBCTR);
+	ret = rcar_gen3_phy_wait_otg_init(channel, &flags);
+	if (ret)
+		goto unlock;
 
-			val |= USB2_USBCTR_PLL_RST;
-			writel(val, channel->base + USB2_USBCTR);
-		}
+	rphy->powered = false;
+
+	if (rcar_gen3_are_all_rphys_power_off(channel)) {
+		u32 val = readl(channel->base + USB2_USBCTR);
+
+		val |= USB2_USBCTR_PLL_RST;
+		writel(val, channel->base + USB2_USBCTR);
 	}
 
-	if (channel->vbus && !channel->otg_internal_reg)
+unlock:
+	spin_unlock_irqrestore(&channel->lock, flags);
+
+	if (!ret && channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -1007,6 +1106,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return ret;
 
 	spin_lock_init(&channel->lock);
+	init_completion(&channel->otg_init_done);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							channel->phy_data->phy_usb2_ops);
@@ -1048,6 +1148,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret,
 					     "Failed to request irq (%d)\n",
 					     irq);
+		channel->irq = irq;
 	}
 
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
-- 
2.43.0


