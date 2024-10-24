Return-Path: <linux-renesas-soc+bounces-10119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB09AF2F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 21:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5371C21678
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 19:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF4618B468;
	Thu, 24 Oct 2024 19:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYxqfvDv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC20B22B67F;
	Thu, 24 Oct 2024 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799564; cv=none; b=tH6r/IdT8+Q4meik78pyE7u02NZDMZio4v2Z5K4o8UatzYykPv1RU/ux+ZFyhE4w9XRYfhWxStUxH9GTZz+4PNLVLO0oVboFsnLnGgN4E++G3f1/sR+ea8gMjYoODHYSDEip1e+K4PyBC3PV8sd0x2jOeoavCbNCmnwWsUoD+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799564; c=relaxed/simple;
	bh=ZDlNaygq0xDS0GjRn4lbalobnSZqEAtZKFfzevXwrmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRaN8PcPbgtNQ2NE9cwM6MIVYNsyd2D1raZooZJy23nuWKiYaVGqewoYwiMa2jS/YNwNwd/o75HzRPLHb77WFyoTLa+ySrkDwUR58ViYaNqwP9MNCoyHAHzIMggqaZvJ5cNa5Rf/XdocVdN/BAlzOGCZZFE12MmrONAYtzN1axY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYxqfvDv; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-288d74b3a91so896001fac.0;
        Thu, 24 Oct 2024 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729799561; x=1730404361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4ugk4oL+sx3EATun/tYyC0Hi4FPvDzLTd8j20awZro=;
        b=NYxqfvDvpXfr2lgKtAZAEEmFMLWaDLeLrw8s02FqHAxDX8OKcpzRCFtfdLlmUuE8rQ
         hlZEd0P8Ra0M8TD2qwMH3c00w/6VSxDEi2nBdghQoqsMl6COz1xkr3AQMbIGKwCMNTxy
         5AYc8vMVIt1OtEMxoQDI5G1rrsIPABjOKzrHI0bCwIIwuu8vkMjeA+DiKMlcFU7CtFuB
         pzjOPD1A1+moCo42jdhRyEO2Y6XKn9TflL0uq3vX6p+XPnFohJF/JW74JXCjWvdOV68R
         DcmGbD1A69Tov2fx+MLjRBO7nnwc66jVQSQysd/ADjRwgnRJ3u/MsAKB54NA36er3zRa
         lnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799561; x=1730404361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4ugk4oL+sx3EATun/tYyC0Hi4FPvDzLTd8j20awZro=;
        b=gSZeVVf9SyyE+R8Rwgm7AsLxyermpS8QDrrjOFGmdfeT/re+nslbsnR6WHRhex50d1
         GrD24g7ciXox8UeNqzKIsHyiuFUBU5QzvzxhZXWPFrigQ89z7FrvbUKC0U3tdV7VCPte
         xQRlsphJLMdpk7EwA+dFjCWFntIwB5e2ajO6J/U27lBlK6xae0+Bs5k2DvMQWTto2bwh
         VvPjLEMYEK8TgSViRPnVfMuSL9NnDhOHsUldjVBEeTNqNO2tvWP9V8CoPJlZRX15Odas
         s/e9c1NfF6rAyqqbVB2f/H9UnKNU1nPM+Cdiw2t4/R0ycPNsRcPxSavJOkmUyL1xtZMa
         AyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbaHi7/m3EA/EPvMzLwSpQupBnh9CB3A6ZUyE4D26CkiMDymo2aVsg1zEiFGvyndr5z2QHGJ2Tc+I5CeKyCtzZAHI=@vger.kernel.org, AJvYcCX+yx0fQMYaP3yzU5059zhA5mwtvPb85kOlMz15H9mhsfb45KCDBszplR9qYKuy3FufSoFW1JyxLGuALEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybc1RXVosHCRjPjZ3e3BcGHlvLjHC5ay5R0sjPAPcRQUkvXufj
	0KlbOlfZQg+gHhWfIdphIRjieXSGCU1im1bMq9yzvsY4Y5YkFJoppqenvlEg
X-Google-Smtp-Source: AGHT+IHkZfr+Q18kjbIScnb+VBCvS+Zo8M6VZjER88B9GDl2IOMHbgrHg5EjPE/zbsSHykxO2mIzhA==
X-Received: by 2002:a05:6870:a101:b0:289:2126:6826 with SMTP id 586e51a60fabf-28ced42e76emr3345721fac.30.1729799560686;
        Thu, 24 Oct 2024 12:52:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab48f62sm9017046a12.42.2024.10.24.12.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:52:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv3 net-next] net: dsa: use ethtool string helpers
Date: Thu, 24 Oct 2024 12:52:38 -0700
Message-ID: <20241024195238.176131-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the preferred way to copy ethtool strings.

Avoids incrementing pointers all over the place.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 v3: remove curly braces from ksz_common.c
 v2: remove curly braces from rzn1_a5psw.c
 drivers/net/dsa/b53/b53_common.c          |  3 +--
 drivers/net/dsa/bcm_sf2.c                 |  5 +----
 drivers/net/dsa/bcm_sf2_cfp.c             | 18 +++++-------------
 drivers/net/dsa/dsa_loop.c                |  3 +--
 drivers/net/dsa/hirschmann/hellcreek.c    |  8 ++------
 drivers/net/dsa/microchip/ksz_common.c    |  6 ++----
 drivers/net/dsa/mv88e6xxx/chip.c          | 17 ++---------------
 drivers/net/dsa/mv88e6xxx/serdes.c        |  6 ++----
 drivers/net/dsa/rzn1_a5psw.c              |  6 ++----
 drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 ++-----
 drivers/net/dsa/xrs700x/xrs700x.c         |  6 ++----
 net/dsa/user.c                            | 13 +++++--------
 12 files changed, 27 insertions(+), 71 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index c39cb119e760..285785c942b0 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -989,8 +989,7 @@ void b53_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 
 	if (stringset == ETH_SS_STATS) {
 		for (i = 0; i < mib_size; i++)
-			strscpy(data + i * ETH_GSTRING_LEN,
-				mibs[i].name, ETH_GSTRING_LEN);
+			ethtool_puts(&data, mibs[i].name);
 	} else if (stringset == ETH_SS_PHY_STATS) {
 		phydev = b53_get_phy_device(ds, port);
 		if (!phydev)
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 9201f07839ad..2bb1832d21bc 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1180,11 +1180,8 @@ static const struct b53_io_ops bcm_sf2_io_ops = {
 static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
 				   u32 stringset, uint8_t *data)
 {
-	int cnt = b53_get_sset_count(ds, port, stringset);
-
 	b53_get_strings(ds, port, stringset, data);
-	bcm_sf2_cfp_get_strings(ds, port, stringset,
-				data + cnt * ETH_GSTRING_LEN);
+	bcm_sf2_cfp_get_strings(ds, port, stringset, data);
 }
 
 static void bcm_sf2_sw_get_ethtool_stats(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index c88ee3dd4299..93cb43ed6e61 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -1283,23 +1283,15 @@ void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
 			     u32 stringset, uint8_t *data)
 {
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
-	unsigned int s = ARRAY_SIZE(bcm_sf2_cfp_stats);
-	char buf[ETH_GSTRING_LEN];
-	unsigned int i, j, iter;
+	unsigned int i, j;
 
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	for (i = 1; i < priv->num_cfp_rules; i++) {
-		for (j = 0; j < s; j++) {
-			snprintf(buf, sizeof(buf),
-				 "CFP%03d_%sCntr",
-				 i, bcm_sf2_cfp_stats[j].name);
-			iter = (i - 1) * s + j;
-			strscpy(data + iter * ETH_GSTRING_LEN,
-				buf, ETH_GSTRING_LEN);
-		}
-	}
+	for (i = 1; i < priv->num_cfp_rules; i++)
+		for (j = 0; j < ARRAY_SIZE(bcm_sf2_cfp_stats); j++)
+			ethtool_sprintf(&data, "CFP%03d_%sCntr", i,
+					bcm_sf2_cfp_stats[j].name);
 }
 
 void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
index c70ed67cc188..adbab544c60f 100644
--- a/drivers/net/dsa/dsa_loop.c
+++ b/drivers/net/dsa/dsa_loop.c
@@ -121,8 +121,7 @@ static void dsa_loop_get_strings(struct dsa_switch *ds, int port,
 		return;
 
 	for (i = 0; i < __DSA_LOOP_CNT_MAX; i++)
-		memcpy(data + i * ETH_GSTRING_LEN,
-		       ps->ports[port].mib[i].name, ETH_GSTRING_LEN);
+		ethtool_puts(&data, ps->ports[port].mib[i].name);
 }
 
 static void dsa_loop_get_ethtool_stats(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index d798f17cf7ea..283ec5a6e23c 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -294,12 +294,8 @@ static void hellcreek_get_strings(struct dsa_switch *ds, int port,
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(hellcreek_counter); ++i) {
-		const struct hellcreek_counter *counter = &hellcreek_counter[i];
-
-		strscpy(data + i * ETH_GSTRING_LEN,
-			counter->name, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < ARRAY_SIZE(hellcreek_counter); ++i)
+		ethtool_puts(&data, hellcreek_counter[i].name);
 }
 
 static int hellcreek_get_sset_count(struct dsa_switch *ds, int port, int sset)
diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index 4e8710c7cb7b..dc129a3d7a34 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -2112,10 +2112,8 @@ static void ksz_get_strings(struct dsa_switch *ds, int port,
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	for (i = 0; i < dev->info->mib_cnt; i++) {
-		memcpy(buf + i * ETH_GSTRING_LEN,
-		       dev->info->mib_names[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < dev->info->mib_cnt; i++)
+		ethtool_puts(&buf, dev->info->mib_names[i].string);
 }
 
 /**
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 4f5193d86e65..1893fed00467 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1162,8 +1162,7 @@ static int mv88e6xxx_stats_get_strings(struct mv88e6xxx_chip *chip,
 	for (i = 0, j = 0; i < ARRAY_SIZE(mv88e6xxx_hw_stats); i++) {
 		stat = &mv88e6xxx_hw_stats[i];
 		if (stat->type & types) {
-			memcpy(data + j * ETH_GSTRING_LEN, stat->string,
-			       ETH_GSTRING_LEN);
+			ethtool_puts(&data, stat->string);
 			j++;
 		}
 	}
@@ -1204,31 +1203,19 @@ static void mv88e6xxx_atu_vtu_get_strings(uint8_t *data)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6xxx_atu_vtu_stats_strings); i++)
-		strscpy(data + i * ETH_GSTRING_LEN,
-			mv88e6xxx_atu_vtu_stats_strings[i],
-			ETH_GSTRING_LEN);
+		ethtool_puts(&data, mv88e6xxx_atu_vtu_stats_strings[i]);
 }
 
 static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
 				  u32 stringset, uint8_t *data)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
-	int count = 0;
 
 	if (stringset != ETH_SS_STATS)
 		return;
 
 	mv88e6xxx_reg_lock(chip);
 
-	if (chip->info->ops->stats_get_strings)
-		count = chip->info->ops->stats_get_strings(chip, data);
-
-	if (chip->info->ops->serdes_get_strings) {
-		data += count * ETH_GSTRING_LEN;
-		count = chip->info->ops->serdes_get_strings(chip, port, data);
-	}
-
-	data += count * ETH_GSTRING_LEN;
 	mv88e6xxx_atu_vtu_get_strings(data);
 
 	mv88e6xxx_reg_unlock(chip);
diff --git a/drivers/net/dsa/mv88e6xxx/serdes.c b/drivers/net/dsa/mv88e6xxx/serdes.c
index 01ea53940786..327831d2b547 100644
--- a/drivers/net/dsa/mv88e6xxx/serdes.c
+++ b/drivers/net/dsa/mv88e6xxx/serdes.c
@@ -144,8 +144,7 @@ int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip,
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6352_serdes_hw_stats); i++) {
 		stat = &mv88e6352_serdes_hw_stats[i];
-		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
-		       ETH_GSTRING_LEN);
+		ethtool_puts(&data, stat->string);
 	}
 	return ARRAY_SIZE(mv88e6352_serdes_hw_stats);
 }
@@ -405,8 +404,7 @@ int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip,
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6390_serdes_hw_stats); i++) {
 		stat = &mv88e6390_serdes_hw_stats[i];
-		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
-		       ETH_GSTRING_LEN);
+		ethtool_puts(&data, stat->string);
 	}
 	return ARRAY_SIZE(mv88e6390_serdes_hw_stats);
 }
diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 1135a32e4b7e..66974379334a 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -802,10 +802,8 @@ static void a5psw_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	for (u = 0; u < ARRAY_SIZE(a5psw_stats); u++) {
-		memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
-		       ETH_GSTRING_LEN);
-	}
+	for (u = 0; u < ARRAY_SIZE(a5psw_stats); u++)
+		ethtool_puts(&data, a5psw_stats[u].name);
 }
 
 static void a5psw_get_ethtool_stats(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/sja1105/sja1105_ethtool.c b/drivers/net/dsa/sja1105/sja1105_ethtool.c
index decc6c931dc1..2ea64b1d026d 100644
--- a/drivers/net/dsa/sja1105/sja1105_ethtool.c
+++ b/drivers/net/dsa/sja1105/sja1105_ethtool.c
@@ -586,7 +586,6 @@ void sja1105_get_strings(struct dsa_switch *ds, int port,
 {
 	struct sja1105_private *priv = ds->priv;
 	enum sja1105_counter_index max_ctr, i;
-	char *p = data;
 
 	if (stringset != ETH_SS_STATS)
 		return;
@@ -597,10 +596,8 @@ void sja1105_get_strings(struct dsa_switch *ds, int port,
 	else
 		max_ctr = __MAX_SJA1105PQRS_PORT_COUNTER;
 
-	for (i = 0; i < max_ctr; i++) {
-		strscpy(p, sja1105_port_counters[i].name, ETH_GSTRING_LEN);
-		p += ETH_GSTRING_LEN;
-	}
+	for (i = 0; i < max_ctr; i++)
+		ethtool_puts(&data, sja1105_port_counters[i].name);
 }
 
 int sja1105_get_sset_count(struct dsa_switch *ds, int port, int sset)
diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/xrs700x.c
index de3b768f2ff9..4dbcc49a9e52 100644
--- a/drivers/net/dsa/xrs700x/xrs700x.c
+++ b/drivers/net/dsa/xrs700x/xrs700x.c
@@ -91,10 +91,8 @@ static void xrs700x_get_strings(struct dsa_switch *ds, int port,
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(xrs700x_mibs); i++) {
-		strscpy(data, xrs700x_mibs[i].name, ETH_GSTRING_LEN);
-		data += ETH_GSTRING_LEN;
-	}
+	for (i = 0; i < ARRAY_SIZE(xrs700x_mibs); i++)
+		ethtool_puts(&data, xrs700x_mibs[i].name);
 }
 
 static int xrs700x_get_sset_count(struct dsa_switch *ds, int port, int sset)
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 91a1fa5f8ab0..f7b0630dd2b6 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1042,15 +1042,12 @@ static void dsa_user_get_strings(struct net_device *dev,
 	struct dsa_switch *ds = dp->ds;
 
 	if (stringset == ETH_SS_STATS) {
-		int len = ETH_GSTRING_LEN;
-
-		strscpy_pad(data, "tx_packets", len);
-		strscpy_pad(data + len, "tx_bytes", len);
-		strscpy_pad(data + 2 * len, "rx_packets", len);
-		strscpy_pad(data + 3 * len, "rx_bytes", len);
+		ethtool_puts(&data, "tx_packets");
+		ethtool_puts(&data, "tx_bytes");
+		ethtool_puts(&data, "rx_packets");
+		ethtool_puts(&data, "rx_bytes");
 		if (ds->ops->get_strings)
-			ds->ops->get_strings(ds, dp->index, stringset,
-					     data + 4 * len);
+			ds->ops->get_strings(ds, dp->index, stringset, data);
 	} else if (stringset ==  ETH_SS_TEST) {
 		net_selftest_get_strings(data);
 	}
-- 
2.47.0


