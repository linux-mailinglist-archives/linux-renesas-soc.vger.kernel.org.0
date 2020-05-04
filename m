Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4031C33AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2020 09:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgEDHfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 May 2020 03:35:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35821 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgEDHfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 May 2020 03:35:00 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MPp0l-1jqdGu42tP-00MsxR; Mon, 04 May 2020 09:34:48 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id D9ED06510C9;
        Mon,  4 May 2020 07:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dUcN9RcOQ6Gr; Mon,  4 May 2020 09:34:46 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 80F0964FBE0;
        Mon,  4 May 2020 09:34:46 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.34) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 4 May 2020 09:34:46 +0200
From:   Matthias Blankertz <matthias.blankertz@cetitec.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jerome Brunet <jbrunet@baylibre.com>
CC:     <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [RFC PATCH] drm: dw-hdmi-i2s: Workaround for interchannel sample offset
Date:   Mon, 4 May 2020 09:34:22 +0200
Message-ID: <20200504073422.7322-1-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.8.5.34]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B667464
X-Provags-ID: V03:K1:OgV8speWiqwUCoBxIRG3cxL3b5yA1H2ttfw7UzEq0x6x2+KVPhd
 CXsjGXkYCBVde6ROVMy1EGe8uEVUNGJUSAT/3NeoMXYLk8pJu8czKJUJVdiWItSyndNPNtX
 ZIq/9tB3GLE2Y1z+G3pNpcdsLfgkHJuxlQyzRKwkoeM6KZXcSJYonyns40yEfLcSD9W9BFe
 sqp5ug1ZgnmH91CDOxr6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OZitNiLl6Hs=:T3NY6pV5wPlArxj2mGeotK
 A79kxdvNg8tgJtnLqyaaMZm5MNUohqLJp8cLQCTcnwoBnO5BDzfA3lpyC0NkIdkvMZBCMU+2u
 ar0pZ8gmSrTG8uO0hLveccgXNLbEXFck3u0+ZdFknaOMm97XegZ6yKxf5u41KX0aOeN7XrlxY
 A4RuAuSpMn/nUwrXdheey1IgCSHbg1wCcCfnAVBfBYg+VCEVESUPRa+6Y39HIvu6DaA5YJIDs
 N4h44W5yqFtRvI49OV2jnHvAmGs7UElZeKx4jxUMFWkXNUh0LrVPzrMw0kjZTx6Cc2FU6Uynm
 4xgex7a/zNBj+KbEvo5SKwuZTm3tWrhexKUPQEH6m4m6jWsy5CNu/QbMHGxUqixucoHKXRbDJ
 TJX7E1dNCtvOyrVqcaJcZLKY8vImW1PKdN8vyG0VYImVRkeUpwNJDFlvqpM51djD2TONRBrZg
 AufRAezk5TjA1bKhHfStEgvgQ6Gts24GJ2m60+Q8IbVyJjbFs9gsKfgI+3FhlA3qzz1IHUIoD
 1Nv1J3fDvOIO1R3ipmNsGC/dZQX2b/OVi/cNczj/n5Y6JOTmbjG81w1eXeUUzrd8LORwzU3Nf
 wYDy7xInZ9ehZKjPtlyEimOfYNFfaQeaB/Xm9izoVfE19UhQYvyWKqLM4OxhH++cZ+pdosLxP
 NRSbm+pAnhWbwwNL2ar4rWXMEnnKHc/T8aKC3pC6ubwbxO/Xeq+E55LskYZ8j/+rDebB+mBea
 gwCNN4ODMV5yWeEOcluwHfSRR6+n3p46LJsfnokHLeVAAdrJgZak9raBc/zZCPbFouPWEEGf0
 nN3as7C+iVlrSB2DTkg3vacEFhGoGioSE2czMK9RoQEoKKYD6A0KJLvb0xkGaerL38q9ghunD
 ggTNDMh9x7Ymwqpg1WNg==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a second reset of the I2S block after the audio parameters are set.
Without this, it was observed on the R-Car Gen3 platform that in ~50% of
audio stream starts, the samples on each odd-numbered channel were delayed
by one sample relative to the even-numbered channels: A stereo test stream
was sent with a walking ones pattern, that is the data pattern was:
Sample  Left    Right
1       0x0001  0x0001
2       0x0002  0x0002
3       0x0004  0x0004
4       0x0008  0x0008
5       0x0010  0x0010
etc.
When the error occurred, the receiving device got the following data:
Left    Right
...
0x0004  0x0002
0x0008  0x0004
0x0010  0x0008
...

With the additional reset, the samples were always properly aligned on the
receiver.

Maybe this relates to the comment of commit 46cecde310bb ("drm/bridge:
dw-hdmi-i2s: reset audio fifo before applying new params"), but without
the datasheet it is only speculation.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---

Can someone with knowledge of the hardware, or access to the datasheet
give some insight if this is a "proper" fix, an ugly workaround, or the
problem is actually elsewhere and this only changes behaviour due to
e.g. timing changes?

Thanks,
	Matthias


 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index d7e65c869415..0cb526f6b8d9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -110,6 +110,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
 
+	/* Re-reset I2S in an attempt to fix inter-channel sample offset
+	 * Without this second reset of the I2S interface, it was observed on
+	 * the R-Car Gen3 platform that in ~50% of audio stream starts, the
+	 * samples on each odd-numbered channel were delayed by one sample
+	 * relative to the even-numbered channels.
+	 */
+	audio->write(audio->hdmi, (u8)~HDMI_MC_SWRSTZ_I2SSWRST_REQ,
+		     HDMI_MC_SWRSTZ);
 	return 0;
 }
 

base-commit: 7111951b8d4973bda27ff663f2cf18b663d15b48
-- 
2.26.2

