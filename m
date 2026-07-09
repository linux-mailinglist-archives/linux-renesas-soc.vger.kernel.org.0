Return-Path: <linux-renesas-soc+bounces-34977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id joqDEzvVT2q7owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 19:07:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90605733B18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 19:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Z+h9yZDZ;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F583051A9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 16:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9147339E185;
	Thu,  9 Jul 2026 16:59:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A42D3A60
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 16:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616386; cv=none; b=lMwc8oEQcRP6yMy7qNYHuiwqaoJQnAmFuDBOBpe3MwdNhUoQJXNr6pDn2lT0JvZODWqnLsxKn8eqAr8oBLJl66NE74JVTqjQ7lmFVusBLZ7FW3E5/FB/255H5yLhuVcBuULt9xRvoMcvtO8JgfoTT55F8edORI1sbnVjiADtwfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616386; c=relaxed/simple;
	bh=x7I7jx1xlGkYcQ0g2wKbDdhKkfSw89TrgshWMQXyV+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q/lq7BSwOljNYT9a8EzTSznY2kbVfLeB2vN6H0BrXwufjh0DLcg8N14LHS/DiOW6skXh08cw0vYCgMO7tBg1WjIrQs6f0k0WIYJDvDywS4LYP1XTibq7Pn0BhZZ8+nH3/Kg5/TouBpGJNd0/zaDVcvwouAo7gJtPtfeKjyI+J2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z+h9yZDZ; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47122683cf3so80880f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616382; x=1784221182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
        b=Z+h9yZDZovU+bnsnMg7Z4tTL2FNt+50VBqnoncNPA1puksfAUX/e/kwqMSMBFHGAFm
         94UiPPccms1SbiyBT+FnrtoVVF7DMu963NG3IdGZukyo8jjW46bJMMjl1p08SGFfC2yK
         aMBEd7/cBVbMYFUwLuo0W9+42IZdR3bL4oRvFWhfgsDw6llnVeq/WT4T4lVrFv8SygAW
         HPpx8M2MGug855od/yCptKEP+63qhHvn/IXwy7mfgpFaOE9rsh9Ou2k6bcykx+WUl0Gc
         ddfI0dBfI69BsyQOBOsE2qEQDGorSPWbkVt64mEWKPuHo0niR2sU0JsGuvo28PNuTVEn
         nBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616382; x=1784221182;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
        b=IrUubYdRo5U7oZvzEzX0saKB+LuqYkkhJqc4DNJxQ3zG3AZVJeQx94qdGB5aBEzuUR
         iEkoFJGYlAECddjyCNFrXaYAF35DYYPoMpYnWVamMpWirRyBdnfUlaCwcjK1yivz8oUy
         g58zcZtcDt+o8ol1Eo/UPvvwQzdi8et8SStNmarwHaiIvyRkTSlXsG1cHbWkcwUAS8PF
         Rjk6/EfUix0yKMU9gR2KZrGJIIGrA1RzI1LnHniJ0i9IycRH54mqdssqmMFXkyGZC9Mz
         AxEYgETPDP0AZOgky8hXdX4g2agCss+4mfgTuynPQmnZxTw5u0HX5BbUFRQFo05gJpJA
         uReA==
X-Forwarded-Encrypted: i=1; AHgh+Rp915IQrzmoaxelBXm6+iq8SNYRPCLzBksVuEaa3e5WKgSqaY7Jvf/5n2D/5oLFn1B00g0mgBL9I8iT0sN9aDqZbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJt77YSBppEU4UfpU94h9W0iSvFHxuJzdU1vLVvT+LXJz7ui7q
	RSgKYm1p4Ox9CihpxxUBjEmBDTvUYiOOrEhE0b0OwN9SCAHi9DuQ+JmxbafdwiB4hjE=
X-Gm-Gg: AfdE7cnrGMaCb++m4Dqt3OtW8bXSxo63A94JAwu9VkdGs11okOqEGwuBqSSWm8qtA0I
	Kc9kjc7e3uJwi/Dhyq6jVyecdqXB8Mb86smi2/KTdCKhxoDS+ci2Tk5FaKNlLV57hTC0l4XlOJ1
	sl27xNNbeAU2O5eNPHNL6RyMN3Xp7YXuEpz1r/R1YyD1EPEjq2Xc/F4unMR5dKr/qzKNMppcmXR
	dewiIH9KOv8AGfbF1n0s92Q3FnQm7EuhAi8XHNEyBr0qeXVA32p25nkXBzybqfilp9Hl79qQHrR
	5bGsvjaxAD4BQFiZLv95S44EX+S5tbw5mEBc2d2EFqs2Lu0/m5g6vaOM0Fd1fs8jMG9XqC/MxOR
	PRj/U+m4NcArgidXrXmzbEydIVgLbRtKv/vvYNlcH3oneFzatytjxcEQ+PILzPEDruuNxvEqYyW
	f3gR83ilCUX+IgdTS5Tryq44x110i6JD68p4kaUyBohMfNo08Ji55ovWzK2+aL/n4fGwGzsWxXl
	3oY
X-Received: by 2002:a05:6000:41fe:b0:47d:efd0:c026 with SMTP id ffacd0b85a97d-47df071e085mr8532732f8f.11.1783616382067;
        Thu, 09 Jul 2026 09:59:42 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm53752742f8f.22.2026.07.09.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Heiko Stuebner <heiko@sntech.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v3 00/23] mfd: Use named initializers for arrays of *_device_data
Date: Thu,  9 Jul 2026 18:58:19 +0200
Message-ID: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10849; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x7I7jx1xlGkYcQ0g2wKbDdhKkfSw89TrgshWMQXyV+I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9Mwgnh31BxHKY/FZjAXkPNmcm0bzYeRgOl6T cuiTlTVXeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TMAAKCRCPgPtYfRL+ TjY5B/4trUacM2VOnrdO7ml6L9pBXtZl5zaoNd5/YBFCQiq3bOhzl8d7o4FccdkGs2bFKjHkS4v Z6nqRY6Y5LACAyYQ1lTm6yna4lBkYMK+YNhz7N0wZfXi/wcumQ3qB1NUXcIqrOtVsoWzRjwIVq5 tkwaeRbvvdVgPa9JyKz68aUBkfo78fyZ778y+VJIvkbupkEfBcnfDIGtUaNg3533ZsMq8uHK516 LXGdCz3u66d8ucj/6SA+/se0nKD9+UCjj+SkVZnqkUOKZVXh+Ntr1ZeP+SKzz1RbE/MhXrQh9Ku YordR+qBAJ+oKLXaovmVD5vvRlMmuiNqGroU1DqPj32i9taA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34977-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:mfd@lists.linux.dev,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:zhaoqunqin@loongson.cn,m:linux-crypto@vger.kernel.org,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:colin.foster@in-advantage.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:qipeng.zha@intel.com,m:thomas.richard@bootlin.com,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:yilun.xu@intel.com,m:trix@redhat.com,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,
 m:support.opensource@diasemi.com,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linusw@kernel.org,m:linux@ew.tq-group.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:luca.ceresoli@bootlin.com,m:sravanhome@gmail.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefer@gmx.net,m:mazziesaccount@gmail.com,m:orsonzhai
 @gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:ptyser@xes-inc.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,gmail.com,collabora.com,loongson.cn,chromium.org,in-advantage.com,cirrus.com,opensource.cirrus.com,linux.intel.com,intel.com,bootlin.com,redhat.com,analog.com,kernel.org,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,foss.st.com,st-md-mailman.stormreply.com,ew.tq-group.com,microchip.com,tuxon.dev,gateworks.com,jannau.net,gompa.dev,nxp.com,pengutronix.de,gmx.net,linux.alibaba.com,sholland.org,arm.com,glider.be,sntech.de,xes-inc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[92];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:dkim,baylibre.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90605733B18

Hello,

v2 of this series can be found at
https://lore.kernel.org/lkml/cover.1783507945.git.u.kleine-koenig@baylibre.com
.

The objective for this series is to prepare mfd for changing
of_device_id and the others to make driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it.

Changes since v2:
 - Added the various review tags I received;
 - Sashiko found an issue in patch #3 ("mfd: kempld: Simplify device
   abstraction"). The concern was valid and that made me realize that I
   could simplify that driver even further;
 - For drivers/mfd/rsmu_i2c.c I did a wrong split. In the middle of the
   series the i2c_device_id array lacked the terminator. (Noticed by
   Sashiko);
 - The of_device_id changes were done by hand for v2, I created a script
   for that now and catched a few more issues (pointed out by Sashiko);
 - trivially rebased to next-20260708, no changes introduced by that;

Sashiko identifyed a bunch of preexisting issues, that I didn't address.
These are better handled by someone having the hardware I guess.

Andy suggested splitting patch #18 ("mfd: Unify style of acpi_device_id
arrays") into one for the pmic drivers and then one per driver. I didn't
do that as it seems arbitrary to me. Lee, please voice your preference
if you disagree with the patch separation here.

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
 drivers/mfd/88pm860x-core.c           |  8 +--
 drivers/mfd/aat2870-core.c            |  2 +-
 drivers/mfd/ab8500-core.c             |  8 +--
 drivers/mfd/ab8500-sysctrl.c          |  4 +-
 drivers/mfd/ac100.c                   |  2 +-
 drivers/mfd/act8945a.c                |  8 +--
 drivers/mfd/adp5520.c                 |  4 +-
 drivers/mfd/altera-a10sr.c            |  4 +-
 drivers/mfd/altera-sysmgr.c           |  2 +-
 drivers/mfd/arizona-i2c.c             | 14 +++---
 drivers/mfd/arizona-spi.c             | 14 +++---
 drivers/mfd/as3711.c                  |  8 +--
 drivers/mfd/as3722.c                  |  8 +--
 drivers/mfd/atmel-hlcdc.c             |  2 +-
 drivers/mfd/atmel-smc.c               |  2 +-
 drivers/mfd/axp20x-i2c.c              | 26 +++++-----
 drivers/mfd/axp20x-rsb.c              |  2 +-
 drivers/mfd/bcm2835-pm.c              | 15 ++++--
 drivers/mfd/bcm590xx.c                |  4 +-
 drivers/mfd/bd9571mwv.c               |  6 +--
 drivers/mfd/bq257xx.c                 |  8 +--
 drivers/mfd/cgbc-core.c               |  2 +-
 drivers/mfd/cros_ec_dev.c             |  2 +-
 drivers/mfd/cs40l50-i2c.c             |  6 +--
 drivers/mfd/cs40l50-spi.c             |  6 +--
 drivers/mfd/cs42l43-i2c.c             |  8 +--
 drivers/mfd/cs5535-mfd.c              |  2 +-
 drivers/mfd/da903x.c                  |  6 +--
 drivers/mfd/da9052-i2c.c              | 12 ++---
 drivers/mfd/da9052-spi.c              | 12 ++---
 drivers/mfd/da9055-i2c.c              |  4 +-
 drivers/mfd/da9062-core.c             |  4 +-
 drivers/mfd/da9063-i2c.c              | 11 +++--
 drivers/mfd/da9150-core.c             |  4 +-
 drivers/mfd/db8500-prcmu.c            |  4 +-
 drivers/mfd/exynos-lpass.c            |  2 +-
 drivers/mfd/gateworks-gsc.c           |  2 +-
 drivers/mfd/hi6421-pmic-core.c        |  6 +--
 drivers/mfd/hi655x-pmic.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++-----------
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
 drivers/mfd/janz-cmodio.c             | 14 +++---
 drivers/mfd/kempld-core.c             | 70 ++++++++-------------------
 drivers/mfd/khadas-mcu.c              |  4 +-
 drivers/mfd/lm3533-core.c             |  2 +-
 drivers/mfd/lochnagar-i2c.c           |  2 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/lp3943.c                  |  4 +-
 drivers/mfd/lp873x.c                  |  8 +--
 drivers/mfd/lp87565.c                 |  9 ++--
 drivers/mfd/lp8788.c                  |  2 +-
 drivers/mfd/lpc_ich.c                 |  2 +-
 drivers/mfd/macsmc.c                  |  2 +-
 drivers/mfd/madera-core.c             |  2 +-
 drivers/mfd/madera-i2c.c              | 18 +++----
 drivers/mfd/madera-spi.c              | 18 +++----
 drivers/mfd/max14577.c                |  6 +--
 drivers/mfd/max7360.c                 |  2 +-
 drivers/mfd/max77541.c                |  4 +-
 drivers/mfd/max77620.c                |  8 +--
 drivers/mfd/max77686.c                |  2 +-
 drivers/mfd/max77693.c                |  4 +-
 drivers/mfd/max77714.c                |  2 +-
 drivers/mfd/max77759.c                |  4 +-
 drivers/mfd/max77843.c                |  8 +--
 drivers/mfd/max8907.c                 |  6 +--
 drivers/mfd/max8925-i2c.c             |  6 +--
 drivers/mfd/max8997.c                 |  6 +--
 drivers/mfd/max8998.c                 |  6 +--
 drivers/mfd/mc13xxx-spi.c             |  6 +--
 drivers/mfd/menelaus.c                |  2 +-
 drivers/mfd/menf21bmc.c               |  2 +-
 drivers/mfd/motorola-cpcap.c          | 12 ++---
 drivers/mfd/mp2629.c                  |  2 +-
 drivers/mfd/mt6360-core.c             |  6 +--
 drivers/mfd/mt6370.c                  |  2 +-
 drivers/mfd/mt6397-core.c             |  4 +-
 drivers/mfd/mxs-lradc.c               |  4 +-
 drivers/mfd/ntxec.c                   |  4 +-
 drivers/mfd/ocelot-spi.c              |  2 +-
 drivers/mfd/omap-usb-host.c           |  4 +-
 drivers/mfd/palmas.c                  |  8 +--
 drivers/mfd/pf1550.c                  |  2 +-
 drivers/mfd/qcom-pm8008.c             |  4 +-
 drivers/mfd/qcom-pm8xxx.c             |  6 +--
 drivers/mfd/rave-sp.c                 |  4 +-
 drivers/mfd/rc5t583.c                 |  4 +-
 drivers/mfd/rdc321x-southbridge.c     |  2 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk8xx-i2c.c               |  2 +-
 drivers/mfd/rk8xx-spi.c               |  4 +-
 drivers/mfd/rohm-bd71828.c            |  4 +-
 drivers/mfd/rohm-bd9576.c             |  6 +--
 drivers/mfd/rsmu_i2c.c                | 18 +++----
 drivers/mfd/rsmu_spi.c                | 14 +++---
 drivers/mfd/rt4831.c                  |  6 +--
 drivers/mfd/rt5033.c                  |  4 +-
 drivers/mfd/rt5120.c                  |  2 +-
 drivers/mfd/rz-mtu3.c                 |  2 +-
 drivers/mfd/sec-acpm.c                |  6 +--
 drivers/mfd/sec-i2c.c                 | 22 ++++-----
 drivers/mfd/si476x-i2c.c              |  8 +--
 drivers/mfd/simple-mfd-i2c.c          |  2 +-
 drivers/mfd/sky81452.c                |  4 +-
 drivers/mfd/sm501.c                   |  4 +-
 drivers/mfd/smpro-core.c              |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c         |  4 +-
 drivers/mfd/ssbi.c                    |  2 +-
 drivers/mfd/stm32-lptimer.c           |  4 +-
 drivers/mfd/stm32-timers.c            |  4 +-
 drivers/mfd/stmfx.c                   |  4 +-
 drivers/mfd/stmpe-i2c.c               | 34 ++++++-------
 drivers/mfd/stmpe-spi.c               | 26 +++++-----
 drivers/mfd/stpmic1.c                 |  4 +-
 drivers/mfd/stw481x.c                 |  8 +--
 drivers/mfd/sun6i-prcm.c              |  2 +-
 drivers/mfd/tc3589x.c                 | 14 +++---
 drivers/mfd/ti-lmu.c                  | 10 ++--
 drivers/mfd/timberdale.c              |  2 +-
 drivers/mfd/tps6105x.c                |  6 +--
 drivers/mfd/tps65010.c                | 10 ++--
 drivers/mfd/tps6507x.c                |  6 +--
 drivers/mfd/tps65086.c                |  4 +-
 drivers/mfd/tps65090.c                |  6 +--
 drivers/mfd/tps65217.c                |  6 +--
 drivers/mfd/tps65218.c                |  8 +--
 drivers/mfd/tps65219.c                |  8 +--
 drivers/mfd/tps6586x.c                |  6 +--
 drivers/mfd/tps65910.c                | 12 ++---
 drivers/mfd/tps65912-i2c.c            |  4 +-
 drivers/mfd/tps65912-spi.c            |  4 +-
 drivers/mfd/tps6594-i2c.c             | 12 ++---
 drivers/mfd/tps6594-spi.c             | 12 ++---
 drivers/mfd/tqmx86.c                  |  2 +-
 drivers/mfd/twl-core.c                | 22 ++++-----
 drivers/mfd/twl4030-audio.c           |  4 +-
 drivers/mfd/twl4030-power.c           |  2 +-
 drivers/mfd/twl6030-irq.c             |  6 +--
 drivers/mfd/twl6040.c                 |  4 +-
 drivers/mfd/upboard-fpga.c            |  6 +--
 drivers/mfd/vexpress-sysreg.c         |  4 +-
 drivers/mfd/vx855.c                   |  2 +-
 drivers/mfd/wm831x-core.c             |  2 +-
 drivers/mfd/wm831x-i2c.c              | 14 +++---
 drivers/mfd/wm831x-spi.c              | 16 +++---
 drivers/mfd/wm8350-i2c.c              |  6 +--
 drivers/mfd/wm8400-core.c             |  4 +-
 drivers/mfd/wm8994-core.c             |  8 +--
 include/linux/mfd/bcm2835-pm.h        |  9 ----
 include/linux/mfd/kempld.h            | 12 -----
 161 files changed, 536 insertions(+), 578 deletions(-)


base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
-- 
2.55.0.11.g153666a7d9bb


