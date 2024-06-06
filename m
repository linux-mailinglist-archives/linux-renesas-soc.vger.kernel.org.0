Return-Path: <linux-renesas-soc+bounces-5910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F18FE320
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45FB21C210B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4EB146A85;
	Thu,  6 Jun 2024 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPewTq3A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264E13D2A4;
	Thu,  6 Jun 2024 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666722; cv=none; b=mWpDAp04xYWlo4HOyhs2doWHA3qpJ8D5IEWRq4UN6Mq7NirQC8yljaRr/RWr5/6xzb/67SDe/XoiPwwvnncGN05+oQPP0OpPng5WG2zZj2RKECsCeZbLypb+yTMk5BhBEAvkeSyFLdlcMQdac+g50NLTc/kinXnRYPZFs4xAn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666722; c=relaxed/simple;
	bh=vqU/LAIuLv3MxglpSiLAs1b6iyW6OFeCtRLiL2wpHbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWHhQqSjSfqJfxUxUqaLNBzPK4F+gSr3Sv2Zo3XfrFqB3WFtaZJcaTCPE3/LsGBUAgDscwNLFUHtFdSxsPsjlNr3lQ1UEo87iYJgIRva7PK8qT7m+ZEqZNYZH3Aecg32sS6JaKRvZq6TFTi7GnTT6mH1qka+5p7g3MB4wo45M70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPewTq3A; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4eb3e4bdbb9so242931e0c.0;
        Thu, 06 Jun 2024 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717666720; x=1718271520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uzRoQkjhLlH3aMQ2w1B8Mep7CWm5DreMQa4sEdwu3E=;
        b=RPewTq3AnvSfVvVYa13qzMDl2TzPffBzXZ5vgptf7qMVlFbxsimUN9dJMELFp2LUjE
         Sl1qTZSfWv5O0j1a568Trf4v0PEOGmQe3Dhyxgjf4Now0ao7xeJAMPZznM+XRcmut+QE
         NSoT/KchvA+5A0DNDMYxc5mE5uGtTsrMoneIRo6wLoYmFeG05AEOE7dIZEGfkIB0aE+S
         yocAtnGyjcdm+YIaaGJJStWXyg6bFY1c0CVteMt3EIBFJtcujSaXs2VDRbsegk4K/INe
         oxNnt6UIIY94r/hPzzzBZs8eYNBaNaxdBn/GUUqm657iXRrKBEWGVAGDZP972UvmZ08k
         BquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717666720; x=1718271520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uzRoQkjhLlH3aMQ2w1B8Mep7CWm5DreMQa4sEdwu3E=;
        b=fsfwTIZCxHXqmgFospEllnOdsFtOIqg3n+k+lROl8SNeAJEnYtV7AOv/yaa9tfS3ob
         ZZGBnE7Fy4HqmS7Y6SKuylSPiwx8Wu9JkAuQMze/GXHb0bUHX/k2NsvvoTgAplzVxIhl
         SD0/5sxvPLdICrJXlXiQLWo5v9K8N8Pc8bsN2w+RZhLjx/KHMWlY+B6Ci95xE3CbVS1P
         zdC/EFk3JytNNDgbaozVNA3bGTZdge3gsDBIsQW2+g/FbW4KrCXwNi4X+DbqwzSyHNZp
         ezk9DRJU0CZeEvubAU3Jv7kmn9hunglzznHPBYTWVpWoLEStOoht9QSMPZbkquu1HCoo
         1wwg==
X-Forwarded-Encrypted: i=1; AJvYcCUDjomeSCV/X6q9JpNEb106hZvWRn/NuMCdEuIpsxuq/XrGpvWxBgHmYybtPCot9Bja2V4eE/QurhwdYIqxTv4OdIIpU9VLTsY3h0j75HqM5u0uWgtx7aodw7nSw1dJghnT1NGRkTtl7KXEuXJXd9dFk1zCprpHt5gQhodJSXf5ajZHc9GaQbDvyd6Q3TzwzXdm9NBJJEB/4XEnc4EhFNTwTs+Kpdul
X-Gm-Message-State: AOJu0YyRHh2x6cN/5D+yvxLTHDDW39BcobOevSRdXGDqoJyYk8uW8hUT
	71BQDWPwcG6ghz49kCmBQvxqQDnIXOkjrcC9+EU562gOcMulUg356nNu//i+sxZJDHRasmEmx+G
	+C6cWX0emuG1fo840P5mamIOt6QM=
X-Google-Smtp-Source: AGHT+IHAC481NqArocQeFW+Qj/4Ff7uVhQb47OdnDRkX5aVif4JsrBIBTupUWE+GRC5pxgihrQhNxLyPDog9pldz2AE=
X-Received: by 2002:a05:6122:489b:b0:4c9:a9c9:4b3b with SMTP id
 71dfb90a1353d-4eb3a4145acmr6751705e0c.9.1717666719889; Thu, 06 Jun 2024
 02:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 10:38:12 +0100
Message-ID: <CA+V-a8tXLsfTvuCWDqiFkWbe=C2Coo8KF4GchbHPzOG+RTiChw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Thu, Jun 6, 2024 at 10:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Wednesday, June 5, 2024 8:50 AM
> > Subject: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) S=
oC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very si=
milar to those found in R-
> > Car Gen3. However, they are not identical, necessitating an SoC-specifi=
c compatible string for
> > fine-tuning driver support.
> >
> > Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> > - Voltage level control via the IOVS bit.
> > - PWEN pin support via SD_STATUS register.
> > - Lack of HS400 support.
> > - Fixed address mode operation.
> >
> > sd_iovs and sd_pwen quirks are introduced for SoCs supporting this bit =
to handle voltage level
> > control and power enable via SD_STATUS register.
> >
> > regulator support is added to control the volatage levels of SD pins vi=
a sd_iovs bit in SD_STATUS
> > register.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/mmc/host/renesas_sdhi.h               |  7 ++
> >  drivers/mmc/host/renesas_sdhi_core.c          | 67 +++++++++++++++++--
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 45 +++++++++++++
> >  drivers/mmc/host/tmio_mmc.h                   |  4 ++
> >  4 files changed, 118 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas=
_sdhi.h index
> > 586f94d4dbfd..9ef4fdf44280 100644
> > --- a/drivers/mmc/host/renesas_sdhi.h
> > +++ b/drivers/mmc/host/renesas_sdhi.h
> > @@ -11,6 +11,8 @@
> >
> >  #include <linux/dmaengine.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> >  #include "tmio_mmc.h"
> >
> >  struct renesas_sdhi_scc {
> > @@ -49,6 +51,11 @@ struct renesas_sdhi_quirks {
> >       bool manual_tap_correction;
> >       bool old_info1_layout;
> >       u32 hs400_bad_taps;
> > +     bool sd_iovs;
> > +     bool sd_pwen;
> > +     struct regulator_desc *rdesc;
> > +     const struct regmap_config *rdesc_regmap_config;
> > +     unsigned int rdesc_offset;
> >       const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
> >  };
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 12f4faaaf4ee..2eeea9513a23 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -248,6 +248,19 @@ static int renesas_sdhi_card_busy(struct mmc_host =
*mmc)
> >                TMIO_STAT_DAT0);
> >  }
> >
> > +static void renesas_sdhi_sd_status_pwen(struct tmio_mmc_host *host,
> > +bool on) {
> > +     u32 sd_status;
> > +
> > +     sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> > +     if (on)
> > +             sd_status |=3D  SD_STATUS_PWEN;
> > +     else
> > +             sd_status &=3D  ~SD_STATUS_PWEN;
> > +
> > +     sd_ctrl_write32(host, CTL_SD_STATUS, sd_status); }
> > +
>
> May be use regulator_set_voltage() to set this??
>
This is the PWEN bit which is not modelled as a regulator, we cannot
use regulator_set_voltage() to set this bit.

> >  static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *m=
mc,
> >                                                   struct mmc_ios *ios)
> >  {
> > @@ -587,6 +600,9 @@ static void renesas_sdhi_reset(struct tmio_mmc_host=
 *host, bool preserve)
> >                                         false, priv->rstc);
> >                       /* At least SDHI_VER_GEN2_SDR50 needs manual rele=
ase of reset */
> >                       sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> > +                     if (sdhi_has_quirk(priv, sd_pwen))
> > +                             renesas_sdhi_sd_status_pwen(host, true);
> > +
> >                       priv->needs_adjust_hs400 =3D false;
> >                       renesas_sdhi_set_clock(host, host->clk_cache);
> >
> > @@ -904,6 +920,34 @@ static void renesas_sdhi_enable_dma(struct tmio_mm=
c_host *host, bool enable)
> >       renesas_sdhi_sdbuf_width(host, enable ? width : 16);  }
> >
> > +static int renesas_sdhi_internal_dmac_register_regulator(struct platfo=
rm_device *pdev,
> > +                                                      const struct ren=
esas_sdhi_quirks *quirks) {
> > +     struct tmio_mmc_host *host =3D platform_get_drvdata(pdev);
> > +     struct renesas_sdhi *priv =3D host_to_priv(host);
> > +     struct regulator_config rcfg =3D {
> > +             .dev =3D &pdev->dev,
> > +             .driver_data =3D priv,
> > +     };
> > +     struct regulator_dev *rdev;
> > +     const char *devname;
> > +
> > +     devname =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regu=
lator",
> > +                              dev_name(&pdev->dev));
> > +     if (!devname)
> > +             return -ENOMEM;
> > +
> > +     quirks->rdesc->name =3D devname;
> > +     rcfg.regmap =3D devm_regmap_init_mmio(&pdev->dev, host->ctl + qui=
rks->rdesc_offset,
>
> This is (CTL_SD_STATUS << 2) , so the variable can be dropped from quirks=
.
>
rdesc_offset is added to make code generic, that is in future if there
is a new chip with a different offset which supports IOVS we can just
pass the offset for it.

Cheers,
Prabhakar

