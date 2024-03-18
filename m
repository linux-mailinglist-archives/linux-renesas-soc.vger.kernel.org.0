Return-Path: <linux-renesas-soc+bounces-3844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425887E65C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DA76B223BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022182D051;
	Mon, 18 Mar 2024 09:51:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2A31A76;
	Mon, 18 Mar 2024 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755467; cv=none; b=sXZmi8SW0kXR+1a7Rei4fz/qrbi5V8KtKKR1mAj4glU6RN8qRAlCmR1T2N+YASdQoPIQxnF/P1yznVnA99yyF6ogrnYCEon4Szsn+9dnIom5by6EqWl62/A9I8fUuJsX1Na9RTlSZ7LdokRaVZgX9WmerTciP9TKHHVAn2HaEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755467; c=relaxed/simple;
	bh=TCKvEjztwIyAdPLygCi5Jj7+0iX7e4ty6j1B9HQ/mqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSvNw01t7HrkJkwX13W2c70nVf+sa24+iYNYcRxuS/XiV0amlJtSsEaXx71qLnrxAKgriz8Zsg1hisU4Gg67LU7auo8m9ARfz244Ej7Cf8HdfWQvD5/MWkJuF3oOpjw9ioOjeRnhHzfaZgvlQE6ZbiNIwh7MfGNVdVThpvCqXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso3396170276.1;
        Mon, 18 Mar 2024 02:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755463; x=1711360263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRTM/HyGmVaUWefQ/xWUeeo5hqE27GP3jfSXkAHRcfM=;
        b=OePmDgQdh3QmVwn97Fco1X07wJXAXyWmEZpPE0gJW77B56HQL9X9lfnmI7ZwQFNrIc
         EhoXOxjwzMzsrQz6GWdkH3XW25c+Umnz5Dk90I1zJE1nOWMdcUlpPv+WeHkRhv4P6LMo
         Ihyv4qKMUcdZDI462wO1/TR08jLSbnTtItDRZxxbZiaysNiV5mELF6MWpa2q+7frbJez
         Pm6ZdJlkYohrSYJJjSpC00R6p0mWvaZ0mqlYKIH+WV+RZu7cjH0V5DA7CsjoZqExXxgh
         D+ufKM6Z6d15AotAiwGfORPa38PI67kE4l6WR3Mqdju6RAAdXfP+EPCm0Pl8AsfQLuPx
         rDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTe+V3mxUjZ8xvUBclFjg8eWqlGoTnPa8XdvTHHbg1kGbTHac1f2gJFgOtCzhHUHBdy4By45VYzthGx/PMbuwG+zEg8Om1Ijr6vXHp5LquMJ3GG/oJrWQyGR8sV739ydh/AOXxY997P8+DSZo=
X-Gm-Message-State: AOJu0YxUSTF1rAKZUOPrGmm+6BzOa4wi2Nrnv1Bc54bD14uA1N8eUz39
	ez5YXC8Tz/Ytd010gJN+U0ISsA9350hrerGvH6UDMvpwbhm6eiy1oKzaPjjj/CY=
X-Google-Smtp-Source: AGHT+IHoCMH3evvqNN3oe//PoygXkSO1HmZ/o6DlL7KbMnocOc+4PcLCXbcnHxU1jkDQV5p5lrc3og==
X-Received: by 2002:a25:db83:0:b0:dc6:2152:3889 with SMTP id g125-20020a25db83000000b00dc621523889mr9569331ybf.7.1710755463439;
        Mon, 18 Mar 2024 02:51:03 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id v11-20020a05690204cb00b00dcda5ddeccasm1702491ybs.30.2024.03.18.02.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:51:02 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f1b77728so44120137b3.3;
        Mon, 18 Mar 2024 02:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGghN5AzLLyfuQbNdnZVmElgAxYHsPxTHyUqx57OCQh+Oo2g9yjJX3fEkj+xH5fdXcriYQUn6n9RG53uJ7YekPW5BMK6hnps7rrdStghX9e7arZa2Vh7w5OOewl7g+kaLPnhSbpCK0hlgOjkI=
X-Received: by 2002:a0d:fc44:0:b0:610:cf4f:b0a with SMTP id
 m65-20020a0dfc44000000b00610cf4f0b0amr1466661ywf.5.1710755462680; Mon, 18 Mar
 2024 02:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
 <20240315183921.375751-5-biju.das.jz@bp.renesas.com> <CAMuHMdXzSCpPSwHYzJrU7L=Lqftw=d4uV6gHMfDPjWDVH2BPbQ@mail.gmail.com>
 <OSAPR01MB1587FB542C8E622F4D7A425C862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB1587FB542C8E622F4D7A425C862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Mar 2024 10:50:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTsjjRNSd8XYtS2D+q3u+CGKRqgscDye+xpvbvtACGjg@mail.gmail.com>
Message-ID: <CAMuHMdUTsjjRNSd8XYtS2D+q3u+CGKRqgscDye+xpvbvtACGjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_configs from
 struct renesas_usbhs_driver_param
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Mar 18, 2024 at 10:33=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Monday, March 18, 2024 9:22 AM
> > Subject: Re: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_confi=
gs from struct
> > renesas_usbhs_driver_param
> >
> > Hi Biju,
> >
> > On Fri, Mar 15, 2024 at 7:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > Drop has_new_pipe_configs variable from struct
> > > renesas_usbhs_driver_param and use info for getting device pipe
> > > configuration data by renaming usbhs_new_pipe[]->usbhs_rcar_pipe[] an=
d
> > > changing the static qualifier to global so that struct
> > > renesas_usbhs_platform_info can be filled by respective devices.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3:
> > >  * New patch
> >
> > Thanks for your patch
> >
> > >  drivers/usb/renesas_usbhs/common.c | 9 ++++-----
> > > drivers/usb/renesas_usbhs/common.h | 2 ++
> > > drivers/usb/renesas_usbhs/rcar2.c  | 3 ++-
> > > drivers/usb/renesas_usbhs/rcar3.c  | 6 ++++--
> > >  drivers/usb/renesas_usbhs/rza.c    | 3 ++-
> > >  drivers/usb/renesas_usbhs/rza2.c   | 3 ++-
> > >  include/linux/usb/renesas_usbhs.h  | 1 -
> > >  7 files changed, 16 insertions(+), 11 deletions(-)
> >
> > Do you need this patch, now RZ/V2H can just set .has_new_pipe_configs t=
o zero?
>
> RZ/V2H has similar configs with RZ/G2L and Old SH SoC's.

Sorry, I meant RZ/G2L (the RZ variants are starting to run around
inside my brain like cockroaches... ;-)

> So, you mean just set . has_new_pipe_configs to zero
> for devices using usbhsc_default_pipe[]??

Exactly. Wouldn't that be sufficient?

Now I have a better understanding of what renesas_usbhs_driver_pipe_config
does, the only thing that matters is how many entries you have, right?
So .has_new_pipe_configs =3D false means 10 entries, true means 16
entries. Hence if .probe() knows the number of entries, it can pick
a suitable table.
As long as there are only two tables, the boolean .has_new_pipe_configs
is fine.  If we ever need more tables, the boolean can be replaced by
a numerical value.

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

