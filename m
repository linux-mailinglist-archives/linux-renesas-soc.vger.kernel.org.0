Return-Path: <linux-renesas-soc+bounces-21759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC701B52B5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 10:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D681B3A7423
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 08:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31A32E3376;
	Thu, 11 Sep 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmlIBjGW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A72E2679;
	Thu, 11 Sep 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578526; cv=none; b=oqVNgRPM/RBTZs4wOd+7sEZoewjsch7TywuT6Y7WqOaRvs2uZWERf1+iviiN8zL1PDe1n9MrW8E9232/FRoveQUkBLfL7mXQMPs2CfBpQnHwr9TEBtbf5XK22H9hHXGPb3BzWhTiEpnQRvZDxG+3aiv3BKIVBz5uboZ7JN8oQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578526; c=relaxed/simple;
	bh=sWbPf7+kNfG1EA2QI6Aw6Y1H/91adzKDkDy0MSMAesY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqHbeZwQafSROEKM4FgfRVX2YoobGfsziMZuqSbNR41nN8MHtPCDq8gsnju4n0z4dXKSnvZTXC+YOJCNMdNA9GQN3KDBsxElE3GciBiltJLibHMIaKs5xPcH5aBqbS3eoYrzkcIz+xKCzr3qT6od+kZ7ikwRW4lhK0GfXNcWvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmlIBjGW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61d3d622a2bso2309510a12.0;
        Thu, 11 Sep 2025 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757578523; x=1758183323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtBJ7XRZRXHnb1oRAlJMLn1CzpEHjZeP/Tjuzyg5UAo=;
        b=KmlIBjGWh2mgCPlrmpvNV1jH/oewn701CjzGV5lalo0Rj9+7UxeIF7O0Za2jNUFk0h
         9ltRkEgVQiNuz/UMmw8Yfk00URUUp/DSKedgvXwpTfNOEyg1mTfPaY0uLo9aVZirmi3w
         x8M/sWbhGOMJi2EhCtrmiH21ilDEXN/MArNxvr1ZJiuAGm7xQqUNG80Fa4npTFn6rQlv
         1SXErzTV+22aYtmfdYs6IHxcXh1U2Wx+J9usRNZbE31CYj1k8cXMUvtxvK5kKfN0d0Qf
         RRti4N2tWisDlS46Gia0KKz7SrUNgvqcdEMa1bOfWiAd7YR4UBfyXAC81QGo0Zppz1SX
         2O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578523; x=1758183323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtBJ7XRZRXHnb1oRAlJMLn1CzpEHjZeP/Tjuzyg5UAo=;
        b=oJpmViQuRk1EN0wZo3j3VkR94WtcE4rUbIcTdOh0AzMWoW/yhj/wDCtWfHdW7HjMQZ
         Wj7b452i6JBN/rA527BpwEqG2fPpbiRafQXUJ7v3gd2Vj01H7Ad4n5gxUqqXkAPtNcNW
         QyotiPAKBCGH7kXp5T4x6WBHiVtqSF/FFqAqTz2pXqu0VqCXeaFETxKvvRZrHGTIvUo1
         8blum22yZttoNOLm+Fw1nmPntAQ8DGpWFO92NfqzjZXNbLIzM/1erZtJgKaYoqfLlMIB
         GE3MyFqP7v7ll6qNKNNQf9zaDVNC6Zls+XcAEe8Dgd+pd0RoNOKlL0ejdZWPgW4ztEyd
         9atg==
X-Forwarded-Encrypted: i=1; AJvYcCUUnmPBcj6nQ+7G6xivxEXxYrwchHXS78ug4gJvZyDGq5fCJkKCGIQ7k/UY23lw1AKRpAi6LXYfXlo4TO42@vger.kernel.org, AJvYcCVUSImXpvCFbgfBmurP8e0cXFTVg9pc9j9w7mheYTP5OWkJ5B1GgA3dQjlBHTk4mfD1JN/PmTFupByL@vger.kernel.org, AJvYcCWF0lIxXwtiUOUO9fnJcdwFcpRi/13HVHj/WPferpx6o9sYsD+AHMua+bAKVC8TA8H2kYK38msLnN1Q@vger.kernel.org, AJvYcCWs7r7Pd/ycjtFgLV3OxghZiOhojc5gebPMlRDV8GAZGParh0kWn7ihknH7xF/Z1SCVJb7rg4JtQroIVwWu67lwDE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+NbYCFtaQiCUIe6mftORHYgxXPr0Vi5vHSW75cRCazc8xbNu
	j1tkogW8d1Aa6lWypJaUQ41UjcQPK81IGkveoV6/0Bm/6WQDFDptccWe/N0GR99EOLfOjRy+OJy
	WQEYaW6+qXaAMrSSf4T2oY2qgNNe2Edc=
X-Gm-Gg: ASbGnctL8awUbzu/Um7k0tI9xMb1Csv4E6dJsbwAA2/69e96vrWAdzjf36M6Z4lrLWT
	5xlccSZwT55EnEMiauVhrFzei8KLWmPAbVy8C6k14SmPeG4gGkbSN5vxNdFDSNqZTldBLEK7OBt
	V9nJJTyavqSo/h9iEfwIGY34OV2V1Vu3fKFswNEmQrKg+WqpH5J602yt2tmt3gLVlTzP5cHR3ev
	mWlQZVIrPsdp3hx+syG5G2qDm9U96sM6E6mzb/EkWhnu7TNDgk=
X-Google-Smtp-Source: AGHT+IEnp+5Pp/hKtvuNcvkPD7ilbt2E7mIP6OMzOLx6fAXAtKZDlirtxajpgqUgKHbow62KqE/NON7LEPov9/q3UY0=
X-Received: by 2002:a17:907:2da5:b0:b04:4579:486e with SMTP id
 a640c23a62f3a-b07a6403229mr286982766b.28.1757578522708; Thu, 11 Sep 2025
 01:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
In-Reply-To: <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 11 Sep 2025 09:14:56 +0100
X-Gm-Features: Ac12FXwA2G13xPdRFdy3yeIIErYfrkajYLbpZADAiTZT6Kl8ibBEbrC_wV_N2u8
Message-ID: <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 03/09/2025 19:17, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> > PLLDSI related data structures, limits, and algorithms between the
> > RZ/V2H(P) CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly
> > different parameter limits and omits the programmable divider present i=
n
> > CPG. To ensure precise frequency calculations, especially for milliHz-l=
evel
> > accuracy needed by the DSI driver, the shared algorithm allows both dri=
vers
> > to compute PLL parameters consistently using the same logic and input
> > clock.
>
> Can you elaborate a bit more why a new clock APIs are needed for the DSI
> PLL? This is the first time I have heard a DSI TX (well, any IP) require
> more precision than Hz. Is that really the case? Are there other reasons?
>
Im pasting the same reply from Fab
(https://lore.kernel.org/all/TYCPR01MB12093A7D99392BC3D6B5E5864C2BC2@TYCPR0=
1MB12093.jpnprd01.prod.outlook.com/#t)
for the similar concern.

The PLL found inside the DSI IP is very similar to the PLLDSI found in
the CPG IP block, although the limits for some of the parameters are
different. Also, the PLLDSI is followed by a programmable divider,
whereas there is no such thing in the DSI PLL IP.

The limits for the PLL found within the DSI IP are:
1 <=3D PLL_P <=3D 4
64 <=3D PLL_M <=3D 1023
0 <=3D PLL_S <=3D 5
=E2=88=9232768 <=3D PLL_K <=3D 32767

The limits for PLLDSI (found in CPG) are:
1 <=3D PLL_P <=3D 4
64 <=3D PLL_M <=3D 533
0 <=3D PLL_S <=3D 6
=E2=88=9232768 <=3D PLL_K <=3D 32767
The limits for the PLLDSI related divider are:
CSDIV =3D 1/(2 + 2 * n), with n=3D0,...,15

Header file `renesas-rzv2h-cpg-pll.h` is added so that both the CPG
and DSI drivers can reuse exactly the same data structures and
algorithm, although they'll drive  rzv2h_get_pll*pars() with different
limits.

While the CPG driver only needs visibility of the limits for the
PLLDSI, the DSI driver is going to need visibility of the limits for
both PLLDSI and for the PLL inside the DSI IP.

The DSI driver requires a resolution higher than Hz (which is what the
clock subsystem currently does not support), namely: mHz. This is
vital to allow the DSI driver to keep the error between the calculated
value of HSFREQ and the generated value of HSFREQ below a certain
threshold. The difficulty in achieving a small error is down to the
accuracy of the VCLK representation.
Since the clock subsystem only allows for Hz, a 1/2 Hz error on the
representation of VCLK (down to the selection of frequencies that
cannot be precisely achieved and related rounding errors) may lead to
a very big error in the calculation of HSFREQ, which uses the below
formula:
HSFREQ =3D (VCLK * bpp) / num_lanes
In the worst case scenario (1 lane and 24 bpp), a 1/2 Hz error on the
representation of VCLK will lead to an error of 12Hz(!) on the
calculation of HSFREQ, leading to a non working video output.

By granting the DSI driver access to the PLL calculations and PLLDSI
(CPG) limits, the DSI driver can work out the best solution for VCLK
independently from the CPG driver, and it can set VCLK accordingly
(knowing that the CPG driver will use exactly the same parameters
determined by the DSI driver, as it will be using the same input
frequency and the same algorithm for the calculations).

For convenience, macro RZV2H_CPG_PLL_DSI_LIMITS() is added to avoid
replicating the declaration of the PLLDSI limits and therefore it can
be used in both the CPG driver and in the DSI driver.

Make use of the data structures and algorithm defined in header file
`renesas-rzv2h-cpg-pll.h` to add PLLDSI support, including its
divider.

Since we need to make sure that the DSI driver knows exactly which
frequency the PLLDSI + divider combo is going to generate, the CPG
driver is instructed to calculate the parameters for the PLLDSI +
divider combo (by calling into rzv2h_get_pll_dtable_pars()) only from
rzv2h_cpg_plldsi_div_determine_rate(). rzv2h_cpg_plldsi_div_set_rate()
will simply reuse the pre-calculated parameter values."


> If such precision is really needed, does it then indicate that it could
> be needed on other IPs too? Thus, we need improvements to the common clk
> API.
>
As of now, this requirement is specific to the DSI IP on the RZ/V2H(P)
SoC. For other IPs we haven=E2=80=99t seen a need yet. Once similar cases
arise in the future, we can certainly revisit the clock subsystem and
look into extending the common clk API to support this more generally.

Cheers,
Prabhakar

