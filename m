Return-Path: <linux-renesas-soc+bounces-33932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vGaoGBsZLGp/LQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:35:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5C67A3B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:35:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a2zX5CWV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5B993205682
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567FB39901C;
	Fri, 12 Jun 2026 14:31:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72603921DD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274660; cv=none; b=KAwEWoFZGzlF0HbOiy6uMaSbpYN+OgkVed2om6FDuckazbSHdPrLNMVPEp/KCyqDduQ+XHh3oRlFracef0I/1vLPaALLrlciEoqDRVL5AJrUgq30LwPoM+iHqcgf/HR6T9KVYb2dPfZF7cSFnQL6Tvc5GGIQmpC0jOJpowSkiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274660; c=relaxed/simple;
	bh=W2SyJUpCbynO0lSWVKeTVQ0CoNnt7JIk9EPxTsL3dKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esbkG20DF19AlFdsGRgv2RUGsIxRCFcUCnpo1RN9pf0z+9c7C0/bObOGiDvFUujouB8LrtIMYhz/OJiJhffqVnkKNdrhO5WfIG6/6NKBKfCJtCXjNyuIQw6dqatS9fS768uIiqrXy9KEp3Wb2DXicAUGzz75mix961NFAD7zuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2zX5CWV; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so731906f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274657; x=1781879457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg8OVS2htXEjt5DyvrIzVmdoLg8gbgjPxybaHw+Mdrs=;
        b=a2zX5CWVogfB72EYYEO/3T+5+BT0E3qbbVVdgg+tnwG/Kc1hfBXWt8XWtHRKe9Z6QH
         juTZ2lQYMQYNqazlwK4OVD69xP2jKXqfGcK3ndKbR97l9meoOXXvgfAlQsJKeG24Jroa
         0ajWVyWG1FwIin6zLFolooSmNAhpBwan63knvyabvJ1/klB99+QlNCsj/SnWDkgGXsh4
         hzHEpGng76sFDPTQ3Vv+/0tiQljs96pPq3TwZRaVXMoJahvtrIi/Tcc4GQxkgA2Zfd6D
         cKL5zy5s/YqQXgDJohW1cAMSj4rmWH7jyyOtOAdXzv9YVAHwv3Z3v359UYYk8+vJe/2M
         UfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274657; x=1781879457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gg8OVS2htXEjt5DyvrIzVmdoLg8gbgjPxybaHw+Mdrs=;
        b=Wsh1D/A2ep7trxIfB1lyqd2rron9lkkmQ+Abl7T4B4LhFnp3hIw7MAFB4Odsgxfemw
         F3ByOKviW53hJcG33ZzK+/nV0qTjL8XretXf/4Ej9cwqdX4BMmH40pmBCKTsUG+odUf1
         SahMv8ae5CYz1Mo5Cq23sfl32z0fhigz9xYuEQn2bPciUO5dDDOl0jbeNksg6VQ/qxmf
         4rhVhNp19ETe+R3qtLWFM8Hik89opOxNbgxsP+VQCKOfCJUqCyudn05ZfP79x2UHDMFK
         UgTXdbW3olTy2ov7fHZfdo9tdXnXV4fnWbK/vypnXVwwg0zsXoygRfjKnqePwXt1kOOv
         NmaA==
X-Forwarded-Encrypted: i=1; AFNElJ8cegI8+74TaOH4jZhbsm5+3/GH/TUDZex+emMy+NWPukAjauD+qRSphuFm28MOPG6nv9TKjL+ryIOiiL5ZDw9FgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNqawfApzhL4ZhaTG012gQ+qMN5ldk61hQ/cZVD/ipI1Jq0pF
	r5q/Jet+5i+8e2+gBECC0PaQWNoPgEwjGFt23sD7938LYsafdQWDP/QL
X-Gm-Gg: Acq92OH5cnVt45A5KjnE8vaP0f1lFfWeAOf3XHJQWIV4gmCMsM42INXzZvc9q0pk+VB
	NNuJF30qSYQr8WmD2k7LG9t/EmrYSNJVd/oNifVNY1ypwmOye4KXBVCPvKTETbPCTSpndvolMuC
	MMkNayICd95B8U4EORnlwtuZYS5wcfzv9ZLwYFa88feInnR5frQiRs65P4oKmyGOIDIdErJRx18
	e0VgmDlAeluwMG2olJZPPGkV3FEr96z08glMXtRw09bJzcccyk0n+ZpXl1K9vvf1EQ6ye/sxk7U
	2pDDbxfIgJ9UAoY8sCVF6Vke/LpvJPn+yjkmALIg9+zrPN+b+dzz9hC02QfP2GXaEYH1lb2FBPM
	FJyVfNCozerbL+is9Nq3z3cwdR13p5w/rwf10oqsD802RVsIKw0mBe9+537De/CODLPXlNtpres
	KHkpcVUZlSVwyEmoVkKRi2rgFmw5zaDZi6OJRXcjWRbrJPOoLW
X-Received: by 2002:a05:6000:4818:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-4606dbad462mr4301980f8f.26.1781274657096;
        Fri, 12 Jun 2026 07:30:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/11] regulator: renesas-usb-vbus-regulator: Introduce helper for regulator registration
Date: Fri, 12 Jun 2026 15:30:34 +0100
Message-ID: <20260612143048.317907-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[bp.renesas.com:server fail,vger.kernel.org:server fail,renesas.com:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-33932-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5E5C67A3B8

From: Biju Das <biju.das.jz@bp.renesas.com>

Extract the regulator node lookup and registration logic from
rzg2l_usb_vbus_regulator_probe() into a new helper function
rzg2l_usb_vbus_regulator_register(), which takes the parent device node,
regulator name, descriptor, and config as parameters.

This refactoring avoids code duplication in a follow-up patch that adds
support for the RZ/G3L SoC, which requires registering a second VBUS
regulator for its additional OTG port.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../regulator/renesas-usb-vbus-regulator.c    | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..511631a788c2 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -31,28 +31,38 @@ static const struct regulator_desc rzg2l_usb_vbus_rdesc = {
 	.n_voltages	= 1,
 };
 
+static int rzg2l_usb_vbus_regulator_register(struct device_node *np,
+					     const char *name,
+					     const struct regulator_desc *desc,
+					     struct regulator_config *config)
+{
+	struct regulator_dev *rdev;
+
+	config->of_node = of_get_child_by_name(np, name);
+	if (!config->of_node)
+		return dev_err_probe(config->dev, -ENODEV, "regulator node %s not found\n", name);
+
+	rdev = devm_regulator_register(config->dev, desc, config);
+	of_node_put(config->of_node);
+	if (IS_ERR(rdev))
+		return dev_err_probe(config->dev, PTR_ERR(rdev), "not able to register %s\n", name);
+
+	return 0;
+}
+
 static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct regulator_config config = { };
 	struct device *dev = &pdev->dev;
-	struct regulator_dev *rdev;
 
 	config.regmap = dev_get_regmap(dev->parent, NULL);
 	if (!config.regmap)
 		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
 
 	config.dev = dev;
-	config.of_node = of_get_child_by_name(dev->parent->of_node, "regulator-vbus");
-	if (!config.of_node)
-		return dev_err_probe(dev, -ENODEV, "regulator node not found\n");
 
-	rdev = devm_regulator_register(dev, &rzg2l_usb_vbus_rdesc, &config);
-	of_node_put(config.of_node);
-	if (IS_ERR(rdev))
-		return dev_err_probe(dev, PTR_ERR(rdev),
-				     "not able to register vbus regulator\n");
-
-	return 0;
+	return rzg2l_usb_vbus_regulator_register(dev->parent->of_node, "regulator-vbus",
+						 &rzg2l_usb_vbus_rdesc, &config);
 }
 
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
-- 
2.43.0


