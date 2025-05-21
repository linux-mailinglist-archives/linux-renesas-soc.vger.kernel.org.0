Return-Path: <linux-renesas-soc+bounces-17299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B13ABF59E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 15:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96BC3AE036
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D419826B2D2;
	Wed, 21 May 2025 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnTVBUJ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6A270ED6;
	Wed, 21 May 2025 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832924; cv=none; b=jw0zjmFzghG1R/Qeku7cSAgNsRNGNRFVQwzDmnVDQJMdghNpnjacH2Gm/rCplI2hEpcBMsP9nb9Zb6ZQ6ejjri5kCZeDe5lWC978vA3O00ngZkviBe5klmdU/ZSAmPrYBj/vZ++MDys47aNSGOb0cj5RYKjLeiCGLSvP94Sfdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832924; c=relaxed/simple;
	bh=6OhCY1xUyBgi1UgWxvCaIJsB6If5IkL4y0bONcB9ZyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzBb8wX8dhxJ4liRKKuqRYVPmY9wX9dGtmOoPyneuk+IsasrsI01XiQdDY7kVAb5WmE6niNzxDLJ+MhxFsBNjJPspFsfIrJGKoCKZnbf677ygXNn+p3f01vX9Rarpm5CVrunNWwryydERoTeXjJpjKusftm/bgvkV99AAm5fokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnTVBUJ2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so73335465e9.1;
        Wed, 21 May 2025 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832921; x=1748437721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtJuC4sON7OcCbFhnl9rFz8s4+7CUDcertp/XszJ1mI=;
        b=mnTVBUJ2dCPNGdgADNgPeEQKtIaRemisamtuTZY93G0sXP6sSMdcdrS0nXX/w6C99U
         YgwfCNJqNvQGZW382G8O3qxp/XaK6v6tlBHmEJhP1PhyfHKwIlqkn8MNQ9lAAIS6Rqe1
         A6j71bb66xFyn5XLsBjTAkYN6K7VlVtly0x3Xlj0y5KKOsJ0Uaw5BAZRDaLt3fZ4dYA5
         yYvtxtfmdlnUKJwBvRmvRI9NDNuGLX2tlDpNBqm5osFz17uam0/8XRd1P5wNnaYsrGGD
         DkjD3YinCQU3h5KFFGXQ1kkfN2Ar6hluMrBhLN4u3fhqICYMVIu4xveXzpYXQ3t48xG6
         AMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832921; x=1748437721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtJuC4sON7OcCbFhnl9rFz8s4+7CUDcertp/XszJ1mI=;
        b=mIrwF4fs5ALrmvYNeX7cExbXEHPklPO20p9ibjjmsAX6asKaHSit3rtr6nsL2cCJ61
         e7jPQQIZTRy+5VuDDMhz0NliqGFN1gqV9FAlqAkLOMT0cT30TA4Dyctu5+DjiA0gidZM
         fyMsQOul9EebdipAmEcvqQNqfNPJUBics7/FEPo7S2O4Tlt82ot8dzyul5b3/P/0MEQG
         aWE4UpzSkEB2K9O5ENh8THnsMtxS1QZ9znXqi/FX2fH4SViktA6W3MsU5wyxR9eIAP8b
         riCE259Shf53SOZIO0cISvEzr4NvZDl5ryuOBLgdel8YD7VGKC20BJvlTivyafDc7IJt
         0T1w==
X-Forwarded-Encrypted: i=1; AJvYcCU2H587DHLhWJT9Z3TWPVYDmgAg9ntFYmrTqrgl9oI0hH1WNeqLWIk8ud4utqDD4AUP3bm2J/W6hkuz@vger.kernel.org, AJvYcCWd/twPkT9CERSsn5Jode6ZLlsNedKJGARwgJHS3dci17xSFHY9NVljCyPrE8DxJIopf1n90ODFHYhx4mNPdJgzLDc=@vger.kernel.org, AJvYcCXxhqUuwCWEdbG3nkVZmlzkKBSDsyV5ZlKMdGxswzci1IncYXLifGZCG4x8gQ+ILq6IP+UQbET8vnTqukAq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Z8K2bDAGkbCkvlC4Awe2ERR7BMVWnBDjBLcI7EihgzTIdzy2
	jzGIvQkRmSubtasEwM9whJWDhdF/YcwG51WDGNQdmKlWaKmEHDAknLHqkKEcikuox+1agVdY3YW
	0ydY0TJbfxvReyN2y3MVE7Nk2SiCGHp8=
X-Gm-Gg: ASbGncuKFdvGjd716cVOr84XQqbefDnU2DqP3HXcDL37aqahqar3ii8N6tfhepjkv8o
	EsxUilDesFsUVtNzy+DLvOwyPF4VckWHZNugQx+BGSVT4Bohe6DL9FhH843eAt3vcfUBHsYBVxk
	MTnc+1sVfIv4fnmJ47eBabzcMvkXQ=
X-Google-Smtp-Source: AGHT+IH5oWUCAOj7liq81Ww5yepueFEsMzPQhgQxcq8TIEroCXdBrKSZYY6lFxEMsfgBnUSJD91+1TgxZPcjy7Bm/ws=
X-Received: by 2002:a05:600c:5493:b0:43d:878c:7c40 with SMTP id
 5b1f17b1804b1-442fd618f0dmr240690125e9.10.1747832920435; Wed, 21 May 2025
 06:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250520142240.GF13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520142240.GF13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:08:13 +0100
X-Gm-Features: AX0GCFs98ZFk9bZKzlsJMx4dK9PDnmCfT8MxXsx3auXJDzvHLqULJxY_wHeAMoE
Message-ID: <CA+V-a8u5t_vjW+bc63o6qn8M=RV+yigkkaKsrAHLzNrtNM8-cg@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, May 20, 2025 at 3:22=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:24PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for the Renesas RZ/V2H(P) SoC, this p=
atch
> > introduces a mechanism to pass SoC-specific information via OF data in =
the
> > DSI driver. This enables the driver to adapt dynamically to various
> > SoC-specific requirements without hardcoding configurations.
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the =
one
> > on the RZ/G2L SoC. While the LINK registers are shared between the two
> > SoCs, the D-PHY registers differ. Also the VCLK range differs on both t=
hese
> > SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` =
is
> > introduced and as now passed as OF data.
> >
> > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support=
 by
> > allowing SoC-specific data to be passed through OF.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
> > - Added Reviewed tag from Biju
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not neede=
d.
> >
> > v1->v2:
> > - Added DPHY_RST as feature flag
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
> >  2 files changed, 38 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 3f6988303e63..00c2bc6e9d6c 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -28,10 +28,23 @@
> >
> >  #include "rzg2l_mipi_dsi_regs.h"
> >
> > +struct rzg2l_mipi_dsi;
> > +
> > +struct rzg2l_mipi_dsi_hw_info {
> > +     int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq=
);
> > +     void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> > +     u32 phy_reg_offset;
> > +     u32 link_reg_offset;
> > +     unsigned long max_dclk;
> > +     unsigned long min_dclk;
>
> I'd put min before max.
>
Sure, I'll swap them (and below).

Cheers,
Prabhakar

> > +};
> > +
> >  struct rzg2l_mipi_dsi {
> >       struct device *dev;
> >       void __iomem *mmio;
> >
> > +     const struct rzg2l_mipi_dsi_hw_info *info;
> > +
> >       struct reset_control *rstc;
> >       struct reset_control *arstc;
> >       struct reset_control *prstc;
> > @@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)
> >  {
> > -     iowrite32(data, dsi->mmio + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 =
reg, u32 data)
> >  {
> > -     iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg=
)
> >  {
> > -     return ioread32(dsi->mmio + reg);
> > +     return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 re=
g)
> >  {
> > -     return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> > +     return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  /* -------------------------------------------------------------------=
----------
> > @@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >                        mode->clock * MILLI, vclk_rate);
> >       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> >
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> > +     ret =3D dsi->info->dphy_init(dsi, hsfreq);
> >       if (ret < 0)
> >               goto err_phy;
> >
> > @@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       return 0;
> >
> >  err_phy:
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >
> >       return ret;
> > @@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >
> >  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
> >  {
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >  }
> >
> > @@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridg=
e *bridge,
> >                                const struct drm_display_info *info,
> >                                const struct drm_display_mode *mode)
> >  {
> > -     if (mode->clock > 148500)
> > +     struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +     if (mode->clock > dsi->info->max_dclk)
> >               return MODE_CLOCK_HIGH;
> >
> > -     if (mode->clock < 5803)
> > +     if (mode->clock < dsi->info->min_dclk)
> >               return MODE_CLOCK_LOW;
> >
> >       return MODE_OK;
> > @@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >       platform_set_drvdata(pdev, dsi);
> >       dsi->dev =3D &pdev->dev;
> >
> > +     dsi->info =3D of_device_get_match_data(&pdev->dev);
> > +
> >       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1=
, 4);
> >       if (ret < 0)
> >               return dev_err_probe(dsi->dev, ret,
> > @@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_d=
evice *pdev)
> >        * mode->clock and format are not available. So initialize DPHY w=
ith
> >        * timing parameters for 80Mbps.
> >        */
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> > +     ret =3D dsi->info->dphy_init(dsi, 80000000);
> >       if (ret < 0)
> >               goto err_phy;
> >
> >       txsetr =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR);
> >       dsi->num_data_lanes =3D min(((txsetr >> 16) & 3) + 1, num_data_la=
nes);
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >
> >       /* Initialize the DRM bridge. */
> > @@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >       return 0;
> >
> >  err_phy:
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >  err_pm_disable:
> >       pm_runtime_disable(dsi->dev);
> > @@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_=
device *pdev)
> >       pm_runtime_disable(&pdev->dev);
> >  }
> >
> > +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
> > +     .dphy_init =3D rzg2l_mipi_dsi_dphy_init,
> > +     .dphy_exit =3D rzg2l_mipi_dsi_dphy_exit,
> > +     .link_reg_offset =3D 0x10000,
> > +     .max_dclk =3D 148500,
> > +     .min_dclk =3D 5803,
>
> Here too.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +};
> > +
> >  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > -     { .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +     { .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi=
_dsi_info, },
> >       { /* sentinel */ }
> >  };
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driv=
ers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > index 1dbc16ec64a4..16efe4dc59f4 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > @@ -41,8 +41,6 @@
> >  #define DSIDPHYTIM3_THS_ZERO(x)              ((x) << 0)
> >
> >  /* --------------------------------------------------------*/
> > -/* Link Registers */
> > -#define LINK_REG_OFFSET                      0x10000
> >
> >  /* Link Status Register */
> >  #define LINKSR                               0x10
>
> --
> Regards,
>
> Laurent Pinchart

