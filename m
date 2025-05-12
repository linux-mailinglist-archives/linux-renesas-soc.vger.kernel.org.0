Return-Path: <linux-renesas-soc+bounces-16985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0291AB3BAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 17:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334D7189D4FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F132367B4;
	Mon, 12 May 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJv1AA+f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F1235058;
	Mon, 12 May 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062515; cv=none; b=ZwYEPEDMoBp961owYUFIdNST7iendW9lyYtZ09+MckMsRIyqtALE4En12IxtVdKiJ7POQGnEDJGO+Zm/n/SEeYcWw0YB3b5OPOJGhUWKGO9imk6w2wG55SHye9UNE3aJeuw0ST02B+LwHdrYlErbhSI2IFAjZZLOzuWbINTgMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062515; c=relaxed/simple;
	bh=Msw32AhrLHq6iLk2sw22+sVlt+eSQ3kEH81z6VmWnt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP2kMG7vAJ+NdUqp+PvlXOT489Gh3QQgD1nCZQI/h7auhuBUJ6PBA1sJK9ROVPqewDuOHt28Zpuxg3aOZxGpTmjJT0sy/yI9MC6jkI6vFI5Q1/02cATloJqkFCBaRakkMimTiUHJvCr8O0vgMqJa+cGuvtVEe2vAoUoiQUS26dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJv1AA+f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so47639845e9.1;
        Mon, 12 May 2025 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747062512; x=1747667312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKGMmsb0GZX2a1OGZNJcNSyZ+FKExfgRMzBaszfNUvg=;
        b=GJv1AA+frHiIG9V9vVDPplpAH9FSLFnd/Dd+8RoVZXg7YkakJDw/qXChIrMJ3vG4F1
         vHuTY4FeNySAaJtCq7MXzDvKUvi6VFrOQiK7L7p3u0YO0RLKCZ78bVT3Rr6PwrFSfw8e
         pHoTsYQ93YDavrvzRxxkfwFCIaOlCe9YkuGbtZCAcW1sn+JbKhdAYZvHnlyio11Lr4Fi
         NT7m+RGqIwAU64km7VOVA1wCnqnUsw65ZHQ9cE/eFbJZu6fvFSMWhYzSXBhb+Fgr1aiw
         sAssiCxRPqBQ9CBtCDEOePMgDjsSuO6wF3IdISkVXAlTPcJHcO727sM/J6lBeuzPS4+3
         6Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062512; x=1747667312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKGMmsb0GZX2a1OGZNJcNSyZ+FKExfgRMzBaszfNUvg=;
        b=HobOqM226FqcO4Tg7/gQd/cSSX4eKhyeqnVk3OpCnEZSCugsUlmpmQYs4L+IhH+b0F
         9SCb0Ur7SLEsQqygYGlmSrPJ9iH1OeIrEq6rhODO6/jMfaiyJr31PGNudqTqUxVwq2BM
         X5rRSqxeyX5fV2MLUSi7b4zPpeDaSva8vhpp1f9DrXERsr+gWvofmXkBirMleN3uZVmZ
         YyxEgnK8z5fVbvaq1l8WJS7FHQ6XDyp4FAyL70eI3mYA8cNvofVRsnfNyQg8NOQUt7Y5
         3xD2w+2bNzfJbke0lmsEYMukfBZsO1mzr+HbNB7StzYnlvVeG7Y/qtio5TIVWjY7L8/Z
         12vA==
X-Forwarded-Encrypted: i=1; AJvYcCUOzs2tFSjvz895oJJE1Aqk6Okhxo3Tn2EyAJme0E1rI4TedBRfkN7onecGhsi5t+N6I8Hria4a3ii8@vger.kernel.org, AJvYcCUv/4rZsas82pw7HqHN41ZXalZnLfaimp7UxSQnbWWHPoVwPfCbFxIf0tEL+2YvWH9wh13dwVwBwbP2PMFRIri9IQY=@vger.kernel.org, AJvYcCVQnhWDzchvSwajrd5ITvMZeYPmPMs00bHGc9TDoqJy44AGZOqHG8cmyelXmBFXwmEL1WAwaYBJgfCA@vger.kernel.org, AJvYcCWKVbp798AXWadW5ZbgXKknLnTe4qLZnZekI62zYqa0SYV3wHsYEPE8dwQNhIa9FAN2+ghxnJ0ZxBUnK3ux@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1CnIRAmFvVVVWuhrKuPa9KCbsICfei4988BcDkf+JO734+K9
	ggdm/fXrR+2VBSkSozaAGS6b5cSpDOTagf2kGYTTYJcvXumZts44m2FGh7C5bmHeqSATkd/hPQZ
	D7VmjxXJ4sc6kVKxYA/KixRr91y4=
X-Gm-Gg: ASbGncvFj98r5BgadtYTRjBvbUxu98DwMqsejFC7PGnTeyPN0etJcJO97GKyzYWXSHY
	1sxRqes1JASoMZO+o6vTH1t/wuaifYppfoQSNjZv4n3LOXyMsp9uYulUESGoiBc6GeI1mVwVjB/
	yGQLyEpa6xAxp1ZhwGtQiLf9Ehc7NUnYY=
X-Google-Smtp-Source: AGHT+IHGDorUIAcM2wju/yK2w1g6iMVsJSONLlGUWzv7KAkB4xpZt3eEAqg+ZCcMqMLKnBSEQpRoVG2lt0TGAjIK4Ds=
X-Received: by 2002:a05:600c:3b26:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-442d6dd4ccdmr114204985e9.30.1747062511455; Mon, 12 May 2025
 08:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113468F023BBECAB10C41DF50868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468F023BBECAB10C41DF50868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 16:08:04 +0100
X-Gm-Features: AX0GCFt0aBi6yZgUyAVYV8vXQDfkJXpvMN6TvFcSMOiBCk3Pku0EFVryPRnJdSE
Message-ID: <CA+V-a8uCfcBYcmg9DTJubki1VnAT9oFvqEsSdBuxM2bYyrta8A@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Sun, May 4, 2025 at 1:41=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 April 2025 21:41
> > Subject: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data su=
pport
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for the Renesas RZ/V2H(P) SoC, this p=
atch introduces a mechanism to
> > pass SoC-specific information via OF data in the DSI driver. This enabl=
es the driver to adapt
> > dynamically to various SoC-specific requirements without hardcoding con=
figurations.
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the =
one on the RZ/G2L SoC. While
> > the LINK registers are shared between the two SoCs, the D-PHY registers=
 differ. Also the VCLK range
> > differs on both these SoCs. To accommodate these differences `struct rz=
g2l_mipi_dsi_hw_info` is
> > introduced and as now passed as OF data.
> >
> > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support=
 by allowing SoC-specific data
> > to be passed through OF.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
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
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 ++++++++++++++-----
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
> >  2 files changed, 48 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index 911c955a3a76..ed259627f5e8 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -28,10 +28,26 @@
> >
> >  #include "rzg2l_mipi_dsi_regs.h"
> >
> > +#define RZ_MIPI_DSI_FEATURE_DPHY_RST BIT(0)
> > +
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
> > +     u8 features;
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
> > @@ -164,22 +180,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)  {
> > -     iowrite32(data, dsi->mmio + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 =
reg, u32 data)  {
> > -     iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg=
)  {
> > -     return ioread32(dsi->mmio + reg);
> > +     return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 re=
g)  {
> > -     return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> > +     return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  /* -------------------------------------------------------------------=
----------
> > @@ -291,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       vclk_rate =3D clk_get_rate(dsi->vclk);
> >       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> >
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> > +     ret =3D dsi->info->dphy_init(dsi, hsfreq);
> >       if (ret < 0)
> >               goto err_phy;
> >
> > @@ -334,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       return 0;
> >
> >  err_phy:
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >
> >       return ret;
> > @@ -342,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >
> >  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)  {
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >  }
> >
> > @@ -584,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridg=
e *bridge,
> >                                const struct drm_display_info *info,
> >                                const struct drm_display_mode *mode)  {
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
> > @@ -713,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
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
> > @@ -728,10 +748,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_d=
evice *pdev)
> >       if (IS_ERR(dsi->vclk))
> >               return PTR_ERR(dsi->vclk);
> >
> > -     dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> > -     if (IS_ERR(dsi->rstc))
> > -             return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > -                                  "failed to get rst\n");
> > +     if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
> > +             dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, =
"rst");
> > +             if (IS_ERR(dsi->rstc))
> > +                     return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc)=
,
> > +                                          "failed to get rst\n");
> > +     }
>
> Dt binding check already checks "rst" as required property the currently =
supported
> SoCs. So for RZ/V2H if it is optional maybe replace
> devm_reset_control_get_exclusive()->devm_reset_control_get_optional_exclu=
sive()
> and get rid of this feature bit check? If I understand correctly, optiona=
l APIs
> are introduced for this purpose.
>
Ok, I'll make use of devm_reset_control_get_optional_exclusive()

Cheers,
Prabhakar

