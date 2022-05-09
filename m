Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC0E51FDF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 15:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235546AbiEINYY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 09:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbiEINYW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 09:24:22 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7372B1651;
        Mon,  9 May 2022 06:20:27 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F0CB8240007;
        Mon,  9 May 2022 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652102426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RrjjbfswMcRGhPL51giZHhSaKlAAFTHbR8pSOyaaywI=;
        b=WPV9QV+6aBDtHfEpOoLvJ45aFDZKLB4fntsUTF5ftqnP0mcN1QMuUg8oPGBlVJZihOAP3S
        jjketnPyc4oDzbkKaW9mPeNJMj8cTuwlEKeva3QdLIv6qEa2wnkbFPP8Fn6vM6JzDcdcYP
        ZJH9MdUje144PRFiXvN+RN7Ghy6XDrJKtDKHW0TZI4zpNlqvucwjkC+n6VY6BYpacT9xw7
        jat1lqXyDRyW9MBWgS73n+xVC4Pc/I7n7sK/yKWYXAA435QQBj4Q0hU5d+bvJv5jcLjjCV
        aMtqGwPDRc0ns9/m6R0bdnA94XVUmth+yRbWT+oYDevYPoX78PEvGA1DSbb/pw==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v4 01/12] net: dsa: add support for ethtool get_rmon_stats()
Date:   Mon,  9 May 2022 15:18:49 +0200
Message-Id: <20220509131900.7840-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509131900.7840-1-clement.leger@bootlin.com>
References: <20220509131900.7840-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support to allow dsa drivers to specify the .get_rmon_stats()
operation.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 include/net/dsa.h |  3 +++
 net/dsa/slave.c   | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 934958fda962..d9da32aacbf1 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -873,6 +873,9 @@ struct dsa_switch_ops {
 				     struct ethtool_eth_mac_stats *mac_stats);
 	void	(*get_eth_ctrl_stats)(struct dsa_switch *ds, int port,
 				      struct ethtool_eth_ctrl_stats *ctrl_stats);
+	void	(*get_rmon_stats)(struct dsa_switch *ds, int port,
+				  struct ethtool_rmon_stats *rmon_stats,
+				  const struct ethtool_rmon_hist_range **ranges);
 	void	(*get_stats64)(struct dsa_switch *ds, int port,
 				   struct rtnl_link_stats64 *s);
 	void	(*self_test)(struct dsa_switch *ds, int port,
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 5ee0aced9410..27c8d28fd9d8 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1026,6 +1026,18 @@ dsa_slave_get_eth_ctrl_stats(struct net_device *dev,
 		ds->ops->get_eth_ctrl_stats(ds, dp->index, ctrl_stats);
 }
 
+static void
+dsa_slave_get_rmon_stats(struct net_device *dev,
+			 struct ethtool_rmon_stats *rmon_stats,
+			 const struct ethtool_rmon_hist_range **ranges)
+{
+	struct dsa_port *dp = dsa_slave_to_port(dev);
+	struct dsa_switch *ds = dp->ds;
+
+	if (ds->ops->get_rmon_stats)
+		ds->ops->get_rmon_stats(ds, dp->index, rmon_stats, ranges);
+}
+
 static void dsa_slave_net_selftest(struct net_device *ndev,
 				   struct ethtool_test *etest, u64 *buf)
 {
@@ -2105,6 +2117,7 @@ static const struct ethtool_ops dsa_slave_ethtool_ops = {
 	.get_eth_phy_stats	= dsa_slave_get_eth_phy_stats,
 	.get_eth_mac_stats	= dsa_slave_get_eth_mac_stats,
 	.get_eth_ctrl_stats	= dsa_slave_get_eth_ctrl_stats,
+	.get_rmon_stats		= dsa_slave_get_rmon_stats,
 	.set_wol		= dsa_slave_set_wol,
 	.get_wol		= dsa_slave_get_wol,
 	.set_eee		= dsa_slave_set_eee,
-- 
2.36.0

