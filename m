Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFFA18D400
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCTQRl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:17:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60227 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCTQRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:17:41 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLiTI-1ixexn1aBE-00HdGr for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:17:39 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 38B3D64FA81
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rmrGCa8bIF20 for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:17:37 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id B032D64D0AE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:17:37 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:17:37 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 0F67C804FD; Fri, 20 Mar 2020 17:11:42 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:11:42 +0100
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
Subject: [PATCH v3 01/11] media: adv748x: fix end-of-line terminators in
 diagnostic statements
Message-ID: <df22a88b6a2006920bae857c53e45c34b31175d6.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7662
X-Provags-ID: V03:K1:/4CKsdWMIVf01+kIIxn6+jId/dtUserZIOhTS6ji6MKvIUb78Pp
 MqAA3kcxm4ZXAI9LbMNJnRNIDEYTJOm1YHvcORn65yRJCI4kl+mutZr+wA77ukcm8gn4YRy
 DZ6zzI1jLl3ZYAGJv9gCOrHbLnXjDf+TU48WTWiL5h1onb7sJXd0ZXPQpCBOh9UYK65DOw4
 iOFQZtwcBL4P0HDGhNAoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rXpPh27GsYQ=:LUK4lJxGLYbv4kGWRsduzm
 YtrLFF8IGVAgTHZNreEhQLKPtSO/ic7dRZdFkU2ih0qt56FYzGkcUwxH+2MENCIqqJ61z/JfM
 iNyY9pnyAKFJjY+K6KF+9ck8JROHfdZWb3PC+WhzaC/D5z0e0r73jHg/IvyxmoczHh5BI9Tq2
 5uiVtGtAwHBHlamMXTRg99hpH1cCp0PHL5xlobq7ywfarU3+zyFVIsV8K/0EMtiU0cr0ac/oS
 aNR+XFyOaf+ahh5Zi6Yf7IISisC9x0JkvV1MolsLxpU81py+AcOe/Q2OZoDOOjr4feS6Cv/iT
 qAIi2nz9ogamhixy3ErD/0r/WKnksTnfb8vTnnI2TxbM7BrKDVtQg9joeuyvEHU5u422pXozC
 xfWJ3AG2o06+m9jp4puonHJ+Fc/+q3xYtmb7XwNcvZIOtJKRPPwge2hr5nhzSLS9wfydZWyDn
 ZZ+RI2yEEv0/CRHbyIccKE+IJVxnT3t2g+g3DE2gk/xQsgxdTf4L9ELGR3vd0A1OXjgQpCOwR
 z3ODhHjwTd9bB9htlNLK0m29BiCrtCPHANcgQT7MjuJZ9KEoBYB0wEYOCVF1Iv4MvK+CEYNLN
 nQW5nPrqT++jA9FtF6xtE37/rD6RW5jvPwvPV/9CzI3nel5qFnuuVqkV34SXUNiaIGqeVM5c7
 kyuJBLrdzqrvbvCRs253ytmedmKvIc/I2goQESTOEZhJUeSOMaFzTz51sIRiGAWgJyWIhT/nA
 lPJXjl+7K9z4bYK0Y0vaCY+IRZuVfwRXyZXy10IO82ntgWd7NBacrl2lpyejwBEeDhsHWcPH3
 l23aAA6LDLSDdXUG6Y/at8hYlGRxEIBCAtDt/JP+2PgGr9IQdWnpb3UF2Jzpf+lN4O5HyJD
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


