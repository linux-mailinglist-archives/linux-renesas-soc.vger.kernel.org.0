Return-Path: <linux-renesas-soc+bounces-28617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJeSIMhQpWnS8QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 09:56:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F51D509B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 09:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173FB304178C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 08:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697FA38BF76;
	Mon,  2 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7IHob1+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693638CFEF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441718; cv=none; b=UvpdQvWs/g/himqU2g7EVW7g/Ym9RFOP9oMDOAjdRKJ9ac6NF6ElBcmQxRa7EYGIkzfQRwz6nga4u2ySXYqbjjDBYRvXgoEJrcYJ/MTXcW/ZPTk63mJZ5+YMgAeBXTma8r4aqWMycutU0IJ5bWtSaUK8xW9PpDwncXJKyPUsRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441718; c=relaxed/simple;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYDYYwCtusK8zDxfhKv+EGkalTGNZvtLXrlKmJG5ngtHkBUQFkyl3q9iT7B1SZ8OB0S4WGwOWtS/Dbxlunp15ijplg8C8fjwH0SjX4v5Fg3jIQ8v8cVEF4O6lOqgnu8RopgHW2T6ZHqgoHribDNfw/JcFaPRDB6RiS165UOr55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7IHob1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12950C2BCB8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772441718;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g7IHob1+IzRdb3Ba3Pk+09VevGbac/nukyJetgEzow3LvsVGBRr2GWZSYzAVyEixs
	 ac3l2GXU1eUawjled3yUp4PoNyyrlKE57fpscvbPswRQwrhTPAPRpAHsdX9bF8uk50
	 21jJn2KzvJeyTiJuTXVv0hiYE2z8fXJETbsxslXwRsYLOGz/2Kro8o6YYy/sT/iMd3
	 h4C3bDJyZ2i2tuFP1LXYD5Zl4yd82hXh/zrKP2aaXT/oXnZlK7bHcDDayF8+uL3oRV
	 pftYGsXRPj1AcBS5eQH/dOGu/3O0/AgCbdo2akwVvBTGmS61EOEj/hBvmS2wOH80Y/
	 rAnN69Swn4ukg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870dec27f4so2869291fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 00:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUU84yE4NoB3+ug3HwcebhtebkBWuIUEMQpYxbMy+R1BY6q3kT73D9727UlAgKTO2WC+T6wSkC8T6F/8CZTZPdiGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ixr2TvQX/ZfVKBBC6n+SWGYNwC8wQ2uFf59WT503I02LNFK5
	YjM78LMwv0adMDE1LtuREj+fg+u+ERjBF8iDcT7Kdprc5AZB1H8Y/AsCIi28r6h+eP2eu4sV3+Q
	vLA18ZxLNiDyYun0Fe3JKjIfofrAIqPd7V1twrtLRhg==
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id
 38308e7fff4ca-389f1d73cecmr65334241fa.5.1772441715946; Mon, 02 Mar 2026
 00:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com> <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
In-Reply-To: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 09:55:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
X-Gm-Features: AaiRm53-Jiy54KH5rFLuIQyxPw_sYDt2pmqB7mKXc8_Bgm_qwPjbm9X-evfdjaM
Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28617-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: F01F51D509B
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> wr=
ote:
>
> On 2/23/26 11:05, Bartosz Golaszewski wrote:
> > In order to stop i2c bus drivers from dereferencing the struct device
> > embedded in struct i2c_adapter, let's allow configuring the parent
> > device and OF-node of the adapter directly through dedicated fields.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >
>
> Hello,
>
> Automated driver test system bisected this commit to be the first bad
> commit, linux-next next-20260227 was tested. Failed tests include driver
> tests for ROHM PMIC and accelerometers, which are connected to
> BeagleBone Black.
>
> The failed driver tests all fail to first i2cget and the tests stop
> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
> directory".
>

Wolfram: well, now it would actually be useful to know which commit
exactly is the culprit so maybe splitting the changes is not a bad
idea after all.

Kalle: which i2c bus driver fails here? Any errors in kernel log?

Bart

