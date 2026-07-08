Return-Path: <linux-renesas-soc+bounces-34871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4dBILxI1Tmr9HgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:31:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A647254C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=j+fVSGFj;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4AC0308B151
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 11:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38969313E36;
	Wed,  8 Jul 2026 11:17:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9547F2CA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 11:17:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509442; cv=none; b=emleAyUkRa4uiu+jw+NlQJBe0iqzj59/d6yKC2hzQAV59FMxWaizwilJaEBjQ4X0cwpgAfTe3A+8LQP79i+xRc188pOSdY+MlefkrCjzwAZKUwVDgLA9X39xmLuhcrYOwIWo8+oKy7TyFebc/yuwaPxaoFg9rP7J8vm+Mj4N5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509442; c=relaxed/simple;
	bh=6OQH27AxVr97qhjR0m3VutA3m89/YeqODkw/Z+Z34X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrXt1PdQpv0AKl6Tlfi7CxaBZTLNjNhjIIU9pXQOxKtoriKoJ2m2zdWp7Lfsa0hg1+blYZW/U/4wvwL2rqWZPlT86h49i5Oy5zR+yYYfrGqK5Acf5Hr/F1t8NpGpovPqmxKgqow2qVZGc4M7b2ZZ5xQWwbguNKQcSueVUZcUR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j+fVSGFj; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso3082175e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509434; x=1784114234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oa7fPfTLrqATXrUG+iEmxKYrrfJwkIFA1yEt/SnN4AI=;
        b=j+fVSGFjT7zYFTZ/JaVT/V/uum6c7LKLs0rgfR5q9/BneRpvrytE+4hP3I7qlhZXcF
         HROCozueUKAPRtVKOjvkK1xmJFNsyq/ZtsglDEKgpZNwmzolewmUuhVWkGGXFmxsANqi
         NLJXDCQKY0B4zgx7z/KEBuGizrwgL7NwkCReafutw/1uI780NhwaUmvQwuh/+o+AlTy8
         LqYSyPjPP27VGI6l5DsFdKin7Lg7U0ss1uxAqWgZY9a7DRgjIo9DzsBO9HEtfV76CXEl
         n+iydlZR/XwVZlKjQgsIjcU3uqs/PXR1YQlW5VrxoKMWSncNKpAfC16L0IyWBZKEw3S1
         KyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509434; x=1784114234;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oa7fPfTLrqATXrUG+iEmxKYrrfJwkIFA1yEt/SnN4AI=;
        b=Qj3LrNQkmFHAcXsf0ZvNx8UMy37KEqOCgvmYu4i5uhxTIWvEdvQHERvyyPfRrc0q9/
         htQMMzKC/wzZJ6MfRhZLeLr9/nKr2W8ZZFMDSTYBA9zfydMk11JQ0SoMsIoOPxqaNp8S
         z7qONK45pI6w4LHWYJNjGt83njICkRsEKp6YbOWSQ8J64KpStwhGrqLqkXYQZdymLTW9
         QLIQvCwIUH2IekbJkkw9WPjJ2daG8q9Hm1F/qBcjeMV992QHofV+FAGgI7QNjohl+JU8
         4n6NTThbjoG13+NXAqnSYBXilc4UeJMuauOx10dgahlc6+qpYoBgk7zgsCDQJDnBHfKI
         dlXw==
X-Forwarded-Encrypted: i=1; AHgh+RqAw/ZNBrWGGDRPqUl2qlan/tTiStyfArcvHP/0hjh+iYJ2FbQECcP0rDlzoHe34cLv7zVsjxgVPN14Du1C31Gwlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25fQ3WOolDjpFscEvZ0VckWX7AMsPBLt5sgi52CEwk4zdkLxV
	Rel+FqOwWcUZ7hxUlBHYxWH6ouXcrO/jrrxV+Ff6qP9+UwXk0tUhucgekb3lqRWtXPg=
X-Gm-Gg: AfdE7cnGrbHTS6LmVj6ldP4FXIAReMvkPgF7ZGYznAvjyKxt8ejDRNxmxVKhLQ/amR5
	ZaCggNuQGtQgmkdExt6HE1F0RmRTbB595itigPAI1Q0BVWifXXq5EscJwO9WfhSX860rSBgXEVw
	bsdbkJmjg5lwZq9mOJL5mXxPWu4gzNI+KtL3RvEkbU9C8EY/qIimntTuBEzkTicujGISuqL1bJk
	iK26ZMqcNa55EQOxT6QxOodpKe7znnpNgf1CgRG0W4G/9mYVJfnLW6MoyURKZlgLPDjv3nuualO
	uuCJ0RZpcCARdc595TFiQOcDLXDhYnirAJtowiroAbMiXoF1ByIacfxyQWJpxBvwwEgnUjSUjAH
	xJezjfDq+rDsWOtZ7jXGHcbCcvJTsGha1LqgB0+O5JRyoNzZhuF4CQCzU42URbm0o5W6N3iPGyD
	IQjFr5KzuapEIWUS56UTUOpdV0P6E9t5A/5+1q7bR4Pel40CKLHc/kGC6/AhAzhLH4exIGBUdnp
	cRsZfYyVGM+0C0=
X-Received: by 2002:a05:600c:34c3:b0:493:e79e:daa6 with SMTP id 5b1f17b1804b1-493e79edba5mr18199385e9.33.1783509433260;
        Wed, 08 Jul 2026 04:17:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f5b811sm213906515e9.13.2026.07.08.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Chen-Yu Tsai <wens@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
Date: Wed,  8 Jul 2026 13:15:28 +0200
Message-ID:  <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=54245; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6OQH27AxVr97qhjR0m3VutA3m89/YeqODkw/Z+Z34X0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjGGMN698ww6U2+9wbILOnrDrrCKWnRu91yfC 68gcIS4786JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xhgAKCRCPgPtYfRL+ TjWbB/4qzmj786xEXsez6b0NMsJ1nu/L0LfmuxcFCeW9LT9ej3E/F9UYcr6fvRFu+S5M7YG0P7P lCXR/4UYtw+Z2hp9dCHoE16XNySN39/3elBPK0rjEgzpskBbah5Hm7QpFZhIZoNTDC+KLv2t0xY KXtVmQxIe7w30Y9usmMFuGEpmwAfvgElinND3F2+N+32BMuAHtUDqtindXRUd8BtVicp2Hj3P2R TUIJZa2CfQJhNZ0/yo11TWPylydzboK/baGRUgG2Yg6DGdX0f1KLBJlIW5p5yPR4QTZEdd3xkBv wCoZ/ljJzVsey3MWZ4Pns88UO5P/AG/+acxlzyXrSceFLFmz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34871-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:wens@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:support.opensource@diasemi.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:ckeepax@opensource.cirrus.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:andre.draszik@linaro.org,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefe
 r@gmx.net,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:mazziesaccount@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:patches@opensource.cirrus.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.d
 ev,m:marekvasut@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,broadcom.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,linaro.org,samsung.com,gateworks.com,jannau.net,gompa.dev,collabora.com,nxp.com,pengutronix.de,gmx.net,iki.fi,kemnade.info,baylibre.com,atomide.com,linux.alibaba.com,foss.st.com,sholland.org,arm.com,glider.be,lists.linux.dev,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[73];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60A647254C3

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/88pm860x-core.c    |  4 ++--
 drivers/mfd/ab8500-sysctrl.c   |  4 ++--
 drivers/mfd/ac100.c            |  2 +-
 drivers/mfd/act8945a.c         |  4 ++--
 drivers/mfd/altera-a10sr.c     |  2 +-
 drivers/mfd/altera-sysmgr.c    |  2 +-
 drivers/mfd/arizona-i2c.c      |  2 +-
 drivers/mfd/arizona-spi.c      |  2 +-
 drivers/mfd/as3711.c           |  4 ++--
 drivers/mfd/as3722.c           |  4 ++--
 drivers/mfd/atmel-hlcdc.c      |  2 +-
 drivers/mfd/atmel-smc.c        |  2 +-
 drivers/mfd/axp20x-i2c.c       |  2 +-
 drivers/mfd/axp20x-rsb.c       |  2 +-
 drivers/mfd/bcm2835-pm.c       |  4 ++--
 drivers/mfd/bd9571mwv.c        |  4 ++--
 drivers/mfd/bq257xx.c          |  2 +-
 drivers/mfd/cs40l50-i2c.c      |  2 +-
 drivers/mfd/cs40l50-spi.c      |  2 +-
 drivers/mfd/cs42l43-i2c.c      |  2 +-
 drivers/mfd/da9063-i2c.c       |  5 +++--
 drivers/mfd/da9150-core.c      |  2 +-
 drivers/mfd/db8500-prcmu.c     |  4 ++--
 drivers/mfd/exynos-lpass.c     |  2 +-
 drivers/mfd/gateworks-gsc.c    |  2 +-
 drivers/mfd/hi6421-pmic-core.c |  6 +++---
 drivers/mfd/hi655x-pmic.c      |  4 ++--
 drivers/mfd/khadas-mcu.c       |  4 ++--
 drivers/mfd/lochnagar-i2c.c    |  2 +-
 drivers/mfd/lp3943.c           |  2 +-
 drivers/mfd/lp873x.c           |  2 +-
 drivers/mfd/lp87565.c          |  2 +-
 drivers/mfd/macsmc.c           |  2 +-
 drivers/mfd/madera-core.c      |  2 +-
 drivers/mfd/max7360.c          |  2 +-
 drivers/mfd/max77686.c         |  2 +-
 drivers/mfd/max77714.c         |  2 +-
 drivers/mfd/max77759.c         |  2 +-
 drivers/mfd/max77843.c         |  4 ++--
 drivers/mfd/max8907.c          |  2 +-
 drivers/mfd/max8925-i2c.c      |  2 +-
 drivers/mfd/max8997.c          |  2 +-
 drivers/mfd/max8998.c          |  2 +-
 drivers/mfd/mc13xxx-spi.c      |  6 +++---
 drivers/mfd/motorola-cpcap.c   |  6 +++---
 drivers/mfd/mp2629.c           |  2 +-
 drivers/mfd/mt6360-core.c      |  4 ++--
 drivers/mfd/mt6370.c           |  2 +-
 drivers/mfd/mxs-lradc.c        |  4 ++--
 drivers/mfd/ntxec.c            |  4 ++--
 drivers/mfd/omap-usb-host.c    |  4 ++--
 drivers/mfd/qcom-pm8008.c      |  4 ++--
 drivers/mfd/qcom-pm8xxx.c      |  6 +++---
 drivers/mfd/rk8xx-i2c.c        |  2 +-
 drivers/mfd/rohm-bd71828.c     |  4 ++--
 drivers/mfd/rohm-bd9576.c      |  6 +++---
 drivers/mfd/rsmu_i2c.c         |  2 +-
 drivers/mfd/rt4831.c           |  4 ++--
 drivers/mfd/rt5033.c           |  2 +-
 drivers/mfd/rz-mtu3.c          |  2 +-
 drivers/mfd/sec-acpm.c         |  6 +++---
 drivers/mfd/sec-i2c.c          | 22 +++++++++++-----------
 drivers/mfd/simple-mfd-i2c.c   |  2 +-
 drivers/mfd/sky81452.c         |  2 +-
 drivers/mfd/sm501.c            |  2 +-
 drivers/mfd/smpro-core.c       |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c  |  2 +-
 drivers/mfd/ssbi.c             |  2 +-
 drivers/mfd/stm32-lptimer.c    |  4 ++--
 drivers/mfd/stm32-timers.c     |  4 ++--
 drivers/mfd/stmfx.c            |  4 ++--
 drivers/mfd/stmpe-i2c.c        | 18 +++++++++---------
 drivers/mfd/stmpe-spi.c        | 14 +++++++-------
 drivers/mfd/stw481x.c          |  6 +++---
 drivers/mfd/sun6i-prcm.c       |  2 +-
 drivers/mfd/tps6105x.c         |  2 +-
 drivers/mfd/tps6507x.c         |  4 ++--
 drivers/mfd/tps65086.c         |  2 +-
 drivers/mfd/tps65090.c         |  4 ++--
 drivers/mfd/tps65217.c         |  4 ++--
 drivers/mfd/tps65218.c         |  4 ++--
 drivers/mfd/tps65219.c         |  8 ++++----
 drivers/mfd/tps6586x.c         |  4 ++--
 drivers/mfd/tps65910.c         |  6 +++---
 drivers/mfd/tps65912-i2c.c     |  2 +-
 drivers/mfd/tps65912-spi.c     |  2 +-
 drivers/mfd/tps6594-i2c.c      | 12 ++++++------
 drivers/mfd/tps6594-spi.c      | 12 ++++++------
 drivers/mfd/twl4030-audio.c    |  4 ++--
 drivers/mfd/twl4030-power.c    |  2 +-
 drivers/mfd/twl6030-irq.c      |  2 +-
 drivers/mfd/vexpress-sysreg.c  |  4 ++--
 drivers/mfd/wm831x-core.c      |  2 +-
 93 files changed, 176 insertions(+), 175 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index d3c24a7a3936..2bde245fc89e 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1238,8 +1238,8 @@ static const struct i2c_device_id pm860x_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, pm860x_id_table);
 
 static const struct of_device_id pm860x_dt_ids[] = {
-	{ .compatible = "marvell,88pm860x", },
-	{},
+	{ .compatible = "marvell,88pm860x" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pm860x_dt_ids);
 
diff --git a/drivers/mfd/ab8500-sysctrl.c b/drivers/mfd/ab8500-sysctrl.c
index b6b44e2e3198..e4a7d864e254 100644
--- a/drivers/mfd/ab8500-sysctrl.c
+++ b/drivers/mfd/ab8500-sysctrl.c
@@ -149,8 +149,8 @@ static void ab8500_sysctrl_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ab8500_sysctrl_match[] = {
-	{ .compatible = "stericsson,ab8500-sysctrl", },
-	{}
+	{ .compatible = "stericsson,ab8500-sysctrl" },
+	{ }
 };
 
 static struct platform_driver ab8500_sysctrl_driver = {
diff --git a/drivers/mfd/ac100.c b/drivers/mfd/ac100.c
index 8f47c392cbd1..a22e3ce7d484 100644
--- a/drivers/mfd/ac100.c
+++ b/drivers/mfd/ac100.c
@@ -116,7 +116,7 @@ static int ac100_rsb_probe(struct sunxi_rsb_device *rdev)
 
 static const struct of_device_id ac100_of_match[] = {
 	{ .compatible = "x-powers,ac100" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ac100_of_match);
 
diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c
index e5fba40f89d4..31b46d032363 100644
--- a/drivers/mfd/act8945a.c
+++ b/drivers/mfd/act8945a.c
@@ -60,8 +60,8 @@ static const struct i2c_device_id act8945a_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
 
 static const struct of_device_id act8945a_of_match[] = {
-	{ .compatible = "active-semi,act8945a", },
-	{},
+	{ .compatible = "active-semi,act8945a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, act8945a_of_match);
 
diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
index d53e433ab5c1..260e590b87b1 100644
--- a/drivers/mfd/altera-a10sr.c
+++ b/drivers/mfd/altera-a10sr.c
@@ -149,7 +149,7 @@ static int altr_a10sr_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id altr_a10sr_spi_of_match[] = {
 	{ .compatible = "altr,a10sr" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, altr_a10sr_spi_of_match);
 
diff --git a/drivers/mfd/altera-sysmgr.c b/drivers/mfd/altera-sysmgr.c
index 90c6902d537d..a9b9164b3651 100644
--- a/drivers/mfd/altera-sysmgr.c
+++ b/drivers/mfd/altera-sysmgr.c
@@ -175,7 +175,7 @@ static int sysmgr_probe(struct platform_device *pdev)
 static const struct of_device_id altr_sysmgr_of_match[] = {
 	{ .compatible = "altr,sys-mgr" },
 	{ .compatible = "altr,sys-mgr-s10" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, altr_sysmgr_of_match);
 
diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
index 1ea8a59948b6..763d9c1bd0ed 100644
--- a/drivers/mfd/arizona-i2c.c
+++ b/drivers/mfd/arizona-i2c.c
@@ -103,7 +103,7 @@ static const struct of_device_id arizona_i2c_of_match[] = {
 	{ .compatible = "wlf,wm8997", .data = (void *)WM8997 },
 	{ .compatible = "wlf,wm8998", .data = (void *)WM8998 },
 	{ .compatible = "wlf,wm1814", .data = (void *)WM1814 },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, arizona_i2c_of_match);
 #endif
diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index bbf520bd2eda..c4ee5b499fce 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -271,7 +271,7 @@ static const struct of_device_id arizona_spi_of_match[] = {
 	{ .compatible = "wlf,wm8280", .data = (void *)WM8280 },
 	{ .compatible = "wlf,wm1831", .data = (void *)WM1831 },
 	{ .compatible = "cirrus,cs47l24", .data = (void *)CS47L24 },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, arizona_spi_of_match);
 #endif
diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 6d2fa63e7f4b..6301b09585ba 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -111,8 +111,8 @@ static const struct regmap_config as3711_regmap_config = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id as3711_of_match[] = {
-	{.compatible = "ams,as3711",},
-	{}
+	{ .compatible = "ams,as3711" },
+	{ }
 };
 #endif
 
diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index ec7be5fb326e..bf2564836553 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -426,8 +426,8 @@ static int __maybe_unused as3722_i2c_resume(struct device *dev)
 }
 
 static const struct of_device_id as3722_of_match[] = {
-	{ .compatible = "ams,as3722", },
-	{},
+	{ .compatible = "ams,as3722" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, as3722_of_match);
 
diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 2a3a05122176..64f64736d819 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -149,7 +149,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
 	{ .compatible = "microchip,sam9x60-hlcdc" },
 	{ .compatible = "microchip,sam9x75-xlcdc" },
 	{ .compatible = "microchip,sama7d65-xlcdc" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);
 
diff --git a/drivers/mfd/atmel-smc.c b/drivers/mfd/atmel-smc.c
index e69be61511a4..94d03a5e2207 100644
--- a/drivers/mfd/atmel-smc.c
+++ b/drivers/mfd/atmel-smc.c
@@ -333,7 +333,7 @@ static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
 	{ .compatible = "atmel,at91sam9260-smc", .data = NULL },
 	{ .compatible = "atmel,sama5d3-smc", .data = &sama5d3_reg_layout },
 	{ .compatible = "atmel,sama5d2-smc", .data = &sama5d2_reg_layout },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 /**
diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 57695e46e00e..9754181bf53b 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -70,7 +70,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
 	{ .compatible = "x-powers,axp806", .data = (void *)AXP806_ID },
 	{ .compatible = "x-powers,axp15060", .data = (void *)AXP15060_ID },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index 059656f2a1bd..7fe71520d5dc 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -63,7 +63,7 @@ static const struct of_device_id axp20x_rsb_of_match[] = {
 	{ .compatible = "x-powers,axp806", .data = (void *)AXP806_ID },
 	{ .compatible = "x-powers,axp809", .data = (void *)AXP809_ID },
 	{ .compatible = "x-powers,axp813", .data = (void *)AXP813_ID },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, axp20x_rsb_of_match);
 
diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 87de35075419..d812a62a05f7 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -113,11 +113,11 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id bcm2835_pm_of_match[] = {
-	{ .compatible = "brcm,bcm2835-pm-wdt", },
+	{ .compatible = "brcm,bcm2835-pm-wdt" },
 	{ .compatible = "brcm,bcm2835-pm", .data = (void *)BCM2835_PM_SOC_BCM2835 },
 	{ .compatible = "brcm,bcm2711-pm", .data = (void *)BCM2835_PM_SOC_BCM2711 },
 	{ .compatible = "brcm,bcm2712-pm", .data = (void *)BCM2835_PM_SOC_BCM2712 },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm2835_pm_of_match);
 
diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 2b6fe6fd9806..76ccca5ffbf8 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -261,8 +261,8 @@ static int bd9571mwv_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id bd9571mwv_of_match_table[] = {
-	{ .compatible = "rohm,bd9571mwv", },
-	{ .compatible = "rohm,bd9574mwf", },
+	{ .compatible = "rohm,bd9571mwv" },
+	{ .compatible = "rohm,bd9574mwf" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
index 182d67f23f60..6c0bbca5b97e 100644
--- a/drivers/mfd/bq257xx.c
+++ b/drivers/mfd/bq257xx.c
@@ -128,7 +128,7 @@ MODULE_DEVICE_TABLE(i2c, bq257xx_i2c_ids);
 static const struct of_device_id bq257xx_of_match[] = {
 	{ .compatible = "ti,bq25703a", .data = (void *)BQ25703A },
 	{ .compatible = "ti,bq25792", .data = (void *)BQ25792 },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bq257xx_of_match);
 
diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
index b61b0484644d..7d2455d95275 100644
--- a/drivers/mfd/cs40l50-i2c.c
+++ b/drivers/mfd/cs40l50-i2c.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
 
 static const struct of_device_id cs40l50_of_match[] = {
 	{ .compatible = "cirrus,cs40l50" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, cs40l50_of_match);
 
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
index 2d8f0dce3494..c273bc98e7f8 100644
--- a/drivers/mfd/cs40l50-spi.c
+++ b/drivers/mfd/cs40l50-spi.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
 
 static const struct of_device_id cs40l50_of_match[] = {
 	{ .compatible = "cirrus,cs40l50" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, cs40l50_of_match);
 
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 6a4e4ddeb268..a8e5a62e2b10 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -58,7 +58,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 static const struct of_device_id cs42l43_of_match[] = {
 	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
 	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 #endif
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 068f080d1f9b..a24fd751f343 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -361,11 +361,12 @@ static struct regmap_config da9063_regmap_config = {
 };
 
 static const struct of_device_id da9063_dt_ids[] = {
-	{ .compatible = "dlg,da9063", },
-	{ .compatible = "dlg,da9063l", },
+	{ .compatible = "dlg,da9063" },
+	{ .compatible = "dlg,da9063l" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da9063_dt_ids);
+
 static int da9063_i2c_probe(struct i2c_client *i2c)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index ab2335b73a63..e3fbf36a71fb 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -500,7 +500,7 @@ static const struct i2c_device_id da9150_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, da9150_i2c_id);
 
 static const struct of_device_id da9150_of_match[] = {
-	{ .compatible = "dlg,da9150", },
+	{ .compatible = "dlg,da9150" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da9150_of_match);
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 21e68a382b11..eb281062e016 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -3073,8 +3073,8 @@ static int db8500_prcmu_probe(struct platform_device *pdev)
 	return err;
 }
 static const struct of_device_id db8500_prcmu_match[] = {
-	{ .compatible = "stericsson,db8500-prcmu"},
-	{ },
+	{ .compatible = "stericsson,db8500-prcmu" },
+	{ }
 };
 
 static struct platform_driver db8500_prcmu_driver = {
diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 9bb2687c2835..7e3201e4c9b4 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -177,7 +177,7 @@ static const struct dev_pm_ops lpass_pm_ops = {
 
 static const struct of_device_id exynos_lpass_of_match[] = {
 	{ .compatible = "samsung,exynos5433-lpass" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, exynos_lpass_of_match);
 
diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index a3301502ce6a..6e561403f509 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -155,7 +155,7 @@ static struct attribute_group attr_group = {
 };
 
 static const struct of_device_id gsc_of_match[] = {
-	{ .compatible = "gw,gsc", },
+	{ .compatible = "gw,gsc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gsc_of_match);
diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
index 5af24a438329..b20cc2c956e7 100644
--- a/drivers/mfd/hi6421-pmic-core.c
+++ b/drivers/mfd/hi6421-pmic-core.c
@@ -38,13 +38,13 @@ static const struct regmap_config hi6421_regmap_config = {
 static const struct of_device_id of_hi6421_pmic_match[] = {
 	{
 		.compatible = "hisilicon,hi6421-pmic",
-		.data = (void *)HI6421
+		.data = (void *)HI6421,
 	},
 	{
 		.compatible = "hisilicon,hi6421v530-pmic",
-		.data = (void *)HI6421_V530
+		.data = (void *)HI6421_V530,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_hi6421_pmic_match);
 
diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
index 5cb392892c19..c6625d61b3ef 100644
--- a/drivers/mfd/hi655x-pmic.c
+++ b/drivers/mfd/hi655x-pmic.c
@@ -152,8 +152,8 @@ static void hi655x_pmic_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id hi655x_pmic_match[] = {
-	{ .compatible = "hisilicon,hi655x-pmic", },
-	{},
+	{ .compatible = "hisilicon,hi655x-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hi655x_pmic_match);
 
diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a788692..cda31b1bc601 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -123,8 +123,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 #ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
-	{ .compatible = "khadas,mcu", },
-	{},
+	{ .compatible = "khadas,mcu" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
 #endif
diff --git a/drivers/mfd/lochnagar-i2c.c b/drivers/mfd/lochnagar-i2c.c
index 9d60a42745fc..24c609ebc2b0 100644
--- a/drivers/mfd/lochnagar-i2c.c
+++ b/drivers/mfd/lochnagar-i2c.c
@@ -200,7 +200,7 @@ static struct lochnagar_config lochnagar_configs[] = {
 static const struct of_device_id lochnagar_of_match[] = {
 	{ .compatible = "cirrus,lochnagar1", .data = &lochnagar_configs[0] },
 	{ .compatible = "cirrus,lochnagar2", .data = &lochnagar_configs[1] },
-	{},
+	{ }
 };
 
 static int lochnagar_wait_for_boot(struct regmap *regmap, unsigned int *id)
diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
index 503615a8d420..18c27cdab615 100644
--- a/drivers/mfd/lp3943.c
+++ b/drivers/mfd/lp3943.c
@@ -133,7 +133,7 @@ MODULE_DEVICE_TABLE(i2c, lp3943_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id lp3943_of_match[] = {
-	{ .compatible = "ti,lp3943", },
+	{ .compatible = "ti,lp3943" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lp3943_of_match);
diff --git a/drivers/mfd/lp873x.c b/drivers/mfd/lp873x.c
index 46444696f2f4..8184048d3341 100644
--- a/drivers/mfd/lp873x.c
+++ b/drivers/mfd/lp873x.c
@@ -62,7 +62,7 @@ static int lp873x_probe(struct i2c_client *client)
 static const struct of_device_id of_lp873x_match_table[] = {
 	{ .compatible = "ti,lp8733", },
 	{ .compatible = "ti,lp8732", },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_lp873x_match_table);
 
diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 14e80588efac..543d5423da99 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -42,7 +42,7 @@ static const struct of_device_id of_lp87565_match_table[] = {
 		.compatible = "ti,lp87561-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87561_Q1,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_lp87565_match_table);
 
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 358feec2d088..9927d08566c7 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -485,7 +485,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 static const struct of_device_id apple_smc_of_match[] = {
 	{ .compatible = "apple,t8103-smc" },
 	{ .compatible = "apple,smc" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, apple_smc_of_match);
 
diff --git a/drivers/mfd/madera-core.c b/drivers/mfd/madera-core.c
index 2f74a8c644a3..2d74b4511a8f 100644
--- a/drivers/mfd/madera-core.c
+++ b/drivers/mfd/madera-core.c
@@ -381,7 +381,7 @@ const struct of_device_id madera_of_match[] = {
 	{ .compatible = "cirrus,cs47l92", .data = (void *)CS47L92 },
 	{ .compatible = "cirrus,cs47l93", .data = (void *)CS47L93 },
 	{ .compatible = "cirrus,wm1840", .data = (void *)WM1840 },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, madera_of_match);
 EXPORT_SYMBOL_GPL(madera_of_match);
diff --git a/drivers/mfd/max7360.c b/drivers/mfd/max7360.c
index 52fffed0c0dd..dc744b40bb38 100644
--- a/drivers/mfd/max7360.c
+++ b/drivers/mfd/max7360.c
@@ -152,7 +152,7 @@ static int max7360_probe(struct i2c_client *client)
 
 static const struct of_device_id max7360_dt_match[] = {
 	{ .compatible = "maxim,max7360" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, max7360_dt_match);
 
diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 0118a444a68b..e8983236c1e8 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -153,7 +153,7 @@ static const struct of_device_id max77686_pmic_dt_match[] = {
 		.compatible = "maxim,max77802",
 		.data = (void *)TYPE_MAX77802,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, max77686_pmic_dt_match);
 
diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
index c618605a3fb2..353f657da879 100644
--- a/drivers/mfd/max77714.c
+++ b/drivers/mfd/max77714.c
@@ -134,7 +134,7 @@ static int max77714_probe(struct i2c_client *client)
 
 static const struct of_device_id max77714_dt_match[] = {
 	{ .compatible = "maxim,max77714" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, max77714_dt_match);
 
diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 2347eb0b014b..5833b267419f 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -718,7 +718,7 @@ static const struct i2c_device_id max77759_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
 
 static const struct of_device_id max77759_of_id[] = {
-	{ .compatible = "maxim,max77759", },
+	{ .compatible = "maxim,max77759" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max77759_of_id);
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index c1cbf1f88b15..0d0bb56a91e5 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -164,8 +164,8 @@ static int max77843_probe(struct i2c_client *i2c)
 }
 
 static const struct of_device_id max77843_dt_match[] = {
-	{ .compatible = "maxim,max77843", },
-	{ },
+	{ .compatible = "maxim,max77843" },
+	{ }
 };
 
 static const struct i2c_device_id max77843_id[] = {
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 6e2fed7021a8..c0d185f13de6 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -294,7 +294,7 @@ static void max8907_i2c_remove(struct i2c_client *i2c)
 #ifdef CONFIG_OF
 static const struct of_device_id max8907_of_match[] = {
 	{ .compatible = "maxim,max8907" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, max8907_of_match);
 #endif
diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index 25390d0eabd4..8d618b127f4d 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -231,7 +231,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max8925_pm_ops,
 
 static const struct of_device_id max8925_dt_ids[] = {
 	{ .compatible = "maxim,max8925", },
-	{},
+	{ }
 };
 
 static struct i2c_driver max8925_driver = {
diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 6edc18e0eebb..04e44174fd8d 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -39,7 +39,7 @@ static const struct mfd_cell max8997_devs[] = {
 #ifdef CONFIG_OF
 static const struct of_device_id max8997_pmic_dt_match[] = {
 	{ .compatible = "maxim,max8997-pmic", .data = (void *)TYPE_MAX8997 },
-	{},
+	{ }
 };
 #endif
 
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index e93a5ffc9612..8d1df69a3158 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -120,7 +120,7 @@ static const struct of_device_id max8998_dt_match[] = {
 	{ .compatible = "maxim,max8998", .data = (void *)TYPE_MAX8998 },
 	{ .compatible = "national,lp3974", .data = (void *)TYPE_LP3974 },
 	{ .compatible = "ti,lp3974", .data = (void *)TYPE_LP3974 },
-	{},
+	{ }
 };
 #endif
 
diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index 56d2e57b7d73..009350aac28f 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -35,9 +35,9 @@ static const struct spi_device_id mc13xxx_device_id[] = {
 MODULE_DEVICE_TABLE(spi, mc13xxx_device_id);
 
 static const struct of_device_id mc13xxx_dt_ids[] = {
-	{ .compatible = "fsl,mc13783", .data = &mc13xxx_variant_mc13783, },
-	{ .compatible = "fsl,mc13892", .data = &mc13xxx_variant_mc13892, },
-	{ .compatible = "fsl,mc34708", .data = &mc13xxx_variant_mc34708, },
+	{ .compatible = "fsl,mc13783", .data = &mc13xxx_variant_mc13783 },
+	{ .compatible = "fsl,mc13892", .data = &mc13xxx_variant_mc13892 },
+	{ .compatible = "fsl,mc34708", .data = &mc13xxx_variant_mc34708 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mc13xxx_dt_ids);
diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index feeccb2c6655..eab96299bc72 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -195,9 +195,9 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
 }
 
 static const struct of_device_id cpcap_of_match[] = {
-	{ .compatible = "motorola,cpcap", },
-	{ .compatible = "st,6556002", },
-	{},
+	{ .compatible = "motorola,cpcap" },
+	{ .compatible = "st,6556002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
 
diff --git a/drivers/mfd/mp2629.c b/drivers/mfd/mp2629.c
index 717b704c3c6b..2634588a284a 100644
--- a/drivers/mfd/mp2629.c
+++ b/drivers/mfd/mp2629.c
@@ -60,7 +60,7 @@ static int mp2629_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id mp2629_of_match[] = {
-	{ .compatible = "mps,mp2629"},
+	{ .compatible = "mps,mp2629" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mp2629_of_match);
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 254b00c905b7..31907e2e388c 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -607,8 +607,8 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
 static const struct of_device_id mt6360_of_id[] = {
-	{ .compatible = "mediatek,mt6360", },
-	{},
+	{ .compatible = "mediatek,mt6360" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6360_of_id);
 
diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
index c7c2efe3598c..a7e5808b98ab 100644
--- a/drivers/mfd/mt6370.c
+++ b/drivers/mfd/mt6370.c
@@ -294,7 +294,7 @@ static int mt6370_probe(struct i2c_client *i2c)
 
 static const struct of_device_id mt6370_match_table[] = {
 	{ .compatible = "mediatek,mt6370" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6370_match_table);
 
diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 64afc7631790..e407bf1d74cf 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -117,8 +117,8 @@ static struct mfd_cell mx28_cells[] = {
 };
 
 static const struct of_device_id mxs_lradc_dt_ids[] = {
-	{ .compatible = "fsl,imx23-lradc", .data = (void *)IMX23_LRADC, },
-	{ .compatible = "fsl,imx28-lradc", .data = (void *)IMX28_LRADC, },
+	{ .compatible = "fsl,imx23-lradc", .data = (void *)IMX23_LRADC },
+	{ .compatible = "fsl,imx28-lradc", .data = (void *)IMX28_LRADC },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_lradc_dt_ids);
diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
index 08c68de0f01b..a16ca4265c40 100644
--- a/drivers/mfd/ntxec.c
+++ b/drivers/mfd/ntxec.c
@@ -250,8 +250,8 @@ static void ntxec_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id of_ntxec_match_table[] = {
-	{ .compatible = "netronix,ntxec", },
-	{}
+	{ .compatible = "netronix,ntxec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_ntxec_match_table);
 
diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 4d29a6e2ed87..f9aed3fc02ce 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -516,8 +516,8 @@ static int usbhs_omap_get_dt_pdata(struct device *dev,
 }
 
 static const struct of_device_id usbhs_child_match_table[] = {
-	{ .compatible = "ti,ehci-omap", },
-	{ .compatible = "ti,ohci-omap3", },
+	{ .compatible = "ti,ehci-omap" },
+	{ .compatible = "ti,ohci-omap3" },
 	{ }
 };
 
diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..c1d522ecc938 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -261,8 +261,8 @@ static int pm8008_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
-	{ },
+	{ .compatible = "qcom,pm8008" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);
 
diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..7547aecde4e0 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -499,9 +499,9 @@ static const struct pm_irq_data pm8821_data = {
 };
 
 static const struct of_device_id pm8xxx_id_table[] = {
-	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
-	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
-	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},
+	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data },
+	{ .compatible = "qcom,pm8821", .data = &pm8821_data },
+	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
index 2951b2911a37..b09454df9494 100644
--- a/drivers/mfd/rk8xx-i2c.c
+++ b/drivers/mfd/rk8xx-i2c.c
@@ -262,7 +262,7 @@ static const struct of_device_id rk8xx_i2c_of_match[] = {
 	{ .compatible = "rockchip,rk816", .data = &rk816_data },
 	{ .compatible = "rockchip,rk817", .data = &rk817_data },
 	{ .compatible = "rockchip,rk818", .data = &rk818_data },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rk8xx_i2c_of_match);
 
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 5fb6142cf087..8bf8fc0dfcd1 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -1127,8 +1127,8 @@ static const struct of_device_id bd71828_of_match[] = {
 	}, {
 		.compatible = "rohm,bd72720",
 		.data = (void *)ROHM_CHIP_TYPE_BD72720,
-	 },
-	{ },
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bd71828_of_match);
 
diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
index 17323ae39803..eaf30aa3dcca 100644
--- a/drivers/mfd/rohm-bd9576.c
+++ b/drivers/mfd/rohm-bd9576.c
@@ -167,9 +167,9 @@ static int bd957x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct of_device_id bd957x_of_match[] = {
-	{ .compatible = "rohm,bd9576", .data = (void *)ROHM_CHIP_TYPE_BD9576, },
-	{ .compatible = "rohm,bd9573", .data = (void *)ROHM_CHIP_TYPE_BD9573, },
-	{ },
+	{ .compatible = "rohm,bd9576", .data = (void *)ROHM_CHIP_TYPE_BD9576 },
+	{ .compatible = "rohm,bd9573", .data = (void *)ROHM_CHIP_TYPE_BD9573 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bd957x_of_match);
 
diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
index c03db3ce5f12..ae6a83e789db 100644
--- a/drivers/mfd/rsmu_i2c.c
+++ b/drivers/mfd/rsmu_i2c.c
@@ -347,7 +347,7 @@ static const struct of_device_id rsmu_i2c_of_match[] = {
 	{ .compatible = "idt,82p33811", .data = (void *)RSMU_SABRE },
 	{ .compatible = "idt,8v19n850", .data = (void *)RSMU_SL },
 	{ .compatible = "idt,8v19n851", .data = (void *)RSMU_SL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rsmu_i2c_of_match);
 
diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 2b3f84b81c65..06794ced4124 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -99,8 +99,8 @@ static void rt4831_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id rt4831_of_match[] = {
-	{ .compatible = "richtek,rt4831", },
-	{}
+	{ .compatible = "richtek,rt4831" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt4831_of_match);
 
diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index 799661fb1c72..61edc3b5f86e 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -113,7 +113,7 @@ static const struct i2c_device_id rt5033_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt5033_i2c_id);
 
 static const struct of_device_id rt5033_dt_match[] = {
-	{ .compatible = "richtek,rt5033", },
+	{ .compatible = "richtek,rt5033" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5033_dt_match);
diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 0a254e61ec0a..75975808dd64 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -352,7 +352,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rz_mtu3_of_match[] = {
-	{ .compatible = "renesas,rz-mtu3", },
+	{ .compatible = "renesas,rz-mtu3" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rz_mtu3_of_match);
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index d11fbf5b94b7..5c744148554e 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -560,9 +560,9 @@ static const struct sec_pmic_acpm_platform_data s2mpg11_data = {
 };
 
 static const struct of_device_id sec_pmic_acpm_of_match[] = {
-	{ .compatible = "samsung,s2mpg10-pmic", .data = &s2mpg10_data, },
-	{ .compatible = "samsung,s2mpg11-pmic", .data = &s2mpg11_data, },
-	{ },
+	{ .compatible = "samsung,s2mpg10-pmic", .data = &s2mpg10_data },
+	{ .compatible = "samsung,s2mpg11-pmic", .data = &s2mpg11_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_acpm_of_match);
 
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 4eec8f7ceee3..5c614098470f 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -236,17 +236,17 @@ static const struct sec_pmic_i2c_platform_data s5m8767_data = {
 };
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
-	{ .compatible = "samsung,s2dos05", .data = &s2dos05_data, },
-	{ .compatible = "samsung,s2mpa01-pmic", .data = &s2mpa01_data, },
-	{ .compatible = "samsung,s2mps11-pmic", .data = &s2mps11_data, },
-	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data, },
-	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps14_data, },
-	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data, },
-	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data, },
-	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data, },
-	{ .compatible = "samsung,s2mu005-pmic", .data = &s2mu005_data, },
-	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data, },
-	{ },
+	{ .compatible = "samsung,s2dos05", .data = &s2dos05_data },
+	{ .compatible = "samsung,s2mpa01-pmic", .data = &s2mpa01_data },
+	{ .compatible = "samsung,s2mps11-pmic", .data = &s2mps11_data },
+	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data },
+	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps14_data },
+	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data },
+	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data },
+	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data },
+	{ .compatible = "samsung,s2mu005-pmic", .data = &s2mu005_data },
+	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);
 
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index ef3ce4bdf98b..4813faf9fd3e 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -126,7 +126,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705 },
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a },
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1 },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
 
diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
index 8a213176b7cd..7d72b357061d 100644
--- a/drivers/mfd/sky81452.c
+++ b/drivers/mfd/sky81452.c
@@ -66,7 +66,7 @@ MODULE_DEVICE_TABLE(i2c, sky81452_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id sky81452_of_match[] = {
-	{ .compatible = "skyworks,sky81452", },
+	{ .compatible = "skyworks,sky81452" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sky81452_of_match);
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index b5bda477ebfc..c53b5cfd675d 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1656,7 +1656,7 @@ static struct pci_driver sm501_pci_driver = {
 MODULE_ALIAS("platform:sm501");
 
 static const struct of_device_id of_sm501_match_tbl[] = {
-	{ .compatible = "smi,sm501", },
+	{ .compatible = "smi,sm501" },
 	{ /* end */ }
 };
 MODULE_DEVICE_TABLE(of, of_sm501_match_tbl);
diff --git a/drivers/mfd/smpro-core.c b/drivers/mfd/smpro-core.c
index 59d31590c69b..b236e4235cb5 100644
--- a/drivers/mfd/smpro-core.c
+++ b/drivers/mfd/smpro-core.c
@@ -120,7 +120,7 @@ static int smpro_core_probe(struct i2c_client *i2c)
 
 static const struct of_device_id smpro_core_of_match[] = {
 	{ .compatible = "ampere,smpro", .data = &smpro_regmap_config },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, smpro_core_of_match);
 
diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index aa052f646623..11d4aed1d43f 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -287,7 +287,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sprd_pmic_pm_ops,
 static const struct of_device_id sprd_pmic_match[] = {
 	{ .compatible = "sprd,sc2730", .data = (void *)PMIC_TYPE_SC2730 },
 	{ .compatible = "sprd,sc2731", .data = (void *)PMIC_TYPE_SC2731 },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sprd_pmic_match);
 
diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
index 6e7aff6e2746..2797aef48a22 100644
--- a/drivers/mfd/ssbi.c
+++ b/drivers/mfd/ssbi.c
@@ -306,7 +306,7 @@ static int ssbi_probe(struct platform_device *pdev)
 
 static const struct of_device_id ssbi_match_table[] = {
 	{ .compatible = "qcom,ssbi" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ssbi_match_table);
 
diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index 123659178cc2..6518d45e9dd3 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -113,8 +113,8 @@ static int stm32_lptimer_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id stm32_lptimer_of_match[] = {
-	{ .compatible = "st,stm32-lptimer", },
-	{},
+	{ .compatible = "st,stm32-lptimer" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32_lptimer_of_match);
 
diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index b3dbc02aaf79..0e618260f595 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -348,9 +348,9 @@ static void stm32_timers_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id stm32_timers_of_match[] = {
-	{ .compatible = "st,stm32-timers", },
+	{ .compatible = "st,stm32-timers" },
 	{ .compatible = "st,stm32mp25-timers", .data = (void *)STM32MP25_TIM_IPIDR },
-	{ /* end node */ },
+	{ /* end node */ }
 };
 MODULE_DEVICE_TABLE(of, stm32_timers_of_match);
 
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f683fdb6ece6..2c7c5f81c2d7 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -540,8 +540,8 @@ static int stmfx_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(stmfx_dev_pm_ops, stmfx_suspend, stmfx_resume);
 
 static const struct of_device_id stmfx_of_match[] = {
-	{ .compatible = "st,stmfx-0300", },
-	{},
+	{ .compatible = "st,stmfx-0300" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stmfx_of_match);
 
diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 8eee780afa16..5ff9afdb8350 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -54,15 +54,15 @@ static struct stmpe_client_info i2c_ci = {
 };
 
 static const struct of_device_id stmpe_of_match[] = {
-	{ .compatible = "st,stmpe610", .data = (void *)STMPE610, },
-	{ .compatible = "st,stmpe801", .data = (void *)STMPE801, },
-	{ .compatible = "st,stmpe811", .data = (void *)STMPE811, },
-	{ .compatible = "st,stmpe1600", .data = (void *)STMPE1600, },
-	{ .compatible = "st,stmpe1601", .data = (void *)STMPE1601, },
-	{ .compatible = "st,stmpe1801", .data = (void *)STMPE1801, },
-	{ .compatible = "st,stmpe2401", .data = (void *)STMPE2401, },
-	{ .compatible = "st,stmpe2403", .data = (void *)STMPE2403, },
-	{},
+	{ .compatible = "st,stmpe610", .data = (void *)STMPE610 },
+	{ .compatible = "st,stmpe801", .data = (void *)STMPE801 },
+	{ .compatible = "st,stmpe811", .data = (void *)STMPE811 },
+	{ .compatible = "st,stmpe1600", .data = (void *)STMPE1600 },
+	{ .compatible = "st,stmpe1601", .data = (void *)STMPE1601 },
+	{ .compatible = "st,stmpe1801", .data = (void *)STMPE1801 },
+	{ .compatible = "st,stmpe2401", .data = (void *)STMPE2401},
+	{ .compatible = "st,stmpe2403", .data = (void *)STMPE2403 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stmpe_of_match);
 
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 22a3da062dee..7d6dcc9dc5d3 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -110,13 +110,13 @@ static void stmpe_spi_remove(struct spi_device *spi)
 }
 
 static const struct of_device_id stmpe_spi_of_match[] = {
-	{ .compatible = "st,stmpe610", },
-	{ .compatible = "st,stmpe801", },
-	{ .compatible = "st,stmpe811", },
-	{ .compatible = "st,stmpe1601", },
-	{ .compatible = "st,stmpe2401", },
-	{ .compatible = "st,stmpe2403", },
-	{ /* sentinel */ },
+	{ .compatible = "st,stmpe610" },
+	{ .compatible = "st,stmpe801" },
+	{ .compatible = "st,stmpe811" },
+	{ .compatible = "st,stmpe1601" },
+	{ .compatible = "st,stmpe2401" },
+	{ .compatible = "st,stmpe2403" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, stmpe_spi_of_match);
 
diff --git a/drivers/mfd/stw481x.c b/drivers/mfd/stw481x.c
index da1e293d36e9..14f60eed9762 100644
--- a/drivers/mfd/stw481x.c
+++ b/drivers/mfd/stw481x.c
@@ -228,9 +228,9 @@ static const struct i2c_device_id stw481x_id[] = {
 MODULE_DEVICE_TABLE(i2c, stw481x_id);
 
 static const struct of_device_id stw481x_match[] = {
-	{ .compatible = "st,stw4810", },
-	{ .compatible = "st,stw4811", },
-	{ },
+	{ .compatible = "st,stw4810" },
+	{ .compatible = "st,stw4811" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stw481x_match);
 
diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
index ee03db0b8485..a8a168f66fc1 100644
--- a/drivers/mfd/sun6i-prcm.c
+++ b/drivers/mfd/sun6i-prcm.c
@@ -122,7 +122,7 @@ static const struct of_device_id sun6i_prcm_dt_ids[] = {
 		.compatible = "allwinner,sun8i-a23-prcm",
 		.data = &sun8i_a23_prcm_data,
 	},
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int sun6i_prcm_probe(struct platform_device *pdev)
diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 94f5b1a6a923..d486d143288c 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -200,7 +200,7 @@ MODULE_DEVICE_TABLE(i2c, tps6105x_id);
 static const struct of_device_id tps6105x_of_match[] = {
 	{ .compatible = "ti,tps61050" },
 	{ .compatible = "ti,tps61052" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, tps6105x_of_match);
 
diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index ed806754d89f..1d1435a6b9c2 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -110,8 +110,8 @@ MODULE_DEVICE_TABLE(i2c, tps6507x_i2c_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id tps6507x_of_match[] = {
-	{.compatible = "ti,tps6507x", },
-	{},
+	{ .compatible = "ti,tps6507x" },
+	{}
 };
 MODULE_DEVICE_TABLE(of, tps6507x_of_match);
 #endif
diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
index a73e0b5c0982..51dc0acbe781 100644
--- a/drivers/mfd/tps65086.c
+++ b/drivers/mfd/tps65086.c
@@ -57,7 +57,7 @@ static const struct regmap_irq_chip tps65086_irq_chip = {
 };
 
 static const struct of_device_id tps65086_of_match_table[] = {
-	{ .compatible = "ti,tps65086", },
+	{ .compatible = "ti,tps65086" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tps65086_of_match_table);
diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index ae845be3a8ea..ffe3a014b8ad 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -157,8 +157,8 @@ static const struct regmap_config tps65090_regmap_config = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id tps65090_of_match[] = {
-	{ .compatible = "ti,tps65090",},
-	{},
+	{ .compatible = "ti,tps65090" },
+	{ }
 };
 #endif
 
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index cef5cefafea3..a76389f99c0d 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -302,8 +302,8 @@ static const struct regmap_config tps65217_regmap_config = {
 };
 
 static const struct of_device_id tps65217_of_match[] = {
-	{ .compatible = "ti,tps65217"},
-	{ /* sentinel */ },
+	{ .compatible = "ti,tps65217" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tps65217_of_match);
 
diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index d2d39bd7eddd..37aa43a2e29b 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -197,8 +197,8 @@ static const struct regmap_irq_chip tps65218_irq_chip = {
 };
 
 static const struct of_device_id of_tps65218_match_table[] = {
-	{ .compatible = "ti,tps65218", },
-	{}
+	{ .compatible = "ti,tps65218" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_tps65218_match_table);
 
diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index e52fbf1481fe..a63640221397 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -554,10 +554,10 @@ static int tps65219_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id of_tps65219_match_table[] = {
-	{ .compatible = "ti,tps65214", .data = (void *)TPS65214, },
-	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },
-	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
-	{}
+	{ .compatible = "ti,tps65214", .data = (void *)TPS65214 },
+	{ .compatible = "ti,tps65215", .data = (void *)TPS65215 },
+	{ .compatible = "ti,tps65219", .data = (void *)TPS65219 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_tps65219_match_table);
 
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 6fa932cda025..9f0190851969 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -432,8 +432,8 @@ static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *clien
 }
 
 static const struct of_device_id tps6586x_of_match[] = {
-	{ .compatible = "ti,tps6586x", },
-	{ },
+	{ .compatible = "ti,tps6586x" },
+	{ }
 };
 #else
 static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *client)
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index d19bd3643591..488fd879702e 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -366,9 +366,9 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 
 #ifdef CONFIG_OF
 static const struct of_device_id tps65910_of_match[] = {
-	{ .compatible = "ti,tps65910", .data = (void *)TPS65910},
-	{ .compatible = "ti,tps65911", .data = (void *)TPS65911},
-	{ },
+	{ .compatible = "ti,tps65910", .data = (void *)TPS65910 },
+	{ .compatible = "ti,tps65911", .data = (void *)TPS65911 },
+	{ }
 };
 
 static struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
index 3eca8880532e..66978d1ad537 100644
--- a/drivers/mfd/tps65912-i2c.c
+++ b/drivers/mfd/tps65912-i2c.c
@@ -16,7 +16,7 @@
 #include <linux/mfd/tps65912.h>
 
 static const struct of_device_id tps65912_i2c_of_match_table[] = {
-	{ .compatible = "ti,tps65912", },
+	{ .compatible = "ti,tps65912" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tps65912_i2c_of_match_table);
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
index 2442a2e67d67..6eee103887cd 100644
--- a/drivers/mfd/tps65912-spi.c
+++ b/drivers/mfd/tps65912-spi.c
@@ -16,7 +16,7 @@
 #include <linux/mfd/tps65912.h>
 
 static const struct of_device_id tps65912_spi_of_match_table[] = {
-	{ .compatible = "ti,tps65912", },
+	{ .compatible = "ti,tps65912" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tps65912_spi_of_match_table);
diff --git a/drivers/mfd/tps6594-i2c.c b/drivers/mfd/tps6594-i2c.c
index d2269f14f068..a3ad0d61f8de 100644
--- a/drivers/mfd/tps6594-i2c.c
+++ b/drivers/mfd/tps6594-i2c.c
@@ -197,12 +197,12 @@ static struct regmap_config tps6594_i2c_regmap_config = {
 };
 
 static const struct of_device_id tps6594_i2c_of_match_table[] = {
-	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594, },
-	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
-	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
-	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
-	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
-	{}
+	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594 },
+	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593 },
+	{ .compatible = "ti,lp8764-q1", .data = (void *)LP8764  },
+	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224 },
+	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, tps6594_i2c_of_match_table);
 
diff --git a/drivers/mfd/tps6594-spi.c b/drivers/mfd/tps6594-spi.c
index bb95d6b64cb4..e2f6bb69fe60 100644
--- a/drivers/mfd/tps6594-spi.c
+++ b/drivers/mfd/tps6594-spi.c
@@ -82,12 +82,12 @@ static struct regmap_config tps6594_spi_regmap_config = {
 };
 
 static const struct of_device_id tps6594_spi_of_match_table[] = {
-	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594, },
-	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
-	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
-	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
-	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
-	{}
+	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594 },
+	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593 },
+	{ .compatible = "ti,lp8764-q1", .data = (void *)LP8764  },
+	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224 },
+	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, tps6594_spi_of_match_table);
 
diff --git a/drivers/mfd/twl4030-audio.c b/drivers/mfd/twl4030-audio.c
index a4a550bafb3c..96e2a281e7fe 100644
--- a/drivers/mfd/twl4030-audio.c
+++ b/drivers/mfd/twl4030-audio.c
@@ -265,8 +265,8 @@ static void twl4030_audio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id twl4030_audio_of_match[] = {
-	{.compatible = "ti,twl4030-audio", },
-	{ },
+	{ .compatible = "ti,twl4030-audio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, twl4030_audio_of_match);
 
diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index fc1cf316c236..f7fe6fcce891 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -875,7 +875,7 @@ static const struct of_device_id twl4030_power_of_match[] = {
 		.compatible = "ti,twl4030-power-omap3-evm",
 		.data = &omap3_idle_ac_quirk,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, twl4030_power_of_match);
 #endif	/* CONFIG_OF */
diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 4303fb288dd5..b3e9fbeb5acb 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -285,7 +285,7 @@ static const struct irq_domain_ops twl6030_irq_domain_ops = {
 static const struct of_device_id twl6030_of_match[] __maybe_unused = {
 	{ .compatible = "ti,twl6030", .data = &twl6030_interrupt_mapping },
 	{ .compatible = "ti,twl6032", .data = &twl6032_interrupt_mapping },
-	{ },
+	{ }
 };
 
 int twl6030_init_irq(struct device *dev, int irq_num)
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index f49cee91f71c..3de377744aa1 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -142,8 +142,8 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id vexpress_sysreg_match[] = {
-	{ .compatible = "arm,vexpress-sysreg", },
-	{},
+	{ .compatible = "arm,vexpress-sysreg" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, vexpress_sysreg_match);
 
diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..00edac4216e2 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -1445,7 +1445,7 @@ const struct of_device_id wm831x_of_match[] = {
 	{ .compatible = "wlf,wm8321", .data = (void *)WM8321 },
 	{ .compatible = "wlf,wm8325", .data = (void *)WM8325 },
 	{ .compatible = "wlf,wm8326", .data = (void *)WM8326 },
-	{ },
+	{ }
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
-- 
2.55.0.11.g153666a7d9bb


