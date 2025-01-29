Return-Path: <linux-renesas-soc+bounces-12694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461CA21F8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB45B1884611
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC769199B8;
	Wed, 29 Jan 2025 14:47:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDAAD51;
	Wed, 29 Jan 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162044; cv=none; b=gLwnU3lC9u1lAm5TxHgoJjDu+EhviQvH/xuN4fjxewA44ndbJHg+ka1F0+bGvJYFYa+cDoZAeeRCoJeKJF2tJaBQbDXp7/aeN938wPRxgQ8WMk9B6kdLgvIQ5e2OAWDRooEHinpBp9nAG+caaZV1DK5pspKRGHDeJoBRpauj/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162044; c=relaxed/simple;
	bh=EpfRKdxc3yU9FUh5W1NYcgSiM+z03aKTHtLKvwc7OOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4RXRn9xqS5xkP22mZGEtsHRG1tArv5XNpCEuhaNJkO9Xctrik5yl6zh2RVJ+k3f0TY23rITCZe7JTkk0tMEsuFAebrvUk9Ln9rBBAg8tgNHCg24kG5jPaTPNpgHvOxzHa7h0nnzmRR45y/xxjCx5N/ZfpAOJXDsb0vc6e2mXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4aff31b77e8so2555016137.1;
        Wed, 29 Jan 2025 06:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162041; x=1738766841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z45gypCk9Q0XRqKa0fLsQqG9nymiAhCAjI876VFAQsA=;
        b=M1ZoXvMVoiJKEC+1tbi56eelVjuKuIh3DuY50sv+DR2Evwioc938vI8y/Jm0D2XpWz
         5D7HcDlY8SdQ1GJLxIPCoEdekVtCZ0zfBtsqQpzr+OzSi0tIAahCrQsT7h24e2uDpH2G
         qwPpNpm14EqITvReZ4kAxQ2qEUnJfMlaUUzwfnqCFhOCJhUZB37GjG0PEMQrnfUb1iJK
         iKTPyx/MAwczC0r2FhaKPSDlpjVqk7Z930Sh+61k73jFTgafDfvdRQHov0fLOIi179e2
         HTE+Qs5Gf4zOKRqUGsZp7bD1tOW1EQ2MYwbCZKs9IG2dzoC637PDBy5Cyx8/RegQroRt
         hUaw==
X-Forwarded-Encrypted: i=1; AJvYcCVavfk08+6uvB+ap0/7YcZB4M6EfcGnQACKPoPS962VhbWp70ivQuUFVYrqiEGvdzxtQqpGVJnYtSs=@vger.kernel.org, AJvYcCWiY7penZjhfh8WlHnsa3GYPj96THxqEp5KlSADkbLaIsXeGP26sKvwZGEMjnowG/yP64J1ekDAe63jF6n+7WCIjhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzy0RJjSM9HaW7hU8z3OAAUxw3+XX4RLNV5UZbIT6kH1odQCU
	HxkowLb+CNbtlJm3315llWRDcWhPmibSK10s31HJGJA/NHVOgajClrVIHN+s
X-Gm-Gg: ASbGncsSVm+tsN/LweQQEiy/gAavXB80fdTvJvyhj7ALURs8e6k02bCim1gl350JUss
	Wh4OnTU/YUuOx4Totgtrj6GSNFViT2gk0pjLLJk7oCgQw6LbTcn4nIcLVgcI7r8vFz07wvfxTYh
	hLcwWUdk638YquQyNsQYG3W7sW5YIcYsCI3X5yCU6vHu5tS39rJZaIsFBszlDe8pWFuYCEoiRc8
	F3iFA//2PgQAVy6jO1IMCW42bYBBUPxwcquqNl2Z28r9aVOAGuS4FOGn8W0N3EUOAhkwzB3o/5g
	njuycgo3H9Vgmrai0bVdHBps2uUw48zbgAue8H5jzihXAta0aYtv9w==
X-Google-Smtp-Source: AGHT+IGLzEGpcLa7Lf4Lpet0PEUaEWMRvwtsjMSFVQ+krAJNxWkWqaxsbnZTznjBlLUHk+VCfX9ENg==
X-Received: by 2002:a05:6102:b05:b0:4b2:48af:bc84 with SMTP id ada2fe7eead31-4b9a4f1d072mr2685503137.7.1738162040926;
        Wed, 29 Jan 2025 06:47:20 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c17e31sm2808586241.22.2025.01.29.06.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:47:20 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afe1009960so1997825137.0;
        Wed, 29 Jan 2025 06:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWv+b38QMdrp79XTd7Ieti9IW/JuuC4TnaYe1m/JUrzZCKcgO3S62V8bv6j85s2CgKm9mTbdVHOvS6bSFRL6llub4I=@vger.kernel.org, AJvYcCXp0+px/fQ+r1tf36BdIuMVDq51r7iiIhLDjdI+Hc4SfSFwZsD8efX0qFaTi9tTyE0CYcEyspH9N5A=@vger.kernel.org
X-Received: by 2002:a05:6102:b05:b0:4b2:48af:bc84 with SMTP id
 ada2fe7eead31-4b9a4f1d072mr2685492137.7.1738162040593; Wed, 29 Jan 2025
 06:47:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-5-biju.das.jz@bp.renesas.com> <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
 <TY3PR01MB11346ADB42D7CC3736A70BD4D86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346522AAB2956C00FC5BB1A86EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346522AAB2956C00FC5BB1A86EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 15:47:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCVs-8PyFyE-f=iO5tLkh=oMXPQg+pkJHMNwqLG0EZVw@mail.gmail.com>
X-Gm-Features: AWEUYZlr4npAKJaBRvylYvLgix7a7ToM4EdD2qyqTBBaPtXy30l3_vuzI9eg_Ho
Message-ID: <CAMuHMdVCVs-8PyFyE-f=iO5tLkh=oMXPQg+pkJHMNwqLG0EZVw@mail.gmail.com>
Subject: Re: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 29 Jan 2025 at 15:45, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 28 January 2025 13:32
> > > Subject: Re: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
> > >
> > > On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > The SDHI/eMMC IPs in the RZ/G3E SoC are similar to those in R-Car Gen3.
> > > > However, the RZ/G3E SD0 channel has Voltage level control and PWEN
> > > > pin support via SD_STATUS register.
> > > >
> > > > internal regulator support is added to control the voltage levels of
> > > > the SD pins via sd_iovs/sd_pwen bits in SD_STATUS register by
> > > > populating vqmmc-regulator child node.
> > > >
> > > > SD1 and SD2 channels have gpio regulator support and internal
> > > > regulator support. Selection of the regulator is based on the regulator phandle.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > >
> > > > @@ -1053,6 +1165,23 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> > > >         if (ret)
> > > >                 goto efree;
> > > >
> > >
> > > > +       if (rcfg.of_node) {
> > > > +               rcfg.driver_data = priv->host;
> > > > +
> > > > +               renesas_sdhi_vqmmc_regulator.name =
> > > > + "sdhi-vqmmc-regulator";
> > >
> > > Name conflict in case of multiple instances?
> >
> > This regulator name is Overriden by of_regulator() and it will pick the name from there.
> > See below. Am I missing anything?
>
> Just to add, without the name it returns error see [1],

Thanks, I had arrived at the same conclusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

