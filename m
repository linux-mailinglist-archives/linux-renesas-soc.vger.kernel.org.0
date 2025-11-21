Return-Path: <linux-renesas-soc+bounces-24936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACBC78D80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 766942D8B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36C134DB75;
	Fri, 21 Nov 2025 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9kqeeqs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3C346785
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724976; cv=none; b=onDy+XHn42axJdComB0bk3WrgdgqT85IAjujBwuwMpmQVH1xpmRaYVfjCwt2sIgWP5ScbToQTA46alPK6DqGTLRIdK5bpPABsOWRY3NTf+376MaO/VBQtjRMBpGcIx/BLMvZsk2wA+gKlkOfYaY2+FbccdHlkpk0KQTIaLjW9U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724976; c=relaxed/simple;
	bh=J9bbhlK2abRtODzOWkRv049W2G9nmFT+wPa+YCN2ze8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGutxZck6DlrRgNPoDDdXNfZc/gMUXvBJ1N6rUGn8fOm7sbrbkbdjLWotp5hGc43VdFW8R0XUQn6fWPFiFJZBOB6yAl41VZL7jY3qq7Z8iARcyEaxrGmkGs52uC1Hp1ydcr4DiNebEQSVFE1/CpA/yScVbfW6PsFXz1ZmtIQuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9kqeeqs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1078179f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724972; x=1764329772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu2kzCH7a9rdHz1PcQb+OvB7oiG265tCyETgvREK4Pg=;
        b=I9kqeeqsEjbAJsoV6HgeAysUP7DKTg+ie04Yhd+Og4saAHgp8POy5T0vevitqwwKwt
         IYmv3TvUbuIf3zqQdo9Awty7w7ayJqJuMVlYelrYNGWB6h0PX3jT3PyInu3eW80UlGq1
         U+L1b5JH3lv0mWV5CVrre/nx0+y0RuPnU4b8EbJjl3qRtA3AJIZwxKjhnwvlgVzurBS9
         hupHxK8idD8JDZAFgQb+LrM4CJ+hU9sq015UpTMB3b6hSkFr+n9anjSSJUA/uV0ONnQQ
         D5ssHLUSltT8k8pmh/CPzhrioeR7pR4LoECIeC+9X2miF3f77PBCenAqFQrtl6QVSZxT
         Nj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724972; x=1764329772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qu2kzCH7a9rdHz1PcQb+OvB7oiG265tCyETgvREK4Pg=;
        b=rpjdAequFM0hXG2gcIk/QixuzVOPxtV7IBEs2/PSvHRI0ts1Wz7F2FLGdQ3s12YIBX
         dO+1PoN4cCS082oMt9eSm6MYWJ2RCWuGfhT3UVVQH+h+OmCkOMP1ClfDcXz5LozDrc51
         wBsMY8NtdU2DmwuUeQbT7F6q3nG2IGuWDNWCDbrDSKLVANSw7S2puO82tXsb+g/K3iXo
         axvXmavgpT2E9lWvDeAhyS+m1C4vxGfzVZq7dQ+nfsusVZIyM3SkXYFX/RnvovTftwo1
         jLTWU4Kny/NpLdf1PkZ+LUl2xIH9UgjbhgNPuopEX5YrtlMuuvn4Suz3TzILtigO1z1U
         YcXw==
X-Gm-Message-State: AOJu0YwjQOVAIZZbx5dNcxfo4lLcVxbTIOYD1jO48dzDzlaR2hgSaN/B
	K6wgOFPKBYnGWbOEcdown9mKC3U3gRtnLHDq7SW9NspMYBPxXkKMU11n
X-Gm-Gg: ASbGnctXM42Qnfse8GKbo2/mRUjSlgewiCVTbC7E9r4I5J9k0sScKl6KJPcI4ag/gwf
	le6p+as3SS+Ix+Xfpk9tAiGfHquFc18m5/twu/I2MKC6ug6u+4vrSBMu8Sf5Ibb+MPPJbTlEvCd
	9T2/mjPmuVVuU1fL09Ehx9zNGVsFLewS2pK5HBab33QWThAWIxBHvxySLbPUFEi3FUc+s3RxdaD
	9g0eXCWzRR0Mk/ksyKxUTIhn5iX5yXa3vrUgk74uo8vGTXZY/X1u9G58kPYqmpW8PatckhM6dBt
	FIgLUL+tbSvmzDDZ49lgr0W7ck9Kk77AHD9ROxzihpO9ZLkp4yaonfF/OLTSvwjfesdTkfuyyIJ
	BfbtWE9PxbjWCGsyPOtuj6ALqhHknKNaXRes35KTlRfwVfpVcWX6huuMvWTDOcalEdxJ6em1+/1
	Qk90XTFaXSLzICUu+KYPdEmLSNNvaOD0kn+8c=
X-Google-Smtp-Source: AGHT+IHJfGnMJvpbU4mjRm3yacg24pgKSDc6DAnZqzokWG1QDvI/YfVxDvtrLFX3uGvN42B9PR/hpA==
X-Received: by 2002:a05:600c:8b16:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-477c115dc85mr15823345e9.32.1763724971434;
        Fri, 21 Nov 2025 03:36:11 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 07/11] net: dsa: rzn1-a5psw: Make switch topology configurable via OF data
Date: Fri, 21 Nov 2025 11:35:33 +0000
Message-ID: <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the switch topology description-the number of ports and the CPU-port
index-out of hard-coded constants and into SoC-specific OF match data. The
driver previously assumed a fixed 5-port layout with the last port acting
as the CPU port. That assumption does not hold for newer Renesas variants,
and embedding it in the code made the driver inflexible and error-prone.

Introduce a small a5psw_of_data structure carrying both the total number
of ports and the CPU-port identifier, and rely on this data everywhere the
driver previously used fixed values. This ensures that port loops, PCS
allocation, management-port setup, and bridge bookkeeping all reflect the
actual hardware configuration.

Making these attributes runtime-selectable allows the driver to support
RZ/T2H and RZ/N2H SoCs which use different port counts and CPU-port
assignments-without rewriting common logic or forking the driver, while
preserving correct behaviour on existing RZN1 systems.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 26 +++++++++++++++++---------
 drivers/net/dsa/rzn1_a5psw.h | 17 ++++++++++++++---
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 99098bc06efe..d957b6d40f05 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -382,13 +382,14 @@ static void a5psw_port_bridge_leave(struct dsa_switch *ds, int port,
 				    struct dsa_bridge bridge)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 
 	a5psw->bridged_ports &= ~BIT(port);
 
 	a5psw_port_set_standalone(a5psw, port, true);
 
 	/* No more ports bridged */
-	if (a5psw->bridged_ports == BIT(A5PSW_CPU_PORT))
+	if (a5psw->bridged_ports == BIT(cpu_port))
 		a5psw->br_dev = NULL;
 }
 
@@ -924,20 +925,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw, int port)
 static int a5psw_setup(struct dsa_switch *ds)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 	int port, vlan, ret;
 	struct dsa_port *dp;
 	u32 reg;
 
-	/* Validate that there is only 1 CPU port with index A5PSW_CPU_PORT */
+	/* Validate that there is only 1 CPU port with index matching cpu_port */
 	dsa_switch_for_each_cpu_port(dp, ds) {
-		if (dp->index != A5PSW_CPU_PORT) {
+		if (dp->index != cpu_port) {
 			dev_err(a5psw->dev, "Invalid CPU port\n");
 			return -EINVAL;
 		}
 	}
 
 	/* Configure management port */
-	reg = A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
+	reg = cpu_port | A5PSW_MGMT_CFG_ENABLE;
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
@@ -1147,7 +1149,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
+	for (i = 0; i < a5psw->of_data->nports - 1; i++) {
 		if (a5psw->pcs[i])
 			miic_destroy(a5psw->pcs[i]);
 	}
@@ -1174,7 +1176,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 			goto free_pcs;
 		}
 
-		if (reg >= ARRAY_SIZE(a5psw->pcs)) {
+		if (reg >= a5psw->of_data->nports - 1) {
 			ret = -ENODEV;
 			goto free_pcs;
 		}
@@ -1223,7 +1225,8 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (IS_ERR(a5psw->base))
 		return PTR_ERR(a5psw->base);
 
-	a5psw->bridged_ports = BIT(A5PSW_CPU_PORT);
+	a5psw->of_data = of_device_get_match_data(dev);
+	a5psw->bridged_ports = BIT(a5psw->of_data->cpu_port);
 
 	ret = a5psw_pcs_get(a5psw);
 	if (ret)
@@ -1268,7 +1271,7 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	ds = &a5psw->ds;
 	ds->dev = dev;
-	ds->num_ports = A5PSW_PORTS_NUM;
+	ds->num_ports = a5psw->of_data->nports;
 	ds->ops = &a5psw_switch_ops;
 	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
 	ds->priv = a5psw;
@@ -1310,8 +1313,13 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzn1_of_data = {
+	.nports = 5,
+	.cpu_port = 4,
+};
+
 static const struct of_device_id a5psw_of_mtable[] = {
-	{ .compatible = "renesas,rzn1-a5psw", },
+	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 81be30d6c55f..d1b2cc5b43e6 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -195,8 +195,7 @@
 #define A5PSW_aCarrierSenseErrors		0x924
 
 #define A5PSW_VLAN_TAG(prio, id)	(((prio) << 12) | (id))
-#define A5PSW_PORTS_NUM			5
-#define A5PSW_CPU_PORT			(A5PSW_PORTS_NUM - 1)
+#define A5PSW_MAX_PORTS			4
 #define A5PSW_MDIO_DEF_FREQ		2500000
 #define A5PSW_MDIO_TIMEOUT		100
 #define A5PSW_JUMBO_LEN			(10 * SZ_1K)
@@ -231,6 +230,16 @@ union lk_data {
 	struct fdb_entry entry;
 };
 
+/**
+ * struct a5psw_of_data - OF data structure
+ * @nports: Number of ports in the switch
+ * @cpu_port: CPU port number
+ */
+struct a5psw_of_data {
+	unsigned int nports;
+	unsigned int cpu_port;
+};
+
 /**
  * struct a5psw - switch struct
  * @base: Base address of the switch
@@ -238,6 +247,7 @@ union lk_data {
  * @clk: clk_switch clock
  * @ts: Timestamp clock
  * @dev: Device associated to the switch
+ * @of_data: Pointer to OF data
  * @mii_bus: MDIO bus struct
  * @mdio_freq: MDIO bus frequency requested
  * @pcs: Array of PCS connected to the switch ports (not for the CPU)
@@ -254,8 +264,9 @@ struct a5psw {
 	struct clk *clk;
 	struct clk *ts;
 	struct device *dev;
+	const struct a5psw_of_data *of_data;
 	struct mii_bus	*mii_bus;
-	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
+	struct phylink_pcs *pcs[A5PSW_MAX_PORTS];
 	struct dsa_switch ds;
 	struct mutex lk_lock;
 	spinlock_t reg_lock;
-- 
2.52.0


