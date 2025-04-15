Return-Path: <linux-renesas-soc+bounces-16027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EBA8A782
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD37178886
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4B323F40E;
	Tue, 15 Apr 2025 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDwlTMTa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92823E350;
	Tue, 15 Apr 2025 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744246; cv=none; b=oAXcCeKOXdZ1ixrQxI9sqpmmef+OjLwawFqgxb3tb9e+ivv59QjOuIs72ujlyE/SXP9bZxIB2F7cbGi4cNK/fksxeLETH5e9AqLD5LSktZvdRuDtkCpVbTsdSNcuoA2jBwlEgBtB4s1cYDrrR7Xz5cRaHxvV1dvZDoab9AUv5XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744246; c=relaxed/simple;
	bh=xqSl63bG3wfUthwLLIvQVxaqRLmukng8C2baTvHd8Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZUTtVJzZi6Uz0HxMgigGQKPXy8FpH61RC5VTux0vZeznHgI17sCOz+cRqD6/JTwAaUmJNcPyMX2JFWOdQt/2jsJLeXjcIIx921OPnJGU2JhF9JPzHqjaQTKq1Krp8VihY0vir4FWiaCKViIdiaJdzJB8+TS+0meJYbXc/ap78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDwlTMTa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so60041125e9.3;
        Tue, 15 Apr 2025 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744242; x=1745349042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+9R6i97eout8tyqOO5go7P8BM8D8c4sbrQg7SeKd3k=;
        b=UDwlTMTaOBWa9aTAVQ+IeTum3xmgXX70oOs7rQxUl/C7NzbpfWm0LgF/mAUgcnJPa5
         7wuVVH43xk8sM/m7D1MbQ3pyJm+yT9Un2eW1JNZr7cfcuK56u0lkKTRZc2mAn0TMtz5O
         KXvzUYrbh231kFspNl4EkJHO0hDECuVkycDwwsaLzmd5OW3McAzqQm+GUdN51KnBFKLq
         CtxH7dvW65x4QU7hyjLrVRTDDD/bTCMnFazaDog+1VOCorpTl2zWwhEhIhsNku9Od6hw
         vjPMKEOr0aHKkHV/uGVSRga31Nf/VlGY3WkGDuB34aFg54i856xdXSUT8FreNwMvr96q
         L9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744242; x=1745349042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+9R6i97eout8tyqOO5go7P8BM8D8c4sbrQg7SeKd3k=;
        b=J+koQoH5ze6EizIDtbLLY6kVi1zW4i8izuLTg8wl6g9Op3aK0yxU+gBU71/XI3Z1ED
         USDmgfJjq8aAWF9GbvtebL+D2FBC5ClmhUkVU5QecEcoDrtBlYzbJA8Tm0EC5c123zDC
         LuVSo4HcRXA9BAHFDFOqYIgbfwihujzKfLfh1QOBfObDmHYxthpqChmH7FVFlPyhcSkC
         qvDJ8nixmaPhW9M7rXw5CVZ5z7Jmlx5zkJFO7zki1R9NzrVZ3w1npcasKbUhz8D6YZuc
         izIQvQ9To0V+sjQIxCGJo4DLD3yWB7DIUC5W7dpzrcsPZOiqsOcIFbph+7fRrbUrFs3q
         tkKw==
X-Forwarded-Encrypted: i=1; AJvYcCVlI3yknE79aHlzmd+cyaq4XclqaCwh5BWeHxzdqDveWX8RmTF++dJ9cVagy1Gk4PscoNh2dOP24glv@vger.kernel.org, AJvYcCVqDn5kPjFEnxK8huqnukHLAJbzLJCJfGCEI0zdHdVialjgU7UwHw4EKT9/+pE6BNVpbuQuULccZV/8@vger.kernel.org, AJvYcCWLy5YBGNMQwX0ygkt23AScj8ub3Nd2vt1bTsyEHfb+Z3ypX27rK9VOliiQ+pUo243oMPZDVZ3Q7AffW5Hl@vger.kernel.org, AJvYcCXYhv5mMAkBLdNNj7wRTFWNZXxWBJDD7WQfcRX9VF1iKtkfM3I1Via7x6aPcHdH4zXrvGexUqYrvizTA+lISVwaVqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6MlQ4yVbzfPJs3SleT4oYhNstftP/3O38w27PjO3PAPxwXkz
	kINvYKjPYpYfEnnzyzIOeldaPk7/aieeP1oS1YVRg/Es9mqVuFcMgaRlaywtvFDLiDrnfvt+Nv4
	10LJyGZUhf5FwtSpw2qYerIjzv/s=
X-Gm-Gg: ASbGnctOi1Pnx9hZIPUVcQuyTLTqYMcPKhTv02PaSYI5DPhKa2ITumstiJ7TUfo6oDQ
	+ft9bR09BjB3d3UrQqEKoUw4cO1QtvJQJrb/AHRBvI/C0OqgWJkhzoj/qPMA1bFa0vZgOmDHCrI
	YZDIKUOeS09iDQMLlfCfcE3w==
X-Google-Smtp-Source: AGHT+IHMiFiS0nsHL73AzzRu+tHqp2edVjNZRkXI+hMQ4GgBBmlNNmVX9ETLW6Y2JCWbDEc24ttLPk2CDXSMeLCHEQU=
X-Received: by 2002:a05:600c:1e0e:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-4405a0a4334mr2589315e9.25.1744744242305; Tue, 15 Apr 2025
 12:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXuqYHAv+yyOJxC3kre1vaspuXmTMev0ZBixEiEo+4saQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXuqYHAv+yyOJxC3kre1vaspuXmTMev0ZBixEiEo+4saQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 20:10:16 +0100
X-Gm-Features: ATxdqUEF-cysVy0kHHQfaLVGmLBzVY6Pt4SqgW51HY8AGLA2rfeWDdpmyMio_Ps
Message-ID: <CA+V-a8sbqj5LQvsfwJyO8gM+0HL5bzW4KLmzZz5YKO5tG6nbfQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON
 bits for external clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Apr 15, 2025 at 3:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Ignore CLK_MON bits when turning on/off module clocks that use an exter=
nal
> > clock source.
> >
> > Introduce the `DEF_MOD_EXTERNAL()` macro for defining module clocks tha=
t
> > may have an external clock source. Update `rzv2h_cpg_register_mod_clk()=
`
> > to update mon_index.
>
> So I guess you implemented this because the external clock was not
> running, and you got into an infinite loop?
>
Yes, partially right but we didn't enter an infinite loop as we have a time=
out.

For the CLK_MON, the HW manual for RZ/V2H section 4.4.4.8 CGC Control
Registers and 4.4.4.10 CGC Monitor Registers will be updated to below
in the next version.
 "The clock gating cells require source clocks to operate correctly.
If the source clocks are stopped, these registers cannot be used."

Currently without the series when we turn ON the clock the CLK_ON bit
gets set and to make sure it's turned ON the corresponding CLK_MON bit
is checked to ensure it's ON. When a request is made to turn ON the
clock first we check the CLK_MON bit and if it's being set we return
early as the clock was ON. This worked OK up until now where the
clocks used were internally generated.

In the case of RGMII interface where the Rx/Rx-180 clock was coming
from an PHY on an external pin the above didn't work as expected. When
we issued an unbind request on the glue driver all the clocks were
gated to OFF state i.e CLK_ON bits were set to '0'. Now when the bind
operation was requested  the clocks were requested to be turned ON, ie
when CLK_MON bits for RX/Rx-180 reported to be '1'  that is because
PHY was providing the clock and due to which the CLK_ON bit was unset
(and not gated to ON state)  due to which the DMA reset operation
failed in dwmac-core  driver.

Below is the thread,
[0] https://lore.kernel.org/all/CA+V-a8uWY1Av8eS1k9C6Td=3DRuB4PbCnQyXbNLzmh=
ao0nr8Spbg@mail.gmail.com/

> This looks rather fragile to me. How do you know when the clock
> is actually running, and thus usable?
>
I was thinking the consumer driver would request the external device
to turn it ON/OFF.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -569,6 +569,25 @@ static void rzv2h_mod_clock_mstop_disable(struct r=
zv2h_cpg_priv *priv,
> >         spin_unlock_irqrestore(&priv->rmw_lock, flags);
> >  }
> >
> > +static bool rzv2h_mod_clock_is_external(struct rzv2h_cpg_priv *priv,
> > +                                       u16 ext_clk_offset,
>
> unsigned int
>
> > +                                       u8 ext_clk_bit,
>
> unsigned int
>
> > +                                       u8 ext_cond)
>
> bool
>
Agreed I 'll change to the above.

> > +{
> > +       u32 value;
> > +
> > +       if (!ext_clk_offset)
> > +               return false;
> > +
> > +       value =3D readl(priv->base + ext_clk_offset) & BIT(ext_clk_bit)=
;
> > +       value >>=3D ext_clk_bit;
>
> No need to shift:
>
>     return !!value =3D=3D ext_cond;
>
OK.

> > +
> > +       if (value =3D=3D ext_cond)
> > +               return true;
> > +
> > +       return false;
> > +}
> > +
> >  static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
> >  {
> >         struct mod_clock *clock =3D to_mod_clock(hw);
> > @@ -691,6 +710,11 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_=
clk *mod,
> >         clock->on_index =3D mod->on_index;
> >         clock->on_bit =3D mod->on_bit;
> >         clock->mon_index =3D mod->mon_index;
> > +       /* If clock is coming from external source ignore the monitor b=
it for it */
> > +       if (rzv2h_mod_clock_is_external(priv, mod->external_clk_offset,
> > +                                       mod->external_clk_bit,
> > +                                       mod->external_cond))
>
> Perhaps just pass "mod" instead of three of its members, to fully
> hide the logic inside the helper function?
>
Agreed.

Cheers,
Prabhakar

