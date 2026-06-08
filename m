Return-Path: <linux-renesas-soc+bounces-33698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AaQFAvgjJ2ohsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:20:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87565A5FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=B1XEdL3a;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00F99303C62A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3924386C0D;
	Mon,  8 Jun 2026 20:16:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2738F250;
	Mon,  8 Jun 2026 20:16:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949772; cv=none; b=Tuk7osY1TPGuRnWcYbZGG+Hz9IB76x4R8mCUTrlGNmnwG1quEbVbXh2tljrFcgrTLV1u2U3G1GTnecT6eSaUHWIvA9FLj1rC7H2Ez1RpZvjfjYGI3juhkftlKKkkAszI1derBrECVrfeB7mxu+xKAIdgqzDMN9HvL8XO8j+/1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949772; c=relaxed/simple;
	bh=KcpZt89G3Js/RJXwoOx/epm8WxT4E5lCkyHQ9JOYyNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJyS/31ER7HEBtXkurIYSh3WPzVR5kBbxfpWO9hWJ43TGd2IVcDTDvr/mwfuvg5lGbuzv9y5ewQKGAXEUR1ZSmL38h5B1LP4pif2JOTZJZlnZlHeShehRDsbkOo0y+xLFRBbsIGA6hBGAV7uLjnrsLQXCP2DgEr86zaak0ZpDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1XEdL3a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6257A1F00893;
	Mon,  8 Jun 2026 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949771;
	bh=hDXDeMq3KCQuQD6o7rm0NkrHfXHqQRvAJcOo6dEcok8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B1XEdL3ac8jrJp9c921/iqOCFjheMiVfhjbfS0dNwD6kOyx65YAPQvdtb2SIpAFXU
	 yImAqhdfgNeEW6SMXBVnIteinz7UmnL3JArTBzFSslW3jrEHPwPUxGyT5cDEonKfLF
	 AJl049pvU6uIHlaGkb/VfseJf78Ndez0hIvrs+Ql8MBgegJO1P24Ebb45orzMeD2wM
	 TS6X/TZ/S28qAg07iq4OGbGgvkHpAXOJF+wO9RgrHs59OduVNVAQ9udottJ9dfRvy4
	 jT7PSUKl0wVleSMWRcMrAEkX8+jtYcjd02ZQR8KPQ0nsHwBi5tNWMlNRZvguHyXQMM
	 lxoOfsAGPPyrA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume
Date: Mon,  8 Jun 2026 23:15:32 +0300
Message-ID: <20260608201543.804902-7-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33698-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C87565A5FF

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

To cover the case where the controller had already attached all the
i3c->maxdevs devices before a suspend/resume cycle and i3c->free_pos is
zero, struct renesas_i3c::resuming flag was introduced.

The flag is set in renesas_i3c_resume() before calling
i3c_master_do_daa_ext() and checked in renesas_i3c_daa().

When resuming from suspend, renesas_i3c_daa() re-runs DAA for all slots
except those used by I2C devices. Since I2C devices may be attached both
during probe (at bus initialization time) and at runtime, the device
slots maintained by the driver may become interleaved with both I2C and
I3C devices.

However, the controller performs dynamic address assignment for I3C
devices starting from a specified DATBAS register index and for a
specified number of I3C devices. This becomes a problem when the bus is
fully occupied by I2C and I3C devices before suspend.

To address this, I2C and I3C devices are grouped, if resuming, in the
i3c->addrs[] array such that I2C devices occupy the first slots and I3C
devices occupy the remaining ones. In this scenario, I3C devices are
re-attached using i3c_master_reattach_i3c_dev_locked(), since the bus is
fully occupied and renesas_i3c_get_free_pos() would otherwise return a
negative error code.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

 drivers/i3c/master/renesas-i3c.c | 209 ++++++++++++++++++++++++-------
 1 file changed, 166 insertions(+), 43 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 7ef317b2ba39..c475d30a84c7 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -252,6 +252,15 @@ struct renesas_i3c_xferqueue {
 	spinlock_t lock;
 };
 
+struct renesas_i3c_addr {
+	union {
+		struct i2c_dev_desc *i2c_dev;
+		struct i3c_dev_desc *i3c_dev;
+	};
+	bool is_i2c;
+	u8 addr;
+};
+
 struct renesas_i3c {
 	struct i3c_master_controller base;
 	enum i3c_internal_state internal_state;
@@ -262,13 +271,13 @@ struct renesas_i3c {
 	u32 i3c_STDBR;
 	u32 extbr;
 	unsigned long rate;
-	u8 addrs[RENESAS_I3C_MAX_DEVS];
+	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	bool resuming;
 	u8 num_clks;
 	u8 refclk_div;
 };
@@ -335,7 +344,7 @@ static int renesas_i3c_get_addr_pos(struct renesas_i3c *i3c, u8 addr)
 	int pos;
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
-		if (addr == i3c->addrs[pos])
+		if (addr == i3c->addrs[pos].addr)
 			return pos;
 	}
 
@@ -480,8 +489,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-					0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -637,12 +646,80 @@ static void renesas_i3c_bus_cleanup(struct i3c_master_controller *m)
 	renesas_i3c_reset(i3c);
 }
 
+static u8 renesas_i3c_group_devs_in_slots(struct renesas_i3c *i3c)
+{
+	struct renesas_i3c_i2c_dev_data *new_i2c_data, *new_i3c_data;
+	struct renesas_i3c_addr i2c_addr, i3c_addr;
+	struct i3c_dev_desc *i3c_dev;
+	struct i2c_dev_desc *i2c_dev;
+	u8 i2c_pos = 0;
+
+	/*
+	 * The controller cannot handle interleaved I2C and I3C devices in the
+	 * slots. It expects to be configured with a starting DATBAS register
+	 * index and the number of I3C devices for which to run dynamic address
+	 * assignment.
+	 *
+	 * Since I2C devices may be added after bus initialization, group the
+	 * devices in slots so that the I2C devices occupy the first slots
+	 * and I3C devices the remaining ones.
+	 *
+	 * This allows the controller to run ENTDAA by specifying the starting
+	 * DATBAS register index and the number of I3C devices. As a result,
+	 * ENTDAA can be re-run for all I3C devices and they can be re-attached
+	 * after a suspend/resume cycle in which power to both the controller
+	 * and the I3C devices was lost.
+	 */
+	for (u8 pos = 0; pos < i3c->maxdevs; pos++) {
+		if (i3c->free_pos & BIT(pos))
+			continue;
+
+		if (!i3c->addrs[pos].is_i2c)
+			continue;
+
+		if (pos == i2c_pos) {
+			i2c_pos++;
+			continue;
+		}
+
+		/*
+		 * Swap the I3C device on i2c_pos slot with the I2C dev
+		 * on pos slot.
+		 */
+		i3c_addr = i3c->addrs[i2c_pos];
+		i3c_dev = i3c_addr.i3c_dev;
+
+		i2c_addr = i3c->addrs[pos];
+		i2c_dev = i2c_addr.i2c_dev;
+
+		new_i2c_data = i3c_dev_get_master_data(i3c_dev->dev->desc);
+		new_i3c_data = i2c_dev_get_master_data(i2c_dev);
+
+		i3c->addrs[i2c_pos] = i3c->addrs[pos];
+		i3c->addrs[i2c_pos].is_i2c = true;
+		i3c->addrs[i2c_pos].i2c_dev = i2c_dev;
+
+		i3c->addrs[pos] = i2c_addr;
+		i3c->addrs[pos].is_i2c = false;
+		i3c->addrs[pos].i3c_dev = i3c_dev;
+
+		new_i2c_data->index = i2c_pos++;
+		new_i3c_data->index = pos;
+
+		i2c_dev_set_master_data(i2c_dev, new_i2c_data);
+		i3c_dev_set_master_data(i3c_dev, new_i3c_data);
+	}
+
+	return i2c_pos;
+}
+
 static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
+	u8 first_i3c_pos = 0;
 	int ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
@@ -655,16 +732,25 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	olddevs = ~(i3c->free_pos);
 	i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_ENTDAA;
 
+	if (i3c->resuming)
+		first_i3c_pos = renesas_i3c_group_devs_in_slots(i3c);
+
 	/* Setting DATBASn registers for target devices. */
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
-		if (olddevs & BIT(pos))
-			continue;
+		if (olddevs & BIT(pos)) {
+			if (i3c->resuming) {
+				if (pos < first_i3c_pos)
+					continue;
+			} else {
+				continue;
+			}
+		}
 
 		ret = i3c_master_get_free_addr(m, last_addr + 1);
 		if (ret < 0)
 			return -ENOSPC;
 
-		i3c->addrs[pos] = ret;
+		i3c->addrs[pos].addr = ret;
 		last_addr = ret;
 
 		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
@@ -674,9 +760,14 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
-	ret = renesas_i3c_get_free_pos(i3c);
-	if (ret < 0)
-		return ret;
+	if (i3c->resuming) {
+		/* Run ENTDAA for all the I3C devices on the bus, if resuming. */
+		ret = first_i3c_pos;
+	} else {
+		ret = renesas_i3c_get_free_pos(i3c);
+		if (ret < 0)
+			return ret;
+	}
 
 	/*
 	 * Setup the command descriptor to start the ENTDAA command
@@ -689,12 +780,38 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
-	newdevs &= ~olddevs;
+	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
+	/* Re-attach all the I3C devices on resume. */
+	if (!i3c->resuming)
+		newdevs &= ~olddevs;
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
-		if (newdevs & BIT(pos))
-			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
+		if (!(newdevs & BIT(pos)))
+			continue;
+
+		/*
+		 * If the bus was fully occupied before suspend, re-attach the
+		 * devices and update the addresses tracked by the subsystem.
+		 * Without this, i3c_master_add_i3c_dev_locked() returns errors
+		 * due to a lack of free slots (as reported by
+		 * renesas_i3c_get_free_pos()), causing the attachment to fail.
+		 *
+		 * Otherwise, follow the normal
+		 * i3c_master_add_i3c_dev_locked() path, which will re-attach the
+		 * devices, keep the subsystem state and driver addresses in sync,
+		 * and perform all the required internal bookkeeping.
+		 */
+		if (!i3c->free_pos && i3c->resuming) {
+			struct i3c_dev_desc *dev = i3c->addrs[pos].i3c_dev->dev->desc;
+			u8 old_dyn_addr;
+
+			old_dyn_addr = dev->info.dyn_addr;
+			dev->info.dyn_addr = i3c->addrs[pos].addr;
+
+			i3c_master_reattach_i3c_dev_locked(dev, old_dyn_addr);
+		} else {
+			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos].addr);
+		}
 	}
 
 	return 0;
@@ -876,11 +993,12 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	i3c->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;
+	i3c->addrs[pos].addr = dev->info.dyn_addr ? : dev->info.static_addr;
+	i3c->addrs[pos].i3c_dev = dev;
 	i3c->free_pos &= ~BIT(pos);
 
 	renesas_writel(i3c->regs, DATBAS(pos), DATBAS_DVSTAD(dev->info.static_addr) |
-				    datbas_dvdyad_with_parity(i3c->addrs[pos]));
+				    datbas_dvdyad_with_parity(i3c->addrs[pos].addr));
 	i3c_dev_set_master_data(dev, data);
 
 	return 0;
@@ -892,25 +1010,28 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_dev_desc *tmp_dev = i3c->addrs[data->index].i3c_dev;
 	int pos;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 
 	if (data->index != pos && pos >= 0) {
 		renesas_writel(i3c->regs, DATBAS(data->index), 0);
-		i3c->addrs[data->index] = 0;
+		i3c->addrs[data->index].addr = 0;
+		i3c->addrs[data->index].i3c_dev = NULL;
 		i3c->free_pos |= BIT(data->index);
 
 		data->index = pos;
 		i3c->free_pos &= ~BIT(data->index);
 	}
 
-	i3c->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
+	i3c->addrs[data->index].addr = dev->info.dyn_addr ? dev->info.dyn_addr :
 							dev->info.static_addr;
+	i3c->addrs[data->index].i3c_dev = tmp_dev;
 
 	renesas_writel(i3c->regs, DATBAS(data->index),
 		       DATBAS_DVSTAD(dev->info.static_addr) |
-		       datbas_dvdyad_with_parity(i3c->addrs[data->index]));
+		       datbas_dvdyad_with_parity(i3c->addrs[data->index].addr));
 
 	return 0;
 }
@@ -922,7 +1043,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
 	i3c_dev_set_master_data(dev, NULL);
-	i3c->addrs[data->index] = 0;
+	i3c->addrs[data->index].addr = 0;
+	i3c->addrs[data->index].i3c_dev = NULL;
 	i3c->free_pos |= BIT(data->index);
 	kfree(data);
 }
@@ -1002,7 +1124,9 @@ static int renesas_i3c_attach_i2c_dev(struct i2c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	i3c->addrs[pos] = dev->addr;
+	i3c->addrs[pos].addr = dev->addr;
+	i3c->addrs[pos].is_i2c = true;
+	i3c->addrs[pos].i2c_dev = dev;
 	i3c->free_pos &= ~BIT(pos);
 	i2c_dev_set_master_data(dev, data);
 
@@ -1016,7 +1140,9 @@ static void renesas_i3c_detach_i2c_dev(struct i2c_dev_desc *dev)
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
 	i2c_dev_set_master_data(dev, NULL);
-	i3c->addrs[data->index] = 0;
+	i3c->addrs[data->index].addr = 0;
+	i3c->addrs[data->index].is_i2c = false;
+	i3c->addrs[data->index].i2c_dev = NULL;
 	i3c->free_pos |= BIT(data->index);
 	kfree(data);
 }
@@ -1419,12 +1545,6 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
 
@@ -1435,17 +1555,13 @@ static void renesas_i3c_remove(struct platform_device *pdev)
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
@@ -1466,10 +1582,10 @@ static int renesas_i3c_suspend_noirq(struct device *dev)
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
@@ -1495,15 +1611,23 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
 		       MSDVAD_MDYAD(i3c->dyn_addr));
 
-	/* Restore Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
-
 	/* I3C hw init. */
 	renesas_i3c_hw_init(i3c);
 
+	i3c->resuming = true;
+
+	ret = i3c_master_do_daa_ext(&i3c->base, true);
+	if (ret)
+		dev_err(dev, "DAA failed on resume, ret=%d", ret);
+
+	i3c->resuming = false;
+
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	/*
+	 * I3C devices may have retained their dynamic address anyway. Do not
+	 * fail the resume because of DAA error.
+	 */
 	return 0;
 
 err_clks_disable:
@@ -1516,8 +1640,7 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops renesas_i3c_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
-				  renesas_i3c_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
 };
 
 static const struct of_device_id renesas_i3c_of_ids[] = {
-- 
2.43.0


