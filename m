Return-Path: <linux-renesas-soc+bounces-34869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hr8GNaQyTmrkGQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:21:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD70724DA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:21:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=B1WQrAqk;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1EBB3022CFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 11:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F61C43784A;
	Wed,  8 Jul 2026 11:16:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A9436BF4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 11:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509407; cv=none; b=DS0jSWyu/HPQQcSdwZ9kge8UopLuqfM3FQkdV1WYc+ZLxyO4jZ+Oq86s7OI1kMvJjLcAFctYN31iRi1vRWAMekL26DBMa81rUyegnldU6w31nut9PlFA1uXoANrhAJSP27VaegZlUTyhhGuJsgv+nLxp6aFTux8qsSWP/mYjeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509407; c=relaxed/simple;
	bh=E3FC72ljteUGOGcVpTGBp/YrOoyfgnbCfRcJyfB8Y/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lodcpHBhjyGta6FKI+vxwM8CzsAXwiI0EXnS/dfjNCqk6mufd3Woy9fmPspY/tqbbR4AWjs2Sy5jZEcgnxm85YqyiCDiFtM7s3DCgbYnHp6iunuPduadevf5i7keEV5+gns++F8FZi6/OaBRTOtoVuXXX+GKkdnNPtpII/D15+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B1WQrAqk; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c7902f47so3885055e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509396; x=1784114196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
        b=B1WQrAqkyKAeldJfqVV7s2dSbXwQoJjseoRi5DSvCfzpd0qXNHkKd7XWWWbRF2pYRD
         /GLu59mAGSa7ypfuFIWooGSf7sIU+YOSS1QUxd0dUSlRxE7HRzhvnMfXQNQ5MqO7p6//
         g3i2qsC9UKGPzl1A91f15gcukJTthkd9/hecMLee0+3pllyWPQz1a3G+EwPLlBCLQ930
         xqYKwRc3oQrds72m0PU1H6VvXrqx3zBBf34hsDSad4OvTjb5xMJtO2KKiKUWQeXyju9U
         zMFUxbHDWa0PvDBw5NCIMe8VymYDGq2W90YePam1rPa6gdLx1h0oWN6U+d9PysY+QMjS
         7blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509396; x=1784114196;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
        b=SyIGUTa6J2NUVxLnRfOCxPsdDgqa2xGX/RZjbclTrfe1s1PiIzvhv2Y+JAK0kCF26Q
         VVqHVtzkUirS2INfFeNM9FQle/ZWGHUcRe3vkqfU6RA7IPucI1Hk4D2lBDaKMJYrV0kQ
         vkQfqT39kI1xk1mXTekJhoLA1fEKId38RIiOgCkoMeTU7Kfjpyz3/Ncy8mCLYR8HdcPe
         6tWZWNnUI6oBLKEIgr6EbqofkM4orDanZIUVLDLhnZf3iQ5hndhF0oMxKkR082su6tCJ
         EWgvi8czFOOze9VkP5BDXxwnYeFTAng2PtIcX87GIIuuW6/AXlXHCF1wIySSNhRLKVRD
         sSPg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1lpB09wCSkV0FYl4xVRYIgrgB71+1v1AjR2zNpssA1e3bGSzzNWUMssGp/A2YmwpY4k+mQkx3NMWKdLhun/31rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlocnb4k95O8xBbBNJCY+WwFL1/czN6G49DK1IqsN06CVIC6k
	YSeL2kmCm7kF+2rwQNApx8Hri2+WkLmr4eE1cVS5SwwV2OVCf4EmIyYLUu5VtDWuBDo=
X-Gm-Gg: AfdE7clQWVeF7ESLFYD1BySk4EVGmJqho3fO0kYOniZFJNxXD7ngxzTiLS5TWj2k7VA
	3ivKOJ/gPc0l+MUvOqNKYBqQl66ZEExTBOkMTE+k+zrEDvHz71TcVok98d1WFefDg4conCi590M
	/U6MoYqcfNwPo3ionXVfk5swZQYX2HGQap+I0ThFwVL2e9ms4bz6mXbzVFidLkyFGiGxMKTGv2C
	3atd2clVkOy+mHACFgF3fV8+gFsbqFyDEB2tsQIp45mWucfZF7YESMAQ+730KRRvfxzvwsWe3cN
	Or+8ca1WrdmnsDDPpCGuoCeK/7Ij96TVxJxsaDMXyspVRlihcW9PlMVD7jH9j0L7snqVIwG5meQ
	wr1KKaSSzjrn7RQLl7NTGr1VxC50vCseeKebANUQcdXJg0p/l/F+fICT61ZUIMEZvdC7oJHl3rh
	leOgaqxlu9y9OvoAVukurS5OhXoMFt4hfGtj8+TPoWN3wJmo0pvLdVXFupwVqp9EOtDncgeQJdw
	nzV
X-Received: by 2002:a05:600c:3e07:b0:493:d0b2:bc46 with SMTP id 5b1f17b1804b1-493e6868818mr22405785e9.28.1783509395617;
        Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm40991012f8f.36.2026.07.08.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Colin Foster <colin.foster@in-advantage.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Werner <andreas.werner@men.de>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	linux@ew.tq-group.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v2 00/23] mfd: Use named initializers for arrays of *_device_data
Date: Wed,  8 Jul 2026 13:15:07 +0200
Message-ID: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10455; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=E3FC72ljteUGOGcVpTGBp/YrOoyfgnbCfRcJyfB8Y/0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiw/Q5s+Y/k2o7lHpivyHIncWbh850X+jPRNklNv1OUu/ aWVzvewk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJ6DzjYNhU8rM+z2p9eUKp X1D4b7MgQ+8ZqyOSv7Hly5nxhf09eenT9602CQJvrz87OONjYenZm5cfbCrentXdUvfpl1LULqm vCz+Y/NeomcT78CvDzuQarcm2nqbGuxt+nDQy9Fvl4jj12VypDMGQn2tfsjCqzT+Q8exTr5y7uW 1Mof0UwSWvw9kDPv6Sl/9QEb55R4O8Z50Na0JXpv3mojvlJ3IaPimrTq5j8NnI/GBy80pWY1425 8WWlXaaqq8Xd//uqxOqmf4rfH2+SPMx1jutu47e3ee2fXXW8kPuV/jsZF92d/2/JDI33HRW8VXe lcY/VdmSz/ZZ3L/rLG5q2aFRGFnzmTVxnUrCasvcTyvdAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34869-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:mfd@lists.linux.dev,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:zhaoqunqin@loongson.cn,m:linux-crypto@vger.kernel.org,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:colin.foster@in-advantage.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:qipeng.zha@intel.com,m:thomas.richard@bootlin.com,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:yilun.xu@intel.com,m:trix@redhat.com,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,
 m:support.opensource@diasemi.com,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:andreas.werner@men.de,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linusw@kernel.org,m:linux@ew.tq-group.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:luca.ceresoli@bootlin.com,m:sravanhome@gmail.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefer@gmx.net,m:mazziesaccou
 nt@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:ptyser@xes-inc.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,gmail.com,collabora.com,loongson.cn,chromium.org,in-advantage.com,cirrus.com,opensource.cirrus.com,linux.intel.com,intel.com,bootlin.com,redhat.com,analog.com,kernel.org,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,men.de,foss.st.com,st-md-mailman.stormreply.com,ew.tq-group.com,microchip.com,tuxon.dev,gateworks.com,jannau.net,gompa.dev,nxp.com,pengutronix.de,gmx.net,linux.alibaba.com,sholland.org,arm.com,glider.be,xes-inc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[91];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim,baylibre.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CD70724DA5

Hello,

this series superseeds my previous patch "[PATCH v1] mfd: Use named
initializers for arrays of i2c_device_data"
(https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@baylibre.com)
that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
Initialize spi_device_id arrays using member names"
(https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@baylibre.com).

The objective for this series is to prepare mfd for changing
of_device_id etc to make driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it.

This series is based on yesterday's next/master and it does the
restructuring not only for i2c and spi (as the two series mentioned
above), but for all *_device_id structures that I intend to modify with
a union that affect mfd. So (I hope) this is the only patch series
affecting mfd for this quest.

I don't care much about the last few patches unifying the coding style.
I think it's a good opportunity to do that, but if you don't like them,
just don't apply these.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (23):
  mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used
    locally
  mfd: bcm2835-pm: Drop unused header
  mfd: kempld: Simplify device abstraction
  mfd: lp87565: Explicitly set driver data for the generic dt compatible
  mfd: mt6360: Drop irrelevant __maybe_unused
  mfd: rt4831: Drop irrelevant __maybe_unused
  mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
  mfd: Drop unused assignment of i2c_device_id driver data
  mfd: Drop unused assignment of platform_device_id driver data
  mfd: Drop unused assignment of spi_device_id driver data
  mfd: Use named initializers for acpi_device_id arrays
  mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id
    array
  mfd: Use named initializers for arrays of i2c_device_id
  mfd: twl6030: Use named initializers for of_device_id
  mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
  mfd: Use named initializers for platform_device_id array
  mfd: Use named initializers for arrays of spi_device_id
  mfd: Unify style of acpi_device_id arrays
  mfd: Unify style of dmi_system_id arrays
  mfd: Unify style of i2c_device_id arrays
  mfd: Unify style of of_device_id arrays
  mfd: Unify style of pci_device_id arrays
  mfd: Unify style of spi_device_id arrays

 drivers/mfd/88pm800.c                 |  4 +-
 drivers/mfd/88pm805.c                 |  4 +-
 drivers/mfd/88pm860x-core.c           |  8 ++--
 drivers/mfd/aat2870-core.c            |  2 +-
 drivers/mfd/ab8500-core.c             |  8 ++--
 drivers/mfd/ab8500-sysctrl.c          |  4 +-
 drivers/mfd/ac100.c                   |  2 +-
 drivers/mfd/act8945a.c                |  8 ++--
 drivers/mfd/adp5520.c                 |  4 +-
 drivers/mfd/altera-a10sr.c            |  4 +-
 drivers/mfd/altera-sysmgr.c           |  2 +-
 drivers/mfd/arizona-i2c.c             | 14 +++----
 drivers/mfd/arizona-spi.c             | 14 +++----
 drivers/mfd/as3711.c                  |  8 ++--
 drivers/mfd/as3722.c                  |  8 ++--
 drivers/mfd/atmel-hlcdc.c             |  2 +-
 drivers/mfd/atmel-smc.c               |  2 +-
 drivers/mfd/axp20x-i2c.c              | 26 ++++++------
 drivers/mfd/axp20x-rsb.c              |  2 +-
 drivers/mfd/bcm2835-pm.c              | 15 +++++--
 drivers/mfd/bcm590xx.c                |  4 +-
 drivers/mfd/bd9571mwv.c               |  6 +--
 drivers/mfd/bq257xx.c                 |  8 ++--
 drivers/mfd/cgbc-core.c               |  2 +-
 drivers/mfd/cros_ec_dev.c             |  2 +-
 drivers/mfd/cs40l50-i2c.c             |  6 +--
 drivers/mfd/cs40l50-spi.c             |  6 +--
 drivers/mfd/cs42l43-i2c.c             |  8 ++--
 drivers/mfd/cs5535-mfd.c              |  2 +-
 drivers/mfd/da903x.c                  |  6 +--
 drivers/mfd/da9052-i2c.c              | 12 +++---
 drivers/mfd/da9052-spi.c              | 12 +++---
 drivers/mfd/da9055-i2c.c              |  2 +-
 drivers/mfd/da9062-core.c             |  4 +-
 drivers/mfd/da9063-i2c.c              | 11 ++---
 drivers/mfd/da9150-core.c             |  4 +-
 drivers/mfd/db8500-prcmu.c            |  4 +-
 drivers/mfd/exynos-lpass.c            |  2 +-
 drivers/mfd/gateworks-gsc.c           |  2 +-
 drivers/mfd/hi6421-pmic-core.c        |  6 +--
 drivers/mfd/hi655x-pmic.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++--------------
 drivers/mfd/intel-m10-bmc-pmci.c      |  2 +-
 drivers/mfd/intel-m10-bmc-spi.c       |  6 +--
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_quark_i2c_gpio.c    |  6 +--
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  6 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +-
 drivers/mfd/ioc3.c                    |  4 +-
 drivers/mfd/janz-cmodio.c             | 14 +++----
 drivers/mfd/kempld-core.c             | 29 ++++++--------
 drivers/mfd/khadas-mcu.c              |  4 +-
 drivers/mfd/lm3533-core.c             |  2 +-
 drivers/mfd/lochnagar-i2c.c           |  2 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/lp3943.c                  |  4 +-
 drivers/mfd/lp873x.c                  |  4 +-
 drivers/mfd/lp87565.c                 |  9 +++--
 drivers/mfd/lp8788.c                  |  2 +-
 drivers/mfd/lpc_ich.c                 |  2 +-
 drivers/mfd/macsmc.c                  |  2 +-
 drivers/mfd/madera-core.c             |  2 +-
 drivers/mfd/madera-i2c.c              | 18 ++++-----
 drivers/mfd/madera-spi.c              | 18 ++++-----
 drivers/mfd/max14577.c                |  4 +-
 drivers/mfd/max7360.c                 |  2 +-
 drivers/mfd/max77541.c                |  4 +-
 drivers/mfd/max77620.c                |  8 ++--
 drivers/mfd/max77686.c                |  2 +-
 drivers/mfd/max77693.c                |  2 +-
 drivers/mfd/max77714.c                |  2 +-
 drivers/mfd/max77759.c                |  4 +-
 drivers/mfd/max77843.c                |  8 ++--
 drivers/mfd/max8907.c                 |  6 +--
 drivers/mfd/max8925-i2c.c             |  4 +-
 drivers/mfd/max8997.c                 |  6 +--
 drivers/mfd/max8998.c                 |  6 +--
 drivers/mfd/mc13xxx-spi.c             |  6 +--
 drivers/mfd/menelaus.c                |  2 +-
 drivers/mfd/menf21bmc.c               |  2 +-
 drivers/mfd/motorola-cpcap.c          | 12 +++---
 drivers/mfd/mp2629.c                  |  2 +-
 drivers/mfd/mt6360-core.c             |  6 +--
 drivers/mfd/mt6370.c                  |  2 +-
 drivers/mfd/mt6397-core.c             |  4 +-
 drivers/mfd/mxs-lradc.c               |  4 +-
 drivers/mfd/ntxec.c                   |  4 +-
 drivers/mfd/ocelot-spi.c              |  2 +-
 drivers/mfd/omap-usb-host.c           |  4 +-
 drivers/mfd/palmas.c                  |  8 ++--
 drivers/mfd/pf1550.c                  |  2 +-
 drivers/mfd/qcom-pm8008.c             |  4 +-
 drivers/mfd/qcom-pm8xxx.c             |  6 +--
 drivers/mfd/rc5t583.c                 |  4 +-
 drivers/mfd/rdc321x-southbridge.c     |  2 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk8xx-i2c.c               |  2 +-
 drivers/mfd/rk8xx-spi.c               |  2 +-
 drivers/mfd/rohm-bd71828.c            |  4 +-
 drivers/mfd/rohm-bd9576.c             |  6 +--
 drivers/mfd/rsmu_i2c.c                | 18 ++++-----
 drivers/mfd/rsmu_spi.c                | 14 +++----
 drivers/mfd/rt4831.c                  |  6 +--
 drivers/mfd/rt5033.c                  |  4 +-
 drivers/mfd/rz-mtu3.c                 |  2 +-
 drivers/mfd/sec-acpm.c                |  6 +--
 drivers/mfd/sec-i2c.c                 | 22 +++++-----
 drivers/mfd/si476x-i2c.c              |  8 ++--
 drivers/mfd/simple-mfd-i2c.c          |  2 +-
 drivers/mfd/sky81452.c                |  4 +-
 drivers/mfd/sm501.c                   |  4 +-
 drivers/mfd/smpro-core.c              |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c         |  4 +-
 drivers/mfd/ssbi.c                    |  2 +-
 drivers/mfd/stm32-lptimer.c           |  4 +-
 drivers/mfd/stm32-timers.c            |  4 +-
 drivers/mfd/stmfx.c                   |  4 +-
 drivers/mfd/stmpe-i2c.c               | 34 ++++++++--------
 drivers/mfd/stmpe-spi.c               | 26 ++++++------
 drivers/mfd/stw481x.c                 |  8 ++--
 drivers/mfd/sun6i-prcm.c              |  2 +-
 drivers/mfd/tc3589x.c                 | 14 +++----
 drivers/mfd/ti-lmu.c                  | 10 ++---
 drivers/mfd/timberdale.c              |  2 +-
 drivers/mfd/tps6105x.c                |  6 +--
 drivers/mfd/tps65010.c                | 10 ++---
 drivers/mfd/tps6507x.c                |  6 +--
 drivers/mfd/tps65086.c                |  4 +-
 drivers/mfd/tps65090.c                |  6 +--
 drivers/mfd/tps65217.c                |  6 +--
 drivers/mfd/tps65218.c                |  8 ++--
 drivers/mfd/tps65219.c                |  8 ++--
 drivers/mfd/tps6586x.c                |  6 +--
 drivers/mfd/tps65910.c                | 12 +++---
 drivers/mfd/tps65912-i2c.c            |  4 +-
 drivers/mfd/tps65912-spi.c            |  4 +-
 drivers/mfd/tps6594-i2c.c             | 12 +++---
 drivers/mfd/tps6594-spi.c             | 12 +++---
 drivers/mfd/tqmx86.c                  |  2 +-
 drivers/mfd/twl-core.c                | 22 +++++-----
 drivers/mfd/twl4030-audio.c           |  4 +-
 drivers/mfd/twl4030-power.c           |  2 +-
 drivers/mfd/twl6030-irq.c             |  6 +--
 drivers/mfd/twl6040.c                 |  4 +-
 drivers/mfd/upboard-fpga.c            |  6 +--
 drivers/mfd/vexpress-sysreg.c         |  4 +-
 drivers/mfd/vx855.c                   |  2 +-
 drivers/mfd/wm831x-core.c             |  2 +-
 drivers/mfd/wm831x-i2c.c              | 14 +++----
 drivers/mfd/wm831x-spi.c              | 16 ++++----
 drivers/mfd/wm8350-i2c.c              |  6 +--
 drivers/mfd/wm8400-core.c             |  4 +-
 drivers/mfd/wm8994-core.c             |  8 ++--
 include/linux/mfd/bcm2835-pm.h        |  9 -----
 include/linux/mfd/kempld.h            |  2 -
 158 files changed, 518 insertions(+), 521 deletions(-)


base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
-- 
2.55.0.11.g153666a7d9bb


