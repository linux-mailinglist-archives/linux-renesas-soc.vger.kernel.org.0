Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4926C2C5A85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404141AbgKZR2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:09 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:12618 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404278AbgKZR2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411684;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0FWs0GZ2M1BSPUxty6o3l4qTn1Z12M+5IyxJGEWK6b4=;
        b=SqvTkhBN+f0/KV2XWMgclS4/AEVDFZBX/y/GgSm17KEQUUYUZjuGUKSGYCCBscT7DM
        akQvUC1wszPALr0nYn1vy9xCyB94p2dOfR8EOoSmytEnF3sTiFwWXkBOp411ye6ldHjQ
        LYmXqWLG1sU4YxaNgWoyR5sLT5BKFmOEyvLk9ewXej+yfOwv1MRLdk2SCOrpy8pGieah
        9uLulqywMbfw3M7pj36fXqb916yA3O3MzDySO2QJ5fwkvwybfCigivwY8cBWTTY446Ey
        Gig9EBY+M3U+f5zjA7Ic2G5XCRmhuCANlh0fsNwAk8XhV8altx+0hY9T20ZNoJN0JFpS
        D98A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM0Mpe
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:00 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 01/11] pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
Date:   Thu, 26 Nov 2020 18:21:44 +0100
Message-Id: <20201126172154.25625-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds groups and function for AVB PHY, LINK, MAGIC, MII and
PTP pins for the R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 595 +++++++++++++++++++++++++
 1 file changed, 595 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index d0d0a682b13b..5fcc8e60167e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1199,6 +1199,462 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - AVB0 ------------------------------------------------ */
+static const unsigned int avb0_link_pins[] = {
+	/* AVB0_LINK */
+	RCAR_GP_PIN(4, 17),
+};
+static const unsigned int avb0_link_mux[] = {
+	AVB0_LINK_MARK,
+};
+static const unsigned int avb0_magic_pins[] = {
+	/* AVB0_MAGIC */
+	RCAR_GP_PIN(4, 15),
+};
+static const unsigned int avb0_magic_mux[] = {
+	AVB0_MAGIC_MARK,
+};
+static const unsigned int avb0_phy_int_pins[] = {
+	/* AVB0_PHY_INT */
+	RCAR_GP_PIN(4, 16),
+};
+static const unsigned int avb0_phy_int_mux[] = {
+	AVB0_PHY_INT_MARK,
+};
+static const unsigned int avb0_mdio_pins[] = {
+	/* AVB0_MDC, AVB0_MDIO */
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 13),
+};
+static const unsigned int avb0_mdio_mux[] = {
+	AVB0_MDC_MARK, AVB0_MDIO_MARK,
+};
+static const unsigned int avb0_rgmii_pins[] = {
+	/*
+	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
+	 * AVB0_RX_CTL, AVB0_RXC, AVB0_RD0, AVB0_RD1, AVB0_RD2, AVB0_RD3,
+	 */
+	RCAR_GP_PIN(4, 6), RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 9),
+	RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 11),
+	RCAR_GP_PIN(4, 0), RCAR_GP_PIN(4, 1),
+	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+};
+static const unsigned int avb0_rgmii_mux[] = {
+	AVB0_TX_CTL_MARK, AVB0_TXC_MARK,
+	AVB0_TD0_MARK, AVB0_TD1_MARK, AVB0_TD2_MARK, AVB0_TD3_MARK,
+	AVB0_RX_CTL_MARK, AVB0_RXC_MARK,
+	AVB0_RD0_MARK, AVB0_RD1_MARK, AVB0_RD2_MARK, AVB0_RD3_MARK,
+};
+static const unsigned int avb0_txcrefclk_pins[] = {
+	/* AVB0_TXCREFCLK */
+	RCAR_GP_PIN(4, 12),
+};
+static const unsigned int avb0_txcrefclk_mux[] = {
+	AVB0_TXCREFCLK_MARK,
+};
+static const unsigned int avb0_avtp_pps_pins[] = {
+	/* AVB0_AVTP_PPS */
+	RCAR_GP_PIN(4, 20),
+};
+static const unsigned int avb0_avtp_pps_mux[] = {
+	AVB0_AVTP_PPS_MARK,
+};
+static const unsigned int avb0_avtp_capture_pins[] = {
+	/* AVB0_AVTP_CAPTURE */
+	RCAR_GP_PIN(4, 19),
+};
+static const unsigned int avb0_avtp_capture_mux[] = {
+	AVB0_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb0_avtp_match_pins[] = {
+	/* AVB0_AVTP_MATCH */
+	RCAR_GP_PIN(4, 18),
+};
+static const unsigned int avb0_avtp_match_mux[] = {
+	AVB0_AVTP_MATCH_MARK,
+};
+
+/* - AVB1 ------------------------------------------------ */
+static const unsigned int avb1_link_pins[] = {
+	/* AVB1_LINK */
+	RCAR_GP_PIN(5, 17),
+};
+static const unsigned int avb1_link_mux[] = {
+	AVB1_LINK_MARK,
+};
+static const unsigned int avb1_magic_pins[] = {
+	/* AVB1_MAGIC */
+	RCAR_GP_PIN(5, 15),
+};
+static const unsigned int avb1_magic_mux[] = {
+	AVB1_MAGIC_MARK,
+};
+static const unsigned int avb1_phy_int_pins[] = {
+	/* AVB1_PHY_INT */
+	RCAR_GP_PIN(5, 16),
+};
+static const unsigned int avb1_phy_int_mux[] = {
+	AVB1_PHY_INT_MARK,
+};
+static const unsigned int avb1_mdio_pins[] = {
+	/* AVB1_MDC, AVB1_MDIO */
+	RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 13),
+};
+static const unsigned int avb1_mdio_mux[] = {
+	AVB1_MDC_MARK, AVB1_MDIO_MARK,
+};
+static const unsigned int avb1_rgmii_pins[] = {
+	/*
+	 * AVB1_TX_CTL, AVB1_TXC, AVB1_TD0, AVB1_TD1, AVB1_TD2, AVB1_TD3,
+	 * AVB1_RX_CTL, AVB1_RXC, AVB1_RD0, AVB1_RD1, AVB1_RD2, AVB1_RD3,
+	 */
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
+	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
+	RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 1),
+	RCAR_GP_PIN(5, 2), RCAR_GP_PIN(5, 3),
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
+};
+static const unsigned int avb1_rgmii_mux[] = {
+	AVB1_TX_CTL_MARK, AVB1_TXC_MARK,
+	AVB1_TD0_MARK, AVB1_TD1_MARK, AVB1_TD2_MARK, AVB1_TD3_MARK,
+	AVB1_RX_CTL_MARK, AVB1_RXC_MARK,
+	AVB1_RD0_MARK, AVB1_RD1_MARK, AVB1_RD2_MARK, AVB1_RD3_MARK,
+};
+static const unsigned int avb1_txcrefclk_pins[] = {
+	/* AVB1_TXCREFCLK */
+	RCAR_GP_PIN(5, 12),
+};
+static const unsigned int avb1_txcrefclk_mux[] = {
+	AVB1_TXCREFCLK_MARK,
+};
+static const unsigned int avb1_avtp_pps_pins[] = {
+	/* AVB1_AVTP_PPS */
+	RCAR_GP_PIN(5, 20),
+};
+static const unsigned int avb1_avtp_pps_mux[] = {
+	AVB1_AVTP_PPS_MARK,
+};
+static const unsigned int avb1_avtp_capture_pins[] = {
+	/* AVB1_AVTP_CAPTURE */
+	RCAR_GP_PIN(5, 19),
+};
+static const unsigned int avb1_avtp_capture_mux[] = {
+	AVB1_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb1_avtp_match_pins[] = {
+	/* AVB1_AVTP_MATCH */
+	RCAR_GP_PIN(5, 18),
+};
+static const unsigned int avb1_avtp_match_mux[] = {
+	AVB1_AVTP_MATCH_MARK,
+};
+
+/* - AVB2 ------------------------------------------------ */
+static const unsigned int avb2_link_pins[] = {
+	/* AVB2_LINK */
+	RCAR_GP_PIN(6, 17),
+};
+static const unsigned int avb2_link_mux[] = {
+	AVB2_LINK_MARK,
+};
+static const unsigned int avb2_magic_pins[] = {
+	/* AVB2_MAGIC */
+	RCAR_GP_PIN(6, 15),
+};
+static const unsigned int avb2_magic_mux[] = {
+	AVB2_MAGIC_MARK,
+};
+static const unsigned int avb2_phy_int_pins[] = {
+	/* AVB2_PHY_INT */
+	RCAR_GP_PIN(6, 16),
+};
+static const unsigned int avb2_phy_int_mux[] = {
+	AVB2_PHY_INT_MARK,
+};
+static const unsigned int avb2_mdio_pins[] = {
+	/* AVB2_MDC, AVB2_MDIO */
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 13),
+};
+static const unsigned int avb2_mdio_mux[] = {
+	AVB2_MDC_MARK, AVB2_MDIO_MARK,
+};
+static const unsigned int avb2_rgmii_pins[] = {
+	/*
+	 * AVB2_TX_CTL, AVB2_TXC, AVB2_TD0, AVB2_TD1, AVB2_TD2, AVB2_TD3,
+	 * AVB2_RX_CTL, AVB2_RXC, AVB2_RD0, AVB2_RD1, AVB2_RD2, AVB2_RD3,
+	 */
+	RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+	RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 11),
+	RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 1),
+	RCAR_GP_PIN(6, 2), RCAR_GP_PIN(6, 3),
+	RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 5),
+};
+static const unsigned int avb2_rgmii_mux[] = {
+	AVB2_TX_CTL_MARK, AVB2_TXC_MARK,
+	AVB2_TD0_MARK, AVB2_TD1_MARK, AVB2_TD2_MARK, AVB2_TD3_MARK,
+	AVB2_RX_CTL_MARK, AVB2_RXC_MARK,
+	AVB2_RD0_MARK, AVB2_RD1_MARK, AVB2_RD2_MARK, AVB2_RD3_MARK,
+};
+static const unsigned int avb2_txcrefclk_pins[] = {
+	/* AVB2_TXCREFCLK */
+	RCAR_GP_PIN(6, 12),
+};
+static const unsigned int avb2_txcrefclk_mux[] = {
+	AVB2_TXCREFCLK_MARK,
+};
+static const unsigned int avb2_avtp_pps_pins[] = {
+	/* AVB2_AVTP_PPS */
+	RCAR_GP_PIN(6, 20),
+};
+static const unsigned int avb2_avtp_pps_mux[] = {
+	AVB2_AVTP_PPS_MARK,
+};
+static const unsigned int avb2_avtp_capture_pins[] = {
+	/* AVB2_AVTP_CAPTURE */
+	RCAR_GP_PIN(6, 19),
+};
+static const unsigned int avb2_avtp_capture_mux[] = {
+	AVB2_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb2_avtp_match_pins[] = {
+	/* AVB2_AVTP_MATCH */
+	RCAR_GP_PIN(6, 18),
+};
+static const unsigned int avb2_avtp_match_mux[] = {
+	AVB2_AVTP_MATCH_MARK,
+};
+
+/* - AVB3 ------------------------------------------------ */
+static const unsigned int avb3_link_pins[] = {
+	/* AVB3_LINK */
+	RCAR_GP_PIN(7, 17),
+};
+static const unsigned int avb3_link_mux[] = {
+	AVB3_LINK_MARK,
+};
+static const unsigned int avb3_magic_pins[] = {
+	/* AVB3_MAGIC */
+	RCAR_GP_PIN(7, 15),
+};
+static const unsigned int avb3_magic_mux[] = {
+	AVB3_MAGIC_MARK,
+};
+static const unsigned int avb3_phy_int_pins[] = {
+	/* AVB3_PHY_INT */
+	RCAR_GP_PIN(7, 16),
+};
+static const unsigned int avb3_phy_int_mux[] = {
+	AVB3_PHY_INT_MARK,
+};
+static const unsigned int avb3_mdio_pins[] = {
+	/* AVB3_MDC, AVB3_MDIO */
+	RCAR_GP_PIN(7, 14), RCAR_GP_PIN(7, 13),
+};
+static const unsigned int avb3_mdio_mux[] = {
+	AVB3_MDC_MARK, AVB3_MDIO_MARK,
+};
+static const unsigned int avb3_rgmii_pins[] = {
+	/*
+	 * AVB3_TX_CTL, AVB3_TXC, AVB3_TD0, AVB3_TD1, AVB3_TD2, AVB3_TD3,
+	 * AVB3_RX_CTL, AVB3_RXC, AVB3_RD0, AVB3_RD1, AVB3_RD2, AVB3_RD3,
+	 */
+	RCAR_GP_PIN(7, 6), RCAR_GP_PIN(7, 7),
+	RCAR_GP_PIN(7, 8), RCAR_GP_PIN(7, 9),
+	RCAR_GP_PIN(7, 10), RCAR_GP_PIN(7, 11),
+	RCAR_GP_PIN(7, 0), RCAR_GP_PIN(7, 1),
+	RCAR_GP_PIN(7, 2), RCAR_GP_PIN(7, 3),
+	RCAR_GP_PIN(7, 4), RCAR_GP_PIN(7, 5),
+};
+static const unsigned int avb3_rgmii_mux[] = {
+	AVB3_TX_CTL_MARK, AVB3_TXC_MARK,
+	AVB3_TD0_MARK, AVB3_TD1_MARK, AVB3_TD2_MARK, AVB3_TD3_MARK,
+	AVB3_RX_CTL_MARK, AVB3_RXC_MARK,
+	AVB3_RD0_MARK, AVB3_RD1_MARK, AVB3_RD2_MARK, AVB3_RD3_MARK,
+};
+static const unsigned int avb3_txcrefclk_pins[] = {
+	/* AVB3_TXCREFCLK */
+	RCAR_GP_PIN(7, 12),
+};
+static const unsigned int avb3_txcrefclk_mux[] = {
+	AVB3_TXCREFCLK_MARK,
+};
+static const unsigned int avb3_avtp_pps_pins[] = {
+	/* AVB3_AVTP_PPS */
+	RCAR_GP_PIN(7, 20),
+};
+static const unsigned int avb3_avtp_pps_mux[] = {
+	AVB3_AVTP_PPS_MARK,
+};
+static const unsigned int avb3_avtp_capture_pins[] = {
+	/* AVB3_AVTP_CAPTURE */
+	RCAR_GP_PIN(7, 19),
+};
+static const unsigned int avb3_avtp_capture_mux[] = {
+	AVB3_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb3_avtp_match_pins[] = {
+	/* AVB3_AVTP_MATCH */
+	RCAR_GP_PIN(7, 18),
+};
+static const unsigned int avb3_avtp_match_mux[] = {
+	AVB3_AVTP_MATCH_MARK,
+};
+
+/* - AVB4 ------------------------------------------------ */
+static const unsigned int avb4_link_pins[] = {
+	/* AVB4_LINK */
+	RCAR_GP_PIN(8, 17),
+};
+static const unsigned int avb4_link_mux[] = {
+	AVB4_LINK_MARK,
+};
+static const unsigned int avb4_magic_pins[] = {
+	/* AVB4_MAGIC */
+	RCAR_GP_PIN(8, 15),
+};
+static const unsigned int avb4_magic_mux[] = {
+	AVB4_MAGIC_MARK,
+};
+static const unsigned int avb4_phy_int_pins[] = {
+	/* AVB4_PHY_INT */
+	RCAR_GP_PIN(8, 16),
+};
+static const unsigned int avb4_phy_int_mux[] = {
+	AVB4_PHY_INT_MARK,
+};
+static const unsigned int avb4_mdio_pins[] = {
+	/* AVB4_MDC, AVB4_MDIO */
+	RCAR_GP_PIN(8, 14), RCAR_GP_PIN(8, 13),
+};
+static const unsigned int avb4_mdio_mux[] = {
+	AVB4_MDC_MARK, AVB4_MDIO_MARK,
+};
+static const unsigned int avb4_rgmii_pins[] = {
+	/*
+	 * AVB4_TX_CTL, AVB4_TXC, AVB4_TD0, AVB4_TD1, AVB4_TD2, AVB4_TD3,
+	 * AVB4_RX_CTL, AVB4_RXC, AVB4_RD0, AVB4_RD1, AVB4_RD2, AVB4_RD3,
+	 */
+	RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),
+	RCAR_GP_PIN(8, 8), RCAR_GP_PIN(8, 9),
+	RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 11),
+	RCAR_GP_PIN(8, 0), RCAR_GP_PIN(8, 1),
+	RCAR_GP_PIN(8, 2), RCAR_GP_PIN(8, 3),
+	RCAR_GP_PIN(8, 4), RCAR_GP_PIN(8, 5),
+};
+static const unsigned int avb4_rgmii_mux[] = {
+	AVB4_TX_CTL_MARK, AVB4_TXC_MARK,
+	AVB4_TD0_MARK, AVB4_TD1_MARK, AVB4_TD2_MARK, AVB4_TD3_MARK,
+	AVB4_RX_CTL_MARK, AVB4_RXC_MARK,
+	AVB4_RD0_MARK, AVB4_RD1_MARK, AVB4_RD2_MARK, AVB4_RD3_MARK,
+};
+static const unsigned int avb4_txcrefclk_pins[] = {
+	/* AVB4_TXCREFCLK */
+	RCAR_GP_PIN(8, 12),
+};
+static const unsigned int avb4_txcrefclk_mux[] = {
+	AVB4_TXCREFCLK_MARK,
+};
+static const unsigned int avb4_avtp_pps_pins[] = {
+	/* AVB4_AVTP_PPS */
+	RCAR_GP_PIN(8, 20),
+};
+static const unsigned int avb4_avtp_pps_mux[] = {
+	AVB4_AVTP_PPS_MARK,
+};
+static const unsigned int avb4_avtp_capture_pins[] = {
+	/* AVB4_AVTP_CAPTURE */
+	RCAR_GP_PIN(8, 19),
+};
+static const unsigned int avb4_avtp_capture_mux[] = {
+	AVB4_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb4_avtp_match_pins[] = {
+	/* AVB4_AVTP_MATCH */
+	RCAR_GP_PIN(8, 18),
+};
+static const unsigned int avb4_avtp_match_mux[] = {
+	AVB4_AVTP_MATCH_MARK,
+};
+
+/* - AVB5 ------------------------------------------------ */
+static const unsigned int avb5_link_pins[] = {
+	/* AVB5_LINK */
+	RCAR_GP_PIN(9, 17),
+};
+static const unsigned int avb5_link_mux[] = {
+	AVB5_LINK_MARK,
+};
+static const unsigned int avb5_magic_pins[] = {
+	/* AVB5_MAGIC */
+	RCAR_GP_PIN(9, 15),
+};
+static const unsigned int avb5_magic_mux[] = {
+	AVB5_MAGIC_MARK,
+};
+static const unsigned int avb5_phy_int_pins[] = {
+	/* AVB5_PHY_INT */
+	RCAR_GP_PIN(9, 16),
+};
+static const unsigned int avb5_phy_int_mux[] = {
+	AVB5_PHY_INT_MARK,
+};
+static const unsigned int avb5_mdio_pins[] = {
+	/* AVB5_MDC, AVB5_MDIO */
+	RCAR_GP_PIN(9, 14), RCAR_GP_PIN(9, 13),
+};
+static const unsigned int avb5_mdio_mux[] = {
+	AVB5_MDC_MARK, AVB5_MDIO_MARK,
+};
+static const unsigned int avb5_rgmii_pins[] = {
+	/*
+	 * AVB5_TX_CTL, AVB5_TXC, AVB5_TD0, AVB5_TD1, AVB5_TD2, AVB5_TD3,
+	 * AVB5_RX_CTL, AVB5_RXC, AVB5_RD0, AVB5_RD1, AVB5_RD2, AVB5_RD3,
+	 */
+	RCAR_GP_PIN(9, 6), RCAR_GP_PIN(9, 7),
+	RCAR_GP_PIN(9, 8), RCAR_GP_PIN(9, 9),
+	RCAR_GP_PIN(9, 10), RCAR_GP_PIN(9, 11),
+	RCAR_GP_PIN(9, 0), RCAR_GP_PIN(9, 1),
+	RCAR_GP_PIN(9, 2), RCAR_GP_PIN(9, 3),
+	RCAR_GP_PIN(9, 4), RCAR_GP_PIN(9, 5),
+};
+static const unsigned int avb5_rgmii_mux[] = {
+	AVB5_TX_CTL_MARK, AVB5_TXC_MARK,
+	AVB5_TD0_MARK, AVB5_TD1_MARK, AVB5_TD2_MARK, AVB5_TD3_MARK,
+	AVB5_RX_CTL_MARK, AVB5_RXC_MARK,
+	AVB5_RD0_MARK, AVB5_RD1_MARK, AVB5_RD2_MARK, AVB5_RD3_MARK,
+};
+static const unsigned int avb5_txcrefclk_pins[] = {
+	/* AVB5_TXCREFCLK */
+	RCAR_GP_PIN(9, 12),
+};
+static const unsigned int avb5_txcrefclk_mux[] = {
+	AVB5_TXCREFCLK_MARK,
+};
+static const unsigned int avb5_avtp_pps_pins[] = {
+	/* AVB5_AVTP_PPS */
+	RCAR_GP_PIN(9, 20),
+};
+static const unsigned int avb5_avtp_pps_mux[] = {
+	AVB5_AVTP_PPS_MARK,
+};
+static const unsigned int avb5_avtp_capture_pins[] = {
+	/* AVB5_AVTP_CAPTURE */
+	RCAR_GP_PIN(9, 19),
+};
+static const unsigned int avb5_avtp_capture_mux[] = {
+	AVB5_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb5_avtp_match_pins[] = {
+	/* AVB5_AVTP_MATCH */
+	RCAR_GP_PIN(9, 18),
+};
+static const unsigned int avb5_avtp_match_mux[] = {
+	AVB5_AVTP_MATCH_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 
 static const unsigned int i2c0_pins[] = {
@@ -1365,6 +1821,66 @@ static const unsigned int scif_clk_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb0_link),
+	SH_PFC_PIN_GROUP(avb0_magic),
+	SH_PFC_PIN_GROUP(avb0_phy_int),
+	SH_PFC_PIN_GROUP(avb0_mdio),
+	SH_PFC_PIN_GROUP(avb0_rgmii),
+	SH_PFC_PIN_GROUP(avb0_txcrefclk),
+	SH_PFC_PIN_GROUP(avb0_avtp_pps),
+	SH_PFC_PIN_GROUP(avb0_avtp_capture),
+	SH_PFC_PIN_GROUP(avb0_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb1_link),
+	SH_PFC_PIN_GROUP(avb1_magic),
+	SH_PFC_PIN_GROUP(avb1_phy_int),
+	SH_PFC_PIN_GROUP(avb1_mdio),
+	SH_PFC_PIN_GROUP(avb1_rgmii),
+	SH_PFC_PIN_GROUP(avb1_txcrefclk),
+	SH_PFC_PIN_GROUP(avb1_avtp_pps),
+	SH_PFC_PIN_GROUP(avb1_avtp_capture),
+	SH_PFC_PIN_GROUP(avb1_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb2_link),
+	SH_PFC_PIN_GROUP(avb2_magic),
+	SH_PFC_PIN_GROUP(avb2_phy_int),
+	SH_PFC_PIN_GROUP(avb2_mdio),
+	SH_PFC_PIN_GROUP(avb2_rgmii),
+	SH_PFC_PIN_GROUP(avb2_txcrefclk),
+	SH_PFC_PIN_GROUP(avb2_avtp_pps),
+	SH_PFC_PIN_GROUP(avb2_avtp_capture),
+	SH_PFC_PIN_GROUP(avb2_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb3_link),
+	SH_PFC_PIN_GROUP(avb3_magic),
+	SH_PFC_PIN_GROUP(avb3_phy_int),
+	SH_PFC_PIN_GROUP(avb3_mdio),
+	SH_PFC_PIN_GROUP(avb3_rgmii),
+	SH_PFC_PIN_GROUP(avb3_txcrefclk),
+	SH_PFC_PIN_GROUP(avb3_avtp_pps),
+	SH_PFC_PIN_GROUP(avb3_avtp_capture),
+	SH_PFC_PIN_GROUP(avb3_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb4_link),
+	SH_PFC_PIN_GROUP(avb4_magic),
+	SH_PFC_PIN_GROUP(avb4_phy_int),
+	SH_PFC_PIN_GROUP(avb4_mdio),
+	SH_PFC_PIN_GROUP(avb4_rgmii),
+	SH_PFC_PIN_GROUP(avb4_txcrefclk),
+	SH_PFC_PIN_GROUP(avb4_avtp_pps),
+	SH_PFC_PIN_GROUP(avb4_avtp_capture),
+	SH_PFC_PIN_GROUP(avb4_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb5_link),
+	SH_PFC_PIN_GROUP(avb5_magic),
+	SH_PFC_PIN_GROUP(avb5_phy_int),
+	SH_PFC_PIN_GROUP(avb5_mdio),
+	SH_PFC_PIN_GROUP(avb5_rgmii),
+	SH_PFC_PIN_GROUP(avb5_txcrefclk),
+	SH_PFC_PIN_GROUP(avb5_avtp_pps),
+	SH_PFC_PIN_GROUP(avb5_avtp_capture),
+	SH_PFC_PIN_GROUP(avb5_avtp_match),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -1388,6 +1904,78 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk),
 };
 
+static const char * const avb0_groups[] = {
+	"avb0_link",
+	"avb0_magic",
+	"avb0_phy_int",
+	"avb0_mdio",
+	"avb0_rgmii",
+	"avb0_txcrefclk",
+	"avb0_avtp_pps",
+	"avb0_avtp_capture",
+	"avb0_avtp_match",
+};
+
+static const char * const avb1_groups[] = {
+	"avb1_link",
+	"avb1_magic",
+	"avb1_phy_int",
+	"avb1_mdio",
+	"avb1_rgmii",
+	"avb1_txcrefclk",
+	"avb1_avtp_pps",
+	"avb1_avtp_capture",
+	"avb1_avtp_match",
+};
+
+static const char * const avb2_groups[] = {
+	"avb2_link",
+	"avb2_magic",
+	"avb2_phy_int",
+	"avb2_mdio",
+	"avb2_rgmii",
+	"avb2_txcrefclk",
+	"avb2_avtp_pps",
+	"avb2_avtp_capture",
+	"avb2_avtp_match",
+};
+
+static const char * const avb3_groups[] = {
+	"avb3_link",
+	"avb3_magic",
+	"avb3_phy_int",
+	"avb3_mdio",
+	"avb3_rgmii",
+	"avb3_txcrefclk",
+	"avb3_avtp_pps",
+	"avb3_avtp_capture",
+	"avb3_avtp_match",
+};
+
+static const char * const avb4_groups[] = {
+	"avb4_link",
+	"avb4_magic",
+	"avb4_phy_int",
+	"avb4_mdio",
+	"avb4_rgmii",
+	"avb4_txcrefclk",
+	"avb4_avtp_pps",
+	"avb4_avtp_capture",
+	"avb4_avtp_match",
+};
+
+static const char * const avb5_groups[] = {
+	"avb5_link",
+	"avb5_magic",
+	"avb5_phy_int",
+	"avb5_mdio",
+	"avb5_rgmii",
+	"avb5_txcrefclk",
+	"avb5_avtp_pps",
+	"avb5_avtp_capture",
+	"avb5_avtp_match",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -1445,6 +2033,13 @@ static const char * const scif_clk_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb0),
+	SH_PFC_FUNCTION(avb1),
+	SH_PFC_FUNCTION(avb2),
+	SH_PFC_FUNCTION(avb3),
+	SH_PFC_FUNCTION(avb4),
+	SH_PFC_FUNCTION(avb5),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

