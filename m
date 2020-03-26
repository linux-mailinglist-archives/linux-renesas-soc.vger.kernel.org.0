Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF87193D40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 11:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgCZKts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 06:49:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53377 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgCZKts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 06:49:48 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGQWr-1j1FCh1kVB-00Gncf for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 11:49:46 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 3D93765047A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 10:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7-s9PfSjAtCk for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 11:49:45 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id DB50C64C209
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:49:45 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:49:45 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 4A99B80501; Thu, 26 Mar 2020 11:35:25 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:25 +0100
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
Subject: [PATCH v4 4/9] media: adv748x: add definitions for audio output
 related registers
Message-ID: <c4314afadd7e0882d8e2cbcbe2fe9c6a46775016.1585218857.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:zhCa0nN+JUbF4TKnnRMo6CRKFni9zSuSstNV0CAEjXMQWPnbeyi
 Rk6K9gN5ju14SvgpYdVFCC1aHCfRddsN5rWxPLJSfwXCINVhGK83wmaYAMuVJCjhhyc6tMk
 NJi/TM+4hzGRV3c7y9PhRRSXrhsSjhUihAOkOFhB4YwwtC7lL/H6rzv/ZUz8FqsWl0ovqdC
 bIL9tRAfLKdpuf7r/EJyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bLK/TUmCenE=:BqI8GtTLoVzbMvOwxhFwAR
 Cw3Ni5hZixaFqtqeLY3nOJViqUywRGiO+xjVNp0V2+xURnGMlgwUaDukQS7ajbaDJkGXTsqYP
 N6YY3YNvjW8tD570bUnQBsOvcVU+TOgt9li+br8LjqwQiO6uQWzxf1H5/sco4QKwUmvJwx7ty
 W7Sc3SxMvUbGu/Bay4m9vYbmDSXwkMrbBbddotea3vMbbgzZqRDExbDu1dopS3/wqFhytTk0z
 zscXbXap4yxvGpnj+VEAf6MyMw0d6g/MUaf3JinZENSQ35Fci/qRXxkntir+qYf4jRUA7bZYO
 VujMd8K/EcSV7Xd+LO8gXWZix30hMuIKfVqw8nnFZ92cvkC7TCwZK+U4Q2EZsNsBRStVFTXYr
 DsMxoTCqnsgog7cERpH6+Tfl7089IbOaVgdxKZm3R6b4oAICarm2smMO616hRhnyOg0qETWum
 aFGjhtWRz5+4VJIaSER4iHYuwCtxVKkpsWEob7maAt445bp1GmMYYhTw6Sc94JtFFebmLaX8j
 T9SOHErsCQuKcx+KjSPolHBWQ6ij+1UbdvAP3YI6SLLDe9TGxI91OLkMI7zkm14YllZfgQE7P
 IABFTrzohuZ7UphEuTuwyZLNkPJrIZegHY/JiaMNjyAyNV8KJTkvPcprda7/IZ9PtJTve1kVr
 0UQJvSe3FNaTjJIjK7pFl67g5sMuquPpI5OIt/RPXrpFeM9q4kCtMotbzwW/nMH78o6oWjL5t
 cp1ijDSNJ+Tzz7uCLP2n+GljfuczRF7qad3p3Z7JifGWwyDsfesq1Yoy0NupZU/zR1Bt1Dl5i
 Vqsk2WSgLTf+et8kceoso3KiRJE0kihMLjVUBi4JdkP86LzJ1OvwtESOJh2DRGyjf0cYaRZ
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 0a9d78c2870b..1a1ea70086c6 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -226,6 +226,11 @@ struct adv748x_state {
 
 #define ADV748X_IO_VID_STD		0x05
 
+#define ADV748X_IO_PAD_CONTROLS		0x0e
+#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
+#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
+#define ADV748X_IO_PAD_CONTROLS1	0x1d
+
 #define ADV748X_IO_10			0x10	/* io_reg_10 */
 #define ADV748X_IO_10_CSI4_EN		BIT(7)
 #define ADV748X_IO_10_CSI1_EN		BIT(6)
@@ -248,7 +253,21 @@ struct adv748x_state {
 #define ADV748X_IO_REG_FF		0xff
 #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
 
+/* DPLL Map */
+#define ADV748X_DPLL_MCLK_FS		0xb5
+#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
+
 /* HDMI RX Map */
+#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
+#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
+#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
+#define ADV748X_HDMI_I2SOUTMODE_MASK	\
+	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
+#define ADV748X_I2SOUTMODE_I2S 0
+#define ADV748X_I2SOUTMODE_RIGHT_J 1
+#define ADV748X_I2SOUTMODE_LEFT_J 2
+#define ADV748X_I2SOUTMODE_SPDIF 3
+
 #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
 #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
 #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
@@ -260,6 +279,16 @@ struct adv748x_state {
 #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
 #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
 
+#define ADV748X_HDMI_MUTE_CTRL		0x1a
+#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
+#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
+#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
+
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
+#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
+#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)
+
 #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
 #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
 
@@ -281,6 +310,9 @@ struct adv748x_state {
 #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
 #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
 
+#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
+#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)
+
 /* HDMI RX Repeater Map */
 #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
 #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
-- 
2.25.1.25.g9ecbe7eb18


