Return-Path: <linux-renesas-soc+bounces-35054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDGqHEzuUGqt8gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:06:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46A73B0F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=wZEo0zVu;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31A8130485B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F184B42CB05;
	Fri, 10 Jul 2026 13:01:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84F42B336;
	Fri, 10 Jul 2026 13:01:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688469; cv=none; b=DxRkthHotDPfGJZMmDXtcuG5EWbAd98oBHW12gaAYnMzhYdR5SDSMPJqcoyuSlTbfmf+U8ZE6Ht7WBCBuhOjWi5SJbFtP6eZrQBv5yV2uBOW8WWwMGIb/6GfKfQaXOV/+Sz2SjcAbPzZNOlMUWl0DS52iTMhTeijvoVhpIaVt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688469; c=relaxed/simple;
	bh=M94SjjYhfG0qMo3AdWDmx7QCzOOMR1z6U/G7HOPFbC0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=I0DHFmz/gYymeb7cNllJ00DbcJMWmKy6VsIMfGb8LIYqUYE1EG+9mos5hOAhByhAHgPqZ/5vfkXoPtdM6pvb4p5TTDMMx4yIRhAklxLXHYEsO34OU0fpmxPbaRr8DBqOO/hhh+0MKlCq4GpLxXOrCEVFYmHbf2Ur23W3Ug6jZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wZEo0zVu; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1706C1A0F42;
	Fri, 10 Jul 2026 13:01:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC97760345;
	Fri, 10 Jul 2026 13:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B95911BD0DEB;
	Fri, 10 Jul 2026 15:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783688461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OpR8EpUWoLVWD1U7hF0BGvXpeDpChn5vhtnYxeMgZ/M=;
	b=wZEo0zVumBZvota9lj9ysImh10+E4+BbYYrgpWI8VBXNocIci+MYRA9CPFt7nqEwahCYw+
	WGH/gbKanRQqklTcRaZlOdZcR2vWKZucFD13TXdAx/Gpc3+UIBLDDcSpYjyXTiFDp62YdU
	/9/G1w78+Iq5ZxLNsh8doY94LRg4F6sBcLJh6gazI/BPBSS8plkEkDP90Iw3Jipm5LWHpd
	t5JPw5/FOpeSvJgrAYi5ApGSR02OuWhrI719bSjbOdQQNoma1YvCMPW0BShr4FskJBpZKn
	RT65XADHkqNtWjPe5eSMFoaw249fIMLHxmMPTQGGDMENM6BCXdXRMwQnlO+2yA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:00:43 +0200
Message-Id: <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Lee Jones" <lee@kernel.org>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
Cc: "Linus Walleij" <linusw@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Chen-Yu Tsai" <wens@kernel.org>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "James Ogletree"
 <jogletre@opensource.cirrus.com>, "Fred Treven" <fred.treven@cirrus.com>,
 "Ben Bright" <ben.bright@cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Support Opensource" <support.opensource@diasemi.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Tim Harvey"
 <tharvey@gateworks.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Saravanan Sekar" <sravanhome@gmail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Liviu
 Dudau" <liviu.dudau@arm.com>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <mfd@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <patches@opensource.cirrus.com>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,broadcom.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,linaro.org,samsung.com,gateworks.com,jannau.net,gompa.dev,collabora.com,nxp.com,pengutronix.de,gmx.net,iki.fi,kemnade.info,baylibre.com,atomide.com,linux.alibaba.com,foss.st.com,sholland.org,arm.com,glider.be,sntech.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-35054-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mathieu.dubois-briand@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:linusw@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:wens@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:support.opensource@diasemi.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:ckeepax@opensource.cirrus.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:andre.draszik@linaro.org,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefer@gmx
 .net,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:mazziesaccount@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:patches@opensource.cirrus.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@
 lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:marekvasut@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.dubois-briand@bootlin.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,bootlin.com:email,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA46A73B0F7

On Thu Jul 9, 2026 at 6:58 PM CEST, Uwe Kleine-K=C3=B6nig (The Capable Hub)=
 wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---

...

> =20
> diff --git a/drivers/mfd/max7360.c b/drivers/mfd/max7360.c
> index 52fffed0c0dd..dc744b40bb38 100644
> --- a/drivers/mfd/max7360.c
> +++ b/drivers/mfd/max7360.c
> @@ -152,7 +152,7 @@ static int max7360_probe(struct i2c_client *client)
> =20
>  static const struct of_device_id max7360_dt_match[] =3D {
>  	{ .compatible =3D "maxim,max7360" },
> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, max7360_dt_match);
> =20

Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # ma=
x7360

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


