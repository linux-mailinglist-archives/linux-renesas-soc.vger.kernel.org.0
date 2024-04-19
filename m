Return-Path: <linux-renesas-soc+bounces-4731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2E8AA9ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 10:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35F41C20CA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 08:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221904EB58;
	Fri, 19 Apr 2024 08:16:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4604EB44;
	Fri, 19 Apr 2024 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713514579; cv=none; b=aL0db1wNJm+c4qRGhh0+mPVyRWKSAr+xMx3YM7/OdkO7P4oWRkJ+8jZzAr8aXMVu2idELv5Fyj3hj+bR3fcdXyN3urORRmdFx7WVmX14BUtxyAXUcw4aLK2GkySLw1nmqr6SldwySwSwCgAjLFgS0CUwrZQRTubp/HEOn5B7VIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713514579; c=relaxed/simple;
	bh=LPphLkGJH/EBrve0mrVUGWJVK9rJ2dE1bLDj98Y/Pj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUEoS1IeTWN8HCbUHknB+IdP23jM6pwJt/GSmFLCB0m7lxhIXIrBtFZZiYTwcNHG86szvy/jx7ctAoSv4Xsxo+1SH9MG50XKqSSI+gtENi0G+HTwvqDlAGn+iuf6Bkhk9EiefgSc3JKPo06ORPXD84B4UcESgB8GP8pYT1uZM7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-617ddc988f5so19206657b3.2;
        Fri, 19 Apr 2024 01:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713514575; x=1714119375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctMRsw42kctOS9RhJ9DoSgwPSD2sQYKkJlvGp/1QXy0=;
        b=teoplGna4o34+7su/GtXpSkM8g0pjrXwf1SWMC31/zCTK4bW09aGMs9enlv2QpDfvX
         z2bcy59KXTDcaVrLdrwL/+6Nuhz7FyuunEvmsHRuWjgWfDrXSEdba2e/oQkVWZnz/VOo
         KWGLbWwawftGEXwNcEJPHudKvvbMVXs2vmkMDk5g4FUuD55T5E5PMNabbLy71IoTCPHh
         0hK5oX407xYdWM1F9wbaRA0516oTNi5UONZsR2qYOae/DQbwNmoTbpA5LUgwWa2VlTGv
         EFqRdUK+rcL2InaRKA6ygznCjWEetyOtNahdhYT4a2a8QO5YbG4IwGA95219C0H3HBg0
         V+hg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZM0+AijgS4bTh2H2xqkwrVCh+fTV9+jIOxNAnC9t5Wd8rXPBmWVesly1CX0qZVd6o0DztMxyP47yJJB9yhGkBDL/jrRXUvmYXSeuYknZAT87UnsPin9oE34WXbIXikCc5qscFkrLioQ=
X-Gm-Message-State: AOJu0YxXEX6cfVmRh+XF2KQWY7WI4YaYbnQL9KYE/etLNJ0l4FQua36w
	9jYBQ/4tyoJqlz/u8NjtSm/QY1c5BpWGuLP9uz+432abmDBNXDXcVz2qC0D8
X-Google-Smtp-Source: AGHT+IFn2JJKNyUJP6bS1tqLKpvEouYk+JyVfHCBqp1uIEvODIyhiY7924ZVdUEizjdmdzKoS/psLw==
X-Received: by 2002:a05:690c:360f:b0:618:9407:db0c with SMTP id ft15-20020a05690c360f00b006189407db0cmr1302374ywb.32.1713514573934;
        Fri, 19 Apr 2024 01:16:13 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z12-20020a81ac4c000000b00617f1b4943esm672886ywj.106.2024.04.19.01.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 01:16:13 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de466c64161so1645885276.3;
        Fri, 19 Apr 2024 01:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4Ik+cLu7To/rsU3mXE7W0aWgKaDWh/7lQy/E6e7QeTZ5DLl8tkbGXoDwIZcjADwOKjxYVuxoUiJu7Q8xIJPUiKjvTkbjMYeJZnaHurNnJniFStNQThhdOkHr/CpqdR1YLX3z2IO+w+k0=
X-Received: by 2002:a25:ab4d:0:b0:dcf:3ef5:4d30 with SMTP id
 u71-20020a25ab4d000000b00dcf3ef54d30mr1185704ybi.17.1713514573005; Fri, 19
 Apr 2024 01:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch> <20240416085802.GE3460978@ragnatech.se>
 <ba68dd2b-b605-435e-8f6b-457bf8af08c6@lunn.ch>
In-Reply-To: <ba68dd2b-b605-435e-8f6b-457bf8af08c6@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Apr 2024 10:16:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt8z-fD7XQ74nfu=jSL8MT-1tauZk0iRzieyNUB4cyRQ@mail.gmail.com>
Message-ID: <CAMuHMdXt8z-fD7XQ74nfu=jSL8MT-1tauZk0iRzieyNUB4cyRQ@mail.gmail.com>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Apr 16, 2024 at 3:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> > > > + if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> > > > +         if (delay)
> > > > +                 val |=3D GPOUT_RDM;
> > > > +
> > > > + /* Valid values are 0 and 2000, according to DT bindings */
> > > > + if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> > > > +         if (delay)
> > > > +                 val |=3D GPOUT_TDM;
> > > > +
> > > > + rtsn_write(priv, GPOUT, val);
> > >
> > > So you seem to be using it as bool?
> >
> > Yes.
> >
> > > That is wrong. It is a number of pico seconds!
> >
> > The issue is that the hardware only supports no delay or a fixed delay
> > that can depend on electric properties of the board.
>
> The general convention is that the MAC does not add delays, it leaves
> it to the PHY. Probably 95% of boards are like this, and many MAC
> drivers don't even add support for configuring their hardware delays,
> it is not needed. Those that do, it is generally for fine tuning the
> delays, being able to add/remove 100s of pico seconds, not the full
> 2us. This hardware cannot do that.
>
> So i suggest you drop all this code, and just hard code the delay to
> 0ps.

IIRC (from users of RAVB, which have similar delay bits), the issue
is that some boards require a larger delay than the maximum delay
supported by the Micrel KSZ9031 PHY (960 ps).  Hence these
boards need to enable the MAC delay.

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

