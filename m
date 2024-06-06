Return-Path: <linux-renesas-soc+bounces-5912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C168FE365
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49DFB1F2452E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686C179956;
	Thu,  6 Jun 2024 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxIQ5FY5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EB179202;
	Thu,  6 Jun 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667405; cv=none; b=d9KbOT5yB1gwf+b8zCWl/yzgRrWFkeVKsHwhSXZNbHHd7Nh73V7LfvFc0jjZ33WUUP0bEvMQ/DWj47vITDJW+1oTO+klgMV6ZyMG4luq+zAcuWLdDQK8IyLR6jZeT5ZWqA4NkpbIwlIW21sTeRVicH89L4FqKwRccxEjRX3i0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667405; c=relaxed/simple;
	bh=bmLdGrZRQXnegcGiTYMlVVgkUaEWpL+WbZvlKBp0HCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEHWo/VdRbzakh8Sguh52nsyUiDhS0I/qX5cMERBz30mXnIckj9P+qPmxeLblnYkHZmI8+0o80RTdH1Do0aiKMqggjymz/E2470gP6J6gFvLVVVBET9dTPHnRXE4mOYSiI/Dmn2RG8ZoXHt5p2HOPdRep6RlJHDMhW2r+lBwRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxIQ5FY5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-80ac76f1226so1082201241.0;
        Thu, 06 Jun 2024 02:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717667403; x=1718272203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt8VYjdgFV32IITBFPs8G4GKKzvcpXkwGBY8GKcJ8X4=;
        b=MxIQ5FY51fwxqFxXIDurItMpSFtqVEJiNujwsj4CNEYKSZ1Ex0W4BminbeK93ZUd0Q
         WMZCL9vovT11s5Z7rkWSJV54NjmhrnHzIyPCsFOU62SLo/UPRVM7FQ3lhllXBZ5D97DI
         Mlqxg1foKU33owMWlVlzSJzizCEOvz4z7IymFvUMjuASPbqe7vQWoQgJjYwkCLB678Lp
         b6NMGL8AadRRRlY8m1ARWQK364DGOqSUor04jHKg11b8IqvBj+0wEFP4dAEZeXA2zUa4
         1dtbZ4I4W2pO/lqSwbYv/+5YwqHziq0r1Jmwr7TTn4++HEtwkRqeIXVrbPmZZJNkTBli
         0WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667403; x=1718272203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pt8VYjdgFV32IITBFPs8G4GKKzvcpXkwGBY8GKcJ8X4=;
        b=e6smrx0W7FNKF7Bqc3h9fO9spN55Qz0Q4l7HkDXZ7mh2UzTZ9UG0SOXR8knjsUFyRj
         ahvHDwciQIMe8KuTEUyibAqYblugQFrIMtjVff+Fc/lCeLeqCnJ8ROItpXczuZSCNGIn
         6Iu56X8JZIXqeP0zXiqlEUHlvTlRJJdw2CWYAhyduE0Xc3KrwpoXp6h0cMfcTQU1tU7q
         BhMN1/uCxJG4O0SYqOb4UTommdVLyEr9DloXZu7WYIGX5xC8hMn0eUqBQawGaa2W2fGI
         bMEjLVvAEeQz7IS55AR/NF8s8JAUm0RNII5W0bFkgVjAN3hMXx2uOMDADOf/PiwuC50K
         h2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUfK01CmA4auybMsgwkG/LrMcC1lmtG35NA0/kjUPaZJM5n3eEj50fjsT9OsM7YaKom2v3ERCUCLZS1pdb2q3IpKOcgFgkHBAGpio1wogIBa+CE3N4dFbFJXOpC/HurcofkGmdOBE7gCvNDgN4i+Lgq3qMIMQAOAv7yc+eL8ceA2R5l/ie8V6unjrJf0mhjMV4Z76T9BMoGFFAtGv37p5s6Uu0IaWZQ
X-Gm-Message-State: AOJu0YwosQ5W/njcc3yVaGdZQlVOKzl4n6KeKWczYAFE/CEz3oWecm2l
	j4MBTdlJJ9H/ulCEidCzffSy8YjRGRV4786mo5OkhB4R9oCElbpWDPbVeKFgBAE3VUoqAj1W/PY
	lEYmifnsQxui544k+4FZDGjPG3EY=
X-Google-Smtp-Source: AGHT+IGVAqNoszwU9soSJ6eGzHcPJKwFbzgrNpgoIuG3yV15kr7QHNvDbxF+BE3cmgmwJgu9YAAd9XA5OL3en06SLcE=
X-Received: by 2002:a05:6122:17a2:b0:4eb:12d4:d3b0 with SMTP id
 71dfb90a1353d-4eb485c084fmr2483444e0c.3.1717667402241; Thu, 06 Jun 2024
 02:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tXLsfTvuCWDqiFkWbe=C2Coo8KF4GchbHPzOG+RTiChw@mail.gmail.com> <TY3PR01MB113468DD4C215E58B4499BAAA86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468DD4C215E58B4499BAAA86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 10:49:36 +0100
Message-ID: <CA+V-a8tXp0sa_FiVzAkz2Uax1iv3XK90ug2KuKxuHRSP5Vfx1Q@mail.gmail.com>
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

On Thu, Jun 6, 2024 at 10:43=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Thursday, June 6, 2024 10:38 AM
> > Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(=
P) SoC
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Thu, Jun 6, 2024 at 10:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
<snip>
> > > >
> > > > +static void renesas_sdhi_sd_status_pwen(struct tmio_mmc_host *host=
,
> > > > +bool on) {
> > > > +     u32 sd_status;
> > > > +
> > > > +     sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> > > > +     if (on)
> > > > +             sd_status |=3D  SD_STATUS_PWEN;
> > > > +     else
> > > > +             sd_status &=3D  ~SD_STATUS_PWEN;
> > > > +
> > > > +     sd_ctrl_write32(host, CTL_SD_STATUS, sd_status); }
> > > > +
> > >
> > > May be use regulator_set_voltage() to set this??
> > >
> > This is the PWEN bit which is not modelled as a regulator, we cannot us=
e regulator_set_voltage() to
> > set this bit.
>
> So, there may be a race between regulator driver and this bit??
>
No, there won't be any race between the regulator driver and this bit
as the regulator driver only controls the IOVS bit and not the PWEN
bit.

> >
> > > >  static int renesas_sdhi_start_signal_voltage_switch(struct mmc_hos=
t *mmc,
> > > >                                                   struct mmc_ios
> > > > *ios)  { @@ -587,6 +600,9 @@ static void renesas_sdhi_reset(struct
> > > > tmio_mmc_host *host, bool preserve)
> > > >                                         false, priv->rstc);
> > > >                       /* At least SDHI_VER_GEN2_SDR50 needs manual =
release of reset */
> > > >                       sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> > > > +                     if (sdhi_has_quirk(priv, sd_pwen))
> > > > +                             renesas_sdhi_sd_status_pwen(host,
> > > > + true);
> > > > +
> > > >                       priv->needs_adjust_hs400 =3D false;
> > > >                       renesas_sdhi_set_clock(host, host->clk_cache)=
;
> > > >
> > > > @@ -904,6 +920,34 @@ static void renesas_sdhi_enable_dma(struct tmi=
o_mmc_host *host, bool
> > enable)
> > > >       renesas_sdhi_sdbuf_width(host, enable ? width : 16);  }
> > > >
> > > > +static int renesas_sdhi_internal_dmac_register_regulator(struct pl=
atform_device *pdev,
> > > > +                                                      const struct=
 renesas_sdhi_quirks
> > *quirks) {
> > > > +     struct tmio_mmc_host *host =3D platform_get_drvdata(pdev);
> > > > +     struct renesas_sdhi *priv =3D host_to_priv(host);
> > > > +     struct regulator_config rcfg =3D {
> > > > +             .dev =3D &pdev->dev,
> > > > +             .driver_data =3D priv,
> > > > +     };
> > > > +     struct regulator_dev *rdev;
> > > > +     const char *devname;
> > > > +
> > > > +     devname =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-=
regulator",
> > > > +                              dev_name(&pdev->dev));
> > > > +     if (!devname)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     quirks->rdesc->name =3D devname;
> > > > +     rcfg.regmap =3D devm_regmap_init_mmio(&pdev->dev, host->ctl +
> > > > + quirks->rdesc_offset,
> > >
> > > This is (CTL_SD_STATUS << 2) , so the variable can be dropped from qu=
irks.
> > >
> > rdesc_offset is added to make code generic, that is in future if there =
is a new chip with a
> > different offset which supports IOVS we can just pass the offset for it=
.
>
> Currently there is no consumer for it, so it can save memory. When a futu=
re chip comes
> we can bring back this variable??
>
OK.

Cheers,
Prabhakar

