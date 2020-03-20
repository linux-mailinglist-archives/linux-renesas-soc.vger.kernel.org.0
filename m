Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC75D18D48D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCTQer (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:34:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:57203 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgCTQeq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:34:46 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4s8v-1jF41S2Kmd-0022xg for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:34:45 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 5763965007A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0QtgkiQv337l for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:34:45 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0B0F764FE34
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:34:45 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:34:44 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CE8680503; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:02 +0100
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
Subject: [PATCH v3 06/11] media: adv748x: prepare/enable mclk when the audio
 is used
Message-ID: <7ed1287d00da70de13627480b1601bfd2c6e570a.1584720678.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:q1vF9/q/OhceLKup7n1/dqakfeSaj8vWzKCXEznQXwjimB2hNn/
 CLjmptmVzVKA3MFGxXj5P5OFQ5dQdampoPO+tf1qq2cby8pzGW7ZuO7RwBo/iFQYq9Jdvun
 Ph56xsuPG1M4SPdqjLnt/w0dPFCFdp5ED8teES+JyjKy8W3w9SpIa7WbAka626DYnV2s8l/
 SO9ejEXGHrp/MK8QogPpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kt5C0M25eB4=:jmTjLNyGCUFHTmVhzRuV/H
 afuPS861HAFjJCKK7AMiu/eJiySTb20YBj0z+uoOtA9T/RoanKnxfTkI5VCvZoU6ty6TH4tYI
 HyB+IgWTuD+DWEJe+71n1JamHByR3pWGExeSyt6n/m9+h0221BAq/6J37hNY7/Jd7PmQytSwF
 NU/UwL2dfiU6TGnszRzwvlrG3wYbVQ0saGEcCUUfT35RFeg+y9rdVLjdrnZ1x+tMdb2WmXmt9
 +RKFuQsLqp3TLdJ7PLa08iLl67SU8yRss636qybCH+DJ8uW+ja3seDfl2L+iqAQiIqeDXPGL+
 FX92HMoIImykXDZtw1qyNJJ/vgL9cB3E9ARB2JPxOC/JXLgw2iGzsQ0kiNQNkmaJrbCmG1LTJ
 QU5gRKNkqX0AyBy9HE4Vj1UgR8u/4GmLRJhO8xW//xIQBps5iZTj2ML28+phlamDdZLs+f2mU
 e8Z3zXlyGl2MjYIhRkMqIEJIuq44QYFhfLR1YegeozKG5Xv0do7Jqtc76lDn7NN0ywtJ1gero
 UxwEiVMa0jqOg5N3fy/2TjuBKVHvIAXojZcLiuL6nCLcghLqyunwecjNY3OZqL8Lx2GH3fNtU
 l/4apXKH0gKpxOaxcYmOyCuAn/Y6FUWMjzs0BPN9Tu7P8vH1linz/y/xf9q4zm3tix6C0hgzb
 OMbH7A/1+kNaEVnH/s1a1PAsl+LO80qJXJVVxw3/U4G7sLP39N7sfPg0PwuTa+2BxTgnTatqX
 FHmUwQ76WfXY70dYjfXhZ0dgTeYeqs8jcZHCWx70+7+C8Mo1qo81yoL99E6vBqX/WqvSy41rU
 /wM1eq8WdDOVV0wW+Suu0waKU36110h8w2MyrEy5Hn4gNWHEH59M0kMgpWY7Cra2y52zzhe
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As there is nothing else (the consumers are supposed to do that) which
enables the clock, do it in the driver.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
--

v3: added
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index 6fce7d000423..1c673efd4745 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -117,11 +117,22 @@ static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
 {
+	int ret;
 	struct adv748x_state *state = state_of(dai);
 
 	if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
 		return -EINVAL;
-	return set_audio_pads_state(state, 1);
+	ret = set_audio_pads_state(state, 1);
+	if (ret)
+		goto fail;
+	ret = clk_prepare_enable(state->dai.mclk);
+	if (ret)
+		goto fail_pwdn;
+	return 0;
+fail_pwdn:
+	set_audio_pads_state(state, 0);
+fail:
+	return ret;
 }
 
 static int adv748x_dai_hw_params(struct snd_pcm_substream *sub,
@@ -174,6 +185,7 @@ static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_d
 {
 	struct adv748x_state *state = state_of(dai);
 
+	clk_disable_unprepare(state->dai.mclk);
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


