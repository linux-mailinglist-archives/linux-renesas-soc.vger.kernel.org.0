Return-Path: <linux-renesas-soc+bounces-33110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOvmIs3GFGqzQAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 00:01:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DE5CEF57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 00:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C52C301692D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60B3330D24;
	Mon, 25 May 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV3BwLVn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D32CCC5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779746505; cv=none; b=O5qzOXSVUM44OV5dxJFIczM/Oyns9UiLq0r6f1NmCEhUn40d//arxU33zzhXKD3owUd/MOPhfc537Ugz0lxQkPYLz64NrFbd+SenHnrZMBNdUI7kv/+7ny0UvqIvbt0LSayVLGbJIdDq03Zk/foXNu5RY40+4GL9Df7z11EdlXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779746505; c=relaxed/simple;
	bh=6uBZcvpHVG9ghMmyfS/bczxD/gV3gurTm4gN5EMIuSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJVotG8bsWJaRQvitebEmkfxzofwoKXYZDxX4VU1NCKHPi3M7PbjuWtTtUnxVkkHC94D7BZGGTEcXSp31rOz1zbMSqR7YpXjamC8tRe4x988SJh3LKUxQuEcJzGFgKYK6qePnxwJ6EJHQBAjsAvBYeVno/8BYaSi4g8N6TNaWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV3BwLVn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8016d642b2so4477537a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779746504; x=1780351304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7NKAW/ulkmG6NXCszZo+vmmRfLFaqedn1kwzn4OXVM=;
        b=kV3BwLVnXBHkc5dV9v8ZhShidwKIw4trhK21aU+r8aMcWxJfhVaPuykG1dTU8WdSNy
         c+ChPnUbdm1Px8fq76YiD8pnaDaiD+cegr9bDrkjFD0gPmBPJhlU/xDhRw+e7qyocUXT
         kI5btX1p5kv4c5CC8jEgvlt9FhTLA+9gqwAW1x6sHojzBFSJwnvr7NCDY3AQEYvW3XqW
         9OBQUqAIoMu7QtO4iKWyKT3eZTnWcECeYMMlGrjkgkDGF/xDrOtQl9QE9Clo2zfk6c11
         GNXKO8OZ/K9tybQTxDmW6zY+FNiJn6yBi5hCslwR/whwd36sPhkD0mAn2ghxCvNRo7Uy
         IvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779746504; x=1780351304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7NKAW/ulkmG6NXCszZo+vmmRfLFaqedn1kwzn4OXVM=;
        b=TCUbkv1wp0v+pRk5+nC8w6t5ZTliLGFBlzGMHLkeWu1IeV613X21VgBkaiZ0uCy7VD
         wwlw34BmTQ1tGuFPZhz97tBWf6mCds3YVKNu/cfLTuu+yaxU8yp8+Ra3q8Sr2OyuR/qj
         5wKB6o4d0XGTuNE4UCq/zcs5HyNcNhwOcUWvEFv3ezjyTByw2V1kCDW6saAbO5+yOBm1
         /JM3Fvmp+jjiMuA9j3YPYN8AhF24Fkr8MQQ+/49RTUmRfuE7fjlLBdIzMjS9/lP1/SA/
         hA+OWMsuPOiHxdeYeoxGbxHhhjo6Xw2qWkM1Q0OhI5hloSXeRwwsqctg7H4DXveUAy9V
         W7Ow==
X-Forwarded-Encrypted: i=1; AFNElJ8M3jKosyzDUTQ3vDyZ6rrOzVXo4Hi/sCuhM4SLzV19YcRPgYWgqS2R3labpVppMsmgV5bTvQUj1h4/LbqlSXncfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyryY9DlxdSAQusmZv+qnRnaC98PLn6OCdIvzZmN3qo3v7FcFe/
	Dar+p0yj5eHSajcj9xifglneZNCYE6NxEH53ZtDoC6wTcmIfPSllxtAn47VBeA==
X-Gm-Gg: Acq92OHC7FKck7pi/x3zVMDmVP3VfAaKyDP14yZ9UOuXwnWm5htL0z5Gy3jt1+iOXBx
	BRtIgHcSUh/4UhYLpEbaYfF65N1va/ivLPi2z1RiJbAI40lFxWQL2olPkCKXDY9vjX5t7hgCvn6
	DufRa0XDxysqzCkRVmC8/1Mjiausd1h4sJhsjQyGZA5PIbv5QnkidCCiaumYVVXKo7M4hbkliaK
	Id4vT7X5M9j5LLzEpJuldbutzKvdykL4j1BvubdtGhLejFfZkK7qgp6k2JLob639gDWkaNWTVFM
	6GXEkEygnqZHSQSK+LH97dNkeZ47aX2kzPZvfNxRWp70xgmPErzuo9Sm+W/f6uLr5Al0Z6Tt3hi
	Fzav9qYjZtcQCmhmqpVYwF8E1ZXrxZ7llYKKpayF+S/LhEDXwcDm0qsqWxWNJK8O7wQi0HBenfX
	DxzP/t9BAv75vWBxNV/hoqtOiEdpROYxv6HPw2lAAEzo/RdSg5oicIyqk+AykmavmEwEqmARFjv
	axS/+WhPEtyj9zaEiUNSjvPqCiwwJmSdrk=
X-Received: by 2002:a05:6a20:d80f:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b329541ab3mr12825168637.12.1779746503829;
        Mon, 25 May 2026 15:01:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm9526514b3a.51.2026.05.25.15.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 15:01:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linusw@kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] pinctrl: rza2: embed pins in the priv struct
Date: Mon, 25 May 2026 15:01:26 -0700
Message-ID: <20260525220126.93990-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33110-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DA1DE5CEF57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Turn the separately allocated pinctrl_pin_desc array into a flexible
array member of struct rza2_pinctrl_priv, annotated with
__counted_by(npins). The pin count is now computed before allocation so
struct_size() can size the combined object, collapsing two allocations
into one.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 8618f32ed26a..42c228b860a4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -44,12 +44,12 @@ struct rza2_pinctrl_priv {
 	struct device *dev;
 	void __iomem *base;
 
-	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc desc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_gpio_range gpio_range;
 	int npins;
 	struct mutex mutex; /* serialize adding groups and functions */
+	struct pinctrl_pin_desc pins[] __counted_by(npins);
 };
 
 #define RZA2_PDR(port)		(0x0000 + (port) * 2)	/* Direction 16-bit */
@@ -289,21 +289,17 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 
 static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
 {
-	struct pinctrl_pin_desc *pins;
+	struct pinctrl_pin_desc *pin;
 	unsigned int i;
 	int ret;
 
-	pins = devm_kcalloc(priv->dev, priv->npins, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
-		return -ENOMEM;
-
-	priv->pins = pins;
-	priv->desc.pins = pins;
+	priv->desc.pins = priv->pins;
 	priv->desc.npins = priv->npins;
 
 	for (i = 0; i < priv->npins; i++) {
-		pins[i].number = i;
-		pins[i].name = rza2_gpio_names[i];
+		pin = &priv->pins[i];
+		pin->number = i;
+		pin->name = rza2_gpio_names[i];
 	}
 
 	ret = devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,
@@ -482,12 +478,17 @@ static const struct pinmux_ops rza2_pinmux_ops = {
 static int rza2_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rza2_pinctrl_priv *priv;
+	int npins;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
+		      RZA2_PINS_PER_PORT;
+
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pins, npins), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->npins = npins;
 	priv->dev = &pdev->dev;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
@@ -498,9 +499,6 @@ static int rza2_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	priv->npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
-		      RZA2_PINS_PER_PORT;
-
 	priv->desc.name		= DRIVER_NAME;
 	priv->desc.pctlops	= &rza2_pinctrl_ops;
 	priv->desc.pmxops	= &rza2_pinmux_ops;
-- 
2.54.0


