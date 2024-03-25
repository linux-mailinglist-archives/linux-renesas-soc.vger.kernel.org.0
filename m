Return-Path: <linux-renesas-soc+bounces-4010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511888AAB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 18:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89F31C3ACD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 17:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52E75B5D6;
	Mon, 25 Mar 2024 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="F5Zc1C7s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xj3y+Fbp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772725A7B4;
	Mon, 25 Mar 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711380984; cv=none; b=gIbLGd5K8IzOdUlwNaCBntdFRdk6WOGIwZOOdjMD9p28CJioaGd0VmpVJOdcCM0StA9uiv6suhe/bfszDg2PoPk0/SCRcMOaH9KLr9e/Acoxw326vfRz/CzsBhOgvl0rpshjXvt+AzYSHHwecyD/g6mq3Q5ulzjJqjiiSKv10sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711380984; c=relaxed/simple;
	bh=CD1EKNWLbg+QFbDHSkiLwzqYMPbislio616T47FV/P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONruKJcDWiZh65p6vk4yhtqAIQB1sJ/n7SNn7n0y3vJbApRn/AFJxaploo4qngXnMWq+onZV8EvrOOJrceHVWPGXXnULLjCLCVymi0rObgmTWH9oV2cXf6m+aUPElMwZmjsS4j0ZwTL/ptIjWgl3oOF/RF03DETgQTgRSIm37dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=F5Zc1C7s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xj3y+Fbp; arc=none smtp.client-ip=64.147.123.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 6CA172B00209;
	Mon, 25 Mar 2024 11:36:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 25 Mar 2024 11:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711380978;
	 x=1711384578; bh=GIG/lFWiLB83BgBBgfX7/0UFdEVrY4t44xseZoGSkC4=; b=
	F5Zc1C7sjfRsXJMIBgfXEMHR4LY3XxFRSOLxq+/8E+YWPBiyuxCjOgRiRiLN9Lqy
	PZsBm1uRmb3ouUoKn/Cu+khBg+dsZjC4rzje30ayQjYqQpsmlYfLeMIsZ59N2rIX
	H5wYmarm5HyZbTu53sqvpD2jTUg7nOoBMEd3wWuoTsAuzksPF3IvscvgPd9zs1/L
	5QaNmen1o4wrHUU26JRf9ctapp/Q0FxWIR8bmjrJpxgemTPX3wOwXyNoq3BW//nM
	QX+v2d4LO+MynUbllWY1ACB4MMFjk/rnAONpA8oSheUASSAJKSmPLefQPLN6zynE
	ToOGdtyIJfJ9VMthSJUmqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711380978; x=
	1711384578; bh=GIG/lFWiLB83BgBBgfX7/0UFdEVrY4t44xseZoGSkC4=; b=X
	j3y+FbpmMZ351KhF7h/fUTGLJ5s9Yf+z94N5PDC6aklAdRRYoXOhGJrIeQgFvvko
	2gahCcrtYiDxAN3G70fMPe4dSVu/UIQg978GPh6W7HKFxo5BjTGAUn86joWuiNDI
	xVRqRHRXJDGH5MF54t02b5L6a4loNytZIamUoXQ/MWepdCm+l4TCptxSb+RxtFSP
	i7hG3roR6oGSy4H1IvqM/fp15sYwFQUaMWXeJ6lYHqrPLJM7U8rAyc6y4/zpZfAk
	yGLbwSqx/8iiTu5uo4nFlm+XSWEEc5YqFWZoHcSi+pRRs/rfb5MUfIArN2YbS/SP
	hsv6fC6LM18moixpEXHHg==
X-ME-Sender: <xms:8pkBZh2wP1m2Jt-R5RLelsv9HwoHgpVWOSvhcMLiPCrY2eT2-awglw>
    <xme:8pkBZoEmCgEgOOUwte7qV5oByODX5qVTS3UgwKZGIxYO-XSyQcPEwS9YAsuaCYRKK
    Hvz8JhARuRK0N-LlQ8>
X-ME-Received: <xmr:8pkBZh6jNuQNwyd7zJGOVlutz8UeEBZIIKZbRaOl1OY4jsqy83_XJq8ukzHo0Mv1EaP3QsYCZl0zO0BzlvpJgyhgFMRSkwp07HI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:8pkBZu3TW-oNVyZ-hpiicBWJZhBBWQWfKF0G0hBlpFJ2ULUhtBy-Jw>
    <xmx:8pkBZkHuP2oNjS9BB9sAFvzaikGyTObcs4DNbfmMpXR3ZJ_U2GzJBg>
    <xmx:8pkBZv9zGTBzLtHa7w-F8820pF_fvacrw6J5ZdU9wGVMLgR5gUmYzQ>
    <xmx:8pkBZhkPv9xXh8NnxAuMWkkJdgCTA86slXXvKVSOtj1IGLLULN7Ndw>
    <xmx:8pkBZpJz2fNhgJ8-QrCEVkAnlKlY_HfadXasttV4zNAQyHKmdRRFUllhdsg>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 11:36:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next,v4 2/2] ravb: Add support for an optional MDIO mode
Date: Mon, 25 Mar 2024 16:34:51 +0100
Message-ID: <20240325153451.2366083-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver used the DT node of the device itself when registering the
MDIO bus. While this works, it creates a problem: it forces any MDIO bus
properties to also be set on the devices DT node. This mixes the
properties of two distinctly different things and is confusing.

This change adds support for an optional mdio node to be defined as a
child to the device DT node. The child node can then be used to describe
MDIO bus properties that the MDIO core can act on when registering the
bus.

If no mdio child node is found the driver fallback to the old behavior
and register the MDIO bus using the device DT node. This change is
backward compatible with old bindings in use.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
* Changes since v3
- None

* Changes since v2
- Use DT node instead of OF ode in commit message.
- Update punctuation in commit message.
- Simplify the node selection in the driver.
---
 drivers/net/ethernet/renesas/ravb_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d1be030c8848..9a397f9b4c0c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2564,6 +2564,7 @@ static int ravb_mdio_init(struct ravb_private *priv)
 {
 	struct platform_device *pdev = priv->pdev;
 	struct device *dev = &pdev->dev;
+	struct device_node *mdio_node;
 	struct phy_device *phydev;
 	struct device_node *pn;
 	int error;
@@ -2583,7 +2584,13 @@ static int ravb_mdio_init(struct ravb_private *priv)
 		 pdev->name, pdev->id);
 
 	/* Register MDIO bus */
-	error = of_mdiobus_register(priv->mii_bus, dev->of_node);
+	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
+	if (!mdio_node) {
+		/* backwards compatibility for DT lacking mdio subnode */
+		mdio_node = of_node_get(dev->of_node);
+	}
+	error = of_mdiobus_register(priv->mii_bus, mdio_node);
+	of_node_put(mdio_node);
 	if (error)
 		goto out_free_bus;
 
-- 
2.44.0


