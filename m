Return-Path: <linux-renesas-soc+bounces-667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C9804A9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 07:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0168CB20C15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 06:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823212E78;
	Tue,  5 Dec 2023 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HzwMXPNm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D20FF;
	Mon,  4 Dec 2023 22:51:21 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6524CC0006;
	Tue,  5 Dec 2023 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701759080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmV/ix9amwJ7r86i5eKjinKKZ2rsJiuszC6Rdqdxvkc=;
	b=HzwMXPNmz6whc7Lpk85Qn6zY/OATY25BeMWTJQcAXyjnM7VJJ2VXeAX+YWpdVRQT5Vur3R
	QhFZ7m94EhMmFpc68Pu+TvXUbkN3AaCfoqMJ0YM3jNWfTv11ZKeKS7C84B6FNIcMZ89Qdd
	f89dxnTRE9h3fG5NI+WkwypaPQVKVGnFiIr48c7zyn6ybn2r/QuBMHWvDYFzi6znO8Y3qN
	XPXYuxTqDh3Xqrxv3JjU1Am74IpMqk2rwYgmjR25xwAIZbpmMtvveNvFwlEljiCzPDcsKq
	xIkKhTMqxIgnw5KCI9gpuOxkCqGDN40qtrKms0AhQXax6Bc4/UCoa1hw6m14cg==
Date: Tue, 5 Dec 2023 07:51:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Alex Elder <elder@kernel.org>, netdev@vger.kernel.org,
 kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>, Nick Child
 <nnac123@linux.ibm.com>, Christian Marangi <ansuelsmth@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Zhao Qiang
 <qiang.zhao@nxp.com>, linuxppc-dev@lists.ozlabs.org, Linus Walleij
 <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 linux-arm-kernel@lists.infradead.org, Stephan Gerhold
 <stephan@gerhold.net>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Loic
 Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
 <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-msm@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, linux-wpan@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove
 callback returning void
Message-ID: <20231205075110.795b88d2@xps-13>
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Mon,  4 Dec 2023 19:30:40 +0100:

> Hello,
>=20
> (implicit) v1 of this series can be found at
> https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pe=
ngutronix.de.
> Changes since then:
>=20
>  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
>    converts ipa to remove_new() and introduces an error message in the
>    error path that failed before.
>=20
>  - Rebased to today's next
>=20
>  - Add the tags received in the previous round.
>=20
> Uwe Kleine-K=C3=B6nig (9):
>   net: ipa: Convert to platform remove callback returning void
>   net: fjes: Convert to platform remove callback returning void
>   net: pcs: rzn1-miic: Convert to platform remove callback returning
>     void
>   net: sfp: Convert to platform remove callback returning void
>   net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
>     void
>   net: wan/ixp4xx_hss: Convert to platform remove callback returning
>     void
>   net: wwan: qcom_bam_dmux: Convert to platform remove callback
>     returning void
>   ieee802154: fakelb: Convert to platform remove callback returning void
>   ieee802154: hwsim: Convert to platform remove callback returning void

FYI, I plan on taking patches 8 and 9 through wpan-next.

Thanks,
Miqu=C3=A8l

