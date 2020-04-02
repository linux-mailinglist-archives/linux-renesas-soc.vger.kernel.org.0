Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053EB19C941
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 20:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389760AbgDBS5C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 14:57:02 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47619 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388658AbgDBS5C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 14:57:02 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MiJhW-1inkba3Nx8-00fNwI for <linux-renesas-soc@vger.kernel.org>; Thu, 02
 Apr 2020 20:57:00 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 9160565073A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 18:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xJbFNJGyRqpT for <linux-renesas-soc@vger.kernel.org>;
        Thu,  2 Apr 2020 20:57:00 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4A70964CC0A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 20:57:00 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:57:00 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E692280503; Thu,  2 Apr 2020 20:34:48 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:48 +0200
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
Subject: [PATCH v5 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:4PU0m/o31r4CCYgmjy9OqrYagieW5Zki74WFejvSjJHyVfACXNo
 LWx0EFLX7axqCgXm6XMulr6g+iKQB2jfOssnsHR3E7us0qJSpIcWCkOfiruN9xgm5u5o+Bi
 B2eKNuVWJrmxmPdyvicPloElUFqGpUXNURX/E8ZJ91s35qHla2r7ff8WgjBEQf05VJmcIfv
 MgZiaiMU3a/KeXzZ5ACxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:28fZMYzHigo=:UAoHbeDBzoWDEamrt53vVc
 EeisHEp9VyFVpENXhyEC+WOQh+nlYum8Q57WWlTqiqms6dj1IZrwNLaJ/yMkD4fYocxET4b+V
 NOwIXzit8Fc2SGiofKcInyqsXYeT7bdZddAXCJVCn66SCvNql0Z8fI4eQTr1k5qZLm4HvIcd3
 L4MPpbczKVOehcMsLj8z085gPqttHlUXQq7j3HtMOPKkMjNoRS+9Vc4jmm/Dm+c4P3FtKCMJK
 3S0Dh2eabCxkCDIeEWKd41F7PovkFYrapDcPJuO3oMMWWQGOTAhs6JG1/Xa1ykRhP2Iyy771t
 DXShXesaT6wZK2rdR6zyUIsgaDYUYt4UocjyVJEhsgs/wVgcGVB8T5aLXmwz80uU1Zhc2PP6L
 /dBm7rQWVOk7yh0LBnjWKqKHjaA60eUPf1aKzDunen1ShfZhW4ZNow79CYmyNoECLbpJZf/8y
 0htHgBjx7GndYFo3pX/uwqVISsGbtK+nJ7ttYIKpSpdwKccsVt9z5zz8uICZCKjb6dYhP3f1q
 L4v3+HbJ5bezecSsLtTerZGdDKS8CJYmESWFrGPfDPXlb5Y7Zxit2mo6Ia2s6HJH9e5hgCAwJ
 MQJkWPmxQrbo2KhOaqZrvU5yD+A4iXpeHQ3XzkIacLPrshxm/E8AQEqrs9w2wGxxsIeoUHLmJ
 6osW/NCOgTOvJsfzAppxIr2tjA2GTKI1ZLtASl1f6UeLqusohgu0X6ZzfjMA1+oqermXKhaa+
 Sl7p8DnItKRI/7dyeySu+5j77pR+tiGEZRJkjr2v1GYLA2y78GW+R8IPEkB6mopPE9fL5qWmu
 /ojNPc3ORLvOqzgesJoOyaUbauEQD8DFs4bhKs30YcGPws31ajeD1SXYi1t8NDEwx3w6nMk
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
index c9191f8f1ca8..185f78023e91 100644
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
+	ret = clk_prepare_enable(mclk_of(state));
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
 
+	clk_disable_unprepare(mclk_of(state));
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


