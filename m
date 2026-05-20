Return-Path: <linux-renesas-soc+bounces-32872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFrHBnmzDWo62AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B499058E935
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2F043046413
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCA53DE439;
	Wed, 20 May 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrtxoDdV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911673E2770;
	Wed, 20 May 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282742; cv=none; b=sNkNfL837SKhswDFr2+DJuCrd2g13IF4noKmY4dIuwgiyLtlSmGPFQJYo+epwgjZXVtZlZxNlBzb/oKTqUcFaMDQE4obJk5cs+NInRrhuWzWmQQfgGwHZNfUeicD9U2iuzdN6nycEPvIAL1avd+2L33dkX2eFeM0pHSEnqQjdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282742; c=relaxed/simple;
	bh=20m5y76wA66YVmqMkAC8xrwCibqKc/+yCcmzTyI0sSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR8MuLXMBxZP+4d68Yy0fnYZt1lal9RZ+w9JFkgSzxpOiraYb+KpyBzuF+FG4W2/Hl5a46hBqXMb+Vt/aumGJ4QBA7PclYtdOS5Pns72VWaatAHhsvJlUxbk5mA59NVoG7aEfxwUd3CH+qTbgSnm5v3V9F+dFSJezCKEV2/32c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrtxoDdV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9F01F00893;
	Wed, 20 May 2026 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282732;
	bh=elKE4oooxXyLT+shPPHMjDb4ahealcIpVbBJ+ePAhrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PrtxoDdVfIJ9/N4PF1nVCnP8gfqgSbUbAZhZLCz2pYniNKUKhc+wzWql7cd79tWaz
	 tQ9m9yDYQdp1syOyTVgftsFjKznHRv5AoQtMOGTOd32I5qMA2IMaUkz09lTaJocZWV
	 ZuCf7ddVIpLHMBc9eTvSo4/6MV3LvXn4nTDohBFSJju9/yu7apellbfEsNAIJAT51d
	 AxWzPTGJ9Cnr9XiQQX7xb4ieI3RbBA4APp+5d89zSUOl02GGMgV0BOABYPMNMRfAdN
	 49D+BhldnbsZFJq6/NgJBqt7sy/3wt42jk+hgNMGTEVG4/YRbiwPGcbt72DqqRqyYz
	 3w47h3oaY8vBQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] i2c: riic: Abort the transfer on completion timeout
Date: Wed, 20 May 2026 16:12:03 +0300
Message-ID: <20260520131206.932050-2-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520131206.932050-1-claudiu.beznea@kernel.org>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32872-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B499058E935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

riic_xfer() configures a transfer and waits for the interrupt handler to
signal its completion. If the completion times out, the device may be
powered off through runtime PM. However, the transfer interrupt may still
fire after the timeout.

To avoid cases where riic_xfer() powers off the device (via runtime PM)
while the interrupt handler is still running, disable and synchronize the
interrupts after the completion times out.

Fixes: 310c18a41450 ("i2c: riic: add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

 drivers/i2c/busses/i2c-riic.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9e3595b3623e..68d359ce2e66 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -112,6 +112,7 @@ struct riic_dev {
 	void __iomem *base;
 	u8 *buf;
 	struct i2c_msg *msg;
+	int *irqs;
 	int bytes_left;
 	int err;
 	int is_last;
@@ -165,6 +166,20 @@ static int riic_bus_barrier(struct riic_dev *riic)
 	return 0;
 }
 
+static void riic_abort_xfer(struct riic_dev *riic)
+{
+	/*
+	 * Disable interrupts. Read back registers to confirm writes have
+	 * fully propagated.
+	 */
+	riic_writeb(riic, 0, RIIC_ICIER);
+	riic_readb(riic, RIIC_ICIER);
+
+	/* Synchronize IRQs */
+	for (unsigned int i = 0; i < riic->info->num_irqs; i++)
+		synchronize_irq(riic->irqs[i]);
+}
+
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
@@ -196,8 +211,10 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		riic_writeb(riic, start_bit, RIIC_ICCR2);
 
 		time_left = wait_for_completion_timeout(&riic->msg_done, riic->adapter.timeout);
-		if (time_left == 0)
+		if (time_left == 0) {
+			riic_abort_xfer(riic);
 			riic->err = -ETIMEDOUT;
+		}
 
 		if (riic->err)
 			break;
@@ -543,16 +560,20 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	riic->info = of_device_get_match_data(dev);
 
+	riic->irqs = devm_kcalloc(&pdev->dev, riic->info->num_irqs,
+				  sizeof(*riic->irqs), GFP_KERNEL);
+	if (!riic->irqs)
+		return -ENOMEM;
+
 	for (i = 0; i < riic->info->num_irqs; i++) {
 		const struct riic_irq_desc *irq_desc;
-		int irq;
 
 		irq_desc = &riic->info->irqs[i];
-		irq = platform_get_irq(pdev, irq_desc->res_num);
-		if (irq < 0)
-			return irq;
+		riic->irqs[i] = platform_get_irq(pdev, irq_desc->res_num);
+		if (riic->irqs[i] < 0)
+			return riic->irqs[i];
 
-		ret = devm_request_irq(dev, irq, irq_desc->isr, 0, irq_desc->name, riic);
+		ret = devm_request_irq(dev, riic->irqs[i], irq_desc->isr, 0, irq_desc->name, riic);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request irq %s\n",
 					     irq_desc->name);
-- 
2.43.0


