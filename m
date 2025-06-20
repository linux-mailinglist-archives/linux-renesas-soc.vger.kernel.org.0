Return-Path: <linux-renesas-soc+bounces-18585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E0AE1D7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 16:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907DB1BC52ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1201F2949E3;
	Fri, 20 Jun 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aa24LnaC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202E7DA93;
	Fri, 20 Jun 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430089; cv=none; b=XKuk5qcKO+WWDWT2DLa9wWw8JKOkqe5Wab/K1O5tkKgvVTiK0THepCqfkl5+nnfYZiptWj9JLFMksDfxoywkmdraub0JGoqizZiy9PRAFUETmBgqtMxT9xTiZczzQ6BK90ykMOMquz8Gv3+M9Vr3zQdRbfnTCBLr3+eSS2sGy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430089; c=relaxed/simple;
	bh=lEdJgIH9+GCDC+/qwPMu3yTOOQpEXsXxTYL2tTUGXws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEva+pT8OEA7FvlIjXLMwEKypuk3BJuF2KomhMEVSwxzivsBsKl9t7qK3QmKmBzBWhRYhVApl+gUPXKSZi0E7ZgXbbblIohhSU6QlYerVGm/lyhtvyOR8HG4pCpfH+bn1aCk84feMINsip0ogLBu6h8VFsZQ0QdZ1gbtE3CZszg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aa24LnaC; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A333D1FD35;
	Fri, 20 Jun 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750430082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z6CFmlIJJWOJm3aMi0Pfqrg4pHtR673sIZ+b0sPjBbI=;
	b=Aa24LnaC5N0iSDFWPQNhPEWUhD/F+1oeuQz2M8E4+VfEJJ31REtddB6yaoH18so2Qv3/oZ
	tjo8JY0w8gUgORffodEHhq63yjeikH3OhC4SL6SIK9NnNAaq24ZPV4DcAAAOaI+l0nNDJg
	11g/9SbHJv48+JWjd69nsydja6oS3j3rhzB1fMwxKZaLIOJftHgdljJ31gbjOGfORLEBNP
	evZIIzamxTsPJKD2VomOmBdXKg9i5sbneEXCVpv8NvRVnTX+QuNzrFu4ezR9JKdO+rjKN0
	n9elaUDmWF3qeddcoBv+ZnDlG+RnP5oci5Oriook94WlCB2SRej8uZpBdbpptw==
From: Kory Maincent <kory.maincent@bootlin.com>
To: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Einon <mark.einon@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Michael Chan <michael.chan@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next RFC] net: Throw ASSERT_RTNL into phy_detach
Date: Fri, 20 Jun 2025 16:33:27 +0200
Message-ID: <20250620143341.2158655-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheplefhhefhgeevtedutdekudegjedvhffffefhhfdtgfefteduvdehgeetgedtvdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddrrddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehuddprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrtghtihhonhhssehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhto
 heplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

phy_detach needs the rtnl lock to be held. It should have been added before
to avoid this massive change among lots of net drivers but there was no
clear evidence of such needs at that time. This imply a lock change in
this API. Add phy_detach_rtnl, phy_diconnect_rtnl, phylink_connect_phy_rtnl
and phylink_fwnode_phy_connect_rtnl helpers to take the lock before calling
their respective function.

The RTNL requirement was identified when adding rtnl_dereference() calls
for hardware timestamping support [1], but applies to other features as
well [2].

[1] https://lore.kernel.org/all/20241212-feature_ptp_netnext-v21-3-2c282a941518@bootlin.com/
[2] https://lore.kernel.org/netdev/Z6OdkdI2ss19FyVT@shell.armlinux.org.uk/

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/ethernet/actions/owl-emac.c       |   4 +-
 drivers/net/ethernet/adi/adin1110.c           |   2 +-
 drivers/net/ethernet/agere/et131x.c           |   4 +-
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c   |   2 +-
 drivers/net/ethernet/apm/xgene-v2/mdio.c      |   2 +-
 .../net/ethernet/apm/xgene/xgene_enet_hw.c    |   4 +-
 drivers/net/ethernet/arc/emac_main.c          |   4 +-
 drivers/net/ethernet/asix/ax88796c_main.c     |   4 +-
 drivers/net/ethernet/broadcom/b44.c           |   2 +-
 drivers/net/ethernet/broadcom/bgmac.c         |   8 +-
 .../net/ethernet/broadcom/genet/bcmgenet.c    |   7 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c  |   2 +-
 drivers/net/ethernet/broadcom/tg3.c           |   4 +-
 .../net/ethernet/cavium/thunder/thunder_bgx.c |   2 +-
 drivers/net/ethernet/cortina/gemini.c         |   4 +-
 drivers/net/ethernet/davicom/dm9051.c         |   4 +-
 drivers/net/ethernet/dnet.c                   |   2 +-
 drivers/net/ethernet/ethoc.c                  |   2 +-
 drivers/net/ethernet/faraday/ftgmac100.c      |   2 +-
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |   4 +-
 .../net/ethernet/hisilicon/hibmcge/hbg_mdio.c |   2 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c    |   2 +-
 drivers/net/ethernet/hisilicon/hisi_femac.c   |   4 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c |   2 +-
 .../hisilicon/hns3/hns3pf/hclge_mdio.c        |   2 +-
 drivers/net/ethernet/lantiq_etop.c            |   2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c    |   2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c     |   2 +-
 .../mellanox/mlxbf_gige/mlxbf_gige_main.c     |   4 +-
 drivers/net/ethernet/oa_tc6.c                 |   2 +-
 drivers/net/ethernet/rdc/r6040.c              |   8 +-
 drivers/net/ethernet/renesas/rswitch.c        |   2 +-
 drivers/net/ethernet/renesas/rtsn.c           |   2 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   4 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |   4 +-
 drivers/net/ethernet/toshiba/tc35815.c        |   2 +-
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    |   2 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c      |   4 +-
 drivers/net/phy/phy_device.c                  |  38 ++++-
 drivers/net/phy/phylink.c                     | 148 ++++++++++++++----
 drivers/net/usb/asix_devices.c                |   2 +-
 drivers/net/usb/ax88172a.c                    |   2 +-
 drivers/net/usb/smsc95xx.c                    |   2 +-
 include/linux/phy.h                           |   2 +
 include/linux/phylink.h                       |   4 +
 net/core/rtnetlink.c                          |   1 +
 net/dsa/user.c                                |   2 +-
 47 files changed, 231 insertions(+), 91 deletions(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 0a08da799255..8fca83d86fba 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1570,7 +1570,7 @@ static int owl_emac_probe(struct platform_device *pdev)
 	ret = devm_register_netdev(dev, netdev);
 	if (ret) {
 		netif_napi_del(&priv->napi);
-		phy_disconnect(netdev->phydev);
+		phy_disconnect_rtnl(netdev->phydev);
 		return ret;
 	}
 
@@ -1582,7 +1582,7 @@ static void owl_emac_remove(struct platform_device *pdev)
 	struct owl_emac_priv *priv = platform_get_drvdata(pdev);
 
 	netif_napi_del(&priv->napi);
-	phy_disconnect(priv->netdev->phydev);
+	phy_disconnect_rtnl(priv->netdev->phydev);
 	cancel_work_sync(&priv->mac_reset_task);
 }
 
diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/adi/adin1110.c
index 30f9d271e595..3f6fef6d7093 100644
--- a/drivers/net/ethernet/adi/adin1110.c
+++ b/drivers/net/ethernet/adi/adin1110.c
@@ -1224,7 +1224,7 @@ static struct notifier_block adin1110_netdevice_nb = {
 
 static void adin1110_disconnect_phy(void *data)
 {
-	phy_disconnect(data);
+	phy_disconnect_rtnl(data);
 }
 
 static int adin1110_port_set_forwarding_state(struct adin1110_port_priv *port_priv)
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index 678eddb36172..7faa4a0f4926 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -3294,7 +3294,7 @@ static void et131x_pci_remove(struct pci_dev *pdev)
 
 	unregister_netdev(netdev);
 	netif_napi_del(&adapter->napi);
-	phy_disconnect(netdev->phydev);
+	phy_disconnect_rtnl(netdev->phydev);
 	mdiobus_unregister(adapter->mii_bus);
 	mdiobus_free(adapter->mii_bus);
 
@@ -4028,7 +4028,7 @@ static int et131x_pci_setup(struct pci_dev *pdev,
 	return rc;
 
 err_phy_disconnect:
-	phy_disconnect(netdev->phydev);
+	phy_disconnect_rtnl(netdev->phydev);
 err_mdio_unregister:
 	mdiobus_unregister(adapter->mii_bus);
 err_mdio_free:
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
index 7a4dfa4e19c7..3f13571a04a4 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
@@ -805,7 +805,7 @@ static void xgbe_phy_free_phy_device(struct xgbe_prv_data *pdata)
 	struct xgbe_phy_data *phy_data = pdata->phy_data;
 
 	if (phy_data->phydev) {
-		phy_detach(phy_data->phydev);
+		phy_detach_rtnl(phy_data->phydev);
 		phy_device_remove(phy_data->phydev);
 		phy_device_free(phy_data->phydev);
 		phy_data->phydev = NULL;
diff --git a/drivers/net/ethernet/apm/xgene-v2/mdio.c b/drivers/net/ethernet/apm/xgene-v2/mdio.c
index 6a17045a5f62..91069c1888af 100644
--- a/drivers/net/ethernet/apm/xgene-v2/mdio.c
+++ b/drivers/net/ethernet/apm/xgene-v2/mdio.c
@@ -87,7 +87,7 @@ void xge_mdio_remove(struct net_device *ndev)
 	struct mii_bus *mdio_bus = pdata->mdio_bus;
 
 	if (ndev->phydev)
-		phy_disconnect(ndev->phydev);
+		phy_disconnect_rtnl(ndev->phydev);
 
 	if (mdio_bus->state == MDIOBUS_REGISTERED)
 		mdiobus_unregister(mdio_bus);
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
index b854b6b42d77..5fbf7c783989 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
@@ -973,7 +973,7 @@ void xgene_enet_phy_disconnect(struct xgene_enet_pdata *pdata)
 	struct net_device *ndev = pdata->ndev;
 
 	if (ndev->phydev)
-		phy_disconnect(ndev->phydev);
+		phy_disconnect_rtnl(ndev->phydev);
 }
 
 void xgene_enet_mdio_remove(struct xgene_enet_pdata *pdata)
@@ -981,7 +981,7 @@ void xgene_enet_mdio_remove(struct xgene_enet_pdata *pdata)
 	struct net_device *ndev = pdata->ndev;
 
 	if (ndev->phydev)
-		phy_disconnect(ndev->phydev);
+		phy_disconnect_rtnl(ndev->phydev);
 
 	mdiobus_unregister(pdata->mdio_bus);
 	mdiobus_free(pdata->mdio_bus);
diff --git a/drivers/net/ethernet/arc/emac_main.c b/drivers/net/ethernet/arc/emac_main.c
index 8283aeee35fb..cf1ba9823a42 100644
--- a/drivers/net/ethernet/arc/emac_main.c
+++ b/drivers/net/ethernet/arc/emac_main.c
@@ -1000,7 +1000,7 @@ int arc_emac_probe(struct net_device *ndev, int interface)
 
 out_netif_api:
 	netif_napi_del(&priv->napi);
-	phy_disconnect(phydev);
+	phy_disconnect_rtnl(phydev);
 out_mdio:
 	arc_mdio_remove(priv);
 out_clken:
@@ -1017,7 +1017,7 @@ void arc_emac_remove(struct net_device *ndev)
 {
 	struct arc_emac_priv *priv = netdev_priv(ndev);
 
-	phy_disconnect(ndev->phydev);
+	phy_disconnect_rtnl(ndev->phydev);
 	arc_mdio_remove(priv);
 	unregister_netdev(ndev);
 	netif_napi_del(&priv->napi);
diff --git a/drivers/net/ethernet/asix/ax88796c_main.c b/drivers/net/ethernet/asix/ax88796c_main.c
index 11e8996b33d7..24aad8f39397 100644
--- a/drivers/net/ethernet/asix/ax88796c_main.c
+++ b/drivers/net/ethernet/asix/ax88796c_main.c
@@ -1097,7 +1097,7 @@ static int ax88796c_probe(struct spi_device *spi)
 	return 0;
 
 err_phy_dis:
-	phy_disconnect(ax_local->phydev);
+	phy_disconnect_rtnl(ax_local->phydev);
 err:
 	return ret;
 }
@@ -1107,7 +1107,7 @@ static void ax88796c_remove(struct spi_device *spi)
 	struct ax88796c_device *ax_local = dev_get_drvdata(&spi->dev);
 	struct net_device *ndev = ax_local->ndev;
 
-	phy_disconnect(ndev->phydev);
+	phy_disconnect_rtnl(ndev->phydev);
 
 	netif_info(ax_local, probe, ndev, "removing network device %s %s\n",
 		   dev_driver_string(&spi->dev),
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 8267417b3750..9b3ce62d5b79 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -2314,7 +2314,7 @@ static void b44_unregister_phy_one(struct b44 *bp)
 	struct net_device *dev = bp->dev;
 	struct mii_bus *mii_bus = bp->mii_bus;
 
-	phy_disconnect(dev->phydev);
+	phy_disconnect_rtnl(dev->phydev);
 	mdiobus_unregister(mii_bus);
 	mdiobus_free(mii_bus);
 }
diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 3e9c57196a39..4d5cf222c9e8 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1548,15 +1548,15 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	err = register_netdev(bgmac->net_dev);
 	if (err) {
 		dev_err(bgmac->dev, "Cannot register net device\n");
-		goto err_phy_disconnect;
+		goto err_phy_disconnect_rtnl;
 	}
 
 	netif_carrier_off(net_dev);
 
 	return 0;
 
-err_phy_disconnect:
-	phy_disconnect(net_dev->phydev);
+err_phy_disconnect_rtnl:
+	phy_disconnect_rtnl(net_dev->phydev);
 err_dma_free:
 	bgmac_dma_free(bgmac);
 err_out:
@@ -1568,7 +1568,7 @@ EXPORT_SYMBOL_GPL(bgmac_enet_probe);
 void bgmac_enet_remove(struct bgmac *bgmac)
 {
 	unregister_netdev(bgmac->net_dev);
-	phy_disconnect(bgmac->net_dev->phydev);
+	phy_disconnect_rtnl(bgmac->net_dev->phydev);
 	netif_napi_del(&bgmac->napi);
 	bgmac_dma_free(bgmac);
 }
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 4f40f6afe88f..90d23aa5114b 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -4256,8 +4256,11 @@ static int bcmgenet_resume(struct device *d)
 	return 0;
 
 out_clk_disable:
-	if (priv->internal_phy)
+	if (priv->internal_phy) {
+		rtnl_lock();
 		bcmgenet_power_down(priv, GENET_POWER_PASSIVE);
+		rtnl_unlock();
+	}
 	clk_disable_unprepare(priv->clk);
 	return ret;
 }
@@ -4325,11 +4328,13 @@ static int bcmgenet_suspend_noirq(struct device *d)
 	if (!netif_running(dev))
 		return 0;
 
+	rtnl_lock();
 	/* Prepare the device for Wake-on-LAN and switch to the slow clock */
 	if (device_may_wakeup(d) && priv->wolopts)
 		ret = bcmgenet_power_down(priv, GENET_POWER_WOL_MAGIC);
 	else if (priv->internal_phy)
 		ret = bcmgenet_power_down(priv, GENET_POWER_PASSIVE);
+	rtnl_unlock();
 
 	/* Let the framework handle resumption and leave the clocks on */
 	if (ret)
diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 573e8b279e52..3377b45c81f3 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -397,7 +397,7 @@ int bcmgenet_mii_probe(struct net_device *dev)
 	 */
 	ret = bcmgenet_mii_config(dev, true);
 	if (ret) {
-		phy_disconnect(dev->phydev);
+		phy_disconnect_rtnl(dev->phydev);
 		return ret;
 	}
 
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 91104cc2c238..e57a00960378 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2116,7 +2116,7 @@ static int tg3_phy_init(struct tg3 *tp)
 		phy_support_asym_pause(phydev);
 		break;
 	default:
-		phy_disconnect(mdiobus_get_phy(tp->mdio_bus, tp->phy_addr));
+		phy_disconnect_rtnl(mdiobus_get_phy(tp->mdio_bus, tp->phy_addr));
 		return -EINVAL;
 	}
 
@@ -2161,7 +2161,7 @@ static void tg3_phy_stop(struct tg3 *tp)
 static void tg3_phy_fini(struct tg3 *tp)
 {
 	if (tp->phy_flags & TG3_PHYFLG_IS_CONNECTED) {
-		phy_disconnect(mdiobus_get_phy(tp->mdio_bus, tp->phy_addr));
+		phy_disconnect_rtnl(mdiobus_get_phy(tp->mdio_bus, tp->phy_addr));
 		tp->phy_flags &= ~TG3_PHYFLG_IS_CONNECTED;
 	}
 }
diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 3b7ad744b2dd..c9383ac1f18f 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1183,7 +1183,7 @@ static void bgx_lmac_disable(struct bgx *bgx, u8 lmacid)
 	    (lmac->lmac_type != BGX_MODE_XLAUI) &&
 	    (lmac->lmac_type != BGX_MODE_40G_KR) &&
 	    (lmac->lmac_type != BGX_MODE_10G_KR) && lmac->phydev)
-		phy_disconnect(lmac->phydev);
+		phy_disconnect_rtnl(lmac->phydev);
 
 	lmac->phydev = NULL;
 }
diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 6a2004bbe87f..65fd40c6dacc 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -393,7 +393,7 @@ static int gmac_setup_phy(struct net_device *netdev)
 		break;
 	default:
 		netdev_err(netdev, "Unsupported MII interface\n");
-		phy_disconnect(phy);
+		phy_disconnect_rtnl(phy);
 		netdev->phydev = NULL;
 		return -EINVAL;
 	}
@@ -2344,7 +2344,7 @@ static irqreturn_t gemini_port_irq(int irq, void *data)
 static void gemini_port_remove(struct gemini_ethernet_port *port)
 {
 	if (port->netdev) {
-		phy_disconnect(port->netdev->phydev);
+		phy_disconnect_rtnl(port->netdev->phydev);
 		unregister_netdev(port->netdev);
 	}
 	clk_disable_unprepare(port->pclk);
diff --git a/drivers/net/ethernet/davicom/dm9051.c b/drivers/net/ethernet/davicom/dm9051.c
index 59ea48d4c9de..be924e610fc3 100644
--- a/drivers/net/ethernet/davicom/dm9051.c
+++ b/drivers/net/ethernet/davicom/dm9051.c
@@ -1215,7 +1215,7 @@ static int dm9051_probe(struct spi_device *spi)
 
 	ret = devm_register_netdev(dev, ndev);
 	if (ret) {
-		phy_disconnect(db->phydev);
+		phy_disconnect_rtnl(db->phydev);
 		return dev_err_probe(dev, ret, "device register failed");
 	}
 
@@ -1228,7 +1228,7 @@ static void dm9051_drv_remove(struct spi_device *spi)
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct board_info *db = to_dm9051_board(ndev);
 
-	phy_disconnect(db->phydev);
+	phy_disconnect_rtnl(db->phydev);
 }
 
 static const struct of_device_id dm9051_match_table[] = {
diff --git a/drivers/net/ethernet/dnet.c b/drivers/net/ethernet/dnet.c
index 0de3cd660ec8..19df1e9867e9 100644
--- a/drivers/net/ethernet/dnet.c
+++ b/drivers/net/ethernet/dnet.c
@@ -852,7 +852,7 @@ static void dnet_remove(struct platform_device *pdev)
 	if (dev) {
 		bp = netdev_priv(dev);
 		if (dev->phydev)
-			phy_disconnect(dev->phydev);
+			phy_disconnect_rtnl(dev->phydev);
 		mdiobus_unregister(bp->mii_bus);
 		mdiobus_free(bp->mii_bus);
 		unregister_netdev(dev);
diff --git a/drivers/net/ethernet/ethoc.c b/drivers/net/ethernet/ethoc.c
index 0c418557264c..456683a478cb 100644
--- a/drivers/net/ethernet/ethoc.c
+++ b/drivers/net/ethernet/ethoc.c
@@ -1261,7 +1261,7 @@ static void ethoc_remove(struct platform_device *pdev)
 
 	if (netdev) {
 		netif_napi_del(&priv->napi);
-		phy_disconnect(netdev->phydev);
+		phy_disconnect_rtnl(netdev->phydev);
 
 		if (priv->mdio) {
 			mdiobus_unregister(priv->mdio);
diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index a98d5af3f9e3..a9a46cc0381b 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1734,7 +1734,7 @@ static void ftgmac100_phy_disconnect(struct net_device *netdev)
 	if (!netdev->phydev)
 		return;
 
-	phy_disconnect(netdev->phydev);
+	phy_disconnect_rtnl(netdev->phydev);
 	if (of_phy_is_fixed_link(priv->dev->of_node))
 		of_phy_deregister_fixed_link(priv->dev->of_node);
 
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index 422ce13a7c94..aded51c72d74 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -434,10 +434,10 @@ int dpaa2_mac_connect(struct dpaa2_mac *mac)
 	mac->phylink = phylink;
 
 	rtnl_lock();
-	err = phylink_fwnode_phy_connect(mac->phylink, dpmac_node, 0);
+	err = phylink_fwnode_phy_connect_rtnl(mac->phylink, dpmac_node, 0);
 	rtnl_unlock();
 	if (err) {
-		netdev_err(net_dev, "phylink_fwnode_phy_connect() = %d\n", err);
+		netdev_err(net_dev, "phylink_fwnode_phy_connect_rtnl() = %d\n", err);
 		goto err_phylink_destroy;
 	}
 
diff --git a/drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c b/drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c
index 42b0083c9193..f87468fe5fd4 100644
--- a/drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c
+++ b/drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c
@@ -194,7 +194,7 @@ static void hbg_phy_adjust_link(struct net_device *netdev)
 
 static void hbg_phy_disconnect(void *data)
 {
-	phy_disconnect((struct phy_device *)data);
+	phy_disconnect_rtnl((struct phy_device *)data);
 }
 
 static int hbg_phy_connect(struct hbg_priv *priv)
diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index 18376bcc718a..052be32754bc 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -1027,7 +1027,7 @@ static void hip04_remove(struct platform_device *pdev)
 	struct device *d = &pdev->dev;
 
 	if (priv->phy)
-		phy_disconnect(priv->phy);
+		phy_disconnect_rtnl(priv->phy);
 
 	hip04_free_ring(ndev, d);
 	unregister_netdev(ndev);
diff --git a/drivers/net/ethernet/hisilicon/hisi_femac.c b/drivers/net/ethernet/hisilicon/hisi_femac.c
index d244a40df430..a82d05c616af 100644
--- a/drivers/net/ethernet/hisilicon/hisi_femac.c
+++ b/drivers/net/ethernet/hisilicon/hisi_femac.c
@@ -884,7 +884,7 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 
 out_disconnect_phy:
 	netif_napi_del(&priv->napi);
-	phy_disconnect(phy);
+	phy_disconnect_rtnl(phy);
 out_disable_clk:
 	clk_disable_unprepare(priv->clk);
 out_free_netdev:
@@ -901,7 +901,7 @@ static void hisi_femac_drv_remove(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	unregister_netdev(ndev);
 
-	phy_disconnect(ndev->phydev);
+	phy_disconnect_rtnl(ndev->phydev);
 	clk_disable_unprepare(priv->clk);
 	free_netdev(ndev);
 }
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..e6d15c5db17d 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -2406,7 +2406,7 @@ static void hns_nic_dev_remove(struct platform_device *pdev)
 	priv->ring_data = NULL;
 
 	if (ndev->phydev)
-		phy_disconnect(ndev->phydev);
+		phy_disconnect_rtnl(ndev->phydev);
 
 	if (!IS_ERR_OR_NULL(priv->ae_handle))
 		hnae_put_handle(priv->ae_handle);
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
index 9a456ebf9b7c..13f254f5a96b 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
@@ -248,7 +248,7 @@ void hclge_mac_disconnect_phy(struct hnae3_handle *handle)
 	if (!phydev)
 		return;
 
-	phy_disconnect(phydev);
+	phy_disconnect_rtnl(phydev);
 }
 
 void hclge_mac_start_phy(struct hclge_dev *hdev)
diff --git a/drivers/net/ethernet/lantiq_etop.c b/drivers/net/ethernet/lantiq_etop.c
index 83ce3bfefa5c..726bd7e4dbc9 100644
--- a/drivers/net/ethernet/lantiq_etop.c
+++ b/drivers/net/ethernet/lantiq_etop.c
@@ -424,7 +424,7 @@ ltq_etop_mdio_cleanup(struct net_device *dev)
 {
 	struct ltq_etop_priv *priv = netdev_priv(dev);
 
-	phy_disconnect(dev->phydev);
+	phy_disconnect_rtnl(dev->phydev);
 	mdiobus_unregister(priv->mii_bus);
 	mdiobus_free(priv->mii_bus);
 }
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 0ab52c57c648..5a62bf72e7be 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -3277,7 +3277,7 @@ static void mv643xx_eth_remove(struct platform_device *pdev)
 
 	unregister_netdev(mp->dev);
 	if (dev->phydev)
-		phy_disconnect(dev->phydev);
+		phy_disconnect_rtnl(dev->phydev);
 	cancel_work_sync(&mp->tx_timeout_task);
 
 	if (!IS_ERR(mp->clk))
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index e4cfdc8bc055..c249a9a54d7f 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -1535,7 +1535,7 @@ static void pxa168_eth_remove(struct platform_device *pdev)
 		pep->htpr = NULL;
 	}
 	if (dev->phydev)
-		phy_disconnect(dev->phydev);
+		phy_disconnect_rtnl(dev->phydev);
 
 	mdiobus_unregister(pep->smi_bus);
 	mdiobus_free(pep->smi_bus);
diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
index d76d7a945899..e1a0e1fbd5c9 100644
--- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
+++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
@@ -480,7 +480,7 @@ static int mlxbf_gige_probe(struct platform_device *pdev)
 	err = register_netdev(netdev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to register netdev\n");
-		phy_disconnect(phydev);
+		phy_disconnect_rtnl(phydev);
 		goto out;
 	}
 
@@ -496,7 +496,7 @@ static void mlxbf_gige_remove(struct platform_device *pdev)
 	struct mlxbf_gige *priv = platform_get_drvdata(pdev);
 
 	unregister_netdev(priv->netdev);
-	phy_disconnect(priv->netdev->phydev);
+	phy_disconnect_rtnl(priv->netdev->phydev);
 	mlxbf_gige_mdio_remove(priv);
 	platform_set_drvdata(pdev, NULL);
 }
diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..07e44ce5d442 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -579,7 +579,7 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 
 static void oa_tc6_phy_exit(struct oa_tc6 *tc6)
 {
-	phy_disconnect(tc6->phydev);
+	phy_disconnect_rtnl(tc6->phydev);
 	oa_tc6_mdiobus_unregister(tc6);
 }
 
diff --git a/drivers/net/ethernet/rdc/r6040.c b/drivers/net/ethernet/rdc/r6040.c
index f4d434c379e7..9f53a9c84053 100644
--- a/drivers/net/ethernet/rdc/r6040.c
+++ b/drivers/net/ethernet/rdc/r6040.c
@@ -1159,12 +1159,12 @@ static int r6040_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	err = register_netdev(dev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to register net device\n");
-		goto err_out_phy_disconnect;
+		goto err_out_phy_disconnect_rtnl;
 	}
 	return 0;
 
-err_out_phy_disconnect:
-	phy_disconnect(dev->phydev);
+err_out_phy_disconnect_rtnl:
+	phy_disconnect_rtnl(dev->phydev);
 err_out_mdio_unregister:
 	mdiobus_unregister(lp->mii_bus);
 err_out_mdio:
@@ -1188,7 +1188,7 @@ static void r6040_remove_one(struct pci_dev *pdev)
 	struct r6040_private *lp = netdev_priv(dev);
 
 	unregister_netdev(dev);
-	phy_disconnect(dev->phydev);
+	phy_disconnect_rtnl(dev->phydev);
 	mdiobus_unregister(lp->mii_bus);
 	mdiobus_free(lp->mii_bus);
 	netif_napi_del(&lp->napi);
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index aba772e14555..eec609802d30 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1478,7 +1478,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
 static void rswitch_phy_device_deinit(struct rswitch_device *rdev)
 {
 	if (rdev->ndev->phydev)
-		phy_disconnect(rdev->ndev->phydev);
+		phy_disconnect_rtnl(rdev->ndev->phydev);
 }
 
 static int rswitch_serdes_set_params(struct rswitch_device *rdev)
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 6b3f7fca8d15..ec18e43f823b 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -930,7 +930,7 @@ static int rtsn_phy_init(struct rtsn_private *priv)
 
 static void rtsn_phy_deinit(struct rtsn_private *priv)
 {
-	phy_disconnect(priv->ndev->phydev);
+	phy_disconnect_rtnl(priv->ndev->phydev);
 	priv->ndev->phydev = NULL;
 }
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 2aa812cbab92..1c771bec83b8 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1958,7 +1958,7 @@ static int prueth_probe(struct platform_device *pdev)
 		if (!prueth->registered_netdevs[i])
 			continue;
 		if (prueth->emac[i]->ndev->phydev) {
-			phy_disconnect(prueth->emac[i]->ndev->phydev);
+			phy_disconnect_rtnl(prueth->emac[i]->ndev->phydev);
 			prueth->emac[i]->ndev->phydev = NULL;
 		}
 		unregister_netdev(prueth->registered_netdevs[i]);
@@ -2017,7 +2017,7 @@ static void prueth_remove(struct platform_device *pdev)
 		if (!prueth->registered_netdevs[i])
 			continue;
 		phy_stop(prueth->emac[i]->ndev->phydev);
-		phy_disconnect(prueth->emac[i]->ndev->phydev);
+		phy_disconnect_rtnl(prueth->emac[i]->ndev->phydev);
 		prueth->emac[i]->ndev->phydev = NULL;
 		unregister_netdev(prueth->registered_netdevs[i]);
 	}
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index ff5f41bf499e..4b066b0fe40a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -1125,7 +1125,7 @@ static int prueth_probe(struct platform_device *pdev)
 			continue;
 
 		if (prueth->emac[i]->ndev->phydev) {
-			phy_disconnect(prueth->emac[i]->ndev->phydev);
+			phy_disconnect_rtnl(prueth->emac[i]->ndev->phydev);
 			prueth->emac[i]->ndev->phydev = NULL;
 		}
 		unregister_netdev(prueth->registered_netdevs[i]);
@@ -1187,7 +1187,7 @@ static void prueth_remove(struct platform_device *pdev)
 		if (!prueth->registered_netdevs[i])
 			continue;
 		phy_stop(prueth->emac[i]->ndev->phydev);
-		phy_disconnect(prueth->emac[i]->ndev->phydev);
+		phy_disconnect_rtnl(prueth->emac[i]->ndev->phydev);
 		prueth->emac[i]->ndev->phydev = NULL;
 		unregister_netdev(prueth->registered_netdevs[i]);
 	}
diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 6e3758dfbdbd..971df7b86795 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -856,7 +856,7 @@ static void tc35815_remove_one(struct pci_dev *pdev)
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct tc35815_local *lp = netdev_priv(dev);
 
-	phy_disconnect(dev->phydev);
+	phy_disconnect_rtnl(dev->phydev);
 	mdiobus_unregister(lp->mii_bus);
 	mdiobus_free(lp->mii_bus);
 	unregister_netdev(dev);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 03f1b9bc604d..f4e87b4117a2 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -297,7 +297,7 @@ static int txgbe_phylink_init(struct txgbe *txgbe)
 	if (wx->phydev) {
 		int ret;
 
-		ret = phylink_connect_phy(phylink, wx->phydev);
+		ret = phylink_connect_phy_rtnl(phylink, wx->phydev);
 		if (ret) {
 			phylink_destroy(phylink);
 			return ret;
diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index e1e7f65553e7..de7b625a4a62 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -1583,7 +1583,7 @@ static int ixp4xx_eth_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy_dis:
-	phy_disconnect(phydev);
+	phy_disconnect_rtnl(phydev);
 err_free_mem:
 	npe_port_tab[NPE_ID(port->id)] = NULL;
 	npe_release(port->npe);
@@ -1597,7 +1597,7 @@ static void ixp4xx_eth_remove(struct platform_device *pdev)
 	struct port *port = netdev_priv(ndev);
 
 	unregister_netdev(ndev);
-	phy_disconnect(phydev);
+	phy_disconnect_rtnl(phydev);
 	ixp4xx_mdio_remove();
 	npe_port_tab[NPE_ID(port->id)] = NULL;
 	npe_release(port->npe);
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 90951681523c..69851f9939ae 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1339,6 +1339,22 @@ void phy_disconnect(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_disconnect);
 
+/**
+ * phy_disconnect_rtnl - disable interrupts, stop state machine, and detach a PHY
+ *		    device
+ * @phydev: target phy_device struct
+ *
+ * This is a wrapper around phy_disconnect that takes the rtnl semaphore.
+ */
+void phy_disconnect_rtnl(struct phy_device *phydev)
+{
+	if (rtnl_lock_killable())
+		return;
+	phy_disconnect(phydev);
+	rtnl_unlock();
+}
+EXPORT_SYMBOL(phy_disconnect_rtnl);
+
 /**
  * phy_poll_reset - Safely wait until a PHY reset has properly completed
  * @phydev: The PHY device to poll
@@ -1767,8 +1783,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	return err;
 
 error:
-	/* phy_detach() does all of the cleanup below */
-	phy_detach(phydev);
+	/* phy_detach_rtnl() does all of the cleanup below */
+	phy_detach_rtnl(phydev);
 	return err;
 
 error_module_put:
@@ -1899,6 +1915,24 @@ void phy_detach(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_detach);
 
+/**
+ * phy_detach_rtnl - detach a PHY device from its network device
+ * @phydev: target phy_device struct
+ *
+ * This detaches the phy device from its network device and the phy
+ * driver, and drops the reference count taken in phy_attach_direct().
+ *
+ * This is a wrapper around phy_detach that takes the rtnl semaphore.
+ */
+void phy_detach_rtnl(struct phy_device *phydev)
+{
+	if (rtnl_lock_killable())
+		return;
+	phy_detach(phydev);
+	rtnl_unlock();
+}
+EXPORT_SYMBOL(phy_detach_rtnl);
+
 int phy_suspend(struct phy_device *phydev)
 {
 	struct net_device *netdev = phydev->attached_dev;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0faa3d97e06b..73e071cee01b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2159,6 +2159,17 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 	return phy_attach_direct(pl->netdev, phy, flags, interface);
 }
 
+static int phylink_preconnect_phy(struct phylink *pl, struct phy_device *phy)
+{
+	/* Use PHY device/driver interface */
+	if (pl->link_interface == PHY_INTERFACE_MODE_NA) {
+		pl->link_interface = phy->interface;
+		pl->link_config.interface = pl->link_interface;
+	}
+
+	return phylink_attach_phy(pl, phy, pl->link_interface);
+}
+
 /**
  * phylink_connect_phy() - connect a PHY to the phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2178,14 +2189,8 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
 {
 	int ret;
 
-	/* Use PHY device/driver interface */
-	if (pl->link_interface == PHY_INTERFACE_MODE_NA) {
-		pl->link_interface = phy->interface;
-		pl->link_config.interface = pl->link_interface;
-	}
-
-	ret = phylink_attach_phy(pl, phy, pl->link_interface);
-	if (ret < 0)
+	ret = phylink_preconnect_phy(pl, phy);
+	if (ret)
 		return ret;
 
 	ret = phylink_bringup_phy(pl, phy, pl->link_config.interface);
@@ -2196,6 +2201,40 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
 }
 EXPORT_SYMBOL_GPL(phylink_connect_phy);
 
+/**
+ * phylink_connect_phy_rtnl() - connect a PHY to the phylink instance
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ * @phy: a pointer to a &struct phy_device.
+ *
+ * Connect @phy to the phylink instance specified by @pl by calling
+ * phy_attach_direct(). Configure the @phy according to the MAC driver's
+ * capabilities, start the PHYLIB state machine and enable any interrupts
+ * that the PHY supports.
+ *
+ * This updates the phylink's ethtool supported and advertising link mode
+ * masks.
+ *
+ * This is a similar to phylink_connect_phy but is called without the hold
+ * of rtnlock. It then use phy_detach_rtnl that takes the rtnl semaphore.
+ *
+ * Returns 0 on success or a negative errno.
+ */
+int phylink_connect_phy_rtnl(struct phylink *pl, struct phy_device *phy)
+{
+	int ret;
+
+	ret = phylink_preconnect_phy(pl, phy);
+	if (ret)
+		return ret;
+
+	ret = phylink_bringup_phy(pl, phy, pl->link_config.interface);
+	if (ret)
+		phy_detach_rtnl(phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phylink_connect_phy_rtnl);
+
 /**
  * phylink_of_phy_connect() - connect the PHY specified in the DT mode.
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2215,20 +2254,10 @@ int phylink_of_phy_connect(struct phylink *pl, struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(phylink_of_phy_connect);
 
-/**
- * phylink_fwnode_phy_connect() - connect the PHY specified in the fwnode.
- * @pl: a pointer to a &struct phylink returned from phylink_create()
- * @fwnode: a pointer to a &struct fwnode_handle.
- * @flags: PHY-specific flags to communicate to the PHY device driver
- *
- * Connect the phy specified @fwnode to the phylink instance specified
- * by @pl.
- *
- * Returns 0 on success or a negative errno.
- */
-int phylink_fwnode_phy_connect(struct phylink *pl,
-			       const struct fwnode_handle *fwnode,
-			       u32 flags)
+static struct phy_device *
+phylink_fwnode_phy_preconnect(struct phylink *pl,
+			      const struct fwnode_handle *fwnode,
+			      u32 flags)
 {
 	struct fwnode_handle *phy_fwnode;
 	struct phy_device *phy_dev;
@@ -2238,20 +2267,20 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
 	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
 	     phy_interface_mode_is_8023z(pl->link_interface)))
-		return 0;
+		return NULL;
 
 	phy_fwnode = fwnode_get_phy_node(fwnode);
 	if (IS_ERR(phy_fwnode)) {
 		if (pl->cfg_link_an_mode == MLO_AN_PHY)
-			return -ENODEV;
-		return 0;
+			return ERR_PTR(-ENODEV);
+		return NULL;
 	}
 
 	phy_dev = fwnode_phy_find_device(phy_fwnode);
 	/* We're done with the phy_node handle */
 	fwnode_handle_put(phy_fwnode);
 	if (!phy_dev)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	/* Use PHY device/driver interface */
 	if (pl->link_interface == PHY_INTERFACE_MODE_NA) {
@@ -2266,7 +2295,38 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 				pl->link_interface);
 	phy_device_free(phy_dev);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
+
+	ret = phylink_bringup_phy(pl, phy_dev, pl->link_config.interface);
+	if (ret) {
+		phy_detach(phy_dev);
+		return ERR_PTR(ret);
+	}
+
+	return phy_dev;
+}
+
+/**
+ * phylink_fwnode_phy_connect() - connect the PHY specified in the fwnode.
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ * @fwnode: a pointer to a &struct fwnode_handle.
+ * @flags: PHY-specific flags to communicate to the PHY device driver
+ *
+ * Connect the phy specified @fwnode to the phylink instance specified
+ * by @pl.
+ *
+ * Returns 0 on success or a negative errno.
+ */
+int phylink_fwnode_phy_connect(struct phylink *pl,
+			       const struct fwnode_handle *fwnode,
+			       u32 flags)
+{
+	struct phy_device *phy_dev;
+	int ret;
+
+	phy_dev = phylink_fwnode_phy_preconnect(pl, fwnode, flags);
+	if (IS_ERR_OR_NULL(phy_dev))
+		return PTR_ERR(phy_dev);
 
 	ret = phylink_bringup_phy(pl, phy_dev, pl->link_config.interface);
 	if (ret)
@@ -2276,6 +2336,40 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_fwnode_phy_connect);
 
+/**
+ * phylink_fwnode_phy_connect() - connect the PHY specified in the fwnode.
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ * @fwnode: a pointer to a &struct fwnode_handle.
+ * @flags: PHY-specific flags to communicate to the PHY device driver
+ *
+ * Connect the phy specified @fwnode to the phylink instance specified
+ * by @pl.
+ *
+ * This is a similar to phylink_fwnode_phy_connect but is called without
+ * the hold of rtnlock. It then use phy_detach_rtnl that takes the rtnl
+ * semaphore.
+ *
+ * Returns 0 on success or a negative errno.
+ */
+int phylink_fwnode_phy_connect_rtnl(struct phylink *pl,
+				    const struct fwnode_handle *fwnode,
+				    u32 flags)
+{
+	struct phy_device *phy_dev;
+	int ret;
+
+	phy_dev = phylink_fwnode_phy_preconnect(pl, fwnode, flags);
+	if (IS_ERR_OR_NULL(phy_dev))
+		return PTR_ERR(phy_dev);
+
+	ret = phylink_bringup_phy(pl, phy_dev, pl->link_config.interface);
+	if (ret)
+		phy_detach_rtnl(phy_dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phylink_fwnode_phy_connect_rtnl);
+
 /**
  * phylink_disconnect_phy() - disconnect any PHY attached to the phylink
  *   instance.
diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 9b0318fb50b5..afb91e0d0224 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -707,7 +707,7 @@ static int ax88772_init_phy(struct usbnet *dev)
 		return -ENODEV;
 	}
 
-	ret = phylink_connect_phy(priv->phylink, priv->phydev);
+	ret = phylink_connect_phy_rtnl(priv->phylink, priv->phydev);
 	if (ret) {
 		netdev_err(dev->net, "Could not connect PHY\n");
 		return ret;
diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
index f613e4bc68c8..7135a0392218 100644
--- a/drivers/net/usb/ax88172a.c
+++ b/drivers/net/usb/ax88172a.c
@@ -248,7 +248,7 @@ static int ax88172a_stop(struct usbnet *dev)
 		netdev_info(dev->net, "Disconnecting from phy %s\n",
 			    priv->phy_name);
 		phy_stop(priv->phydev);
-		phy_disconnect(priv->phydev);
+		phy_disconnect_rtnl(priv->phydev);
 	}
 
 	return 0;
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 8e82184be5e7..aa61e386ecf7 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1263,7 +1263,7 @@ static void smsc95xx_unbind(struct usbnet *dev, struct usb_interface *intf)
 {
 	struct smsc95xx_priv *pdata = dev->driver_priv;
 
-	phy_disconnect(dev->net->phydev);
+	phy_disconnect_rtnl(dev->net->phydev);
 	mdiobus_unregister(pdata->mdiobus);
 	mdiobus_free(pdata->mdiobus);
 	irq_dispose_mapping(irq_find_mapping(pdata->irqdomain, PHY_HWIRQ));
diff --git a/include/linux/phy.h b/include/linux/phy.h
index b037aab7b71d..9542049613b9 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1798,7 +1798,9 @@ struct phy_device *phy_connect(struct net_device *dev, const char *bus_id,
 			       void (*handler)(struct net_device *),
 			       phy_interface_t interface);
 void phy_disconnect(struct phy_device *phydev);
+void phy_disconnect_rtnl(struct phy_device *phydev);
 void phy_detach(struct phy_device *phydev);
+void phy_detach_rtnl(struct phy_device *phydev);
 void phy_start(struct phy_device *phydev);
 void phy_stop(struct phy_device *phydev);
 int phy_config_aneg(struct phy_device *phydev);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 30659b615fca..e762d4f7e7b2 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -699,10 +699,14 @@ void phylink_destroy(struct phylink *);
 bool phylink_expects_phy(struct phylink *pl);
 
 int phylink_connect_phy(struct phylink *, struct phy_device *);
+int phylink_connect_phy_rtnl(struct phylink *pl, struct phy_device *phy);
 int phylink_of_phy_connect(struct phylink *, struct device_node *, u32 flags);
 int phylink_fwnode_phy_connect(struct phylink *pl,
 			       const struct fwnode_handle *fwnode,
 			       u32 flags);
+int phylink_fwnode_phy_connect_rtnl(struct phylink *pl,
+				    const struct fwnode_handle *fwnode,
+				    u32 flags);
 void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index c57692eb8da9..b5ea0fd0f891 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -90,6 +90,7 @@ int rtnl_lock_killable(void)
 {
 	return mutex_lock_killable(&rtnl_mutex);
 }
+EXPORT_SYMBOL_GPL(rtnl_lock_killable);
 
 static struct sk_buff *defer_kfree_skb_list;
 void rtnl_kfree_skbs(struct sk_buff *head, struct sk_buff *tail)
diff --git a/net/dsa/user.c b/net/dsa/user.c
index e9334520c54a..c01c00f9df37 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -2650,7 +2650,7 @@ static int dsa_user_phy_connect(struct net_device *user_dev, int addr,
 
 	user_dev->phydev->dev_flags |= flags;
 
-	return phylink_connect_phy(dp->pl, user_dev->phydev);
+	return phylink_connect_phy_rtnl(dp->pl, user_dev->phydev);
 }
 
 static int dsa_user_phy_setup(struct net_device *user_dev)
-- 
2.43.0


