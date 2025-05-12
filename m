Return-Path: <linux-renesas-soc+bounces-17012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F64AB452A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 21:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7298E8C3FDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 19:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809F1255E2B;
	Mon, 12 May 2025 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7kH0Za6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65CC1CA84;
	Mon, 12 May 2025 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079374; cv=none; b=Fl2OuNgFKX65BURydHhHoh/DCe3QXAW47TM6wn8d/jnVCw7L50kStglnCf7yRP1LaI6UrGCPQ3bNy2MYQ5OLwbl1S2E2cqgHfU7Eeqq7LcYgPdFscyjh3Cz9x+HId/MRlDa+5UAwGViQM7RdHNYwBTzUeH2rZefG4E0xHxQPjWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079374; c=relaxed/simple;
	bh=0ea+jq9tawsp4ep8x5s5ibmfKZ+OoRVIjOhLxVL+Gbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgjDzzyKuin3gYLjSGAisMC008AHXURjKxVHw6k0T04fTaIhB9fhTYqIM30GiPlb1sIDvKvFVmNzOXC5IGZLiLFOF2YNFA8LDfBIN72kOb47r2Qs1JuGAGgZxpJl0dbwaQfJPR2gyM3s8wdXBU6C0GFizVnYaVUlhoJ77m3zShw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7kH0Za6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32753535e9.2;
        Mon, 12 May 2025 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747079371; x=1747684171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSiiTyR+SUvpOZu3w9u+267WlZQzAWddC0oSI9XaOBA=;
        b=H7kH0Za6P+h3RSjj9U+G7itqUiAaxr2Dg0X5WjFHyNbde6yqsO6CVrlBfHuzTXdJUr
         7z0els8SNSwLbizYojtk8NcxscdxtQNPqfw7UVq1Xv7/PAGYTADc9LKDMzJzJesx2DM4
         bjV5ndsUMhJt3/ydhreVU1Xz48GdiDeiGQ0XUTDcnfokZVOpVw2duOXmJq93tKH7+P1U
         ccx9VwywrH12BpEPh8Z8rLvq8eBM8LMEdvUXtmphKCmnP7e44FqRkWh10L9zce6UXyG3
         uLGgcgJVP84wtaSpVU0HnxKVpVqfm+hm/fq8rdjSunZbTFye+W+ORytZSDmK+ISqXYzd
         7OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079371; x=1747684171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSiiTyR+SUvpOZu3w9u+267WlZQzAWddC0oSI9XaOBA=;
        b=cbDX4vumZ50vubTbLsZEIRfIbUPbp0EwOzBZyzkKFwCLlbCJekMF4M7TkRqpnH17wp
         vCCbegahv+oMIKxyLYKtL/GXCFcESH4HV1abrG+AdkMMSrV+D6E+Ef/3Aq8xPvW/3zVr
         XIwd5RM160B4kEhKvtgWiyAEKPyGgA+hoSt1QlikZ3zU9Z4m/HgonRXA2EdRnyP8pz8d
         LgQ02dLd5tzXWVPGfmYPpaegBBv3d2XcDvTA4c61de+ZdTnmEZ+pnqJtvSUDIsgGtrXA
         6fJZkgudrV4J5nLLG4LWX7N2sbGmxDgJ2XkiM30Z14NsTCEPm56Xl83tlAXOdGYEPck5
         ng3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDdBOXGydEkeejJ3eIdDBlTRMxvNLyfZWqYkFC75TfJCcayHbX0XODadsiOIBChoxzZL4OHC4mRP3X@vger.kernel.org, AJvYcCX7vDH+Bwm+jA/a44QuqDClwCo2lJ2vNSmIoXw+NXYmweYLtBkAlbC0enfjW+p2jFIrn3jLYeAWPCKm6waxzFuJxMg=@vger.kernel.org, AJvYcCXKPu9fmTAMdI7Xf3osMfeqCDgIhr9zdbWMznz/TOpLN2k9h5DpK3Nidll65X3183Hb9nM0UuXbcE7texX7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8K9jDGs5qvwo2301uCZ5b50LRt26J26joXEaDWMegIWJing6L
	NzEYyzVxEAGHMGEl8jWJiDOKkZwMr7yN23TkgN6Prk7pEKWE/FdjPhjibtiXL3UUQA/e+sxFQk6
	8n3if+jIWtEHh1R5RsFryhd3iYQmV6lS6
X-Gm-Gg: ASbGncslkkbJBgwEtSJXBrJ5K0VV5DGapCez+2EiGTJJDzeATpNregr2ge0hVNI+0jD
	47wtNQDD4AsGMV7vpOC4seEVdIysOXiWkRgHXTcIUkwEaZd58gidoaroeeZgLNrHk5sEzKKo75Y
	AOs8KJ5RwNSY3dpiDIysmJF8N6FYYnYSw=
X-Google-Smtp-Source: AGHT+IHXn9bcwnRyYmCRV8MG1JG7GKW2zAKb4s3goQRCkyctTQW+k259Qx4iLBqZmc9e+QxhawLs1wgHdnIQEM0q8rQ=
X-Received: by 2002:a05:600c:4e55:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-442d6ddefb8mr146970545e9.30.1747079370563; Mon, 12 May 2025
 12:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250509153559.326603-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWnaujCjK+gu8RFfrZ4a2axf=xffEOAdwsjFMvUHcfw1w@mail.gmail.com>
In-Reply-To: <CAMuHMdWnaujCjK+gu8RFfrZ4a2axf=xffEOAdwsjFMvUHcfw1w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 20:49:04 +0100
X-Gm-Features: AX0GCFtT9ypb887tyBvjkPornOofDipwEh_uuhsFcpkzTJjevvAivBwRNUps-s8
Message-ID: <CA+V-a8vrF178XqqtECqNrXJRSWD8MGmBZvCbutsi2uggJWDjWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable GBETH
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, May 12, 2025 at 8:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 9 May 2025 at 17:36, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the GBETH nodes on the RZ/V2H Evaluation Kit.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > @@ -78,6 +80,68 @@ &audio_extal_clk {
> >         clock-frequency =3D <22579200>;
> >  };
> >
> > +&eth0 {
> > +       pinctrl-0 =3D <&eth0_pins>;
> > +       pinctrl-names =3D "default";
> > +       phy-handle =3D <&phy0>;
> > +       phy-mode =3D "rgmii-id";
> > +       status =3D "okay";
> > +
> > +       mdio {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               compatible =3D "snps,dwmac-mdio";
>
> I am just wondering if the above parts of the mdio subnodes should be
> moved to the SoC-specific .dtsi instead, as it is part of the SoC and
> fairly static?
>
Agreed, I will move this to SoC DTSI.

> Both approaches seem to be popular: e.g. rk3568.dtsi[1] has the mdio
> subnode in the SoC part, and rk3568-nanopi-r5s.dts[2] extends the
> subnode, while rk3399-orangepi.dts[3] has the full subnode in the
> board part.
>
> [1] arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [2] arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> [3] arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
>

[3] was added earlier, [1]/[2] seem more recent. So let's go with the
mdio node in SoC DTSI.

Cheers,
Prabhakar

