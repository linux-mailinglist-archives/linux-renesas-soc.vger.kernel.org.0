Return-Path: <linux-renesas-soc+bounces-14435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8CA63550
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 12:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC343A3F47
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 11:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D67419D06B;
	Sun, 16 Mar 2025 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hSkLXpw0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1BxvC84S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0918E750;
	Sun, 16 Mar 2025 11:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742124065; cv=none; b=d96hiXdi8o/25nOe3/5VpyeLtzTdoqR+U8fQv8uJEA/LcGXWK8qBKdspvH3rSe2vpxM+/oDONHs70tAHGQwCBKYCR7/zSnpdQMhENqsuPckpK6bndAnyYvFJKzWPgN/1LQ30B/wZNgQaefanr8oNjDQtVuCZC248j5rwRUDjrnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742124065; c=relaxed/simple;
	bh=TGq0jAaCJxV7ApKrQmmMGQVQxpebTOHnt7iay5hOEhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XLVz/knlSR/cIUJ8WNr0WjonuZHISf/nHuahL1wheSS8cgqE5Icql9RVLXz9arsjcIuQlUNsM2Sip4VmhzR68J2/FneuBIA2HZxCN39nAFoEYyfHrsg4o5d6nSlca9mPe/tsLwMnuMMpJHqd4LaB3sCIsfFpTgZOUOHdQNUyjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hSkLXpw0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1BxvC84S; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BF8D25400E0;
	Sun, 16 Mar 2025 07:21:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 16 Mar 2025 07:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1742124060; x=1742210460; bh=Wz
	Irl9nCxBpVkIpeEIwRQ4jdekZ1b9KgT8u2zSPY4pc=; b=hSkLXpw0bXTOA9Zcnm
	4DAFoK16xTs/kNzkHbkBFPKwPhzPkT/BQVIeOX6XqWW8u24V94Uun99qXmQpgMCe
	0LeGH5WPJ2VjdwiaMFqy+bt57MnVRGgUCXOlMIN4Yb3MTVoXqeHUlLzVDQDb1qxg
	lXAQH7GKuOIbIcfWlAocQ4M8hYXulwdxKk/GCZHwcWwW6oyZ23ALqibx5IgsQLd3
	ikOAk4qz5N0m7u196DbFRQTDsTDK/5LiqzQZhGmb5XNz+f31xB3v4xtJXVjh5AVS
	NoXfdY8w8xJbWe8HfoHZx35zwY7hUfNGfPsTfMmhB5Fu8DyKaMOHdiy0odUEYHWg
	ZVJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1742124060; x=1742210460; bh=WzIrl9nCxBpVkIpeEIwRQ4jdekZ1
	b9KgT8u2zSPY4pc=; b=1BxvC84SLYjSN3EkaiLKr1m+i7ygFwowVLw344yD3SG3
	CAR+F8+nF5PVlZD/qxYxoO/RHKqy6Lj722t9SvnquK0+brY9oh8OvergvHtWGyuT
	+dpinFcQbZhznYm/LLVdGzOLdjPXJDRWGJFC3unfMPv0GG0fQQ+HRiQepiBiXoTd
	oCDZlk1Eg2NX7xERgqXOSZNL5ApH6U8j4OxqOMeSHRATW1HmNQJmjF5Q/kQBwmzp
	DEw1d8VPg27hUUq70d49WhS5ymo8ylQYb3l0/NKhFNCzh122Smhbnwj5zUBoEprL
	yjeL51mGMHuJKbhdSaa8UGYP4UEPgXTcxf9gOyDLRA==
X-ME-Sender: <xms:G7TWZ3iGTDsC6rtcX4jf48mDpMhzpt8N7nqZvrmwUvpGS3P6LIgymw>
    <xme:G7TWZ0At-05OJmzcBd38b8eOPwROe5a6MQMK7m8VDRJO_IAprgdgkav2UBaW7XgAk
    V-PyQj7HPMRNoU1czw>
X-ME-Received: <xmr:G7TWZ3Ec-nlgpz8ZwKlyZjbta5s2KJT30DmcL9pcxiBc42ML5ZSbLzlMs6xvGGC-6BRxMeL4PlNR6vRz_-Wp3mtcQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeigeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpedutdeugeegudduvdfhffdtteeiveekhfffgeejvdektdehteeuvdetgeevhe
    evleenucffohhmrghinheprhgvphhorhhtvggurdgtrghtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    gusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhope
    hhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsegr
    rhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhloh
    hfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnih
    esrhgvughhrghtrdgtohhmpdhrtghpthhtohepughimhgrrdhfvggurhgruhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G7TWZ0QOGyDjXfPqFBWELf0-aLTBwFHQgCRXw1BQh9mDDRkM7_Jkgw>
    <xmx:G7TWZ0zvSVU3u6_6F5_VKReDP-ll5oRdfFLn1WW8S01CL-H-08dv9Q>
    <xmx:G7TWZ67Hb8CAiliwPYMeV2VveYIrKvkgd1RZJ8RUX6nI-JyDdq1XNw>
    <xmx:G7TWZ5zqA8iGlO2T7f74zoGZxfhgUAl3EVGGJhzJ1a8va10f_IeY1g>
    <xmx:HLTWZ-4hX7W2CBcP4vfanqCrB3E71OJrqpxRWZK5UyrMu_8Te_UkOOte>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Mar 2025 07:20:59 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor for mv88q211x
Date: Sun, 16 Mar 2025 12:20:33 +0100
Message-ID: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The temperature sensor enabled for mv88q222x devices also functions for
mv88q211x based devices. Unify the two devices probe functions to enable
the sensors for all devices supported by this driver.

The same oddity as for mv88q222x devices exists, the PHY must be up for
a correct temperature reading to be reported.

    # cat /sys/class/hwmon/hwmon9/temp1_input
    -75000

    # ifconfig end5 up

    # cat /sys/class/hwmon/hwmon9/temp1_input
    59000

Worth noting is that while the temperature register offsets and layout
are the same between mv88q211x and mv88q222x devices their names in the
datasheets are different. This change keeps the mv88q222x names for the
mv88q211x support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/marvell-88q2xxx.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index 15c0f8adc2f5..cdd40b613ce8 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -834,6 +834,7 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
 static int mv88q2xxx_probe(struct phy_device *phydev)
 {
 	struct mv88q2xxx_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -841,17 +842,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
 
 	phydev->priv = priv;
 
-	return 0;
-}
-
-static int mv88q222x_probe(struct phy_device *phydev)
-{
-	int ret;
-
-	ret = mv88q2xxx_probe(phydev);
-	if (ret)
-		return ret;
-
 	ret = mv88q2xxx_leds_probe(phydev);
 	if (ret)
 		return ret;
@@ -1124,7 +1114,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.phy_id_mask		= MARVELL_PHY_ID_MASK,
 		.name			= "mv88q2220",
 		.flags			= PHY_POLL_CABLE_TEST,
-		.probe			= mv88q222x_probe,
+		.probe			= mv88q2xxx_probe,
 		.get_features		= mv88q2xxx_get_features,
 		.config_aneg		= mv88q2xxx_config_aneg,
 		.aneg_done		= genphy_c45_aneg_done,
-- 
2.48.1


