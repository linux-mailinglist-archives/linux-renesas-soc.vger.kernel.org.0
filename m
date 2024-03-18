Return-Path: <linux-renesas-soc+bounces-3845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507387E670
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857411C217F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081D52D04C;
	Mon, 18 Mar 2024 09:52:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF6376F5;
	Mon, 18 Mar 2024 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755528; cv=none; b=OSAeSrEgfxK2aqu93TSpMSweX2UtEQZrCUCkNFx2cuxJVXOCi+V6AbyiO66xUoxDp3oWg2TFSnWDUI+tHmYRwUQYF0z3aRsiZ7h/U/LC6oA+xA3TcAPJP3QFzBwRbEipstRV7zohIYe9V0Vc9Qs2qcH8pJDDoCO6HcRnW7853RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755528; c=relaxed/simple;
	bh=QepCC4jh/z1oyfrAB08Nh/+RtZkJcjdQvGuSYzUyAXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXo/M/Q273n2IfkH83lIWxRJveGhg2fJhJgvcqY2g39xPqjVT19D7OSe5Lr5Vg0nD69+IkH0BKPLpF11SIwFyBF89Imv0Lhc9VocqOpSAb4PXsKNr0imk6htBJ6AETmVF8Esy2kL9Dnpvtq0ytg4Dj/3TIV4GLco51So69MWX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso3852817276.0;
        Mon, 18 Mar 2024 02:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755525; x=1711360325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbC4jkIjZgELDVdlA/y+TC0dWbtax/sF1ynKF0NWsYI=;
        b=gNTuk0C70iicW1VEOSK7h+Ue79Y4IIgKE5sh5Jbl95wgQKNqj6BaX/JVol22oebNdB
         6517VGoq7YnBQmASrUGQLNNhQ5F7eW98E+hAtiMCcSQHp5g7Y7pkbgvkOvq6a+AfKnXd
         k6X939R3j/cnlDs1pBn222wiLNQvMGcnFCbldh8I3pgy0P2qv4j+HnEyGUdac/I4q1yM
         YvXTgsy1ET/OQiiPtqhgCcUh2FOIo+tpOjdYI1/StzYodVYPI03c4/TpPoZjroNC1aMt
         76yhaj8sMbd4USx6raYsO/OdxWb3Jj+/4135KHEHs9rO6B4Uk5St2g1vchcforGGvTxa
         SIqg==
X-Forwarded-Encrypted: i=1; AJvYcCVil0hXWtzWhx1bnaURkNQ3AuL/lU/MdG/u+Oqp5TpqHFhKjaHeJqYPK+WHbSYcFd0E10pQ8FpL0V75iLkkcyn2tn8nNJaFXqG2rDFKN6ntiQ9I3bp64g5NhUUATQCsgwKH3FJ3vExcjn7tq2s=
X-Gm-Message-State: AOJu0YxAiAr22uF4CzjkmTgAKWdz5/h2VkNGYd5VcCuzO8vHPxRiLQwa
	PqVC/vwgt8k0Nkyf9uQSo+Rb+p840Qg2N4g1Uveyrm7jOezvM9lEf/VbWVY6KIw=
X-Google-Smtp-Source: AGHT+IFX4cSvfRhJAQTdOXWimB5MIi6ohfvPHPlkKuUVChiy+XvN/8rq0x9F/ZJ1ej9BIYkYMghhJQ==
X-Received: by 2002:a25:8591:0:b0:dcd:59e4:620c with SMTP id x17-20020a258591000000b00dcd59e4620cmr9342436ybk.49.1710755524844;
        Mon, 18 Mar 2024 02:52:04 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id b11-20020a252e4b000000b00dc7622402b9sm1692646ybn.43.2024.03.18.02.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:52:04 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-609f060cbafso48302837b3.0;
        Mon, 18 Mar 2024 02:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXj33tVkEB0Vg/l5qTHbcKcpFqpZxqOqyTpZMn/zwZ5AZgIJCbNPhh8qzW21aMobFz958zX5IT1eEYmof1AfxwX4L3/ajtgwmMGMV0BtWpeM7utrqUwIJamkUtM+3WdM+rP2vifx7RNKvmgcok=
X-Received: by 2002:a81:9e44:0:b0:608:3785:707a with SMTP id
 n4-20020a819e44000000b006083785707amr11164943ywj.52.1710755524097; Mon, 18
 Mar 2024 02:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
 <20240315183921.375751-6-biju.das.jz@bp.renesas.com> <CAMuHMdW5ZWOXuWc+thDTJ6+h7mcH7o+N6tVLhhkH=TKG2BZC6A@mail.gmail.com>
 <OSAPR01MB1587E4455F259156CE371F04862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB1587E4455F259156CE371F04862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Mar 2024 10:51:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4BEr7uO8FiHbPSiRFhRwdXu0+=xqbG65UhStdpcy2BA@mail.gmail.com>
Message-ID: <CAMuHMdV4BEr7uO8FiHbPSiRFhRwdXu0+=xqbG65UhStdpcy2BA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Mar 18, 2024 at 10:46=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Mar 15, 2024 at 7:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe buffer=
s
> > > on RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and
> > > use family SoC specific compatible to handle this difference.
> > >
> > > Added SoC specific compatible to OF table to avoid ABI breakage with
> > > old DTB. To optimize memory usage the SoC specific compatible will be
> > > removed later.
> > >
> > > The pipe configuration of RZ/G2L is same as the default one, so reuse
> > > the common table by renaming
> > > usbhs_default_pipe[]->usbhs_rcar_default_pipe[]
> > > and changing static qualifier to global to fill the pipe configuratio=
n
> > > data.
> > >
> > > Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Updated commit description
> > >  * Dropped usbhsc_rzg2l_pipe[] and reusing the default_pipe[].
> >
> > Thanks for the update!
> >
> > > --- a/drivers/usb/renesas_usbhs/common.c
> > > +++ b/drivers/usb/renesas_usbhs/common.c
> > > @@ -363,8 +363,8 @@ static void usbhsc_clk_disable_unprepare(struct u=
sbhs_priv *priv)
> > >   *             platform default param
> > >   */
> > >
> > > -/* commonly used on old SH-Mobile SoCs */ -static struct
> > > renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] =3D {
> > > +/* commonly used on old SH-Mobile and RZ/G2L family SoCs */ struct
> > > +renesas_usbhs_driver_pipe_config usbhsc_rcar_default_pipe[] =3D {
> >
> > So why rename this to have "rcar" in the name?
>
> Oops, it is not used by R-Car, but used by old SH SoCs and RZ/G2L
> As this structure becomes global now, Will use usbhsc_rzg2l_default_pipe[=
] instead??
>
> Or
>
> Will make this as static like current driver and drop filling pipe config=
s in info and
> use .has_new_pipe_configs to zero for devices using usbhsc_default_pipe[]=
??

I think just using .has_new_pipe_configs is the simplest solution.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

