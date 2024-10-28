Return-Path: <linux-renesas-soc+bounces-10175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1ED9B23EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 05:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCACE28202D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 04:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91706088F;
	Mon, 28 Oct 2024 04:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCPESFpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB09A47;
	Mon, 28 Oct 2024 04:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730090915; cv=none; b=eEVTMdOJGwZQDtuzl7UrkbuPTYMcQxs2miqu39FwDeqMKCKko9XUvDBDTzCUAFXyCvhwXNfB22zh9PIypoAEwyMq7pv2RNNN361YFwT50Wpxps6/6Xp4quzeBWUc1HpnVEd8UQmcnlR/m0DHTrt8DcROc8dLN3gIqguj4UB5Pmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730090915; c=relaxed/simple;
	bh=M08gC1B6KovanNOLVcD0x6mPLM7QL169RqRn9Gnk/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIi8CBi7kwSYRAHH0HFWtn9L6x6LhSQF9c4sSKZCcJgSwUfRl5mLw/adhJ29fFmXChBLwQGfK5Q/KX5DShfr3AJuT7nqmwHT7HUfrrAQGqkYpn0dcXgC63gve9gEtSdpn17gZj7XiRthpEC3xfvkQjSkQX3VNJEW3/xrEGndOEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCPESFpQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso3061652a91.3;
        Sun, 27 Oct 2024 21:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730090912; x=1730695712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIadJeQjeosFNyQLqOFAkIcSeeTemptM85afMdf05NE=;
        b=hCPESFpQdKRgCnUMo4K/yNGMtPNhfCbqNeWIHxS4bGmehDEJMTJ1n6ItUbXvZSMDHL
         KDtOsjhR2q6bDHKeIejhFCmxqOEkjHbCXMACXEZWHIWzcKwfiRi/pOFRmFvotWguilSE
         x98qoDOt5nYM+aDM8YwizG06vFc2kF1e9nJbHLZ/XUxGKGmPJbuGfaxejFw0OBMyQM8v
         NA0jvOUpqA5ySEcVpiLCBlImop5pvb56yvtaGZ+qgONmRHfBxgLX61b35YkNiBdNxXKD
         vBhQKs2zKpuIrhZAKgq6ye2rX48HufziC5+us4dKIqCW8DgiuYxjzdt5prXKBJa6eWVw
         D1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730090912; x=1730695712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIadJeQjeosFNyQLqOFAkIcSeeTemptM85afMdf05NE=;
        b=LohbI0bji7INnAdy6oqW1w6eoac1SlYvqjvPOFJ+eO61rGbslWTRu4bPdHPaVCUcJX
         a9yICgDiHcdk2JYa7G5+F7A2wtQd1HTQLIxB1PJrqgCu3WEq62eERNX/ZBvBvbpHRmwr
         ZJM/yOcHMgVWq1e1F22kjAOSfIgYd2AwVrRHv9jecNgfjlQwh1cleqcYL2KnlHyEOWSS
         7SeQcgTzbVXGyO8SolI2Z1ES/iNp6cr4b0xY+xowEb/zNfcNzSLa4rnJcwsOShO+8oFo
         M1dcruR1ICL+EqSjxISPkAEWuETvIP9DbGAxZ8FDzMGofmHDeG/iYxjfh4lYzdy6tjwV
         JWww==
X-Forwarded-Encrypted: i=1; AJvYcCUi58uo27zja35kACckPQRygq5AqCf/yQ2l9dbcNA4xblFjWmgVP9B06//2VN7grhrsc4LeWm1hoNrMfOM=@vger.kernel.org, AJvYcCW6eeTHIuglhvz/REgOVMCo7kwvtiZUFQAUCAtAAXZN05F/9d268zWRsiP9Z5UAa8KAh8s6LxH0MAr+NCh3WMN50Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGer2ZLc6pKgYBA00GjnD6f/4ODbbpPleHzp08+PQw9dmrBsPT
	uZCMqm+DZoJGJsERkLKSESUdtebGVBbe6DNSyfdUzpkLAsRLu/GnoMWe4bL4
X-Google-Smtp-Source: AGHT+IE9D7sbbvCHDoFaIPcFKl9kvXzS6BagJrMSuOvgIDHiBeKFPXeAXY36Bg+53U9aTz2E/9PlpA==
X-Received: by 2002:a17:90a:a004:b0:2e2:a661:596a with SMTP id 98e67ed59e1d1-2e8f105e840mr9523525a91.13.1730090911837;
        Sun, 27 Oct 2024 21:48:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a5831sm8051459a91.55.2024.10.27.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 21:48:31 -0700 (PDT)
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
Subject: [PATCHv4 net-next] net: dsa: use ethtool string helpers
Date: Sun, 27 Oct 2024 21:48:28 -0700
Message-ID: <20241028044828.1639668-1-rosenp@gmail.com>
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
(for hellcreek driver)
Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 v4: use double pointer parameters for mv88e6xxx
 v3: remove curly braces from ksz_common.c
 v2: remove curly braces from rzn1_a5psw.c
 drivers/net/dsa/b53/b53_common.c          |  3 +-
 drivers/net/dsa/bcm_sf2.c                 |  4 +-
 drivers/net/dsa/bcm_sf2.h                 |  4 +-
 drivers/net/dsa/bcm_sf2_cfp.c             | 22 +++------
 drivers/net/dsa/dsa_loop.c                |  3 +-
 drivers/net/dsa/hirschmann/hellcreek.c    |  8 +---
 drivers/net/dsa/microchip/ksz_common.c    |  6 +--
 drivers/net/dsa/mv88e6xxx/chip.c          | 57 +++++++++--------------
 drivers/net/dsa/mv88e6xxx/chip.h          |  6 +--
 drivers/net/dsa/mv88e6xxx/serdes.c        | 14 +++---
 drivers/net/dsa/mv88e6xxx/serdes.h        |  8 ++--
 drivers/net/dsa/rzn1_a5psw.c              |  6 +--
 drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 +--
 drivers/net/dsa/xrs700x/xrs700x.c         |  6 +--
 net/dsa/user.c                            | 13 ++----
 15 files changed, 64 insertions(+), 103 deletions(-)

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
index 9201f07839ad..43bde1f583ff 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1183,8 +1183,8 @@ static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
 	int cnt = b53_get_sset_count(ds, port, stringset);
 
 	b53_get_strings(ds, port, stringset, data);
-	bcm_sf2_cfp_get_strings(ds, port, stringset,
-				data + cnt * ETH_GSTRING_LEN);
+	data += cnt * ETH_GSTRING_LEN;
+	bcm_sf2_cfp_get_strings(ds, port, stringset, &data);
 }
 
 static void bcm_sf2_sw_get_ethtool_stats(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/bcm_sf2.h b/drivers/net/dsa/bcm_sf2.h
index 4fda075a3449..be9f3b29019f 100644
--- a/drivers/net/dsa/bcm_sf2.h
+++ b/drivers/net/dsa/bcm_sf2.h
@@ -228,8 +228,8 @@ int bcm_sf2_set_rxnfc(struct dsa_switch *ds, int port,
 int bcm_sf2_cfp_rst(struct bcm_sf2_priv *priv);
 void bcm_sf2_cfp_exit(struct dsa_switch *ds);
 int bcm_sf2_cfp_resume(struct dsa_switch *ds);
-void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
-			     u32 stringset, uint8_t *data);
+void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port, u32 stringset,
+			     uint8_t **data);
 void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
 				   uint64_t *data);
 int bcm_sf2_cfp_get_sset_count(struct dsa_switch *ds, int port, int sset);
diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index c88ee3dd4299..e22362e6f0cd 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -1279,27 +1279,19 @@ static const struct bcm_sf2_cfp_stat {
 	},
 };
 
-void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
-			     u32 stringset, uint8_t *data)
+void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port, u32 stringset,
+			     uint8_t **data)
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
+			ethtool_sprintf(data, "CFP%03d_%sCntr", i,
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
index 5290f5ad98f3..f73833e24622 100644
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
index 4f5193d86e65..4e8bbaa1ea1f 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1153,42 +1153,37 @@ static uint64_t _mv88e6xxx_get_ethtool_stat(struct mv88e6xxx_chip *chip,
 	return value;
 }
 
-static int mv88e6xxx_stats_get_strings(struct mv88e6xxx_chip *chip,
-				       uint8_t *data, int types)
+static void mv88e6xxx_stats_get_strings(struct mv88e6xxx_chip *chip,
+					uint8_t **data, int types)
 {
 	const struct mv88e6xxx_hw_stat *stat;
-	int i, j;
+	int i;
 
-	for (i = 0, j = 0; i < ARRAY_SIZE(mv88e6xxx_hw_stats); i++) {
+	for (i = 0; i < ARRAY_SIZE(mv88e6xxx_hw_stats); i++) {
 		stat = &mv88e6xxx_hw_stats[i];
-		if (stat->type & types) {
-			memcpy(data + j * ETH_GSTRING_LEN, stat->string,
-			       ETH_GSTRING_LEN);
-			j++;
-		}
+		if (stat->type & types)
+			ethtool_puts(data, stat->string);
 	}
-
-	return j;
 }
 
-static int mv88e6095_stats_get_strings(struct mv88e6xxx_chip *chip,
-				       uint8_t *data)
+static void mv88e6095_stats_get_strings(struct mv88e6xxx_chip *chip,
+					uint8_t **data)
 {
-	return mv88e6xxx_stats_get_strings(chip, data,
-					   STATS_TYPE_BANK0 | STATS_TYPE_PORT);
+	mv88e6xxx_stats_get_strings(chip, data,
+				    STATS_TYPE_BANK0 | STATS_TYPE_PORT);
 }
 
-static int mv88e6250_stats_get_strings(struct mv88e6xxx_chip *chip,
-				       uint8_t *data)
+static void mv88e6250_stats_get_strings(struct mv88e6xxx_chip *chip,
+					uint8_t **data)
 {
-	return mv88e6xxx_stats_get_strings(chip, data, STATS_TYPE_BANK0);
+	mv88e6xxx_stats_get_strings(chip, data, STATS_TYPE_BANK0);
 }
 
-static int mv88e6320_stats_get_strings(struct mv88e6xxx_chip *chip,
-				       uint8_t *data)
+static void mv88e6320_stats_get_strings(struct mv88e6xxx_chip *chip,
+					uint8_t **data)
 {
-	return mv88e6xxx_stats_get_strings(chip, data,
-					   STATS_TYPE_BANK0 | STATS_TYPE_BANK1);
+	mv88e6xxx_stats_get_strings(chip, data,
+				    STATS_TYPE_BANK0 | STATS_TYPE_BANK1);
 }
 
 static const uint8_t *mv88e6xxx_atu_vtu_stats_strings[] = {
@@ -1199,21 +1194,18 @@ static const uint8_t *mv88e6xxx_atu_vtu_stats_strings[] = {
 	"vtu_miss_violation",
 };
 
-static void mv88e6xxx_atu_vtu_get_strings(uint8_t *data)
+static void mv88e6xxx_atu_vtu_get_strings(uint8_t **data)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6xxx_atu_vtu_stats_strings); i++)
-		strscpy(data + i * ETH_GSTRING_LEN,
-			mv88e6xxx_atu_vtu_stats_strings[i],
-			ETH_GSTRING_LEN);
+		ethtool_puts(data, mv88e6xxx_atu_vtu_stats_strings[i]);
 }
 
 static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
 				  u32 stringset, uint8_t *data)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
-	int count = 0;
 
 	if (stringset != ETH_SS_STATS)
 		return;
@@ -1221,15 +1213,12 @@ static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
 	mv88e6xxx_reg_lock(chip);
 
 	if (chip->info->ops->stats_get_strings)
-		count = chip->info->ops->stats_get_strings(chip, data);
+		chip->info->ops->stats_get_strings(chip, &data);
 
-	if (chip->info->ops->serdes_get_strings) {
-		data += count * ETH_GSTRING_LEN;
-		count = chip->info->ops->serdes_get_strings(chip, port, data);
-	}
+	if (chip->info->ops->serdes_get_strings)
+		chip->info->ops->serdes_get_strings(chip, port, &data);
 
-	data += count * ETH_GSTRING_LEN;
-	mv88e6xxx_atu_vtu_get_strings(data);
+	mv88e6xxx_atu_vtu_get_strings(&data);
 
 	mv88e6xxx_reg_unlock(chip);
 }
diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx/chip.h
index 48399ab5355a..9fe8e8a7856b 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.h
+++ b/drivers/net/dsa/mv88e6xxx/chip.h
@@ -606,7 +606,7 @@ struct mv88e6xxx_ops {
 
 	/* Return the number of strings describing statistics */
 	int (*stats_get_sset_count)(struct mv88e6xxx_chip *chip);
-	int (*stats_get_strings)(struct mv88e6xxx_chip *chip,  uint8_t *data);
+	void (*stats_get_strings)(struct mv88e6xxx_chip *chip, uint8_t **data);
 	size_t (*stats_get_stat)(struct mv88e6xxx_chip *chip, int port,
 				 const struct mv88e6xxx_hw_stat *stat,
 				 uint64_t *data);
@@ -633,8 +633,8 @@ struct mv88e6xxx_ops {
 
 	/* Statistics from the SERDES interface */
 	int (*serdes_get_sset_count)(struct mv88e6xxx_chip *chip, int port);
-	int (*serdes_get_strings)(struct mv88e6xxx_chip *chip,  int port,
-				  uint8_t *data);
+	int (*serdes_get_strings)(struct mv88e6xxx_chip *chip, int port,
+				  uint8_t **data);
 	size_t (*serdes_get_stats)(struct mv88e6xxx_chip *chip, int port,
 				   uint64_t *data);
 
diff --git a/drivers/net/dsa/mv88e6xxx/serdes.c b/drivers/net/dsa/mv88e6xxx/serdes.c
index 01ea53940786..b3330211edbc 100644
--- a/drivers/net/dsa/mv88e6xxx/serdes.c
+++ b/drivers/net/dsa/mv88e6xxx/serdes.c
@@ -132,8 +132,8 @@ int mv88e6352_serdes_get_sset_count(struct mv88e6xxx_chip *chip, int port)
 	return ARRAY_SIZE(mv88e6352_serdes_hw_stats);
 }
 
-int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip,
-				 int port, uint8_t *data)
+int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip, int port,
+				 uint8_t **data)
 {
 	struct mv88e6352_serdes_hw_stat *stat;
 	int err, i;
@@ -144,8 +144,7 @@ int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip,
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6352_serdes_hw_stats); i++) {
 		stat = &mv88e6352_serdes_hw_stats[i];
-		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
-		       ETH_GSTRING_LEN);
+		ethtool_puts(data, stat->string);
 	}
 	return ARRAY_SIZE(mv88e6352_serdes_hw_stats);
 }
@@ -394,8 +393,8 @@ int mv88e6390_serdes_get_sset_count(struct mv88e6xxx_chip *chip, int port)
 	return ARRAY_SIZE(mv88e6390_serdes_hw_stats);
 }
 
-int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip,
-				 int port, uint8_t *data)
+int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip, int port,
+				 uint8_t **data)
 {
 	struct mv88e6390_serdes_hw_stat *stat;
 	int i;
@@ -405,8 +404,7 @@ int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip,
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6390_serdes_hw_stats); i++) {
 		stat = &mv88e6390_serdes_hw_stats[i];
-		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
-		       ETH_GSTRING_LEN);
+		ethtool_puts(data, stat->string);
 	}
 	return ARRAY_SIZE(mv88e6390_serdes_hw_stats);
 }
diff --git a/drivers/net/dsa/mv88e6xxx/serdes.h b/drivers/net/dsa/mv88e6xxx/serdes.h
index ff5c3ab31e15..ad887d8601bc 100644
--- a/drivers/net/dsa/mv88e6xxx/serdes.h
+++ b/drivers/net/dsa/mv88e6xxx/serdes.h
@@ -125,13 +125,13 @@ unsigned int mv88e6352_serdes_irq_mapping(struct mv88e6xxx_chip *chip,
 unsigned int mv88e6390_serdes_irq_mapping(struct mv88e6xxx_chip *chip,
 					  int port);
 int mv88e6352_serdes_get_sset_count(struct mv88e6xxx_chip *chip, int port);
-int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip,
-				 int port, uint8_t *data);
+int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip, int port,
+				 uint8_t **data);
 size_t mv88e6352_serdes_get_stats(struct mv88e6xxx_chip *chip, int port,
 				  uint64_t *data);
 int mv88e6390_serdes_get_sset_count(struct mv88e6xxx_chip *chip, int port);
-int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip,
-				 int port, uint8_t *data);
+int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip, int port,
+				 uint8_t **data);
 size_t mv88e6390_serdes_get_stats(struct mv88e6xxx_chip *chip, int port,
 				  uint64_t *data);
 
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


