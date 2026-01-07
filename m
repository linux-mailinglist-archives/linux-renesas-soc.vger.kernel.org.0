Return-Path: <linux-renesas-soc+bounces-26362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C92CFF294
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 18:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DF2132ACFCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AAE346AD5;
	Wed,  7 Jan 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+zuW7Xo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB9345CDF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802699; cv=none; b=aRD3bLGyX0FOgIIYiWz1zMoIwXSdyBMOdSd6bHGsB1eTx9nvrTdN3u+txppa2JCFX2DQ74K9sDXXL7ZDGZJ7iCSqyI6DlHW2ArRql2u1jdw5EJEa2mTdpL7T77cDUji9RX3Mqm0JaCPt3PGQDG+0Mmd+FINgWyu+cB49H2GobOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802699; c=relaxed/simple;
	bh=P1Xty01RvQupKmQhHSR0uSMUP7gSJhgKk0CW7HysnfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2YzrIvVXmAH2ZjYM9bcGKY7wU8MUJHAdAYTP3uSqSdvUcbAwgEuKmF6SVRxZSTlezEjfAwiyVpaAsRddv+6/VkcdWLtD/k/XJwBA2VKrmLL5Xbvp6fYSkO2bobVKzLiwYDgGBgfit6tE9k035VZur881+lgNuAlmtY9iig0Buk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+zuW7Xo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1155330f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767802689; x=1768407489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub6pcj+LESF7gm6VRMaH4L4JZtSRCvIUNf6ACo2jY6Q=;
        b=J+zuW7XojHykpfESZdGGblZlwJIH3qQcPHrpU/juS9+hacBzAWaBbhPYATOxsvQTHi
         UoPkvwqriO3TWXz5aA2bjY3bIaSvxVoCa9OmLIHgne+qek+gNnMuocW3i1VCUmIqmzWK
         GtfXxOFsPvDATslic099+hvpWzCCrK7gJlETLYmXEYrLk/CAgwxEJts4es0gURdRKbd/
         hbrr1cCyqv8p2TErr47MU9MTov6okYJ3wacd3BEfUTg0WbXaL41gqfkhMeeaXsSpcKUv
         y/bMTyThdMaYiObkFFVvbeK0vWCSMjfNX0EKWW2ywt+YSRdEEDpFaECLgeeVHL6F7rJ2
         nWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802689; x=1768407489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub6pcj+LESF7gm6VRMaH4L4JZtSRCvIUNf6ACo2jY6Q=;
        b=VxI8qgrPVEkoTJAOF+GqiM+Yv0MgdxeHomKSVFJkvJZ4WSeZbzhOECS5O5OV5K+Xt2
         YkIQAmX1Pc5kVgere1FHwmLv5zD/I+rv9jzswlcjM941Y3p+q4sxKED9j2treyF9+css
         m+w9Av+YvGfb6/ZZKoDm1TmHU6Am5OxM9EgYjEn+86mbOQqEHCwgqk0qcGjFoPtV5u5i
         yfgXCzQccFt+YSKgng8qAmr52A5dTeST1oBVtdGMy8WGC5hcEskoYrpNP1Fdwz8MvwF5
         0Ul/7dZVPuGpZhRXZYlJ+DuSxXw8pBJWssK+1eW1VtMOtEbBzDqUlfk43/THZf2xgs49
         BaBA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Zn6JbxNV04FyHcZKxHuVGbaRIdEzSiHfrUmc0ZtLCeshlp+b0HuZXgiBAi+8P+1f3YURNhAffOVJ3JVuDgE0wA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn9e9eDtLyWS563J0YlCxVtKa9rGPOQIAKJsaGay9KKjmRehL0
	JNFgky/L/P7vxvM/bohKtAz+e1rVFcvPXpl9gf87beey3i0ekzZ59PkKskqZZeA0/Ri/oZVaGoa
	DmZMuFNe1ZTAbVPEm5txjHU5Veyq98eg=
X-Gm-Gg: AY/fxX67rhx4F1j2IfDcnfWoQ8P4xJHAN9sbT5ElZCrf2eCqrMdHX9Be60e3Two11Up
	saual+lLkNKhznViZAQMPmAgp0yFLnpDW/ZzL7Fp71YpOwHX5XRS05z5GhKRlIqD70CVuSH1OP3
	zgDSA1+Tj8t5P4EM0ixGzCltEPg+fcc9Zz9Vc6IBJIhHZfc5pvfn78r/q2XIPs9mw3Ia7XhN40S
	TliGw4L+Ufh72p4EZB7i/3UQYLwT6jjm0gym/Z7DFxnsB+TbZaPKGTsQothrSfb9LQgtLKw02O+
	/OTfTy2Yw773A1CTo7hW5RCDeilcRVGilqTONIpN8brSwwZppvEv1ILMluOvFWqcAOt/4FRq2gx
	qAwtp/vAMiEFIvA==
X-Google-Smtp-Source: AGHT+IGu3w1dZTOB7vC4uPV3KF01IfYjQqaSIB3ic1Bl7p/Pe4T+dKGPTjyVB0Zer4Ju1T2Oo1DgWJNqzxNiDuAOoV8=
X-Received: by 2002:a05:6000:4013:b0:432:8585:6830 with SMTP id
 ffacd0b85a97d-432c3760f78mr4159464f8f.45.1767802688753; Wed, 07 Jan 2026
 08:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
In-Reply-To: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 7 Jan 2026 16:17:42 +0000
X-Gm-Features: AQt7F2pEf7prioPIipdcmgVFBpOq1BcZ2ikqnkNm7GziWlh0pmNM4fAPNlQ-bZc
Message-ID: <CA+V-a8t-2UiV74SvgmcLnWLA3yxdJGOnnjH17ZczY8mfD-90_g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jan 7, 2026 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Mon, 5 Jan 2026 at 15:06, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move spin_unlock_irqrestore() before verifying the reset result and
> > printing errors. The verification condition only uses local variables
> > and does not require locking.
> >
> > Reported-by: Pavel Machek <pavel@nabladev.com>
> > Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.20.
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_=
controller_dev *rcdev,
> >
> >         /* Verify the operation */
> >         val =3D readl(reg_addr);
> > +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
>
> I will surround this by blank lines while applying.
>
Makes sense, thank you for taking care of it.

Cheers,
Prabhakar

> >         if (set =3D=3D !(bitmask & val)) {
> >                 dev_err(priv->dev, "Reset register %u%02u operation fai=
led\n", reg, bit);
> > -               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> >                 return -EIO;
> >         }
> >
> > -       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> > -
> >         return 0;
> >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

