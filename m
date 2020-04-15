Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2C71AA97F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636419AbgDOOLy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 10:11:54 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54625 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2636414AbgDOOLq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 10:11:46 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Md76B-1iopto2yJ9-00aCVS; Wed, 15 Apr 2020 16:10:43 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 7C05D650ECB;
        Wed, 15 Apr 2020 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id k87RMMoqYIEv; Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 2A57C64C0D9;
        Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.60) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 16:10:41 +0200
From:   Matthias Blankertz <matthias.blankertz@cetitec.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
Date:   Wed, 15 Apr 2020 16:10:16 +0200
Message-ID: <20200415141017.384017-2-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
References: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.8.5.60]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B647460
X-Provags-ID: V03:K1:Dg6FDtPdZsmgRsmMhlYWEnuKvaX3qALipIH+tGzjN+bZlhcIpLG
 Cjm71wsq+PDb5HVHH7otRr0JdxVQxqQVAD4vQbSjTodxSb3ZxgezV7S8TNoMO7GFhyljKwK
 bfc28VW2hC2+0v8epqcVvmc0ND+s9PDElcpyYXOqmJX55YoNYFRjdX8A4nXBKacLQDL+Q+v
 5FOcztZ3beD7MT7/i3LDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XuLeWtvK6/Q=:nA3Lgcclveqc8WDV4TER4Y
 N6WNnNU0eLJ1AQhNnVf+SvDq9fpE6OyVTjAl0XBU4TfNf60bjJbNMaztkqQsCbTBrFs9xmvr1
 F7o66/kKj65TZMdDEMN41rrEgdXAm4QkfkuLreDnq0O4bFX5poIhvTBq7+/a6+wbNMdDbwbjz
 lqD8FPeTx7RpymGUDVYrmUG0THbC5Kd3+8AYv5Vo1mlx14eShhj/55uk2lAvf4k79KF7WT8xZ
 QfhVHmyjhqXuotHOAIhauiDjU/WDQWsia9Vidw6xyPTcr8FMyEZHWNKcDxY4+8qsMnADSjAnW
 T7naX8LpNBT6n37/mULKBXFstq4aG1vTcPkH4HPrDFCotR10jl7mNGUf+7XTEGjie3W3sUM8P
 4S9vUjh+HaeMNsW9QCtBA7/PuVB29wPaeowm02Ds1noKPsIbX9xOECUXsKIC4JCQjyR56DPzW
 nqHHAMBMYyLoPcHvJLcK2ea5UNfj1oeanHeyzgvBa5B6E6sUWF6BjtrImKdLkWADMp0cLHKqL
 GUI6LNkA3aHpqKMocXCFiEJwLp3WA5oEY/hDNdjU8nLtlCjfaDTKnwhf8stJO0s7/iC+M2/UR
 F32v5hzm4caVzWzAV6uIgOPfe23usQEpRTtZlu0V/9MfwUk0HLsH0+XSA33VV4y931XzVIck6
 +SsMX3yYEUUvZD/FPrK8S4UlDC2Xj9HTD/y6hdps2lKo6Hnp2aHGy2SyYSSwnM6BH5Cz1Lm3R
 ps/qHh7Q0Biof/0yFu2Xgbl0JfgfLHSQgQJhqmxc8IbA786EhxAra/a+bjNwkOPWcj9ogdUki
 Y/4jGpBXIE2ZCIihl0lVbV4gglu9AJnLUuexLk4WbUGMMvw9SLvWAIEzBbYH6vfa+4pTOZqOM
 TsrtSHQSbdMJR7m+Y2QQ==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The parent SSI of a multi-SSI setup must be fully setup, started and
stopped since it is also part of the playback/capture setup. So only
skip the SSI (as per commit 203cdf51f288 ("ASoC: rsnd: SSI parent cares
SWSP bit") and commit 597b046f0d99 ("ASoC: rsnd: control SSICR::EN
correctly")) if the SSI is parent outside of a multi-SSI setup.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---
 sound/soc/sh/rcar/ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index fc5d089868df..d51fb3a39448 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -407,7 +407,7 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * We shouldn't exchange SWSP after running.
 	 * This means, parent needs to care it.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		goto init_end;
 
 	if (rsnd_io_is_play(io))
@@ -559,7 +559,7 @@ static int rsnd_ssi_start(struct rsnd_mod *mod,
 	 * EN is for data output.
 	 * SSI parent EN is not needed.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	ssi->cr_en = EN;
@@ -582,7 +582,7 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	cr  =	ssi->cr_own	|
@@ -620,7 +620,7 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (rsnd_is_gen1(priv))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
-- 
2.26.0

