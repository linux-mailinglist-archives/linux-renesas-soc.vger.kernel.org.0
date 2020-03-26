Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED1F193D1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 11:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgCZKkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 06:40:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:51695 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgCZKkw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 06:40:52 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKbc2-1iwaly3w20-00Kud7 for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 11:40:50 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id BB87564FF16
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 10:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GLkfRKDdRAHB for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 11:40:50 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 5C56164FB26
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:40:50 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:40:50 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 182C1804FD; Thu, 26 Mar 2020 11:34:57 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:34:57 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 1/9] media: adv748x: fix end-of-line terminators in
 diagnostic statements
Message-ID: <df22a88b6a2006920bae857c53e45c34b31175d6.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:Ps6i356mxVoV+d6s6+yUR2exlZMpoFpO1kRdT9y8K4O43OUmwB9
 3VppWAAF6kNv3F/W7yPqJb1hQ6Qox3hrWKnZ2BFGEOO64y7lPZuH2/9OUFkP+4LfiFPPsBX
 TXWPMQdv0iUR/UMz1pcclJDy3mPcovjf5dMbUxaUwaLLUoQDZ2Rvn9/RL3bameK0RUxTpgN
 saSeucHn56j0ben6F2vhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FUVO1VvYd8o=:i5bEKkZw97ltteN5QFaWXN
 XH3Pe7Pc6eXVkJJfvt2yqf4Xeezy6QaKJYiWq/m209me7wF4KjgfENovSFFwd5pnHKVRk48uw
 wkt2hy6n8JuLXCrsHq+uUM5XGDkQs1prsbAqX7fbgdDfaa+jlFvHlVxAZewotRsWGyyTz0hrV
 r3xEfSrT6wegfHL3nzn6u4XsxA8vZsc1MZdX8A4NMhvfbSfC6VPWggZ+K+8LLgQfEqlZvbaVx
 55MZCVQiW7E06TJwwIuCoMHFa2T7doL2HOp1VSwpnS7pJLauaxj0c4RrtJLYbJ2krvqABqeSu
 6Gjuz0jfUdULKiuKLwhRo4PwltTyjeVm47E2Pbzee+OaymSICzKJ6HgvjK50SSUMRGhE9ecNe
 1IJxHBUsb2B7DQ66G3Da7HjMJaLzdGL7e9xhLONoSFs0BRMemyJ3ir2V1CT8Gadf83r5/GqnC
 foB4q8qfzzpcCPYueFEHzfOk/ELY6RPKrA8+USW+IEXEGH0nYHDdvoznjPA9k5/7rIKnAqLm2
 sRkSy5aOSPjbnUw3t4VtD8SRbv4DRr2RMb+ip3WqRhVVuiWpjFeANjliNHiV5viy+s5op4+W9
 OoO+76u7gRVsYFDR+cUbASYAaC7r6NOJD+d6mfj8cjQIqOTN6s1T2XnikmQyIHm4ilZlvGfgC
 uRxsmTl7MlWs3KXrGRGgy4mK/UvdqP4u59RMcCQhBncGTr10/TptsHJNRpuM+0PiVKeaZqixh
 qofrMtZ9CbTE7vPTpp0wYp5/SS6bG+k8t+aJV6iLKPdTcXZnidzqQyxvGtTFA+bUZlzk+FlNY
 radHxisvO8UlI4kI0zhl0XRlzqZmCrgdmNZgIsq7XXDdaB8VNXsvokdm7UKIoAn3SGdog1P
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 24 ++++++++++++------------
 drivers/media/i2c/adv748x/adv748x-csi2.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 23e02ff27b17..c3fb113cef62 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -623,11 +623,11 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
 		of_graph_parse_endpoint(ep_np, &ep);
-		adv_info(state, "Endpoint %pOF on port %d", ep.local_node,
+		adv_info(state, "Endpoint %pOF on port %d\n", ep.local_node,
 			 ep.port);
 
 		if (ep.port >= ADV748X_PORT_MAX) {
-			adv_err(state, "Invalid endpoint %pOF on port %d",
+			adv_err(state, "Invalid endpoint %pOF on port %d\n",
 				ep.local_node, ep.port);
 
 			continue;
@@ -635,7 +635,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 		if (state->endpoints[ep.port]) {
 			adv_err(state,
-				"Multiple port endpoints are not supported");
+				"Multiple port endpoints are not supported\n");
 			continue;
 		}
 
@@ -702,62 +702,62 @@ static int adv748x_probe(struct i2c_client *client)
 	/* Discover and process ports declared by the Device tree endpoints */
 	ret = adv748x_parse_dt(state);
 	if (ret) {
-		adv_err(state, "Failed to parse device tree");
+		adv_err(state, "Failed to parse device tree\n");
 		goto err_free_mutex;
 	}
 
 	/* Configure IO Regmap region */
 	ret = adv748x_configure_regmap(state, ADV748X_PAGE_IO);
 	if (ret) {
-		adv_err(state, "Error configuring IO regmap region");
+		adv_err(state, "Error configuring IO regmap region\n");
 		goto err_cleanup_dt;
 	}
 
 	ret = adv748x_identify_chip(state);
 	if (ret) {
-		adv_err(state, "Failed to identify chip");
+		adv_err(state, "Failed to identify chip\n");
 		goto err_cleanup_dt;
 	}
 
 	/* Configure remaining pages as I2C clients with regmap access */
 	ret = adv748x_initialise_clients(state);
 	if (ret) {
-		adv_err(state, "Failed to setup client regmap pages");
+		adv_err(state, "Failed to setup client regmap pages\n");
 		goto err_cleanup_clients;
 	}
 
 	/* SW reset ADV748X to its default values */
 	ret = adv748x_reset(state);
 	if (ret) {
-		adv_err(state, "Failed to reset hardware");
+		adv_err(state, "Failed to reset hardware\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise HDMI */
 	ret = adv748x_hdmi_init(&state->hdmi);
 	if (ret) {
-		adv_err(state, "Failed to probe HDMI");
+		adv_err(state, "Failed to probe HDMI\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise AFE */
 	ret = adv748x_afe_init(&state->afe);
 	if (ret) {
-		adv_err(state, "Failed to probe AFE");
+		adv_err(state, "Failed to probe AFE\n");
 		goto err_cleanup_hdmi;
 	}
 
 	/* Initialise TXA */
 	ret = adv748x_csi2_init(state, &state->txa);
 	if (ret) {
-		adv_err(state, "Failed to probe TXA");
+		adv_err(state, "Failed to probe TXA\n");
 		goto err_cleanup_afe;
 	}
 
 	/* Initialise TXB */
 	ret = adv748x_csi2_init(state, &state->txb);
 	if (ret) {
-		adv_err(state, "Failed to probe TXB");
+		adv_err(state, "Failed to probe TXB\n");
 		goto err_cleanup_txa;
 	}
 
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..c43ce5d78723 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -72,7 +72,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
 	struct adv748x_state *state = tx->state;
 	int ret;
 
-	adv_dbg(state, "Registered %s (%s)", is_txa(tx) ? "TXA":"TXB",
+	adv_dbg(state, "Registered %s (%s)\n", is_txa(tx) ? "TXA":"TXB",
 			sd->name);
 
 	/*
-- 
2.25.1.25.g9ecbe7eb18


