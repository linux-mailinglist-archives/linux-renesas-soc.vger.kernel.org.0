Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D164D18D4D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgCTQsO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:48:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58177 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:48:13 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M4alK-1jEmqo0vwM-001kHw for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:48:12 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 117196502D9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id n1GrpHSjNM70 for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:48:11 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7A62B64DA94
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:48:11 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:48:11 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 95A9480507; Fri, 20 Mar 2020 17:12:05 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:05 +0100
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
Subject: [PATCH v3 10/11] media: adv748x: add support for log_status ioctl
Message-ID: <e52d19788355e15a1502bc90ccb1e9a077f239ef.1584720678.git.alexander.riesen@cetitec.com>
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
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:UChRg37hz+gqv8mOMBYRXT3PTaS+djSVcbKVj65gIkNSIUWYB6J
 KBQa6KlINX9YcxLz9Pn7q5xjtxUmTj5mkMYDK2Vzpn5tAKumCxqul4Y+Hdhs3KE0Jwb4Hi+
 4g971E8CZUDh6z6YUXrNXNp71T8+ympUlFUCkJjYN6319z6+YgtvnJorm2dUH1r9NpSN4fD
 U0q2pdB90ZrZGVFpFHkVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cB4r0gxhXuw=:UpPsfV9ZDlLFaqYxauz52g
 ZeA+DeezqYDifm96ePWegOeHGDZmtlsk2JXAbkEd/f5+j3TH90pOEHLysp38QItFdAnOu8agM
 3Ac5qTwGk5XykWJWhpILMlANUsrPw59gN0DxUsztxQhO2Z5meLppPwmXx8LVOyUseeEFPpf/Y
 RKws+YPnqmsxezY6cDr3U1hXvJnFgiwEG1ZfGWa9VROS4LNc0t2VMR2g205fTZb1aBYCLV257
 Mj2sOj4kF3+iQzZtYtlNVh218Fnv5SJG/scsOSq7sXqOtHh7d+M8uHIV8tEX3WxL/d/o9UZXy
 q7dFYV6vgV7dd5ngRIdg1Maaocg0ZtITxYcA2XkQAR8WFq2kVG1Edrlhro8hOuyXo1dSCL/eo
 CXqRoFrxamEp4FNbHqDgccOridk4Wc8uP3DqzAucabke1q+LDGdUMxW2yUOjIgBHW0wIagIKb
 BHqtFTkOshf0ou0fH5RAVo2f0BrdOhwhhrRK8sad0TB4kj8lJBvgwncdIZw7vuQDN9U8dBm4x
 1fRL7D5M2cjVzX6xwcTzrGyuePZoDM77PkykoPPnqJpBIkw9xJeaTMDlVyaZRzNoBQ6asrgSP
 I7jLWkieqQ+SRU3o7V5AA7B6bdWRFrjzKXqQsq1ud1ajmYUt9JePVXfZ6RofGUqykIddAxQJK
 0zzenJRwGUaYUEXu1ya89O2aUrRfr8jKpgJ4SucU1vwBez4r1PWT7XH0U5o0PE9nKOut4dGCi
 V3wjQbiO760RlELrsFIqEUmeqrsITvAIGouZUQPEqFMTk7OE7k3ni9H+7sJ+esSF2JAs7y3Hg
 /5ciwoV08woLHRhF1Z311UWy0zlF7+lfwU+UdiBnTO/v95PGMVK6j6EP+qxvEFSUf45ur0x
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The logged information provides insights about cable connection and the
state of the HDMI decoder. It is very useful when debugging hardware
problems in environments without easy access to the connectors.

This change adds a device-specific wrapper for register block read,
because some of the devices I2C-accessible registers (for instance,
cs_data for stereo channel information or tmds_params for TMDS channel
information) located in adjacent cells. According to manufacturers
information, these registers can be read using block transactions.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c |  15 ++
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 179 +++++++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h      |   2 +
 3 files changed, 196 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3513ca138e53..775450ab2bad 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -95,6 +95,21 @@ static const struct adv748x_register_map adv748x_default_addresses[] = {
 	[ADV748X_PAGE_TXA] = { "txa", 0x4a },
 };
 
+int adv748x_read_block(struct adv748x_state *state, u8 client_page, u8 reg,
+		       void *val, size_t reg_count)
+{
+	struct i2c_client *client = state->i2c_clients[client_page];
+	int err;
+
+	err = regmap_bulk_read(state->regmap[client_page], reg, val, reg_count);
+	if (err) {
+		adv_err(state, "error reading %02x, %02x-%02lx: %d\n",
+				client->addr, reg, reg + reg_count - 1, err);
+		return err;
+	}
+	return 0;
+}
+
 static int adv748x_read_check(struct adv748x_state *state,
 			      int client_page, u8 reg)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index f598acec3b5c..664930e55baf 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -7,6 +7,7 @@
 
 #include "adv748x.h"
 
+#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -601,11 +602,189 @@ static const struct v4l2_subdev_pad_ops adv748x_pad_ops_hdmi = {
 	.enum_dv_timings = adv748x_hdmi_enum_dv_timings,
 };
 
+struct tmds_params {
+	u32 cts, n;
+	u16 tmdsfreq, tmdsfreq_frac;
+};
+
+static inline const char *cs_data_smpl_freq_str(u8 cs_data_3)
+{
+	switch (cs_data_3 & 0xf) {
+	case 0:
+		return "44.1";
+	case 2:
+		return "48";
+	case 3:
+		return "32";
+	case 8:
+		return "88.2";
+	case 10:
+		return "96";
+	case 12:
+		return "176";
+	case 14:
+		return "192";
+	}
+	return "reserved";
+}
+
+static inline const char *cs_data_clk_lvl_str(u8 cs_data_3)
+{
+	switch (cs_data_3 & 0x30) {
+	case 0:
+		return "Level II";
+	case 1:
+		return "Level I";
+	case 2:
+		return "Level III, variable pitch shifted";
+	}
+	return "reserved";
+}
+
+static inline const char *i2s_out_mode_str(u8 i2s_mode)
+{
+	switch (i2s_mode & ADV748X_HDMI_I2SOUTMODE_MASK) {
+	case 0 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "I2S";
+	case 1 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "right";
+	case 2 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "left";
+	case 3 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "spdif";
+	}
+	return "";
+}
+
+static int adv748x_hdmi_log_status(struct v4l2_subdev *sd)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+	u8 rv, i2s_tdm_mode_enable;
+	u8 cts_n[5];
+	u8 cs_data[0x3a - 0x36 + 1];
+	u8 tmdsfreq[2]; /* both tmdsfreq and tmdsfreq_frac */
+	struct tmds_params tmds_params;
+
+	/* Audio control and configuration */
+	rv = io_read(state, 0x71);
+	pr_info("cable_det_a_raw         %s\n",
+		rv & BIT(6) ? "detected" : "no cable");
+	pr_info("tmds_clk_a_raw          %s\n",
+		rv & BIT(3) ? "detected" : "no TMDS clock");
+	pr_info("tmdspll_lck_a_raw       %s\n",
+		rv & BIT(7) ? "locked to incoming clock" : "not locked");
+	pr_info("hdmi_encrpt_a_raw       %s\n",
+		rv & BIT(5) ? "current frame encrypted" : "not encrypted");
+	rv = hdmi_read(state, 0x04);
+	pr_info("audio_pll_locked        0x%02lx\n", rv & BIT(0));
+	pr_info("tmds_pll_locked         0x%02lx\n", rv & BIT(1));
+	rv = io_read(state, 0x6c);
+	pr_info("gamut_mdata_raw         %s\n",
+		rv & BIT(0) ? "received" : "-");
+	pr_info("audio_c_pckt_raw        %s\n",
+		rv & BIT(1) ? "ACR received" : "-");
+	pr_info("gen_ctl_pckt_raw        %s\n",
+		rv & BIT(2) ? "received" : "-");
+	pr_info("hdmi_mode_raw           %s\n",
+		rv & BIT(3) ? "HDMI/MHL" : "-");
+	pr_info("audio_ch_md_raw         %s\n",
+		rv & BIT(4) ? "multichannel" : "-");
+	pr_info("av_mute_raw             %s\n",
+		rv & BIT(5) ? "received" : "-");
+	pr_info("internal_mute_raw       %s\n",
+		rv & BIT(6) ? "asserted" : "-");
+	pr_info("cs_data_valid_raw       %s\n",
+		rv & BIT(7) ? "valid" : "-");
+	rv = hdmi_read(state, 0x6d);
+	pr_info("i2s_tdm_mode_enable     %s\n",
+		rv & BIT(7) ? "TDM (multichannel)" : "I2S (stereo)");
+	i2s_tdm_mode_enable = rv & BIT(7);
+
+	/* i2s_tdm_mode_enable must be unset */
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x36,
+			       cs_data, ARRAY_SIZE(cs_data)) == 0) {
+		pr_info("... cs_data %s\n",
+			cs_data[0] & BIT(0) ? "pro" : "consumer");
+		pr_info("... cs_data %s\n",
+			cs_data[0] & BIT(1) ? "other" : "L-PCM");
+		pr_info("... cs_data %s copyright\n",
+			cs_data[0] & BIT(2) ? "no" : "asserted");
+		pr_info("... cs_data %s (%lu)\n",
+			cs_data[0] & GENMASK(5, 3) ?
+			"50/15" : "no pre-emphasis",
+			(cs_data[0] & GENMASK(5, 3)) >> 4);
+		pr_info("... cs_data channels status mode %lu\n",
+			(cs_data[0] & GENMASK(7, 6)) >> 7);
+		pr_info("... cs_data category code 0x%02x\n", cs_data[1]);
+		pr_info("... cs_data source number %u\n", cs_data[2] & 0xf);
+		pr_info("... cs_data channel number %u\n",
+			(cs_data[2] & 0xf0) >> 4);
+		pr_info("... cs_data sampling frequency %s (%u)\n",
+			cs_data_smpl_freq_str(cs_data[3]), cs_data[3] & 0xf);
+		pr_info("... cs_data clock accuracy %s\n",
+			cs_data_clk_lvl_str(cs_data[3]));
+	}
+	rv = hdmi_read(state, ADV748X_HDMI_I2S);
+	pr_info("i2soutmode              %s\n", i2s_out_mode_str(rv));
+	pr_info("i2sbitwidth             %u\n", rv & 0x1fu);
+	rv = hdmi_read(state, 0x05);
+	pr_info("hdmi_mode               %s\n", rv & BIT(7) ? "HDMI" : "DVI");
+	rv = hdmi_read(state, 0x07);
+	pr_info("audio_channel_mode      %s\n",
+		rv & BIT(6) ? "multichannel" : "stereo or compressed");
+	rv = hdmi_read(state, 0x0f);
+	/* The bits 6 and 7 must be 1 if TDM mode */
+	pr_info("man_audio_dl_bypass     0x%02lx\n", rv & BIT(7));
+	pr_info("audio_delay_line_bypass 0x%02lx\n", rv & BIT(6));
+	rv = hdmi_read(state, 0x6e);
+	pr_info("mux_spdif_to_i2s_enable %s\n", rv & BIT(3) ? "SPDIF" : "I2S");
+	rv = dpll_read(state, ADV748X_DPLL_MCLK_FS);
+	pr_info("mclk_fs_n               %lu\n",
+		((rv & ADV748X_DPLL_MCLK_FS_N_MASK) + 1) * 128);
+
+	/* i2s_tdm_mode_enable must be set */
+	memset(&tmds_params, 0, sizeof(tmds_params));
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x5b, cts_n, 5) == 0) {
+		tmds_params.cts  = cts_n[0] << 12;
+		tmds_params.cts |= cts_n[1] << 4;
+		tmds_params.cts |= cts_n[2] >> 4;
+		tmds_params.n  = (cts_n[2] & 0xf) << 16;
+		tmds_params.n |= cts_n[3] << 8;
+		tmds_params.n |= cts_n[4];
+		pr_info("... TDM: ACR cts  %u\n", tmds_params.cts);
+		pr_info("... TDM: ACR n    %u\n", tmds_params.n);
+	}
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x51,
+			       tmdsfreq, 2) == 0) {
+		tmds_params.tmdsfreq  = tmdsfreq[0] << 1;
+		tmds_params.tmdsfreq |= tmdsfreq[1] >> 7;
+		tmds_params.tmdsfreq_frac = tmdsfreq[1] & 0x7f;
+		pr_info("... TDM: tmdsfreq       %d MHz\n",
+			tmds_params.tmdsfreq);
+		pr_info("... TDM: tmdsfreq_frac  %d 1/128\n",
+			tmds_params.tmdsfreq_frac);
+	}
+	if (i2s_tdm_mode_enable)
+		pr_info("... TDM: sampling frequency %u Hz\n",
+			tmds_params.cts ?
+			(tmds_params.tmdsfreq * tmds_params.n +
+			 tmds_params.tmdsfreq_frac * tmds_params.n / 128) *
+			1000 / (128 * tmds_params.cts / 1000) :
+			UINT_MAX);
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.log_status = adv748x_hdmi_log_status,
+};
+
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_ops
  */
 
 static const struct v4l2_subdev_ops adv748x_ops_hdmi = {
+	.core = &adv748x_core_ops_hdmi,
 	.video = &adv748x_video_ops_hdmi,
 	.pad = &adv748x_pad_ops_hdmi,
 };
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index b0735de0ced5..6421a4c02c60 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -433,6 +433,8 @@ struct adv748x_state {
 /* Register handling */
 
 int adv748x_read(struct adv748x_state *state, u8 addr, u8 reg);
+int adv748x_read_block(struct adv748x_state *state, u8 page, u8 reg,
+		       void *val, size_t reg_count);
 int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
-- 
2.25.1.25.g9ecbe7eb18


