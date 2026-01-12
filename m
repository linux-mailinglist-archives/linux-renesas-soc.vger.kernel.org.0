Return-Path: <linux-renesas-soc+bounces-26595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67ED12715
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 13:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39AF3006F58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 12:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61548352942;
	Mon, 12 Jan 2026 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjMe152x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12582C21F0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219465; cv=none; b=ckSejkH+DWgLzxdYSGlpiGoy6C8SmmqITiYkmqUyPxVRiAVtZYNEFXclJG8WhGMfLGdPJFNtEEGLq51X7oVCf+UJH1ATh1EuhggIRMeTQn774a36R8OTc6d66aS6OSaJ31dWXicrEFkDN67H6bQ1yzxy5vMjxpZVqQSrdaR7M0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219465; c=relaxed/simple;
	bh=owV/mzAQMgSgZqT2YNEQVofDEFHHk/+21LmjhX5q+Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCt2j7tKwW9SfEvj0J43rHPHt9Xs8BuY6YkEAXN97xkRSC5uYVRjd1BeuAV/cj5l1Qpf/l7ovEoTBR38mvGDdTji/+5+ypnEykIKbr4C1Wh1UEvwzxdKrFjb4rNlTENGN1gceu2hzHFmHRbCDgJL8iTa+Ppcce0wPw7ISrWH8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjMe152x; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305914so4477116f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 04:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768219462; x=1768824262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qCjJpPI4Nv2Sruqvo8JVCZ2nInrDNeq4vKMW92xMvc=;
        b=mjMe152xj/lPCBJAHZ9j3TmmJeIqUB9yWgDVSCCq8IErpZkM9IDqFS7uBJQqMzrRJQ
         K424xE1wXa6ksNhB8HVwYme4Hhiwk2YuI45VKs9bQjVDigh5rgFkb7P0OV9h98mBsKF5
         GyCeIiwkYj9KeP6UZE5EkGYm600zXjrcug87jT6IKrSr99ky3Ihne17fieVcfqyPMT1h
         SnFa8eOm2RwMZd401qv/Tx5FV/Xop5o2g196KNkVX/Z/jt+bOmPYtKaafG5QPpIcc58O
         0G+jNr60tTKlUXxWRQ0tkcrSw23noR3updlySnTaSH4K77kWQZMvqAil+cHT5yKNpK16
         ArFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219462; x=1768824262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4qCjJpPI4Nv2Sruqvo8JVCZ2nInrDNeq4vKMW92xMvc=;
        b=fjE65KDy4v5i6O33e8ueofOxGiMrC8MKJpBbk04fvhLqVWq7i0qER2S3ZKkTOU8I2T
         HN4ylpsiS6QA8YsILagWoUhsUDM/xXFstUeJltPBxKIdDXVFG/fRuddfBolWAtEr4Wnw
         S29hMwfC3RH2qs257hCPEHbftyl2oT18G8pCHV0ANwl78wLiYyp5If6vD5DBbKR9swCm
         Ss2oEBkD5z4f5zyGm/118Gieb6Ikx4rsV/WpbwtnY5HzKLOOuV/gpTzcl8hVExlcCN+7
         1C8BBXcBnfeJP+rqV8f4JVHopWUOEJwklUSbvrjMwIbI8xAeTnY+NMZnM62AoBXYWHhs
         ZX4w==
X-Forwarded-Encrypted: i=1; AJvYcCWVhfO04pGszFLnNp4s2AZy9UDx8OIu/5UftLrCC+M4pot+DILUNwNYlKpJFz2kBAL+TabvD6ZvMiRXxWGDUfFhVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhnIVHYWdY5+oQQ1ae6bYTl4xVb3i9e64bWilIzPIGKrS0EKE
	8FmVS2CVxRM/M81n5c3/pKVB6Cpf/UMPlsjKr3gQNoMmJoNJrlBFWdlnw/t2NxllioqdiAqLgkj
	RVYamloJUBvX7bSnnuej4mtTxu2KIO2I=
X-Gm-Gg: AY/fxX7Q+cxu3SagZucfC3KpNvslD27n7a956iuRZq4J+IuzqhG041wIxkMyWYKOKMC
	/Q5WSglt2CVQrqRYHG6i+sbrD37nTra4XudA1P273j3lI0MIOI2FxnefEpIZcU3x/6wyTAenm0f
	CwnF2Nyq4f0BTvy7m4FMxuvWDAqukD4dQBD0YKfO88KGTKbMLT+JwiZEEWP5yFvHEkAcu/RCQuV
	LS+LDL+ryHfLNNhOz16Nw+S/A/mVY2vVHt1ER+b2OceRTGl5gOGVkjtTifgGIUa873vFhJuaOVr
	5h6zVwdq6akcSAOPC6oDLIbSZsY3+jM574T2B4vMBzM9IEY5XOVp8uo=
X-Google-Smtp-Source: AGHT+IFleqUzD9PdoNRtoRImQZ9LCtOvaSoUd+ku2Uay3M7C+gWLGIYYIGe551DYKQUEtcgJaYVpbuo5ppnL49v+1SM=
X-Received: by 2002:a05:6000:1844:b0:42f:bab5:953b with SMTP id
 ffacd0b85a97d-432c37758demr20987353f8f.16.1768219461649; Mon, 12 Jan 2026
 04:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aWEUvef4eDlmuOic@shell.armlinux.org.uk>
In-Reply-To: <aWEUvef4eDlmuOic@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 12:03:55 +0000
X-Gm-Features: AZwV_QioW4DXXcjEyYpawN9Qxe7RxIEI2XGhrh2bEmXD6OAYa4cj6ZYh-0RkOlQ
Message-ID: <CA+V-a8vKJ6Z3Xp-u69oGzXr7ju+5RVdMXQcqErm8m8rU7pvauQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: pcs: rzn1-miic: Add support for PHY
 link active-level configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Thank you for the review.

On Fri, Jan 9, 2026 at 2:46=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jan 09, 2026 at 02:22:50PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support to configure the PHY link signal active level per converter
> > using the DT property "renesas,miic-phylink-active-low".
> >
> > Introduce the MIIC_PHYLINK register definition and extend the MIIC driv=
er
> > with a new `phylink` structure to store the mask and value for PHY link
> > configuration. Implement `miic_configure_phylink()` to determine the bi=
t
> > position and polarity for each port based on the SoC type, such as RZ/N=
1
> > or RZ/T2H/N2H.
> >
> > The accumulated configuration is stored during DT parsing and applied
> > later in `miic_probe()` after hardware initialization, since the MIIC
> > registers can only be modified safely once the hardware setup is comple=
te.
>
> Please do not re-use "phylink", we have a subsystem in the kernel named
> as such, and, for example, it too defines "struct phylink".
>
> > +/**
> > + * struct phylink - Phylink configuration
> > + * @mask: Mask of phylink bits
> > + * @val: Value of phylink bits
> > + */
> > +struct phylink {
> > +     u32 mask;
> > +     u32 val;
> > +};
> > +
>
> You don't get a warning for this, because, although you have:
>
> #include <linux/phylink.h>
>
> which delares "struct phylink" as:
>
> struct phylink;
>
> The definition of this structure is entirely private to
> drivers/net/phy/phylink.c and is intentionally not exposed.
>
> By redefining "struct phylink" here, it means that anyone using gdb
> is going to run into problems - which version of this struct is the
> right one for any particular pointer.
>
Ack, I will rename the struct to `miic_phy_link_cfg`.

> You describe this feature as "PHY-link" and "PHY link" in your commit
> and cover messages. Please use "phy_link" and "PHY_LINK" as identifies
> for this so that grep can distinguish between your PHY link feature
> and the phylink infrastructure.
>
Ok, I will use "phy_link"/ "PHY_LINK".

Cheers,
Prabhakar

