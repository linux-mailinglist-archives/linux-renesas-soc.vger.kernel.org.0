Return-Path: <linux-renesas-soc+bounces-26598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBECD127BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 13:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B29B30ABCCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 12:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8C9357729;
	Mon, 12 Jan 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaTSmOTx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B882357714
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219955; cv=none; b=jVYakOgMOaswgQ9Jw+/rWF/z2B4l9eekHDPDve8GQTZa0tSqmRzPa3/ESirh7+vTrtPu86Xlcnbgh/bCvR3MSncRA20M0v9UVtCeaG+XVG7fOodPM5Ny1I/rHdTGbw9NUhFF4P0hAz0ZVX8dlIUNALLNc9Q7M9aQ+Voi3hxYNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219955; c=relaxed/simple;
	bh=TWbhPBAIKAm5t8vyAUtw16r1eURjReug56t9Dx27Pl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYDmGoCri84MS3OGODQRy2fdlhZMgOaO/zqhDnJ/Tjg/zNmrhHlXEWgDW10/5O5iHbGbAS1q9cZJtV44YYtSm2qipDC5lZUEqpM7xsHsZkVfuE1K4Kwk7XcioDnRWoivxYtp3/cwJHcDbmuYD+z7hh5eVYD5JIZzgK/lwCZ0oDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaTSmOTx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so4703543f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768219952; x=1768824752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmg0YBnqbNA08twWWhFsABytT3ibNSR8wV2mBBA27+Q=;
        b=SaTSmOTxULg06bM6mXRgfJTzRh8LLk9WzqyvlG2wIWC2cY0Prk/CrqfOP9fjHBBQ/t
         nSNc4M/l8BWGJHUZ+dSC1HCiyuI4iDwmFlq89PfJgCk2Ya+7d9Y5iD8GHldMbjPeNmD4
         djJl6qY86gKKhysXFJwnkBVNL5/xj6rGYHHdfuk+5mvT+ndJEYuHQbew6s8TZA+WWNCP
         HvpWTXgsI3zRJNxo/398l5VeJYJaGvN2Rl/VFKsb4DWrjE8/n/1caaLX5+UKW8ByRZdZ
         eFMfz+yi9RRq/KmBrVyjBif7Us6BNdLbP4E9LgVOKszWztAypfVolNZ/YUuSKQQ5Grmo
         uEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219952; x=1768824752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zmg0YBnqbNA08twWWhFsABytT3ibNSR8wV2mBBA27+Q=;
        b=Ogafry0j1LrwsJSe5qAXk0p10EnTQMP7Odlbp0U7iYnUyND9q6Jf1IrPFumT/U7TDA
         9Q4HW0hICB7jxHMJ5SpWA6LADXoaLaxLFQw9d8D88CHCgTYgy+HO1ogoRDCA2FNmL3w4
         L5loO8sQhz6LGo9SMkmhOlh0G0GHya/iLV8ZUBB59fPpc+QErIP5WFEpusOS5+qAhyTo
         8D8UknitOt8JpJElLD0EZUO4L1TKT6+lgC7dhvb2qSPDV6dEn+bm/sOzzNCBisEElz+f
         O/tramX5PA6JY28kUZyc1wTUE7PbBi8uMF6NXDVcKFqjnowigBVCdTXxcCsIHNBEwB2O
         tRow==
X-Forwarded-Encrypted: i=1; AJvYcCXZx7cI8DtH4b8JvAU+To4gN7XlF3UI0m5t9h9ZjM7I5nOntgRfSllxPDjYoQHYtN0ruU1DuKFrddZbQWJqPNIO6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSIA+8WajSQJDvyU/+8C7HNe+HYhJYmPInDXOSvKjCf/U8nOX
	a1u8ghOH+NDGDs9iHtOR+w530+71YfPLgq7mie67H/4yLXhVmo9ChY4KulLtBV311hni4xlND2R
	Vr3I0wPpVnfATSK1hlGLys2OVkdHB9lA=
X-Gm-Gg: AY/fxX6Tp991f+SFybiu3AjQ3Auj6R0/KkBMwASTjELUTpWmYOMVcutt9N2iTj5wQmE
	gzQStSn49jIXGo3eEdlvZXnvtloNpJ0dx9U6WOFV0e19whDCh0l22yv5wEmVX0tG8xbjFwV9Q1s
	R2WqTQYX12nfhO9nYogmZaPU1BKJPB2rvgWJqLdPgTFAnew/KAETdOhm/kKnMPhKxzSxomxYrCA
	DHZ1JgImmiUISpXR1kfZXwJQdDTjJu2L1DgNf/u19MtHuk0tMLiyNhq9QbqkpPQyMq+50K5SVk8
	ZK4WYbL3wsdSIZnHdnYNl7ZkKNjfKIV8Sb/svxh1FK1JhL7sSOyzQzg=
X-Google-Smtp-Source: AGHT+IHRMmRHG9WUlqGE0+jnqrwDoFHrXFSr0vLwiRkF3FJ3Rp4o3ftEq7KmOV6lEwv51HuXFQnfz/RdjAB+huyBZvg=
X-Received: by 2002:a05:6000:4301:b0:431:864:d48f with SMTP id
 ffacd0b85a97d-432c37746c9mr19467055f8f.27.1768219952334; Mon, 12 Jan 2026
 04:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aWEj4py2Cv4tPu-5@shell.armlinux.org.uk>
In-Reply-To: <aWEj4py2Cv4tPu-5@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 12:12:05 +0000
X-Gm-Features: AZwV_Qj8cXWO3qJ8HGwK10MFwpC4teebKCl0mNxZqHOVldG2dsN40IyKGwpDyS8
Message-ID: <CA+V-a8vLfwr7gKruY-SOdBHUPmY5TgQ3vrSMkn+QF7LsphVxuA@mail.gmail.com>
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

On Fri, Jan 9, 2026 at 3:51=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jan 09, 2026 at 02:22:50PM +0000, Prabhakar wrote:
> > +static void miic_configure_phylink(struct miic *miic, u32 conf,
> > +                                u32 port, bool active_low)
> > +{
> > +     bool polarity_active_high;
> > +     u32 mask, val;
> > +     int shift;
> > +
> > +     /* determine shift and polarity for this conf */
> > +     if (miic->of_data->type =3D=3D MIIC_TYPE_RZN1) {
> > +             switch (conf) {
> > +             /* switch ports =3D> bits [3:0] (shift 0), active when lo=
w */
> > +             case MIIC_SWITCH_PORTA:
> > +             case MIIC_SWITCH_PORTB:
> > +             case MIIC_SWITCH_PORTC:
> > +             case MIIC_SWITCH_PORTD:
> > +                     shift =3D 0;
> > +                     polarity_active_high =3D false;
> > +                     break;
> > +
> > +             /* EtherCAT ports =3D> bits [7:4] (shift 4), active when =
high */
> > +             case MIIC_ETHERCAT_PORTA:
> > +             case MIIC_ETHERCAT_PORTB:
> > +             case MIIC_ETHERCAT_PORTC:
> > +                     shift =3D 4;
> > +                     polarity_active_high =3D true;
> > +                     break;
> > +
> > +             /* Sercos ports =3D> bits [11:8] (shift 8), active when h=
igh */
> > +             case MIIC_SERCOS_PORTA:
> > +             case MIIC_SERCOS_PORTB:
> > +                     shift =3D 8;
> > +                     polarity_active_high =3D true;
> > +                     break;
> > +
> > +             default:
> > +                     return;
> > +             }
> > +     } else {
> > +             switch (conf) {
> > +             /* ETHSW ports =3D> bits [3:0] (shift 0), active when low=
 */
> > +             case ETHSS_ETHSW_PORT0:
> > +             case ETHSS_ETHSW_PORT1:
> > +             case ETHSS_ETHSW_PORT2:
> > +                     shift =3D 0;
> > +                     polarity_active_high =3D false;
> > +                     break;
> > +
> > +             /* ESC ports =3D> bits [7:4] (shift 4), active when high =
*/
> > +             case ETHSS_ESC_PORT0:
> > +             case ETHSS_ESC_PORT1:
> > +             case ETHSS_ESC_PORT2:
> > +                     shift =3D 4;
> > +                     polarity_active_high =3D true;
> > +                     break;
> > +
> > +             default:
> > +                     return;
> > +             }
> > +     }
> > +
> > +     mask =3D BIT(port) << shift;
> > +
> > +     if (polarity_active_high)
> > +             val =3D (active_low ? 0 : BIT(port)) << shift;
> > +     else
> > +             val =3D (active_low ? BIT(port) : 0) << shift;
>
> Looking closer at this, I think this is confusing.
>
> The underlying purpose here is to set mask and val to change the state of
> a single bit in the PHY link register for each call to this function,
> accumulating the changes in your misnamed "struct phylink".
>
> Given that "mask" can be used to compute the value to describe the bit,
> and that is made up of "shift" that describes the start of the bitfield
> and "port" that describes the bit within the bitfield, then surely:
>
>         mask =3D BIT(port + shift);
>
> would be saner?
>
Agreed.

> Next, the creation of "val". This is either zero or the same value of
> mask depending on active_low and polarity_active_high. The truth table
> here is:
>
> polarity_active_high    active_low      result
> 0                       0               0
> 0                       1               mask
> 1                       0               mask
> 1                       1               0
>
> This is a classical an exclusive-or truth table in the world of logic,
> or could be regarded as an inquality relationship (result is mask
> when polarity_active_high differs from active_low, otherwise zero).
>
> Thus:
>
>         /* Set the bit when polarity_active_high differs from active_low =
*/
>         val =3D polarity_active_high !=3D active_low ? mask : 0;
>
> Or, even simpler, this could become overall:
>
>         mask =3D BIT(port + shift);
>
>         miic->phylink.mask |=3D mask;
>         if (polarity_active_high !=3D active_low)
>                 miic->phylink.val |=3D mask;
>         else
>                 miic->phylink.val &=3D ~mask;
>
Ack, this simplifies the code. I=E2=80=99ll rework the code along the lines
you suggested.

> > @@ -605,8 +698,15 @@ static int miic_parse_dt(struct miic *miic, u32 *m=
ode_cfg)
> >
> >               /* Adjust for 0 based index */
> >               port +=3D !miic->of_data->miic_port_start;
> > -             if (of_property_read_u32(conv, "renesas,miic-input", &con=
f) =3D=3D 0)
> > -                     dt_val[port] =3D conf;
> > +             if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
> > +                     continue;
> > +
> > +             dt_val[port] =3D conf;
> > +
> > +             active_low =3D of_property_read_bool(conv, "renesas,miic-=
phylink-active-low");
> > +
> > +             miic_configure_phylink(miic, conf, port - !miic->of_data-=
>miic_port_start,
> > +                                    active_low);
>
> I think this is also over-complicated. Wouldn't it be better to only
> deal with the miic_port_start at the one place that it matters?
>
>                 if (of_property_read_u32(conv, "reg", &port))
>                         continue;
>
>                 if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
>                         continue;
>
>                 dt_val[port + !miic->of_data->miic_port_start] =3D conf;
>
>                 active_low =3D of_property_read_bool(conv, "renesas,miic-=
phylink-active-low");
>
>                 miic_configure_phylink(miic, conf, port, active_low);
>
> ?
>
Agreed with your point about miic_port_start. Handling the offset only
at the point where dt_val[] is indexed, and passing the unmodified
port into miic_configure_phylink(), simplifies the flow and avoids the
current back-and-forth adjustments. I=E2=80=99ll restructure that part
accordingly.

I=E2=80=99ll post an updated version with these cleanups in the next revisi=
on.

Cheers,
Prabhakar

