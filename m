Return-Path: <linux-renesas-soc+bounces-10164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C99B0F8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 22:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D3F01F236B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 20:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6F20F3CC;
	Fri, 25 Oct 2024 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8Q2Iz/1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5888020C320;
	Fri, 25 Oct 2024 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886893; cv=none; b=cKp50tKtBc6KNgC+oyN5dJSPmBOYQcwaLl4uxL49BYQv+Uws/dalbI0b/zbbtJfdFycagC8DcWuA3hy8xa8YXvEiGWlzd1+5Gx2ZGEy0vCkYgS3rNEE50LfluYw5vD8EYZbwmmzTY2lSIKk1jd5TrO+l0TUChrd0PuhX/wHgW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886893; c=relaxed/simple;
	bh=gYc1FqhSTX9JLcOhjXbbJi93w7ZjmV3VEktbwWxkcVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fc3gbRqS9nhPMxYtkE4B+7UN/MCz0jcbFhSX+Zj+BYp71gs9i4tgEW3johj/8zLU37lNKzDV7uG/ShKr7Rn54ifPcfSvcMx46p9ZZg3a0VKQfpZ33vWoCF60mGgeJ3gwiwQbkLcf+UuCUFOu9mQ/Q1F0SUX8dqNDKEfFneJUKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8Q2Iz/1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cf3e36a76so24403725ad.0;
        Fri, 25 Oct 2024 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729886890; x=1730491690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uixWn8fdahIGEMvXoLBHGdPjmpQgtv+DOa9mQo7ADa4=;
        b=l8Q2Iz/1l9ZjKemyjBYnB/l2r2gc6StZjB6lmOR2Umaqrd/lL1xEBBq20EgXvnNOs7
         RvjJM9rKsTqDFpTQt5EqB4k66mmQ0NkX2FsI/Wp5dKam1PR/s6iSMQUoZX/Fmx8QYrWJ
         ogm63W8Zf+12vODfCPWKTrqGq6ZSPiFA/yKs827Kkqx8WE9Pgv7uUXeL2s21CavE3/3B
         mKC1eR+uAMuI5iFEqCf3b09LPVBf0tfl0e1q3IE/oq483RVRbR68dzUGrC3vVlJVwB84
         QWfX01IYeMCQOsnCxTlWN9Pva70cJ6hwLSQNAIEJIB9MQYgCrv95tPJy+cNaz3hUULFN
         kVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886890; x=1730491690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uixWn8fdahIGEMvXoLBHGdPjmpQgtv+DOa9mQo7ADa4=;
        b=xDg8idnyuxAKgeiWIZJVvEWbgf9l/nMeFar53x3FdSNKeA5HsTQ3H85NatakCTalwP
         SmFsBWau3R9ko2ZgTyPqP1jLyUpqcAh+He0Eb8Kl9QARu0N+F2Ail0wlTLaJPbCPnYZF
         fVFN4uL2zsrvUL3WSiXCXnICqkhr052lV4D0Q+UaVQ6kTF6L8PO2h9M/bcH52/WLNgpC
         t804VQjTvZt+r2dHr5GpVz5jp9xBtzuP8c7E0hx2ug6xGxqPbINfmOTpB9cLXBfHFC1S
         23NhWgxgnA6um0WBkYiaXPO/BmfGdjBQPttZY1BTFYkpwULL3QwaXRZI2Rp8Af0Wu671
         1urg==
X-Forwarded-Encrypted: i=1; AJvYcCUnkpChCa9Jv4xjqVArUGEclEC5hc2B5v/bxmY/PScinvGThVHlWFim3foB3ZTXoR2D38I27c9OU7DdYd7oIJNybqA=@vger.kernel.org, AJvYcCXf7sgxJEbYbg6iAEXMo+VxFg6+Xllo6UZH55bz6/Llmba5dZzkPjqvWZsuYTNnVmdymmuYaMCE1U+zTMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlojYmwqbEtSMzEYb2DcIwKfFD+3ePWCHkqOzu+eCn5E0rmIB
	ZDC79L5Xyciyx64685pnZgelXVc3IpYh1V38riE8w8O+93iDYorI9FgYx+SN
X-Google-Smtp-Source: AGHT+IGfEh+YQ5rNtlYhxLAOGe/BjvBEgRs9kQSSD+p19Mq/20eITnmz6vDppjwUs54j3x4Mr4ReFA==
X-Received: by 2002:a17:902:f54e:b0:20b:5439:f194 with SMTP id d9443c01a7336-210c6898707mr4682885ad.16.1729886890376;
        Fri, 25 Oct 2024 13:08:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0178a1sm13007515ad.143.2024.10.25.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:08:09 -0700 (PDT)
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
Date: Fri, 25 Oct 2024 13:08:07 -0700
Message-ID: <20241025200807.189223-1-rosenp@gmail.com>
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
 v4: add back pointer math for b53_get_strings. Needed as prototype
 can't be change to double pointer.
 v3: remove curly braces from ksz_common.c
 v2: remove curly braces from rzn1_a5psw.c
 drivers/net/dsa/b53/b53_common.c          |  3 +--
 drivers/net/dsa/bcm_sf2.c                 |  4 ++--
 drivers/net/dsa/bcm_sf2.h                 |  2 +-
 drivers/net/dsa/bcm_sf2_cfp.c             | 20 ++++++--------------
 drivers/net/dsa/dsa_loop.c                |  3 +--
 drivers/net/dsa/hirschmann/hellcreek.c    |  8 ++------
 drivers/net/dsa/microchip/ksz_common.c    |  6 ++----
 drivers/net/dsa/mv88e6xxx/chip.c          | 17 ++---------------
 drivers/net/dsa/mv88e6xxx/serdes.c        |  6 ++----
 drivers/net/dsa/rzn1_a5psw.c              |  6 ++----
 drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 ++-----
 drivers/net/dsa/xrs700x/xrs700x.c         |  6 ++----
 net/dsa/user.c                            | 13 +++++--------
 13 files changed, 30 insertions(+), 71 deletions(-)

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
index 4fda075a3449..e61e3bf688ff 100644
--- a/drivers/net/dsa/bcm_sf2.h
+++ b/drivers/net/dsa/bcm_sf2.h
@@ -229,7 +229,7 @@ int bcm_sf2_cfp_rst(struct bcm_sf2_priv *priv);
 void bcm_sf2_cfp_exit(struct dsa_switch *ds);
 int bcm_sf2_cfp_resume(struct dsa_switch *ds);
 void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
-			     u32 stringset, uint8_t *data);
+			     u32 stringset, uint8_t **data);
 void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
 				   uint64_t *data);
 int bcm_sf2_cfp_get_sset_count(struct dsa_switch *ds, int port, int sset);
diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index c88ee3dd4299..95991334561e 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -1280,26 +1280,18 @@ static const struct bcm_sf2_cfp_stat {
 };
 
 void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
-			     u32 stringset, uint8_t *data)
+			     u32 stringset, uint8_t **data)
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


