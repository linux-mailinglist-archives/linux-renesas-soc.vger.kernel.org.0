Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E754C19C94F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 21:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389103AbgDBTAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 15:00:24 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37227 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbgDBTAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 15:00:23 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MplHR-1izY792f4n-00qAQs for <linux-renesas-soc@vger.kernel.org>; Thu, 02
 Apr 2020 21:00:22 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 68483650882
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 19:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dZJOwrLsFPkF for <linux-renesas-soc@vger.kernel.org>;
        Thu,  2 Apr 2020 21:00:22 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 150EA64FB53
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 21:00:22 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 21:00:22 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CFF680504; Thu,  2 Apr 2020 20:34:59 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:59 +0200
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
Subject: [PATCH v5 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <c3c8ece14c0fbc987dc201c9b61dd22d98f83056.1585852001.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:n9tquJEofo91gDY2vOY3TlXfZZQXAPgJmmUwH3GaKShbI/Xidna
 59FH9fwmyuMeI7YEE/uCaSoLuGQKgNcsSk+fwv1NdUg1+qzQeflzVX+HLPYKlTzMfwa8mKR
 6RTNLpbMcnYaBaXb8ALX+k/EBhty0U+EnMSKFLeQnKAtB1ubzlDIVjHoMKa/gJ5Al9gweVC
 CJn/Al38bO701yXNPHuKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Md7hZo6/tZg=:u2rKc5PColQNeKhcm/apXK
 UzrVib2Qj7HTVfbxYMZgQWlIWr+vHn1I7rSehpDoPEnjgRyYa3Bf4im6IGP4GtivQmCbhYPLf
 rAXvWhvpaT4m2/S+u6QeoI0+ZdZhQleZF+RxP5YljSuv+0RcacA1BV1TtIH4K15JMDWbyI6XU
 0rJCqH1Q52iW4EJCug/1hUJS27iE7g0vQa82zn61iTSaGXqJQO7hGj5IW+vV7UGjKbysBDIfd
 rOv2KYYf5uEV7F1eeNW6kYgEDVa3/JoRl/qwSlaBzAVw3/YYFHehtJPgYlDjou5SQ0CyOT7NL
 vU5jrQJ3WibcqTualnL8wMQmTJ/0LfreqMsY2UuCCEZ8QTrBv+J9mCCyeCKGLPIWNIF6M8oMp
 x+VPub/RxzIFYGj7TGhhZ/p/te2G2AKwhCiL+CSqKaM2Rab/tP/NypnCXGMSX/fhhiJtpLaBM
 mek/arqzuDBeoMfpaXP9bJwpR4uZ0nr/e2sQpakOCPX0HOK6ITtb+3Rpgqi0YMc+kWj268KSd
 BwjZiCrajhnCK1QYRpQ2Z8aXDmzRqHcQt/+YNnX+xfFb/5H64ro7k/rveMVkIiuk7nq2IKKtV
 GD7LW+L5DtuaJdbUF4j4RiMy5wU6t+5hjWd3sAZ4gg+6wveRLoYPAxkK+jFb3Ztn2t2Rk44/d
 +8PRFk2j+SsdaG1OFHnIH+a0O+sLfh0+pGoqB9a9kZ92XPgo9Cz7AMqq9rwnf35/5PrUIE04B
 +1frSQn0CG24z9drfAdCOFaGjn31DO/cEki3oqjmdBl8wXSXCelaSHeMMv8FMfDWT34741os3
 pzdJTLsqLP0oPQvnA4p7CLw4PcrBT58UgUILM+7h+PDU35CD070w0X5U0W1PVNSJ+5zQ0Se
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To avoid setting it up even if the hardware is not actually connected
to anything physically.

Besides, the bindings explicitly notes that port definitions are
"optional if they are not connected to anything at the hardware level".

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index 185f78023e91..f9cc47fa9ad1 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -216,6 +216,11 @@ int adv748x_dai_init(struct adv748x_dai *dai)
 	int ret;
 	struct adv748x_state *state = adv748x_dai_to_state(dai);
 
+	if (!state->endpoints[ADV748X_PORT_I2S]) {
+		adv_info(state, "no I2S port, DAI disabled\n");
+		ret = 0;
+		goto fail;
+	}
 	dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
 				   state->dev->driver->name,
 				   dev_name(state->dev));
-- 
2.25.1.25.g9ecbe7eb18


