Return-Path: <linux-renesas-soc+bounces-9779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A778099F7C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE8A1C22490
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366DE1F81BD;
	Tue, 15 Oct 2024 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0ZpXkyR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8D1F5836;
	Tue, 15 Oct 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022552; cv=none; b=BePZSkqvsuBFUd2XeFyCkydY4AgkcW4Vnuny69bcDpK5HgUlpPQfL9tOD6pdoQwUkgZkd46rVEyTULegUPI+VTceZOEW/13utsREuybvaFlkKrbiNSsqGZauX/elpBGwumFopWi7YLwYEODDFOF/KmlfGa6lbBUwdAT1cidtGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022552; c=relaxed/simple;
	bh=TQb2BDzVQuGXYXCviFcUoFwCJMnSpYzGGJ4UVh59etE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T32c+ZGbXI7z9EyaFLN2qnhITSfE88MU12fKzR97z4ZVfcqXkV3aAH26EBbSXAiVDlfWX9ZOOw3FoNslSEnE8b9FiUUNVPK5zOz9zyDNvT+G+P60QINRQ77yNP/vVz/QIHX8Y03tvWqNxmJyzbh4yrh8TiQDsi9jdfEeR06M/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0ZpXkyR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e6f1a5a19so1481355b3a.3;
        Tue, 15 Oct 2024 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022549; x=1729627349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhK8TlC8OBuAKbLOpGav2a0vgjsHfERtSU7FB7P1BFg=;
        b=i0ZpXkyRPbY6rXsMrM3Xf8KYnlYhuMadRwu/0auOozAhfpF0J6I6wRE1uqslJ/MRfv
         6HoX2s8CvF2ZjX8V/A0ThWSXnHhBDFSEMQeDG6uKPwmFAsBT40RL8KbzyTGbMrPvkglB
         2yAlrVqp/OI9gLu1jVOKovJkxh+eTxG5O+muE1tjbrF4fohGzqoFM3meqc4pafIX9E5o
         9VbAUPR08NyaUiHR5Ubz1JOfXiODBIjcCa/voW+j9Kiw9GyFIinnWy67kvg0Jrspumgi
         6G+/6xe1HZwkF+vXAazxiAIyosjpOPAYAwGQkwODyb6Q1vdaJQDhcBwh1Cg3nyHfq/X9
         gpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022549; x=1729627349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhK8TlC8OBuAKbLOpGav2a0vgjsHfERtSU7FB7P1BFg=;
        b=pgZ7/NaSa5uU45LlEOPBDejTFPqij9k/GIbns2bP0NSTgl2f2w8a4LpLqzspn6/ewg
         OJVuiYRVaNno7PObbO50bP+rVn+v5C/EtJEWhdRziGLmHnUVe6ncxnjhK/k7jXC2CZAF
         q+w6J+MHeQn+RpzS+bUtKAnt/25kFDibnCtHb12//ke0A3se0mAGzpVreoqXNu4laX+3
         GMUKZ0UeCKEV2T6FOXrH7la6BfEE14qvhu8sMHoc+drBzC3ANHh0fYF3mbwrCufmdl7M
         0rMv23c1iohYxUGR/Mmplm6v6QugqZouDEYF8UTWyCwG1OCZk5iik0VYsZZoxSiUku6q
         pn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqvI+kOq2e1MI366g9lgm0mutwkLvShYCESOCbCW2TJGn8d/sRTkI7uHUeuHNgf+Yxzds1ivdeaQ8Ows/tpYcoUHY=@vger.kernel.org, AJvYcCXQS5hWnH5YE9PEny/sj51yLmLrZ4NZwvoOHJ/LzYd28+Q3pLH9J2Q78esokXKCDDyj6lIHvWTyM17AcIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIl/h9oMUauBkYl4Hwz61knzYbcLg6+SuCKBV7+QuHsrbDGSZJ
	hOc7qxjtgsNokyTkueT/ZyzJkpC1UaR1C7ZglK9bGIe3pG3+dZCO6BIokc8R
X-Google-Smtp-Source: AGHT+IFdb+mOanDwPwdfGBDDfu4cR0p5AHExBKddPFuKRxK36OkQ45CLIHQTxckxleQvezZKyq9dwg==
X-Received: by 2002:a05:6a00:1818:b0:71e:688c:1edd with SMTP id d2e1a72fcca58-71e7db0d026mr2362171b3a.27.1729022549400;
        Tue, 15 Oct 2024 13:02:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:29 -0700 (PDT)
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
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCH] net: memcpy to ethtool_puts
Date: Tue, 15 Oct 2024 13:02:16 -0700
Message-ID: <20241015200222.12452-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latter is the prefered way to copy ethtool strings.

Transformed with the following coccinelle script:

virtual org
virtual report
virtual context
virtual patch

@depends on patch@
expression E1, E2;
identifier I;
position p;
@@

- memcpy@p(E1 + I * ETH_GSTRING_LEN, E2, ETH_GSTRING_LEN);
+ ethtool_puts(&E1, E2);

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/dsa/b53/b53_common.c              |  3 +-
 drivers/net/dsa/bcm_sf2.c                     |  5 +-
 drivers/net/dsa/bcm_sf2_cfp.c                 | 17 ++--
 drivers/net/dsa/hirschmann/hellcreek.c        |  8 +-
 drivers/net/dsa/microchip/ksz_common.c        |  3 +-
 drivers/net/dsa/mv88e6xxx/chip.c              |  5 +-
 drivers/net/dsa/rzn1_a5psw.c                  |  3 +-
 drivers/net/dsa/sja1105/sja1105_ethtool.c     |  7 +-
 drivers/net/dsa/xrs700x/xrs700x.c             |  6 +-
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c  | 22 +++---
 drivers/net/ethernet/apm/xgene-v2/ethtool.c   | 13 +---
 .../ethernet/apm/xgene/xgene_enet_ethtool.c   | 13 +---
 drivers/net/ethernet/atheros/atlx/atl1.c      |  8 +-
 .../ethernet/broadcom/asp2/bcmasp_ethtool.c   |  5 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 10 +--
 drivers/net/ethernet/broadcom/bcmsysport.c    | 16 ++--
 drivers/net/ethernet/broadcom/bgmac.c         |  3 +-
 .../net/ethernet/broadcom/genet/bcmgenet.c    |  5 +-
 drivers/net/ethernet/cadence/macb_main.c      | 19 ++---
 drivers/net/ethernet/calxeda/xgmac.c          |  9 +--
 .../ethernet/cavium/liquidio/lio_ethtool.c    | 50 +++++-------
 .../ethernet/cavium/thunder/nicvf_ethtool.c   | 48 ++++--------
 .../net/ethernet/cisco/enic/enic_ethtool.c    | 40 ++++------
 .../net/ethernet/emulex/benet/be_ethtool.c    | 39 ++++------
 drivers/net/ethernet/engleder/tsnep_ethtool.c | 32 ++++----
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 38 +++------
 .../ethernet/freescale/dpaa2/dpaa2-ethtool.c  | 15 ++--
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 +-
 .../freescale/dpaa2/dpaa2-switch-ethtool.c    | 12 ++-
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 33 +++-----
 .../net/ethernet/freescale/gianfar_ethtool.c  |  8 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c | 23 +++---
 .../ethernet/hisilicon/hns/hns_dsaf_main.c    | 66 ++++++----------
 .../hns3/hns3_common/hclge_comm_tqp_stats.c   |  6 +-
 .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  9 +--
 .../hisilicon/hns3/hns3pf/hclge_main.c        | 49 +++++-------
 drivers/net/ethernet/ibm/ibmveth.c            |  4 +-
 drivers/net/ethernet/ibm/ibmvnic.c            | 30 +++----
 .../net/ethernet/intel/e1000/e1000_ethtool.c  | 13 ++--
 drivers/net/ethernet/intel/e1000e/ethtool.c   | 13 ++--
 drivers/net/ethernet/intel/igbvf/ethtool.c    |  9 +--
 drivers/net/ethernet/intel/ixgbevf/ethtool.c  | 35 ++++-----
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 38 +++------
 .../marvell/octeon_ep/octep_ethtool.c         | 34 +++-----
 .../marvell/octeon_ep_vf/octep_vf_ethtool.c   | 37 ++++-----
 .../marvell/octeontx2/nic/otx2_ethtool.c      | 78 +++++++------------
 drivers/net/ethernet/marvell/skge.c           |  3 +-
 drivers/net/ethernet/marvell/sky2.c           |  3 +-
 .../mellanox/mlxsw/spectrum_ethtool.c         | 77 +++++++-----------
 .../ethernet/mellanox/mlxsw/spectrum_ptp.c    |  7 +-
 drivers/net/ethernet/micrel/ksz884x.c         |  5 +-
 .../microchip/lan966x/lan966x_ethtool.c       |  3 +-
 .../ethernet/microsoft/mana/mana_ethtool.c    | 55 +++++--------
 drivers/net/ethernet/mscc/ocelot_stats.c      |  3 +-
 .../ethernet/netronome/nfp/nfp_net_ethtool.c  |  3 +-
 .../oki-semi/pch_gbe/pch_gbe_ethtool.c        |  8 +-
 .../qlogic/netxen/netxen_nic_ethtool.c        | 10 +--
 .../net/ethernet/qlogic/qede/qede_ethtool.c   | 34 ++++----
 .../ethernet/qlogic/qlcnic/qlcnic_ethtool.c   | 49 +++++-------
 .../net/ethernet/qualcomm/emac/emac-ethtool.c |  7 +-
 drivers/net/ethernet/rocker/rocker_main.c     |  7 +-
 .../ethernet/samsung/sxgbe/sxgbe_ethtool.c    |  9 +--
 drivers/net/ethernet/sfc/ethtool_common.c     | 21 +++--
 drivers/net/ethernet/sfc/falcon/ethtool.c     | 14 ++--
 drivers/net/ethernet/sfc/falcon/nic.c         |  7 +-
 drivers/net/ethernet/sfc/nic.c                |  7 +-
 .../net/ethernet/sfc/siena/ethtool_common.c   | 25 +++---
 drivers/net/ethernet/sfc/siena/nic.c          |  7 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 60 ++++++--------
 .../stmicro/stmmac/stmmac_selftests.c         |  7 +-
 drivers/net/ethernet/sun/cassini.c            |  6 +-
 .../ethernet/synopsys/dwc-xlgmac-ethtool.c    |  8 +-
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 20 ++---
 drivers/net/ethernet/ti/cpsw_ethtool.c        | 15 ++--
 drivers/net/ethernet/ti/netcp_ethss.c         |  7 +-
 drivers/net/fjes/fjes_ethtool.c               | 52 +++++--------
 drivers/net/phy/aquantia/aquantia_main.c      |  3 +-
 drivers/net/phy/bcm-phy-lib.c                 |  3 +-
 drivers/net/usb/cdc_ncm.c                     |  8 +-
 drivers/net/xen-netback/interface.c           |  3 +-
 drivers/net/xen-netfront.c                    |  3 +-
 net/dsa/user.c                                | 11 ++-
 82 files changed, 550 insertions(+), 966 deletions(-)

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
index 69cf19d3dd5e..bc813d97afa7 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1220,12 +1220,9 @@ static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
 	if (chip->info->ops->stats_get_strings)
 		count = chip->info->ops->stats_get_strings(chip, data);
 
-	if (chip->info->ops->serdes_get_strings) {
-		data += count * ETH_GSTRING_LEN;
+	if (chip->info->ops->serdes_get_strings)
 		count = chip->info->ops->serdes_get_strings(chip, port, data);
-	}
 
-	data += count * ETH_GSTRING_LEN;
 	mv88e6xxx_atu_vtu_get_strings(data);
 
 	mv88e6xxx_reg_unlock(chip);
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

