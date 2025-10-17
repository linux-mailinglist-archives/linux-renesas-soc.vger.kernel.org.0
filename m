Return-Path: <linux-renesas-soc+bounces-23213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C55BE7DF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 318334F4589
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BE9221F03;
	Fri, 17 Oct 2025 09:42:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF0253B40
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694169; cv=none; b=FfbV9bjL4voQi3Llz5FQAw4Qt3xoNiMSMBbcZLwMwPx2jdwFbFWKftU5RJF99QdODDMdFz1n3miwHb19H9Frw6ruYvjuCmzdmtkCme5VxYxrJ5aQ6zb2XZEcdrUTd7v989bebNcVCYty60ZWoOEdVegISqwSRe4DCC0Gm6jtUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694169; c=relaxed/simple;
	bh=JCqGKaZ0Qqlff5bNu7CzAY3onTeQvwYh5WB8W5/RQOE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R6Zz0bOGa1mlHv3Gjnn7SGqwae12DyBGjHSJduGpY7OUHYA9hGL5n+Lz1zcN9Sd6WL/EigEJp8ju1wrmPB28O0h9uRoRAfurBkODDSJA6ppWg+KvCiztJo/Svn54I9m+x+QmJq/Dm3q+Pnfk/s2wnHzb4Tcr/uLyk1hnCLkn0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gyx-0006k4-2D; Fri, 17 Oct 2025 11:42:43 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gyw-0042N9-1e;
	Fri, 17 Oct 2025 11:42:42 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gyw-000000003VT-1nSR;
	Fri, 17 Oct 2025 11:42:42 +0200
Message-ID: <96d66ea4890b5f0d5c0961f8c8fac781a15865b9.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang
	 <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Kuninori Morimoto
	 <kuninori.morimoto.gx@renesas.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 11:42:42 +0200
In-Reply-To: <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
	 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
	 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
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

On Do, 2025-10-16 at 15:02 +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Thu, 16 Oct 2025 at 14:16, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Reset core uses the reset_gpio driver for a fallback mechanism. So,
> > include it always once its dependencies are met to enable the fallback
> > mechanism whenever possible. This avoids regressions when drivers remov=
e
> > open coded solutions in favor of this fallback.
> >=20
> > Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@re=
nesas.com
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -5,6 +5,7 @@ config ARCH_HAS_RESET_CONTROLLER
> >  menuconfig RESET_CONTROLLER
> >         bool "Reset Controller Support"
> >         default y if ARCH_HAS_RESET_CONTROLLER
> > +       select RESET_GPIO if GPIOLIB
> >         help
> >           Generic Reset Controller support.
> >=20
>=20
> Makes sense, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> This does mean RESET_GPIO will never be modular anymore, while it could
> still work as a module (the reset core creates the platform device,
> which can be probed later), albeit in a non-intuitive way.

Btw, Bartosz (added to Cc:) is reworking reset-gpio into an auxiliary
device driver.

[1] https://lore.kernel.org/all/20251006-reset-gpios-swnodes-v1-0-6d3325b9a=
f42@linaro.org/

> BTW, could we run into a circular dependency?
>=20
>     config RESET_TI_TPS380X
>             tristate "TI TPS380x Reset Driver"
>             select GPIOLIB
>=20
> I guess this should be changed from select to depends on?

The drivers referencing GPIOLIB seem to be split in the middle between
select and depends...

regards
Philipp

