Return-Path: <linux-renesas-soc+bounces-25739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24CCBBF02
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 19:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D29830057EE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 18:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A61156CA;
	Sun, 14 Dec 2025 18:58:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81550241CA2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Dec 2025 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765738700; cv=none; b=nF5Xxemxrw5gQBHZrGiSJrLaD776f/WBtbXo0s4B/ZJ5JedU9YP+6bMOJgWApU7i86aUjQar1XV38lVfCdSufNNNSuGPv1CPh/llYI4xvfKBVnRJh2+D82zWy8iIbeVDR75jnldPh8aGY7KbkxBguVVCxbNn2jKga2gRxnunYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765738700; c=relaxed/simple;
	bh=GCZ+nNQyoS7pAg5z7KK/xZ1P1Rh/V7W61g2toooh6So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG/dxsdIiV28D1wJiY7CJ/l8ZYMd8aKbsaTSBe+szvenhcbgrE+v4Q4LPXOd2ObZj+XeDCGkVo+H9sQWLHrH25WEW7x7U94YJo5a1B/4AsIziV95EhX35GWyieZYKamzUMvNH2oHm8O7uYfb8gjYLfEKTLmaMBoAVqzULZKeH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrI0-0002HV-1N; Sun, 14 Dec 2025 19:57:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrHy-005enG-16;
	Sun, 14 Dec 2025 19:57:50 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrHy-00786O-0Y;
	Sun, 14 Dec 2025 19:57:50 +0100
Date: Sun, 14 Dec 2025 19:57:50 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, barebox@lists.infradead.org,
	frieder.schrempf@kontron.de, annette.kobou@kontron.de,
	oualid.derouiche@kontron.de, eberhard.stoll@kontron.de
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
References: <20251212203226.458694-5-robh@kernel.org>
 <20251213181324.u32ztfblkknfpz44@pengutronix.de>
 <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On 25-12-14, Rob Herring wrote:
> On Sat, Dec 13, 2025 at 12:13 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi Rob,
> >
> > On 25-12-12, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> >
> > not in the tree but by other projects, please see below.
> >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> > >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> > >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
> > >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
> > >  4 files changed, 123 deletions(-)
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > deleted file mode 100644
> > > index 5a9b819d7ee8..000000000000
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > -/*
> > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > - */
> > > -
> > > -#include "imx6dl.dtsi"
> > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > -
> > > -/ {
> > > -     model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > > -     compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > > -};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > deleted file mode 100644
> > > index e76963436079..000000000000
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > -/*
> > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > - */
> > > -
> > > -#include "imx6q.dtsi"
> > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > -
> > > -/ {
> > > -     model = "Kontron SMARC-sAMX6i Quad/Dual";
> > > -     compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> > > -};
> >
> > I can't speak for the other two .dtsi files but both kontron .dtsi files
> > are used by barebox:
> >
> >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
> >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6q-samx6i.dts#L8
> >
> > Removing them here will cause a regression for barebox.
> 
> Please upstream something that uses the .dtsi. Other than the
> undocumented barebox property, no reason these can't be.

My intention wasn't to point to the barebox-only
"barebox,disable-deep-probe" property. I was refering to the include
line.

The two .dtsi files we're talking about are SoM .dtsi files. We don't
have access to the Kontron EVK baseboard which uses this SoM.

I've added a few Kontron devs which may can add the missing baseboard
support.

+Cc: frieder.schrempf@kontron.de
+Cc: annette.kobou@kontron.de
+Cc: oualid.derouiche@kontron.de
+Cc: eberhard.stoll@kontron.de

I could also add the imx6dl-samx6i.dts and imx6q-samx6i.dts like we do
in barebox. But as said, this would be a devicetree for a SoM which
makes sense for the bootloader but not for the kernel.

Regards,
  Marco


> 
> Rob
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

