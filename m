Return-Path: <linux-renesas-soc+bounces-27247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CRXCV1ccWnLGAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:08:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF905F421
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1C3C488E16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C246244D01B;
	Wed, 21 Jan 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KtSdQ7G2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d5rwGeEl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3F33B6E3;
	Wed, 21 Jan 2026 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036872; cv=none; b=p2i3R8dUT6LKL5Pel5WI/TzfBDLCaaqneIrtEFEBycqB722g7hr7CZvNBmic5cCwNWaJmN9AUzIkYZshYnMgWFKez0uNzAQbaNtZsDwZDV6oZtUdgKNcTBiP7/QkU8zgTqEBfEdgysatgG126b6Qh0yE3jpUMS9BRYkqKyBpue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036872; c=relaxed/simple;
	bh=eP5u0bcH6/ndLOE9f1NkKZVIEDWPotwUSRX3eNj33m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwqjjrR+ACQnzlzsUjsumYRSmBA0QDCpE34LfwVFTVUst8GbMW9/6wV9+xihZZMnQvXgKOc+M0xthBK33YLgYz+NSjSoCHVLD4kwUKBu9KE1Zl0OQa8pXQ0LpO6Qdo1mmR42TTb4VGVuJFyzQGx7NVnJSVoB0KCGT71Dw+GE/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KtSdQ7G2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d5rwGeEl; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dxKbl39HSz9tWx;
	Thu, 22 Jan 2026 00:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769036867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbygMkA9xb3PiCriBCXe9IPnA17+OvXYfLow5fH/iTU=;
	b=KtSdQ7G2ZznVL3V7UZHOb/dQzo/oNmvVunJ0ffhecECrs2T9M6/V8AT6k2RNmTylkg4qJ0
	VwKrPP0Kdyxkdp+6fFDuJF5gmsSnj5ivM5PggVKrn1KmaaGPHNfkhzWuJpvsn2ui/Czs7s
	V5lffNFHfudpUct2PII4cpo3RWn22/0vCsbAy5skmS2eeb/wWV1D4gKTpqoKcXxnnRxmse
	4cjU1CVYlafNxbicsMjyZXyneOO3FkVXCnLt+EAV2woA+76CMih27qvohaBf6diLdV5XS/
	Xbn0ku4d6uD2rzosOS3RsDVbvRPTej/AfGdxN6PSG8o2PdtDf4bp6dZ5Ligc7Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769036865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbygMkA9xb3PiCriBCXe9IPnA17+OvXYfLow5fH/iTU=;
	b=d5rwGeElRieS+4t6SlMYuS9QEt3wFfzExNTRF+7SeDEv6IVMdKTycvsyAazBHw50NPlrtI
	MgsvndZRlXIyXsPIy6C4DSVXfdNSSrso2D4lwJTg6x1xlqa9DkFTbPJm4/+CBrrACwc9JR
	1Ml1StnMla6HV+FKFGiyamvkaqsnUUJmzDlF0O/QDjPxXD42g03bkWAADaJ6mtJOdRtc73
	wBeY5M9V0EFhukN5uC2u7LjAncyR8O9FdO7hRYBo4cUcepeS78HG6v83WDadVXiNUUpzOa
	RWtKDvt05oeS2MNmFwPWN12yex1XJi5p3lQBD5he3Z1yJztMF2kBFkJziSDjDw==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 2/2] Input: ili210x - add support for polling mode
Date: Thu, 22 Jan 2026 00:06:47 +0100
Message-ID: <20260121230736.114623-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260121230736.114623-1-marek.vasut+renesas@mailbox.org>
References: <20260121230736.114623-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5x39q9u81ns5qrmh45on6q7q1oz5z9iu
X-MBO-RS-ID: 07c1d74621d32b1001e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	FREEMAIL_CC(0.00)[mailbox.org,nxp.com,kernel.org,gmail.com,noorman.info,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27247-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,nxp.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: BEF905F421
X-Rspamd-Action: no action

There are designs incorporating Ilitek ILI2xxx touch controller that
do not connect interrupt pin, for example Waveshare 13.3" DSI display.
To support such systems use polling mode for the input device when I2C
client does not have interrupt assigned to it.

Factor out ili210x_firmware_update_noirq() to allow conditional scoped
guard around this code. The scoped guard has to be applied only in case
the IRQ line is connected, and not applied otherwise.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Test client->irq > 0 for IRQ presence
V3: - Rebase on dev_err_probe() conversion
    - Fix if (client->irq > 0) in ili210x_firmware_update_store()
V4: No change
V5: - Add RB from Frank
    - Rename ili210x_firmware_update_noirq() to ili210x_firmware_update()
    - Change scoped_guard() to guard()
---
 drivers/input/touchscreen/ili210x.c | 75 +++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 264eee3e61d0a..3bf524a6ee204 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 	return contact;
 }
 
-static irqreturn_t ili210x_irq(int irq, void *irq_data)
+static void ili210x_process_events(struct ili210x *priv)
 {
-	struct ili210x *priv = irq_data;
 	struct i2c_client *client = priv->client;
 	const struct ili2xxx_chip *chip = priv->chip;
 	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
@@ -356,8 +355,22 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 				usleep_range(time_delta, time_delta + 1000);
 		}
 	} while (!priv->stop && keep_polling);
+}
+
+static irqreturn_t ili210x_irq(int irq, void *irq_data)
+{
+	struct ili210x *priv = irq_data;
+
+	ili210x_process_events(priv);
 
 	return IRQ_HANDLED;
+};
+
+static void ili210x_work_i2c_poll(struct input_dev *input)
+{
+	struct ili210x *priv = input_get_drvdata(input);
+
+	ili210x_process_events(priv);
 }
 
 static int ili251x_firmware_update_resolution(struct device *dev)
@@ -829,12 +842,32 @@ static int ili210x_do_firmware_update(struct ili210x *priv,
 	return 0;
 }
 
+static ssize_t ili210x_firmware_update(struct device *dev, const u8 *fwbuf,
+				       u16 ac_end, u16 df_end)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	const char *fwname = ILI251X_FW_FILENAME;
+	int error;
+
+	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+
+	ili210x_hardware_reset(priv->reset_gpio);
+
+	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
+
+	ili210x_hardware_reset(priv->reset_gpio);
+
+	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+
+	return error;
+}
+
 static ssize_t ili210x_firmware_update_store(struct device *dev,
 					     struct device_attribute *attr,
 					     const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct ili210x *priv = i2c_get_clientdata(client);
 	const char *fwname = ILI251X_FW_FILENAME;
 	u16 ac_end, df_end;
 	int error;
@@ -860,16 +893,11 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	 * the touch controller to disable the IRQs during update, so we have
 	 * to do it this way here.
 	 */
-	scoped_guard(disable_irq, &client->irq) {
-		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
-
-		ili210x_hardware_reset(priv->reset_gpio);
-
-		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
-
-		ili210x_hardware_reset(priv->reset_gpio);
-
-		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+	if (client->irq > 0) {
+		guard(disable_irq)(&client->irq);
+		error = ili210x_firmware_update(dev, fwbuf, ac_end, df_end);
+	} else {
+		error = ili210x_firmware_update(dev, fwbuf, ac_end, df_end);
 	}
 
 	return error ?: count;
@@ -945,9 +973,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	if (!chip)
 		return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
 
-	if (client->irq <= 0)
-		return dev_err_probe(dev, -EINVAL, "No IRQ!\n");
-
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio))
 		return PTR_ERR(reset_gpio);
@@ -997,10 +1022,20 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	if (error)
 		return dev_err_probe(dev, error, "Unable to set up slots\n");
 
-	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
-					  IRQF_ONESHOT, client->name, priv);
-	if (error)
-		return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
+	input_set_drvdata(input, priv);
+
+	if (client->irq > 0) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
+						  IRQF_ONESHOT, client->name, priv);
+		if (error)
+			return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
+	} else {
+		error = input_setup_polling(input, ili210x_work_i2c_poll);
+		if (error)
+			return dev_err_probe(dev, error, "Could not set up polling mode\n");
+
+		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
+	}
 
 	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
 	if (error)
-- 
2.51.0


