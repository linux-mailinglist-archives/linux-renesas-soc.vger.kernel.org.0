Return-Path: <linux-renesas-soc+bounces-6505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D989190F3E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 18:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E73C2868E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 16:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D8C1534E9;
	Wed, 19 Jun 2024 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxrQ7+Ho"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCF1534E6;
	Wed, 19 Jun 2024 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813968; cv=none; b=LG36XMr3AvtslOy+fHIlBZf1qYtsl6s0tR9DklmTkPVCXuPbL+RuKDxsjRMDmEFjlHOdHXnIPaCbYPNVtp64/4zElc0rrz1Oq3SPixQwUjkeXO5fI5wguFVdlrjsnji3q2v4wJndoSgMo3gBeU7DRkrYtUMAJTzLy+wYXG1N8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813968; c=relaxed/simple;
	bh=UMgouaT6S/IixEQF8EjbaOo9Ec9dIFnfX3ko37uhAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2NSkeqTfi4IFJqqWNgZaY7qEoYxRDjxorjl3j+ttNLOIXtDNxCaZlYzSAcPhNZOc3fafNVnKPTJsCuvblsfed42YV3/zxDZHUixGDC9q18g+7qzuKqc/gn9kVUxAizBnka3od/4+h9gMdmSvXRCKOjFVaj0oENd99mMm/p9jV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxrQ7+Ho; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25488f4e55aso19694fac.0;
        Wed, 19 Jun 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718813965; x=1719418765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFTtLiupNQjUDm5wJ7kx2VnTWJ/TIurLfPXStd+BLtA=;
        b=gxrQ7+HoV/6xifISWjvwpbsC7cY44G4DGahaMD8NXHngr5/YHeUWA9Y4aU9jVZ5Pqw
         /voMBbL0IELciBUgDnWGEtqQP0X7Qk90cq7Hib/ZLFfaZb8HDwY/WnDtzx6suRXfDpsa
         7MIjHsZOndJe6axUuh9NMjRVsSLhKy1kyzbcjFAxoKJo0ZG146cO2HQq+9azqwlKORko
         6aa3fcD/yd/oFmSUkPtO5GEkhztpylzNGBqi/h2cQkyjKW89rPo3Wx7L5gC9zvRt36GN
         m8giRC3xXRgyiwds13fUyyqU7ulzwjoXMHwBceCsR09nRmvU5xB0JAjGjTE4X4JSqfFp
         5OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718813965; x=1719418765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFTtLiupNQjUDm5wJ7kx2VnTWJ/TIurLfPXStd+BLtA=;
        b=Sa/qZcsMJiehhDkK38PZIbgaiPh6Fr210i/kRV4lx0GGUjCY/m2rUoUs7chuemoDKr
         yu0ma1L3TAnSVAiLf0ricHXNuzyoUepgzB11zV3rx36TTzwukTwol+rPTFJToL5Dkf/9
         ItdJDsVpNJ2WpVzo6kYxevmKCzDgiaoqTXuf2gB5G0SZJ/LrG07Wy/uryQYRZexTBtMi
         AFhT0v10/9GOait4NUTdH6lkNpD43qTFmUj8L6T6tY09ZZMxT6Ipr82d3ZpkdqOXBzUh
         2p2jLsMHps8kUwGISCCpmZZ3TmmEU3zJZ+IPB/aEut0WvvDmHujO4O4h+W45qYqGdfaS
         3cgw==
X-Forwarded-Encrypted: i=1; AJvYcCUtGniZNGRuozn42BXvGcsVOvmWwvvOjQZ1sQGC1XMsYeyBLTi2YmWjDeTMGi5lR5sxQhQKLUMQc46gukJm7awdqrZd79W46K2vEy1NVAnGBnxGsmVpf9ACXbjVRiMSg4vaI19UMbcVgZhu7v7gbh/K0FxZp8BiHT7TeZ4WalINkiYD4q6teBhfYekf
X-Gm-Message-State: AOJu0YwN+55EB/E2NS4DUFXW06c6kjmOHzNLdhtXawHG36z0ZW1aYMY7
	x1IGWjSb4GxC2HUT1CvWzeu2Cj5i78OkNpJ3VuG/PY9UDThmVNxvViEU1O14FqigyjVdKj9qvvF
	ikoPvcY5DgSQ0+pQN6e4Zb+MryJ8=
X-Google-Smtp-Source: AGHT+IG8lcFqoVxgi4qmEwYOa2FXhJDu1cbELTejcdqT7shjKmkU/mTPDTR+dr1wTP2oazD7SaMIDyBEPwcu4hTw8Zg=
X-Received: by 2002:a05:6870:5247:b0:254:956f:ff9a with SMTP id
 586e51a60fabf-25c94a1f1b3mr3499722fac.32.1718813964714; Wed, 19 Jun 2024
 09:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
In-Reply-To: <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 19 Jun 2024 17:18:58 +0100
Message-ID: <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Mon, Jun 17, 2024 at 9:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > - Ive modelled the regulator now to control the PWEN aswell.
>
> Yay, this looks much better. Good work!
>
> > - I have still kept regulator bits in quirks I was wondering if I shoul=
d
> >   move this to renesas_sdhi_of_data instead?
>
> I think so. An internal regulator is not a quirk.
>
Agreed.

> > - I still need to add checks if the internal regulator used and
> >   only then call regulator_enable/regulator_set_voltage. ATM I am still
> >   unclear on differentiating if internal/external regulator is used.
>
> When it comes to re-enabling the regulator in sdhi_reset, I think this
> can be a sdhi_flag like SDHI_FLAG_ENABLE_REGULATOR_IN_RESET or alike.
>
OK.

> When it comes to the regulator, I wonder if it wouldn't be clearer to
> replace renesas_sdhi_internal_dmac_register_regulator() with a proper
> probe function and a dedicated compatible value for it. We could use
> platform_driver_probe() to instantiate the new driver within the SDHI
> probe function. This will ensure that the regulator driver will only be
> started once the main driver got all needed resources (mapped
> registers).
>
I did give it a try with platform_driver_probe() and failed.

- Firstly I had to move the regulator node outside the SDHI node for
platform_driver_probe() to succeed or else it failed with -ENODEV (at
https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L953=
)
- In Renesas SoCs we have multiple instances of SDHI, the problem
being for each instance we are calling platform_driver_probe(). Which
causes a problem as the regulator node will use the first device.

Let me know if I have missed something obvious here.

> My gut feeling is that it will pay off if the internal regulator will be
> described in DT as any other regulator. Like, we could name the
> regulator in DT as always etc...
>
> More opinions on this idea are welcome, though...
>
> > --- a/drivers/mmc/host/renesas_sdhi.h
> > +++ b/drivers/mmc/host/renesas_sdhi.h
> > @@ -11,6 +11,9 @@
> >
> >  #include <linux/dmaengine.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>
> Regmap can luckily go now.
>
Agreed.

> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/machine.h>
> >  #include "tmio_mmc.h"
> >
> >  struct renesas_sdhi_scc {
> > @@ -49,6 +52,9 @@ struct renesas_sdhi_quirks {
> >       bool manual_tap_correction;
> >       bool old_info1_layout;
> >       u32 hs400_bad_taps;
> > +     bool internal_regulator;
> > +     struct regulator_desc *rdesc;
> > +     struct regulator_init_data *reg_init_data;
> >       const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
> >  };
> >
> > @@ -93,6 +99,8 @@ struct renesas_sdhi {
> >       unsigned int tap_set;
> >
> >       struct reset_control *rstc;
> > +
> > +     struct regulator_dev *sd_status;
>
> This is a strange name for the regulater. Especially given that you have
> as well the more fitting 'u32 sd_status' in the code later.
>
I will update it.

> ...
>
> > +static struct regulator_init_data r9a09g057_regulator_init_data =3D {
> > +     .constraints =3D {
> > +             .valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
>
> Don't we need REGULATOR_CHANGE_VOLTAGE here as well? Or is this implicit
> because of REGULATOR_VOLTAGE? Can't find this, though.
>
I will investigate it.

Cheers,
Prabhakar

