Return-Path: <linux-renesas-soc+bounces-23413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D296BFB129
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 11:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52DCB188B11C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6304309F1D;
	Wed, 22 Oct 2025 09:07:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BFE3126A6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124078; cv=none; b=TLcZCXG3JbFIJwpV9vaXcoJ/J6D/ZHbrSRYQCaV32VYQaQIyF5nY4AaoqQ/Xcyi9hct14AA60xMciCMCQ1j+M8+ryUHjvJU+7a/uu6UbxROBkDOwuyFkd8ejn4uQtftulNYxXRwZ0K6UIGu9sAd7wUUgTUzGOA+MTZlDx7nQ4Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124078; c=relaxed/simple;
	bh=DFFRjTGp6HQBk2r6PDkD+Pq+QGDwTablWuJ4zetvp6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JvXB7EHuVa6U4Vuga8SUWuJNRA3CQFyEA1+3k3+kVaUKI4AFCcvWrT0N7fjV4zYxfjo9g3fPa347gRnJSlMpF62jR/2gcBBmrsMrHnKvUOnbd+p5CTUiZ3InMBL4LIlHj5GXyrJIkptPd2pSwtkN2XsExowwCS8JANWgz+Y1Hck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBUov-0004KN-J0; Wed, 22 Oct 2025 11:07:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBUou-004rc3-2A;
	Wed, 22 Oct 2025 11:07:48 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBUou-000000004Eq-2RKz;
	Wed, 22 Oct 2025 11:07:48 +0200
Message-ID: <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang
	 <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-renesas-soc@vger.kernel.org, Kuninori Morimoto
	 <kuninori.morimoto.gx@renesas.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Date: Wed, 22 Oct 2025 11:07:48 +0200
In-Reply-To: <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
	 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
	 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
	 <aPEAx8ZGHBcWZKJF@shikoro>
	 <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
	 <aPIfF-3SgzW5V_gs@shikoro>
	 <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
	 <aPInv9NELU7N9QDn@shikoro>
	 <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Fr, 2025-10-17 at 19:02 +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 17, 2025 at 1:25=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >=20
> >=20
> > > > I think the fallback mechanism of the core should work without any
> > > > module loading infrastructure. It should be there whenever possible=
.
> > > >=20
> > >=20
> > > It's not really a fallback, is it? This is the path we'll always take
> > > if the driver requests a reset control on a firmware node which has a
> > > reset-gpios property. If the driver goes with the gpiod API, it will
> > > get a regular descriptor. It's deterministic enough to not warrant th=
e
> > > term "fallback".
> >=20
> > I dunno for how many drivers this is really applicable, but I really
> > liked the cleanup of the pca954x driver.

That cleanup might have been a little premature, given that the reset-
gpio driver currently only works on OF-based platforms, and even there
only with gpio controllers with #gpio-cells =3D <2>.

> >  Don't handle GPIOs internally,
> > just get a reset, and it might be a GPIO. I think it is very useful and
> > I would like to see it wherever possible.
> >=20
> > We could now make these drivers depend on RESET_GPIO. This would make
> > sense in a way but is uncomfortable for the user who has not RESET_GPIO
> > enabled before. The driver would just disappear because of unmet
> > dependencies. Yes, this can happen all the time because we always find
> > new dependencies and describe them. I just hoped it could be avoided in
> > this case.

How about selecting RESET_GPIO from I2C_MUX_PCA954x? It already depends
on GPIOLIB. Although I don't like the idea of drivers being converted
en masse, all selecting RESET_GPIO ...

> >=20
> > > Then I believe the platform's config should make sure the driver is
> > > built-in. I don't think it makes sense to just cram it into the kerne=
l
> > > image for the few users it currently has.
> >=20
> > For Morimoto-san, the PCA954x update resulted in a regression. It is
> > worth thinking how to avoid that. The driver is so small, I wouldn't
> > mind the extra space if it saves users from disappearing devices. But
> > mileages vary...
> >=20
>=20
> It's up to Philipp but I'd personally go with "default m if GPIOLIB".

To be honest, I don't like either very much.

Yes, the reset-gpio driver is only about three pages in size, but
force-enabling it for nearly everyone, just because some hardware
designs like to share resets a little too much, feels wrong to me,
especially in its current state.

And just default-enabling it doesn't solve the regression problem when
updating preexisting configs.

regards
Philipp

