Return-Path: <linux-renesas-soc+bounces-34964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id luufBRytT2pQmgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 16:15:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F873214C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 16:15:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BBF230E1056
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 14:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD64A30EF9B;
	Thu,  9 Jul 2026 14:03:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844102AD10;
	Thu,  9 Jul 2026 14:03:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605785; cv=none; b=QnNiy8eeEVY71U0VO5/PfTSdqr7+7g075cHaU/Mg+bouw1E/GyStG00sOfuo0dkx+nKtA2joI4LcvMWPTgjGAF5aSadNUmacLy/deP/uJ1S9wE6/TCVcHCB/NGUr1cajOdh1kzgh7NXsTnKKEVD+teIZPX1cQiraYq3Yiy3iBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605785; c=relaxed/simple;
	bh=xdwfTdc0ZT7p07rzeLeHqV9VIuRDUqk6bO5Y9jtC/gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W093EpNxZrYy1aVtV37iKDCDJRUQZI44IMuixl3MBBGLqjqvlfABNaxnUwqinc47YzdfYaVCmVFmVnD9mSplOthiIkWtFow/6TamzL3I8N5kSQ4JbXwlVkqLAl155vG6HfeQU8iv8SA3OwyMmv7g3VrdZ4uHaYDJ54KnbIU+JRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3553F1F000E9;
	Thu,  9 Jul 2026 14:03:00 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v4] phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context
Date: Thu,  9 Jul 2026 17:02:57 +0300
Message-ID: <20260709140257.843685-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:pavel@nabladev.com,m:iwamatsu@nigauri.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34964-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nigauri.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 611F873214C

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

The OTG can only be initialized once. It is initialized by the first PHY
that calls struct phy_ops::rcar_gen3_phy_usb2_init().

To avoid failures when multiple PHYs call struct
phy_ops::rcar_gen3_phy_usb2_init() simultaneously, and the PHY responsible
for initializing the OTG either fails or deinit quiqly and another PHY
takes over the PHY init role), the code waiting for the
channel->otg_init_done completion retries up to NUM_OF_PHYS times.

Fixes: 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data")
Cc: stable@vger.kernel.org
Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
Reported-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- increase the timeout to 120 ms and added a macro for it USB2_OTG_INIT_TIMEOUT
- add retry mechanism when waiting for otg_init_done completion
- read the status registers in rcar_gen3_phy_usb2_irq() before returning,
  in case an unexpected IRQ is received while waiting for OTG init
- mask channel->phy_data->obint_enable_bits in rcar_gen3_phy_usb2_irqs_mask_all()
- updated the patch description

Changes in v3:
- initialize ret value in role_store()
- jump to exit label in role_store() to have the same exit path
- dropped scoped_guard() in rcar_gen3_phy_usb2_irq() to avoid mixing
  goto statements with scoped_guard()
- take into account USB2_INT_ENABLE_UCOM_INTEN when masking/unmasking IRQs
- increase the completion timeout to 40ms
- in rcar_gen3_phy_usb2_power_on() disable regulator on failure path

Changes in v2:
- dropped the rcar_gen3_phy_wait_otg_init() and used inline the code; with it
  the comment that was previously in rcar_gen3_phy_wait_otg_init() was added
  in struct rcar_gen3_chan for above the org_initializing variable
- dropped READ_ONCE()/WRITE_ONCE() arround struct rcar_gen3_chan::otg_initializing
- checked for struct rcar_gen3_chan::otg_initializing before checking for
  rcar_gen3_is_any_otg_rphy_initialized() in all code places
- added rcar_gen3_phy_usb2_irqs_mask_all() and rcar_gen3_phy_usb2_irqs_unmask()
  to mask/unmask only the interrupts at the controller level since the line is
  shared
- along with it dropped disable_irq_nosync()/enable_irq() from v1 along with
  struct rcar_gen3_chan::irq
- increased the completion timeout to 30 ms

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 258 +++++++++++++++++++----
 1 file changed, 217 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..e1873928cc84 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -106,6 +106,13 @@
 /*  RZ/G2L specific */
 #define USB2_LINECTRL1_USB2_IDMON	BIT(0)
 
+/*
+ * The OTG initialization is expected to finish in 20ms. Choose a large enough
+ * timeout to avoid waiters exit prematurely the waiting section under heavy
+ * CPU load.
+ */
+#define USB2_OTG_INIT_TIMEOUT		msecs_to_jiffies(120)
+
 #define NUM_OF_PHYS			4
 enum rcar_gen3_phy_index {
 	PHY_INDEX_BOTH_HC,
@@ -138,12 +145,20 @@ struct rcar_gen3_chan {
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct work_struct work;
+	struct completion otg_init_done;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
 	bool otg_internal_reg;
+	/*
+	 * The OTG can be initialized only once and needs to release the spinlock
+	 * and wait for 20 ms due to hardware constraints. If a thread executes
+	 * PHY configuration code while the OTG PHY is waiting for the 20 ms, the
+	 * thread will have to wait for the OTG PHY initialization to complete.
+	 */
+	bool otg_initializing;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -392,26 +407,52 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
+	int retries = NUM_OF_PHYS;
+	unsigned long flags;
+	int ret = -EIO;
 
-	guard(spinlock_irqsave)(&ch->lock);
+	spin_lock_irqsave(&ch->lock, flags);
 
-	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
-		return -EIO;
+	if (!ch->is_otg_channel)
+		goto unlock;
+
+	while (retries-- && ch->otg_initializing) {
+		spin_unlock_irqrestore(&ch->lock, flags);
+
+		ret = wait_for_completion_timeout(&ch->otg_init_done,
+						  USB2_OTG_INIT_TIMEOUT);
+		ret = ret ? 0 : -ETIMEDOUT;
+		if (ret && !retries)
+			goto exit;
+
+		spin_lock_irqsave(&ch->lock, flags);
+	}
+
+	if (!rcar_gen3_is_any_otg_rphy_initialized(ch)) {
+		ret = -EIO;
+		goto unlock;
+	}
 
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
+
+	ret = 0;
 
 	if (new_mode == PHY_MODE_USB_HOST) { /* And is_host must be false */
 		if (!is_b_device)	/* A-Peripheral */
@@ -425,7 +466,10 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			rcar_gen3_init_for_peri(ch);
 	}
 
-	return count;
+unlock:
+	spin_unlock_irqrestore(&ch->lock, flags);
+exit:
+	return ret ?: count;
 }
 
 static ssize_t role_show(struct device *dev, struct device_attribute *attr,
@@ -441,14 +485,11 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
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
@@ -471,7 +512,11 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
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
@@ -502,6 +547,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	void __iomem *usb2_base = ch->base;
 	struct device *dev = ch->dev;
 	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
 	u32 status;
 
 	pm_runtime_get_noresume(dev);
@@ -509,33 +555,91 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	if (pm_runtime_suspended(dev))
 		goto rpm_put;
 
-	scoped_guard(spinlock, &ch->lock) {
-		status = readl(usb2_base + USB2_OBINTSTA);
-		if (status & ch->phy_data->obint_enable_bits) {
-			dev_vdbg(dev, "%s: %08x\n", __func__, status);
-			if (ch->phy_data->vblvl_ctrl)
-				writel(USB2_OBINTSTA_CLEAR, usb2_base + USB2_OBINTSTA);
-			else
-				writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTSTA);
-			rcar_gen3_device_recognition(ch);
-			rcar_gen3_configure_vblvl_ctrl(ch);
-			ret = IRQ_HANDLED;
-		}
+	spin_lock_irqsave(&ch->lock, flags);
+
+	status = readl(usb2_base + USB2_OBINTSTA);
+	if (status & ch->phy_data->obint_enable_bits) {
+		dev_vdbg(dev, "%s: %08x\n", __func__, status);
+		if (ch->phy_data->vblvl_ctrl)
+			writel(USB2_OBINTSTA_CLEAR, usb2_base + USB2_OBINTSTA);
+		else
+			writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTSTA);
+
+		ret = IRQ_HANDLED;
+
+		/* This should not happen! */
+		if (ch->otg_initializing)
+			goto unlock;
+
+		rcar_gen3_device_recognition(ch);
+		rcar_gen3_configure_vblvl_ctrl(ch);
 	}
 
+unlock:
+	spin_unlock_irqrestore(&ch->lock, flags);
 rpm_put:
 	pm_runtime_put_noidle(dev);
 	return ret;
 }
 
+static void rcar_gen3_phy_usb2_irqs_mask_all(struct rcar_gen3_chan *channel,
+					     u32 *masked_irqs_bits)
+{
+	u32 val, bitmask = USB2_INT_ENABLE_UCOM_INTEN;
+	void __iomem *usb2_base = channel->base;
+
+	for (unsigned int i = 0; i < NUM_OF_PHYS; i++)
+		bitmask |= channel->rphys[i].int_enable_bits;
+
+	val = readl(usb2_base + USB2_INT_ENABLE);
+	*masked_irqs_bits = val & bitmask;
+	/*
+	 * Don't report channel->phy_data->obint_enable_bits IRQs. These are
+	 * unmasked anyway in rcar_gen3_init_otg_phase1().
+	 */
+	val &= ~(bitmask | channel->phy_data->obint_enable_bits);
+	writel(val, usb2_base + USB2_INT_ENABLE);
+}
+
+static void rcar_gen3_phy_usb2_irqs_unmask(struct rcar_gen3_chan *channel,
+					   u32 irqs_bits)
+{
+	u32 val, bitmask = USB2_INT_ENABLE_UCOM_INTEN;
+	void __iomem *usb2_base = channel->base;
+
+	for (unsigned int i = 0; i < NUM_OF_PHYS; i++)
+		bitmask |= channel->rphys[i].int_enable_bits;
+
+	val = readl(usb2_base + USB2_INT_ENABLE);
+	val &= ~bitmask;
+	val |= irqs_bits;
+	writel(val, usb2_base + USB2_INT_ENABLE);
+}
+
 static int rcar_gen3_phy_usb2_init(struct phy *p)
 {
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	int retries = NUM_OF_PHYS;
+	unsigned long flags;
 	u32 val;
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
+
+	while (retries-- && channel->otg_initializing) {
+		int ret;
+
+		spin_unlock_irqrestore(&channel->lock, flags);
+
+		ret = wait_for_completion_timeout(&channel->otg_init_done,
+						  USB2_OTG_INIT_TIMEOUT);
+		ret = ret ? 0 : -ETIMEDOUT;
+		if (ret && !retries)
+			return ret;
+
+		spin_lock_irqsave(&channel->lock, flags);
+	}
 
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
@@ -548,8 +652,24 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	}
 
 	/* Initialize otg part (only if we initialize a PHY with IRQs). */
-	if (rphy->int_enable_bits)
-		rcar_gen3_init_otg(channel);
+	if (rphy->int_enable_bits && channel->is_otg_channel &&
+	    !rcar_gen3_is_any_otg_rphy_initialized(channel)) {
+		u32 masked_irq_bits = 0;
+
+		rcar_gen3_init_otg_phase0(channel);
+		rcar_gen3_phy_usb2_irqs_mask_all(channel, &masked_irq_bits);
+		reinit_completion(&channel->otg_init_done);
+		channel->otg_initializing = true;
+		spin_unlock_irqrestore(&channel->lock, flags);
+
+		fsleep(20000);
+
+		spin_lock_irqsave(&channel->lock, flags);
+		channel->otg_initializing = false;
+		complete_all(&channel->otg_init_done);
+		rcar_gen3_phy_usb2_irqs_unmask(channel, masked_irq_bits);
+		rcar_gen3_init_otg_phase1(channel);
+	}
 
 	if (channel->phy_data->vblvl_ctrl) {
 		/* SIDDQ mode release */
@@ -568,6 +688,8 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 
 	rphy->initialized = true;
 
+	spin_unlock_irqrestore(&channel->lock, flags);
+
 	return 0;
 }
 
@@ -576,9 +698,25 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	int retries = NUM_OF_PHYS;
+	unsigned long flags;
 	u32 val;
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
+
+	while (retries-- && channel->otg_initializing) {
+		int ret;
+
+		spin_unlock_irqrestore(&channel->lock, flags);
+
+		ret = wait_for_completion_timeout(&channel->otg_init_done,
+						  USB2_OTG_INIT_TIMEOUT);
+		ret = ret ? 0 : -ETIMEDOUT;
+		if (ret && !retries)
+			return ret;
+
+		spin_lock_irqsave(&channel->lock, flags);
+	}
 
 	rphy->initialized = false;
 
@@ -588,6 +726,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 		val &= ~USB2_INT_ENABLE_UCOM_INTEN;
 	writel(val, usb2_base + USB2_INT_ENABLE);
 
+	spin_unlock_irqrestore(&channel->lock, flags);
 	return 0;
 }
 
@@ -596,6 +735,8 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	int retries = NUM_OF_PHYS;
+	unsigned long flags;
 	u32 val;
 	int ret = 0;
 
@@ -605,7 +746,19 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 			return ret;
 	}
 
-	guard(spinlock_irqsave)(&channel->lock);
+	spin_lock_irqsave(&channel->lock, flags);
+
+	while (retries-- && channel->otg_initializing) {
+		spin_unlock_irqrestore(&channel->lock, flags);
+
+		ret = wait_for_completion_timeout(&channel->otg_init_done,
+						  USB2_OTG_INIT_TIMEOUT);
+		ret = ret ? 0 : -ETIMEDOUT;
+		if (ret && !retries)
+			goto disable_regulator;
+
+		spin_lock_irqsave(&channel->lock, flags);
+	}
 
 	if (!rcar_gen3_are_all_rphys_power_off(channel))
 		goto out;
@@ -620,27 +773,49 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	/* The powered flag should be set for any other phys anyway */
 	rphy->powered = true;
 
-	return 0;
+	spin_unlock_irqrestore(&channel->lock, flags);
+
+disable_regulator:
+	if (ret && channel->vbus && !channel->otg_internal_reg)
+		regulator_disable(channel->vbus);
+
+	return ret;
 }
 
 static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 {
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
+	int retries = NUM_OF_PHYS;
+	unsigned long flags;
 	int ret = 0;
 
-	scoped_guard(spinlock_irqsave, &channel->lock) {
-		rphy->powered = false;
+	spin_lock_irqsave(&channel->lock, flags);
 
-		if (rcar_gen3_are_all_rphys_power_off(channel)) {
-			u32 val = readl(channel->base + USB2_USBCTR);
+	while (retries-- && channel->otg_initializing) {
+		spin_unlock_irqrestore(&channel->lock, flags);
 
-			val |= USB2_USBCTR_PLL_RST;
-			writel(val, channel->base + USB2_USBCTR);
-		}
+		ret = wait_for_completion_timeout(&channel->otg_init_done,
+						  USB2_OTG_INIT_TIMEOUT);
+		ret = ret ? 0 : -ETIMEDOUT;
+		if (ret && !retries)
+			return ret;
+
+		spin_lock_irqsave(&channel->lock, flags);
 	}
 
-	if (channel->vbus && !channel->otg_internal_reg)
+	rphy->powered = false;
+
+	if (rcar_gen3_are_all_rphys_power_off(channel)) {
+		u32 val = readl(channel->base + USB2_USBCTR);
+
+		val |= USB2_USBCTR_PLL_RST;
+		writel(val, channel->base + USB2_USBCTR);
+	}
+
+	spin_unlock_irqrestore(&channel->lock, flags);
+
+	if (!ret && channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -1007,6 +1182,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return ret;
 
 	spin_lock_init(&channel->lock);
+	init_completion(&channel->otg_init_done);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							channel->phy_data->phy_usb2_ops);
-- 
2.43.0


