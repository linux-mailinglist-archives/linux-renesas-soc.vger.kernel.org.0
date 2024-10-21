Return-Path: <linux-renesas-soc+bounces-9955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F69A9467
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 01:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3941F22F97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 23:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4261E7657;
	Mon, 21 Oct 2024 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnHvrijI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3A10A3E;
	Mon, 21 Oct 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729554940; cv=none; b=sMojsqnzUbMjCIAaB2sYflJb1Di77Hp807kj250/oJyaq9alHm0kglUhag3XQ94/yWJEKYchYD4U0KpHfUqnY63pTGz/EkryzEm2Hv/vJqo8EoCaB8p1LQDchwZ6lELizw7OapGOaGwaR9MGFYfO2sGMqFg/9gCju+R+rFpXPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729554940; c=relaxed/simple;
	bh=kHchKKJlQi83/Y4nDX+r2HVsGrvX8n9SYUcfCXlNHTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdeXlWSo57/wNk9SLJB46jqcgPIoHKtnmHmQNvyEdqq5u1Mmg79LxNz9/krZuyoceLWU/D/q9d7PJkvoQ7zqtEVzxCfwBJ6MH0COzcf/URe/Ev9sotcOJxXN4Vs7YDW8QWLodDPlTu5saKnSR+fdQItNcZB7Yhue0kwoYmvad2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHvrijI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cdb889222so48564385ad.3;
        Mon, 21 Oct 2024 16:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729554938; x=1730159738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DuuhmRbY1uh3nX9bYiXwiBnaI3gOHstjeTKguk6ETx8=;
        b=RnHvrijIeZ/79MJJd5gzUobdvTXyHvfnL2h3XWEwLK0cEAyorHgzLuWJzM2C5w41Nu
         e6hxKCyGlVAguxgRTBZ0yogEAMKOccUWBbpQYGsVmD8owFMLTYKrVZ6lo7awdMXOnn37
         2/LhPWdxR9lA8I+KlhBgV+iybcaMGpBk3S6S6frJufZjCzQ9mev4Zpra23Vp0wkUdwL2
         WNNVDls1Xi+GIGLZH1KtuJzCdB3DRXUhKp21wg0+0rwbVuMZ+dufV7S/zYnAfsQODD09
         8bJK3ZlzdOmG6iJlaNNoXYJXKa0iyQmZbP5RXZSfUDPLyJNYcO9jboxfvTNNh5mVIAFg
         ZiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729554938; x=1730159738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuuhmRbY1uh3nX9bYiXwiBnaI3gOHstjeTKguk6ETx8=;
        b=tPSsHH73TE8764AVPwED3kmi2ApUXSg5ve5ncpO8G7R1HJJ45kiXmymRzW8g7Zxogv
         /p8eq78WZW45pLalwAdYxcW6Iv7tv0i+Xazg6INXJZjj2TbOMNzEeiTYJJStrbOsNNpf
         La2y2phWziFVxTvJt/kjUuAV4p8yLs1B8ntzAijqifKD/27Lk8iLMb4bpjfEYC3tV51f
         If1WGmPi83lSylwlvgwjdQpIG79j1alJul69ijE5vLGs2SeHzpFdiCftZFUsP0Lxwag+
         T5wPCK+emaDrJ9BW8z0nMRfb8Tm2oVp1dEh6n0qRAABMNcLdcQbyDVYnCu9mKdcvtBuE
         kLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWIt3DZyOOppqIcKyiUjos1gd+4gh6GR3G2weK6zRqjX/AZTkIvw026IZRi7y8IQrbXJVvHUjxFegVo6Us=@vger.kernel.org, AJvYcCX5e5qcBkMqT3wuSIHFUdwKY4z7tel0+J8Rbc9UnihBEuDuOwPLDY+VYYm+uroBc9N3TokWxO4daTU7w0AL0YB1OHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtirZjkdL19/wbmJ05zsALMa7/awoDyNHIFz8KCdul4q2Vz1V
	zJfONf6Hhhyy8aEg9ncPNvOxOMl5RQ4Elj2NT9+InzFsSUxthkDLOk5LqCn7
X-Google-Smtp-Source: AGHT+IGZQ85vTN1DEpM5ct443DOIRJsbP5TPhCwmaqsizASA3oM8uOXRnruFRfkpB4T5fTBDmjIRYQ==
X-Received: by 2002:a17:902:dacb:b0:20b:5645:d860 with SMTP id d9443c01a7336-20e984b664emr13148935ad.36.1729554938008;
        Mon, 21 Oct 2024 16:55:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f32f0sm31556075ad.249.2024.10.21.16.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 16:55:37 -0700 (PDT)
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
Subject: [PATCH net-next] net: dsa: use ethtool string helpers
Date: Mon, 21 Oct 2024 16:55:35 -0700
Message-ID: <20241021235535.603253-1-rosenp@gmail.com>
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
---
 drivers/net/dsa/b53/b53_common.c          |  3 +--
 drivers/net/dsa/bcm_sf2.c                 |  5 +----
 drivers/net/dsa/bcm_sf2_cfp.c             | 17 +++++------------
 drivers/net/dsa/dsa_loop.c                |  3 +--
 drivers/net/dsa/hirschmann/hellcreek.c    |  8 ++------
 drivers/net/dsa/microchip/ksz_common.c    |  3 +--
 drivers/net/dsa/mv88e6xxx/chip.c          | 17 ++---------------
 drivers/net/dsa/mv88e6xxx/serdes.c        |  6 ++----
 drivers/net/dsa/rzn1_a5psw.c              |  3 +--
 drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 ++-----
 drivers/net/dsa/xrs700x/xrs700x.c         |  6 ++----
 net/dsa/user.c                            | 13 +++++--------
 12 files changed, 25 insertions(+), 66 deletions(-)

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
index c88ee3dd4299..8ba23e643a42 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -1284,22 +1284,15 @@ void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
 {
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
 	unsigned int s = ARRAY_SIZE(bcm_sf2_cfp_stats);
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
+		for (j = 0; j < s; j++)
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
index 4e8710c7cb7b..408ccb1f012e 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -2113,8 +2113,7 @@ static void ksz_get_strings(struct dsa_switch *ds, int port,
 		return;
 
 	for (i = 0; i < dev->info->mib_cnt; i++) {
-		memcpy(buf + i * ETH_GSTRING_LEN,
-		       dev->info->mib_names[i].string, ETH_GSTRING_LEN);
+		ethtool_puts(&buf, dev->info->mib_names[i].string);
 	}
 }
 
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
index 1135a32e4b7e..b3e127f64b08 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -803,8 +803,7 @@ static void a5psw_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		return;
 
 	for (u = 0; u < ARRAY_SIZE(a5psw_stats); u++) {
-		memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
-		       ETH_GSTRING_LEN);
+		ethtool_puts(&data, a5psw_stats[u].name);
 	}
 }
 
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
index 64f660d2334b..697e73494175 100644
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


