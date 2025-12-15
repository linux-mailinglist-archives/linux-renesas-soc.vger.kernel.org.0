Return-Path: <linux-renesas-soc+bounces-25782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7ACBF9CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 20:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E34305161D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 19:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6408E337104;
	Mon, 15 Dec 2025 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsEyoZ7G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45D336EEC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827819; cv=none; b=a/W/txZTdmLLcqBXur5IdmfXrs1rHDeaACxndwTAb/r/PLvXSK2kJtV+rIwv43P5i0pSqyeGVlK71nJ8zycw2PtCfsBEfPkjIrDMBAoarEUMcNwKUMwJP1et4gxpbS3VSm75kJlgWsaI1cPJW4p2Eb1XcXy+kc84K1LVCrzllqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827819; c=relaxed/simple;
	bh=QAMKKq+/07OKE2edah45Zywl8LeTi9tuqwkGpLjZYEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5AQFFJ3A323tffpMlOXrW0fWpoamY6S+oCYvzDsF4e570hjQkBO7wPRZPGm8eGJy++eO24aaIeBp1XLcF/hoNOwvizTYF0fjR2yMHhaEXgVflYSuVOonvPv6JiiWAL31efX+N1kA6Ymx2YcZXAeCK30xPtpy/psKbHF7xB7CwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsEyoZ7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467BC2BCB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765827819;
	bh=QAMKKq+/07OKE2edah45Zywl8LeTi9tuqwkGpLjZYEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KsEyoZ7G5Ju7kqFhPvG3H8KQOT7gqgJ5WG2uMk9wC7nQLYLUWAVco8lSu9AfiGLWo
	 3OZCkta4fv4QT+oI0vwA22vfY5ayWBzNy9GvGiTS7US5pZeJ/xa8KS0lVg5gnG0fnM
	 wiTQ56MmpJx2A2ylThkfE6Kfr7d6CgrhfXvFhv/rSHG9crpPAuaGqVxTHjxUVYQg/Y
	 bKm8i2nuAj4aP9DJrZh1LGhqi9TN+Fu2ESkK3VL/Atag4Hi2s99ujH0vIn6xtcPjqt
	 cvLkHXEf2h0YyIbTfIMpTOeVhVoMuDYcQrXO+Bm8OaBkKKUSpzIeqUZ7/dxjTFocpP
	 6cvnycQKd3HOw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so680602666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 11:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdaQAUoLfesxoNlZ26c8roEyfpTsHfMgHW7Lg4UsQzH637QmUBPzmwV3ovbJpBfIzpRLwqgaR0yJNNINy8NwqelA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHFS0R9XvuO3lJUYzdEcA3wS+E+lvFD1TT3PxtaeJISkrEQaLx
	qYZNd6riD1BmllD4ZpbWkHmAlvcFu1xNnVHVeu95MHHF4FhhAZ/wU9VcNp9miV3+XKsIt9aCzj6
	4tiPq2JGpuTms/JhILboBhL2wk0vMcg==
X-Google-Smtp-Source: AGHT+IHPOvW2BGVu2D4Ir+xTf+ZrZ0oTHwKdRBT3jQdNMTbk0Ko9WuWTep47Nqx4mbBndw2hB+2iEYVbKpnnkmMFsi4=
X-Received: by 2002:a17:907:7e97:b0:b74:983b:4056 with SMTP id
 a640c23a62f3a-b7d235c8495mr1177908366b.8.1765827817406; Mon, 15 Dec 2025
 11:43:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-5-robh@kernel.org> <20251213181324.u32ztfblkknfpz44@pengutronix.de>
 <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com> <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
In-Reply-To: <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Dec 2025 13:43:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfVemq9k3x5J1pTz--Z+VYLeEQrFdbtdS7Pc-HkRui=w@mail.gmail.com>
X-Gm-Features: AQt7F2oiZD_a6RbSn-VyOWgON7AhmUCDA0yS1ZH9l8th1WHWsPTGvW7f6u1q7WA
Message-ID: <CAL_JsqLfVemq9k3x5J1pTz--Z+VYLeEQrFdbtdS7Pc-HkRui=w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, barebox@lists.infradead.org, frieder.schrempf@kontron.de, 
	annette.kobou@kontron.de, oualid.derouiche@kontron.de, 
	eberhard.stoll@kontron.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 12:58=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> On 25-12-14, Rob Herring wrote:
> > On Sat, Dec 13, 2025 at 12:13=E2=80=AFPM Marco Felsch <m.felsch@pengutr=
onix.de> wrote:
> > >
> > > Hi Rob,
> > >
> > > On 25-12-12, Rob Herring (Arm) wrote:
> > > > These .dtsi files are not included anywhere in the tree and can't b=
e
> > > > tested.
> > >
> > > not in the tree but by other projects, please see below.
> > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> > > >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> > > >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ---------------=
-
> > > >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 ---------------=
----
> > > >  4 files changed, 123 deletions(-)
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i=
.dtsi
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.=
dtsi
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dt=
si
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dt=
si
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b=
/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > > deleted file mode 100644
> > > > index 5a9b819d7ee8..000000000000
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > > +++ /dev/null
> > > > @@ -1,12 +0,0 @@
> > > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > > -/*
> > > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutroni=
x.de>
> > > > - */
> > > > -
> > > > -#include "imx6dl.dtsi"
> > > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > > -
> > > > -/ {
> > > > -     model =3D "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > > > -     compatible =3D "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > > > -};
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > > deleted file mode 100644
> > > > index e76963436079..000000000000
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > > +++ /dev/null
> > > > @@ -1,12 +0,0 @@
> > > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > > -/*
> > > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutroni=
x.de>
> > > > - */
> > > > -
> > > > -#include "imx6q.dtsi"
> > > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > > -
> > > > -/ {
> > > > -     model =3D "Kontron SMARC-sAMX6i Quad/Dual";
> > > > -     compatible =3D "kontron,imx6q-samx6i", "fsl,imx6q";
> > > > -};
> > >
> > > I can't speak for the other two .dtsi files but both kontron .dtsi fi=
les
> > > are used by barebox:
> > >
> > >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/=
imx6dl-samx6i.dts#L8
> > >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/=
imx6q-samx6i.dts#L8
> > >
> > > Removing them here will cause a regression for barebox.
> >
> > Please upstream something that uses the .dtsi. Other than the
> > undocumented barebox property, no reason these can't be.
>
> My intention wasn't to point to the barebox-only
> "barebox,disable-deep-probe" property. I was refering to the include
> line.
>
> The two .dtsi files we're talking about are SoM .dtsi files. We don't
> have access to the Kontron EVK baseboard which uses this SoM.
>
> I've added a few Kontron devs which may can add the missing baseboard
> support.
>
> +Cc: frieder.schrempf@kontron.de
> +Cc: annette.kobou@kontron.de
> +Cc: oualid.derouiche@kontron.de
> +Cc: eberhard.stoll@kontron.de
>
> I could also add the imx6dl-samx6i.dts and imx6q-samx6i.dts like we do
> in barebox. But as said, this would be a devicetree for a SoM which
> makes sense for the bootloader but not for the kernel.

Why not? People use the kernel as a bootloader. There's also some
discussions about splitting SoMs and baseboards into overlays for
baseboards (and also even into SoC base DT plus overlay for boards).

Rob

