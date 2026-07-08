Return-Path: <linux-renesas-soc+bounces-34878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LYjAGVhLTmpVKQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 15:06:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B20927269B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 15:06:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=aMJWEhS4;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E604830893A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083BC46AF0E;
	Wed,  8 Jul 2026 12:58:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E83466B70
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 12:58:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515490; cv=none; b=AfAumvOa6ARAuNyfKFSH+ryYmM6j643G6Ln/FTnfO11q1/rW8iAVUbxlZlZ+sF/+NQ6VqxQIAaW/TuwrP+D+iXOkU44cKpjShyOSlcnJ8c5pue7YKGQjXPI3H4U04NgGp3w1RAkP99WUVlL4+wExMJK+kJYcaLl8ElVr7Wg7Wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515490; c=relaxed/simple;
	bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=spBehVW3gCQeFh5CNfa2kGJ7c+rbRPaxd/b68IHSijEqZzVaAMGecylz2ZErVGbfwu6Hplv4/F7m3sBGhczST0OFdlfuwXi4x6q9lCFj2jrkLKOaWUqvRk/SD2ksokZGoKAqKXp1nd0WYqHMdWQCwQlzYKI8GozU9FGj2EDbryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMJWEhS4; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15b1da6b82so71112666b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515487; x=1784120287; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=aMJWEhS4hQz1H78nOyA4aawahdqLtwzDKdyM9k+8prM+a+FvTJyLchShLI/gayPTia
         DwFamIt6cP+fzDDd362zi2MfX1MuzwsNTV4T4y6EHoQv2MiZU51A1UBUD0FMSajWFUZW
         1PwkKCpxi6ZeW6PR9jXfYS582dtdMDjSV4pVOD1C2C/KsCYrVCb8xbAdWzkDamPJ5WoB
         ZXs39ipPyJllMbovc3IykcZOuI3sw3ko7syGXBA777S6bPntiR4OEomiodtdGhy8Dts0
         +UmqM8ONnyrMKPW/xRHNsJJb612O8E/8Yg001NY+WyV14saQEBIQzzpLKb9pTkNMgXZW
         C26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515487; x=1784120287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=l7ZDl59RnSEuSsqwgKVPxcRqNLYt9Y+mwpHKbtY/QpmagUx/vD5AMytV55g/s/xEwW
         EUO8WH+zPBsVTV3t+0xJpod3cBwnju+MhZi/ahZPMgV02eK6bwBbV5y9GgWVR5G0Uxng
         AK4+NSXhk/gUbzOoSKIRi7fNVoG+gv0GJhyBRtSj5kZsun2e1kT+2b8r1uT5fRXMNkre
         +AAT7yxs0fLXcJ/dvka/t4YgrDNBIEswb/El55x0JASrb+SdR4jkpsZvjRuUNGsvGk0a
         Y/JkvyJJG8Gl5nypvK/NEpTzcuQi6kgu/B9tWV06n28t31TQ9rO8KpEVna4H7sTyBzdt
         7+kA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxdj9T/wDlFgnGBRc3U1LzPigQxSrP+N/8jV6UUfIOvNtKCZP8ZETCvM+AT6dd8ufOp4XrlTHp01mncyxTcQs/gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RFSLgRAssKb2jamxbuYmzzuuj6HM3o2QOp5uf2Y//aN4xI0d
	oUXTXZfmouUMKSyWq9ZTKup63EeXKcP7rZkjTn8ZV6rPyPQ88CNmKPTjnVU8nPvAb2s=
X-Gm-Gg: AfdE7clrJ/kzNAHVns81tLA8nDsnaerav04uMzw22J9eOSM0CP1cBBDwnMMAt+Y7dto
	5DnjcLwxZDGgU2sq444seyoCwa0D9hNVaEZ1wZChfFGNEbLddSa2P6v23LxR6t9FT3s5PV9h1qM
	DRR67GNPiVR8hujEwwMnePPP+CdxqAj8i4/GTfM7gpV/wnPf/LCgVniT2ENpueZlpCGuXC7hBrN
	hLPBr9DrHUnEmsC1b1wl4XD7U7TO9wZfQwhPVgu/4syvxPRb96qJltoyxXVCQtL21wB7UQsE+BK
	4GuTOIl065saAvJBuipMGfpWBdsyD+YkNA/n23334clsTKy1xvkQOQhkm4GdzI0nhXQy+I0nxYD
	0+yi1dhWsq/0LDypLVMSixShYoswrqM40TLZAz5tAhMwbnR8xDXEUO/CRYzwF7UIaxMPHY7J1yU
	4iM/g2MM+akM0oTPDAvIQ=
X-Received: by 2002:a17:907:7211:b0:c12:4597:601f with SMTP id a640c23a62f3a-c15ce131902mr120160066b.53.1783515486648;
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84c636sm324005266b.22.2026.07.08.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Message-ID: <eed86cadd335597d7c7a4278a9a09706913ba6a3.camel@linaro.org>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>, Florian
 Fainelli	 <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list	 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald	 <rf@opensource.cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>,  Krzysztof Kozlowski	 <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>,  Sven Peter <sven@kernel.org>, Janne
 Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli	 <luca.ceresoli@bootlin.com>, Saravanan Sekar
 <sravanhome@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Matti
 Vaittinen	 <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang	 <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm	 <magnus.damm@gmail.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, 	linux-rpi-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, 	linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, 	linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
Date: Wed, 08 Jul 2026 13:58:20 +0100
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34878-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,broadcom.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,linaro.org,samsung.com,gateworks.com,jannau.net,gompa.dev,collabora.com,nxp.com,pengutronix.de,gmx.net,iki.fi,kemnade.info,baylibre.com,atomide.com,linux.alibaba.com,foss.st.com,sholland.org,arm.com,glider.be,lists.linux.dev,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:linusw@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:wens@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:support.opensource@diasemi.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:ckeepax@opensource.cirrus.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neusch
 aefer@gmx.net,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:mazziesaccount@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:patches@opensource.cirrus.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.lin
 ux.dev,m:marekvasut@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[73];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B20927269B8

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
> =C2=A0- no comma after the list terminator;
> =C2=A0- a comma after an initializer if (and only if) the closing } is no=
t
> =C2=A0=C2=A0 directly following;
> =C2=A0- no explicit zeros in the list terminator;
> =C2=A0- a space after an opening { and before a closing }, a single space=
 in
> =C2=A0=C2=A0 the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759

