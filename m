Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B8118D499
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgCTQiI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:38:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57623 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgCTQiH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:38:07 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MoOpq-1jdLni3E6a-00ops3 for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:38:06 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 8A918650123
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UCCVUAskblkt for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:38:06 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4341464E0F8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:38:06 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:38:06 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9E6F480504; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
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
Subject: [PATCH v3 07/11] media: adv748x: only activate DAI if it is
 described in device tree
Message-ID: <ad4992170f9865f1040f6bda13452f23ea30a787.1584720678.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:HddHdWPPzV+3nJLEq2WEJhJnRC01Ta3u94WnOuNhwBmh2nBBOIL
 oe9TOfDbetg05yT64sNO1wKBNeQpp+0ufQq+EmTN5DThixfKcOl/ix9Afg8Pic33eF7NMG8
 LIWGS4PiClYEtaZtu6ssok83wRc8fkW2RmoODtX485QjyoiKZEcfljEF/X/rS8UROs6apUp
 wvGFrZ+i9P69Tl0sHVe2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZODtHJEdC9U=:10fMQB9PJxy/sVqliPmzCE
 BmPQIQkvCI9NYCIA1UVmCTdm/BcK2SYE86TVoVYC1BnQrwGota6WtsrafI0QERZSbjFMrSARi
 jUMi46bA4mmk7Zj1pwHXWE8gbApHqDrczdmBSfckvlmNe83x4R4bVlA3ipgYDWUkaiuoTPBmg
 vBD7Wi8zlYQs5cfhn3a73ijrtoX1jCyeeGvkMjkJs7fCil+odQ0LiIpzLGnLGGXp2tZ1/IeoW
 41DQ5RURSX4CM9sdyShDPKy9jIFv/p+WfUY5kIbv+6kr+0Cx0uAdQBSFCzgF+lGb3oH8V9KS1
 Ylf2Wh4czCs/C0dmE66iUBE/6pKGV1QLfkEnaNv89ludEJYz5JYCAhkXrfY4nOMStHSNqZ0Fb
 UTFU8c3Ksb0yjHmxZ5AVSAeiqaYVePONP8YGu+7cG/SjMKF6SBhKESV1kISP7Rsg/U4/f3ZgX
 Xyi5sosIZpEQGMe84TSj2hwFjJq9IaFNimPdgXh9Z+J4njCfz+BLxt09kEoibKks/p7zu/6CW
 NkA7FQxu5RD+1egcDsuBT2GxXgJ9sJfpacWawKOKZM8OyHyk0Fz6ghLJWak9lLlMj2Z/J9JCg
 s4eYGUZ3RdTE4/0H87un1CcppEn/vVGeOVl7CiY2lTj/IooazQDJAVENaGnTMC7cqBYw1Uu1E
 Hlg72r78lUVr9dPJMEbVJhkEt5YmidURt9Vmqj8FTuUxUkpAy2aHXKK7yu/NzH51kzlHQykeO
 LIkkoIgyYGHwwzwkUDydETs9AzkeaLJJ8TmxLFfw+54rFFAbBnD2INO1U9zr6FYBdA627Myby
 McpNds+WYZqhpBb1b6Z+r87tl3Yw/Rnh0E2ukGF6gCcYaTIlie6GP02+fCfuMqe1kZe0WQzMJ
 n3mT1KB+2il8xc73+tgzkpBY4aYqKXlvqrcsVGS1Ti8D2j97UQUMjRhE6YJk1JK1njjJck5E+
 JWsTepfE+Ydd0OIFXG6t/Y+DwOP5ZLhU=
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
index 1c673efd4745..f22566094568 100644
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


