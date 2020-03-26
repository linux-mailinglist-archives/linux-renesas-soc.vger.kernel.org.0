Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC5C193D74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 12:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgCZLAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 07:00:39 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60791 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbgCZLAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 07:00:39 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLR5h-1j0iJS1x1X-00IQIR for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 12:00:37 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 46BEA6502CC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rEZvhlRd02XO for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 12:00:36 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id ECA1864FC1E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 12:00:36 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 12:00:36 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DD5CD80504; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
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
Subject: [PATCH v4 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <a7112a71e23d63cb6d19188e59252689e4900c70.1585218857.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:TM/y2WUFOVcMS2eBmLJa7FblcbqyRbdehPKCR+RQ4ytpAKuHy7m
 q92euLldnYjy3+xC8vx9Za0iCA+RXv6j195bUTTjkI8rjmvrHWAvsE4Ll53lSU7C2iYd64t
 I+IkSNzLc0ja9GJPPnaQbPcBYKQqVcOSG0qETHwPoJZ8vgWmHS59osf0kYH1x6SXatZvxZW
 54AEwhxdxJi8ydHT2xqAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dmg9QVFkJUg=:CQR4oqlZI5qoTizAu90/YR
 ffwptPi3YSBLB2s6C9udcQvfNoINeMTY2sNU41MiPd0SanOxnUWfD8Kvh8zYWXlDToNREgyaJ
 waHJgJkH5SY52USgugd3lr6C/AuQEIpbwu34uj1gUaP6q7M0gdf4YT0+9pUNa6iDKQawWlyVV
 O2UV5YPdZcaZg04b6Nmchv7oWeJKuohXQbZoYCF4z01UnAh3x2voWmdvaIdrvVFdD8oJheJl7
 qI082oHOrCVgcpGmr3ACl7pQqhM4Nu8E1JFHvHByYjqsBRr/TTjAKFhK24ZBoteCU8gvhJ2lY
 RTsXTbDVcXICA9PyzgTmRQBc35UJ2gNXZkXTUyjYoKLQSE0xPfeBgiO6S0JD+l9lnFq3aLfIw
 w2qAzeLtCU7AuXmnWXPlZasMz7h8B6+BpijffiTNXmUw4rzmRu1105hQtToSDq2EDFF56CQMA
 NGBaG/hyjOC53G+q7S1Y15jSaqwDGXQ2q+3um4EuZiqspW/ifdEPAnUOerF+SJpuiCWQ3cNmn
 iBjMZB4zrUBC373uRIcSxl05birsx7vpVgdARRGBd0j9eyu5KqTBv1OqmG7ICJssY2f0Zs3sI
 VorxBxZqganHWU3ASSRWm9rYqWLMpuR5ivaJDJPk/bza+RFauprW+6vQIO7z2DyCbfi1bCCgI
 LgDzlcvqrChLwK2itsQJkIqqqFJu4tvDMvg230pOtJMNc3SHHV7K6AIvh5McZdsFmWQuiOCTA
 c9ju05ChcnEgIGF4ZqFEpM+qFQivjeXC+js9W1GHxIPpcUBpY/nN/88m+yjRGmhkRC7mG6c0Q
 B73Wz7BfWqGextUOHb2HKkydvL5Rg2gQqWfKpzjw8dg1+2Y5j2xTbBb+oI8eZGcgPe+/RPB
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


