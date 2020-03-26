Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D4193D55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 11:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgCZKxz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 06:53:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41187 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgCZKxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 06:53:55 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQgtC-1iuxqm0v1q-00NkXn for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 11:53:54 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 11D2264FB32
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 10:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y_AYX6E1xkUu for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 11:53:53 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C33C464D5D2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:53:53 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:53:53 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 220CD80503; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:42 +0100
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
Subject: [PATCH v4 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <c4469e5897f0974c3e6eaba7cd1d4be983cf84a9.1585218857.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:GF9XAJjY4AlZROXljfwOA7tsNyHFnXMFdEk17mq1XJ892m1Hxmr
 Jg+fJsoBiM5ykgaDzKvwjlIF2lulXMljpUxlPhVyUxbhXih6Y7cYkqbUMlCOHDh/Ukp6g2h
 29dYdZKLN5devQ8zLNLr1hNoUc7qqetR6KEWZX74jw7LIjvv+Q7GICo9mH1lItT95WgT+dq
 30JLY0YGmq15LwPDkCATw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r/Nj4xpxV3E=:fpxYBMcpbE8EQzPNRIjONT
 WFHrVFe25EAfLfgpP/GJYk7hTIrZwnMGyEDiA5injpDHX4tognpXmB7sdWtgsdJQHCl6TTuDl
 x0LT6D8oQoSfqAC3WvA7gVBj5tmJAhPTDZcBBLyEowZM29/JesGyshqrE1eN7w7CrsJgE1lIV
 GkZLf2fG4jiiYvlmoYv4GGuTQza/ZpCgcid/qnbhgHmOgKJoBvavJVUSw7vveE7D9ArGQFvfd
 GbPbZZO2RpKdVaTvPX4QndIICMYEALGkmd4dW38JXOAQhqJi9ViXiZbaKh7ZMyVH0+8otF6c4
 3Vis3WpVjvKMLutHjn3gup7UG8KgyhskETDR7mZVhKdP+xeqYQD8k5/CAvt64B5YjwLI/H39R
 vqiEFL4/zT5BqAjvK8xKk/bWZzZePpD85X3t/0fSzQFydmW0OIA/ZNM5ESsoOWUjHXa9RvA9n
 kQkDBKogb2ZTRZBrRJYRdTr+xR1FHMSJUlErp7AwyzCXsaV2fWbsuLqFgnuEUnB93NC+cQ3C7
 5BLRYkKoaUe7Jd4UIVRRkZFqiUgfH1+a6h1za5wsdT/YYaaldFEZm3TP0xVAH4t/c5j7yWOqR
 QSZHMyAOzCd2DpjPCRSipGdnT9aDaB7hfLaD7xHB/PZTK4bH0+d7BgRddurGGktnz2VeFzMg5
 aD2ZK8Ap0reEQJm6IsDac6RAXs2PS3N6rs4vwo/3YJidMkSjZ8Gfc2iOdZxL4iOp5scqcfiED
 s16PU/tOgMJ5B4ZVseTXMhiM8WUQmcS0MunxC/TpB1FIcaGcn0DIj/sqKRZ9x6xw5jbjo1r/f
 wzgYizgXFFkYtS8yLG1YqQhZzDqm94JfnrlR/ukfyK9p5YcgnvEA5K28j5kc1ayZhrFijvB
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


