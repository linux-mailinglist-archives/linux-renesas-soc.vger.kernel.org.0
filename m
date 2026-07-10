Return-Path: <linux-renesas-soc+bounces-35075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/QmEmVMUWpUCAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 21:47:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78873DEDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 21:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eQ5prH05;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA2D300D956
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 19:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591B54499B3;
	Fri, 10 Jul 2026 19:46:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33938E5D4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 19:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712768; cv=none; b=a1Tl7o7rutX03aw9g2JQxTbrvXc4nj5WbrpvB22pZXOmQ6i/B5qPpboUFmRxXd4Ib8cQO8iG7Psg7oKFlMSdRt6QapTKM8T1PuviDkKxFeLe5oeZCCBR+cU3O4O03IkT/2Gn3jgSHMfBRwwtRZW1xcOFq4xOiXtCYGbQ/KuC+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712768; c=relaxed/simple;
	bh=sZDwGaUkGBLrMyNSIpb3kLYEJV1iPNS+5Pn9t9xv6aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5CerGp9Qe+MZfPmNAT0N5WMzwqt/+U6D8yeLXg0UrR3jZ1BX7upSiY4t549BKf2w+Dl+9qhcbSevvArDoAqEdCW728aab1UncBf+0cJjrvLf5p5ur1wIIEp1rH6jNCNZStpOrXszA78qAuwn97xv9LYt8gEnSAdu1HbIBsDE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ5prH05; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA501F0155A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712765;
	bh=sZDwGaUkGBLrMyNSIpb3kLYEJV1iPNS+5Pn9t9xv6aE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eQ5prH05UmMQ5nGzy2ipeXY4lkQKyESaExDjUsgSfLeW4Exvc2X3hmxZBp+HDDnwh
	 gy5xn0rCrTfjNjQPuHqcu0FzPQaJ1YAZQhahxV6T71deZYeziM3pxHW7W2QMq7y6oo
	 FhrHfQwcIy8kJ5vfpHKHkPBPGkAXF61R0T/lZ2ElQ2NH5ERxyQsy7VX/rtQZXyubbl
	 A2sLjBzEZvP7c6oEza0bh+NHkyjHOxBrmO5f6L+sHKF4PsUJlyZudG5MyYb+SAYa+Q
	 NxdYQYovNbSqCC+VoYxV741dZW8VrYV1dSt2xDZrMn+OppxGaWxi3KV0Oc/ks13nm6
	 ThnjUYcTxcrQg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1366749e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 12:46:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoradYDqabl3KmOpE5MSQvelviOQblHxubqgvrGCzIRb4lbzywyanIKhIsSuT1T34sffyQgq8S+y0JngDOaKDg4XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcHtHzUPcDUG9vfv28HR66cEOLxBirTocVpM5a1y6MyNWVJAM
	0pqpoY0vfTK9v/dHs/bTlMCDc9P+QTvOdDBQ1DhhlFnAJ0XTS5MS18b6knjGw3OyagCXOdwH7dT
	NOy5Lv5pRVTGe/DC2zSYUUmMHrHdEXBQ=
X-Received: by 2002:a05:6512:32cf:b0:5ae:b792:7f1e with SMTP id
 2adb3069b0e04-5b0236a3891mr89821e87.30.1783712764308; Fri, 10 Jul 2026
 12:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:45:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
X-Gm-Features: AUfX_mx_vh7ziiGHTkkaiMBQb1TjjZ8vahBxzqeJira0tID9YqDdR27A_6wUme0
Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] mfd: Use named initializers for arrays of *_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
	linux-crypto@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	Colin Foster <colin.foster@in-advantage.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, Xu Yilun <yilun.xu@intel.com>, 
	Tom Rix <trix@redhat.com>, Michael Hennerich <michael.hennerich@analog.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, Support Opensource <support.opensource@diasemi.com>, 
	Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Samuel Kayode <samkay014@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux@ew.tq-group.com, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Peter Tyser <ptyser@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,gmail.com,collabora.com,loongson.cn,chromium.org,in-advantage.com,cirrus.com,opensource.cirrus.com,linux.intel.com,intel.com,bootlin.com,redhat.com,analog.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,foss.st.com,st-md-mailman.stormreply.com,ew.tq-group.com,microchip.com,tuxon.dev,gateworks.com,jannau.net,gompa.dev,nxp.com,pengutronix.de,gmx.net,linux.alibaba.com,sholland.org,arm.com,glider.be,sntech.de,xes-inc.com];
	TAGGED_FROM(0.00)[bounces-35075-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:mfd@lists.linux.dev,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:zhaoqunqin@loongson.cn,m:linux-crypto@vger.kernel.org,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:colin.foster@in-advantage.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:qipeng.zha@intel.com,m:thomas.richard@bootlin.com,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:yilun.xu@intel.com,m:trix@redhat.com,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirr
 us.com,m:ben.bright@cirrus.com,m:support.opensource@diasemi.com,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@ew.tq-group.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:luca.ceresoli@bootlin.com,m:sravanhome@gmail.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefer@gmx.net,m:mazziesaccount@gmail.com,
 m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:ptyser@xes-inc.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B78873DEDA

On Thu, Jul 9, 2026 at 6:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> The objective for this series is to prepare mfd for changing
> of_device_id and the others to make driver_data a union, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
.com/
> for the idea behind it.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

