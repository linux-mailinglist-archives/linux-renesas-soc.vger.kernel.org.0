Return-Path: <linux-renesas-soc+bounces-25738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C1CBBB94
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 15:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B7B73009DA0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Dec 2025 14:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6740273D66;
	Sun, 14 Dec 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2NEGrJ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06EB270EDF
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Dec 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765723329; cv=none; b=WshS3oBPEWqYWrzn8V2bYqgi7b/EWWhnSMRP6b1+1UwNKV/ix3OB6W2ULPfMX26U7HEUWMR/LWy+AjX97URFJuY9+mHBpbTFXyls3LFAuG5VP6gWOyIM8xlxrjE2K9e5jKaaCPxjSon3rT69WTikYIrWZTO7X0yh+ONv39pojFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765723329; c=relaxed/simple;
	bh=oD/KggYabkmpbLwMi9JfkWOU4h7CawiUNWnQZdptfFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoT3s32L6ZXR4VpeKeJkGJVtVxL9g8Wi0VjHa5OzTgqnDcgSNu5IeeboYVnCzNOgDJP72thrvJWtKivu4SZdiNw0Zv5ARxLE3J12m1wRaTwQIBDDfUdDONFobaNkpyIK2v09vGS4b7H6tin44Y3+UOG9fdlGLgkbobBWbdR4u+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2NEGrJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5156EC19422
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Dec 2025 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723329;
	bh=oD/KggYabkmpbLwMi9JfkWOU4h7CawiUNWnQZdptfFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A2NEGrJ8Ca/wyaS8iRk2pzHKLF/U3QmLusVXaZzxtH9hznjnkyrH6Q/SO6I737Qxx
	 1fnX7nPsD0UrqCV3BjIUBod3S7jfToHWUitD6rzVImFvrO0lFbm/NjP6mXRiqEI8Kg
	 5RayiPIrLIuvSKmWEqIm/eyoTPZJzFE3Tdrcwb9QtM0xtgOQNsKcp9KV0Fv7/xm7nA
	 hoADE0vZQgXHuxAv4KjtwdWC5e9aXv5ESFuJNjcCF23fKz1TOw51W4sNiz8JvB+kKK
	 4m+lkZRUyp3K39p/uLOzqFgk47oFMmO68FQdxZpYgAlkCgcEpj0gVf2XDyK1bEC0dR
	 Mp/ViGbY8qe1w==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7697e8b01aso506570466b.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Dec 2025 06:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8AKSeiPveI33Plt8BM4pp+rgss7rKGb6036a7ffryfijkwnIEzxAXc+QKuwbkCjfUPPrPI5A3zK8dUNXaVsUhAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/JxJ5ifK+jXQ/DwkeWpBFJ9naIwXj6Rqw4kqFyYrkWRLnG8W
	0oi9ZsvtbkKpLGOkulpE4dBPOIDYxNKmplK3RfTKCo8hB8UlMeGqUKsGsw7cbBwW7FADPOpwKmk
	c5y95J2eGo2ByWQDfajG2TsHDlc/7DQ==
X-Google-Smtp-Source: AGHT+IH/UNXJVVIzYMzF70T0zT2ePS4CZo3kLeaqHyUCNx7LNUsqU6Z3vZR8gWlhInbPYIFxkyNcgz3+uHF1VkK6TAw=
X-Received: by 2002:a17:907:3f28:b0:b73:8903:f4b9 with SMTP id
 a640c23a62f3a-b7d23a813bdmr836277766b.24.1765723327827; Sun, 14 Dec 2025
 06:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-5-robh@kernel.org> <20251213181324.u32ztfblkknfpz44@pengutronix.de>
In-Reply-To: <20251213181324.u32ztfblkknfpz44@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Sun, 14 Dec 2025 08:41:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
X-Gm-Features: AQt7F2o1cvCAKghlM7oUFNsydZljaReVAverYw-RqgPCazmU6RqIU2uWyYXg6mg
Message-ID: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 12:13=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> Hi Rob,
>
> On 25-12-12, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
>
> not in the tree but by other projects, please see below.
>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
> >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
> >  4 files changed, 123 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dts=
i
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arc=
h/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > deleted file mode 100644
> > index 5a9b819d7ee8..000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > -/*
> > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de=
>
> > - */
> > -
> > -#include "imx6dl.dtsi"
> > -#include "imx6qdl-kontron-samx6i.dtsi"
> > -
> > -/ {
> > -     model =3D "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > -     compatible =3D "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > -};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > deleted file mode 100644
> > index e76963436079..000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > -/*
> > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de=
>
> > - */
> > -
> > -#include "imx6q.dtsi"
> > -#include "imx6qdl-kontron-samx6i.dtsi"
> > -
> > -/ {
> > -     model =3D "Kontron SMARC-sAMX6i Quad/Dual";
> > -     compatible =3D "kontron,imx6q-samx6i", "fsl,imx6q";
> > -};
>
> I can't speak for the other two .dtsi files but both kontron .dtsi files
> are used by barebox:
>
>  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6=
dl-samx6i.dts#L8
>  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6=
q-samx6i.dts#L8
>
> Removing them here will cause a regression for barebox.

Please upstream something that uses the .dtsi. Other than the
undocumented barebox property, no reason these can't be.

Rob

