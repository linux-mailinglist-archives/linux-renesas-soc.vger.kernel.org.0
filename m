Return-Path: <linux-renesas-soc+bounces-17578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E5AC62A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 09:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8729117924D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 07:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8020242D7E;
	Wed, 28 May 2025 07:09:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C9913B5A9;
	Wed, 28 May 2025 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416191; cv=none; b=rNuffwiPNhWFAO8QhPrCrh2Nr95z14roxzWjeEouU089+9d6xdT1VJZtaOviqbBr+dFfK4i8w935F/ei6eUkEx4IIkvO+DppsH1Gu/KKwvE2B/Sh57a8smcxmSGVM07XqcgKrbLU259LqHZKHBQDCkbxQSrfjHuQ4yJ4JsvmUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416191; c=relaxed/simple;
	bh=GMH1Cfon7tp8nzpXUVJJR5JPu+aG6W4IEBYgCCKOYQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bzi8Xg5dt60kgu0Qdz4LVu+Pz+s0xxQZd0UteepOVjC02rtWuoFaEpbHR2pBLyjZgduMV7JojlwSZMoI5yklRJvSz7EEnIItNbChxsGGYtLMjDCoCvWVaOxTvo5en5ebJGbqVmyX96dMv7Sa8x0vs9NB4FJCgEyZZ/Mmgw8Jw4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476ac73c76fso53398561cf.0;
        Wed, 28 May 2025 00:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416187; x=1749020987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRJM+2U0wpi1bojafvsrSUpFWh6L8i7gfnVXkXPRlF4=;
        b=UT5LWPuoHfJevqpwgLPoN5OufFxHQYqn6WyYzUm6gVLhqVqiZLs47r3v9WENZ5zH5j
         z44Z0MMywGAtLv8sRcnwkXBBgoUZ85O3K8WFx+PnlprOLaZWGbdM4PlcxFOozPy31B0a
         tOiDzk/eHrrUbH/7fXlfmzMDVgxzERAMZ7xtmW004wYgclHCQ7fPOCUra5/Ng2KwJhmc
         1K12hs/vSM6OywLoGZeNIMMiKCBw+ceiUaFu2Z1I51ACBJQTavgiRFSqB/mTiDOzfevk
         5pmhuWFF/8P1hpui6uzEy2UBjPAA2EObbcjU0/5dy+tsSm8bdQoXdJfPGzKTQRwC89V4
         8wug==
X-Forwarded-Encrypted: i=1; AJvYcCUzq6lkC662iNhnO7RZNRc5+lxseTp8j5V3ufuZY/Qi01ZSitlhjE2eED2OLQC+WwBZrYIYwe05jSGagtRspeO65QQ=@vger.kernel.org, AJvYcCVz+y19bSnspttgPg5ZHVp3HdEVOGfxFoj5ykbht3dniIkaJIfcy/mypHnN29H9SMjZu+lAzbIGmMsNEpgi@vger.kernel.org, AJvYcCWpQmcmJPrSq1bzayV/bFQ0NLV719ycpZCnm1hD598VEmgdf+DPHq6WTDkfCKhJNaI4Vwt3ZRdIhYLk@vger.kernel.org, AJvYcCXxHn0sVCVNf6hWtPDsTF8a0M453O+5P3/hNOyuLLPMuWnsij3uzIOjOiTR4Tf7TQdiLet1+2UUkxNw@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGerS3aGc/eiEtX2gueu8K2zLEID65riR/jwiysiTn6FKy8zz
	GWyDf3NwRJ7+p266maFuOEqXu5gfxHrU8VcmbWpEKuoi1ZiV5ewM5tXTGKe4K9Nm
X-Gm-Gg: ASbGncsb6/txsFotHhXt58X8SEBWdocEBcmIQZ0RW0ZyB7q9rmHzAU4L/p2oMwD5w51
	MjNPHR3brvSng7kbWsKh6BfeKJsnt67FLgr4cGtkK9ZZcAObWD5HK9cm/VQqoq8zllpDC/vhERl
	f7GgPDR+qk+Tdldn3ChX2ilMqfjBTrM2f69fWAThGM+lYPM/MY+UuznpsQplTo2d44AlIQ058oh
	jiGUYbGx/vzzFRh6GPW2iTEHqtHmlAl/oPb7qcKzmtoWIl2XCrzOh/5e600AGMoW0avXSX73Arp
	3sNmxICDBuuXs1IbldVAyRn4/AUNx1RBEi3lcmkgrPPNUetUGMKqBtKic8b7T+aZ5I1y6uf07/b
	YUUZTQ/cBPIe1/Q==
X-Google-Smtp-Source: AGHT+IFDKnkrGjFBcbFA13AB3RdYAmXCHlML01/xHN6hj7ANBmMIC5VeS+OF8pO1fzkp++2ev7Jv9Q==
X-Received: by 2002:a05:6122:2207:b0:52a:863f:78dd with SMTP id 71dfb90a1353d-52f2c57fc1cmr12397051e0c.6.1748416176489;
        Wed, 28 May 2025 00:09:36 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066844188sm487992e0c.2.2025.05.28.00.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:09:36 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so2599901241.2;
        Wed, 28 May 2025 00:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN4IXP2E4qXgiHaj5kMZ9A5kD7jd9qKp19YQESeZoD848AVxzXozTw/oj0+aFBO2TbnNqsyMOzSoGACnV3@vger.kernel.org, AJvYcCUPj92lyo69BfxiSUnOjI2d7oOQvHvc+85LQGRMrcczzUzOqdvx43dPn2xiiCMG9BdeKhazX+YzRlTV@vger.kernel.org, AJvYcCUtWzRzZZeYEpiAqR0ieA1D+DUKmZnFjMzfDIxG1+7B6dlBWr5j8Bw/iHrOHIiWt9S+ESy91mVNrbzXRJ/kIf3sHgk=@vger.kernel.org, AJvYcCWgWxNUCxuWaAIWRB7RDCyCtZgY2r+HcrkOTvhLrb2YD1DIAbxNY18XnYTzWcNOlWKkyGHeLLqY8tuD@vger.kernel.org
X-Received: by 2002:a05:6102:32d3:b0:4e2:8b49:9f96 with SMTP id
 ada2fe7eead31-4e42409f765mr12510096137.6.1748416164708; Wed, 28 May 2025
 00:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com> <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
In-Reply-To: <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:09:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
X-Gm-Features: AX0GCFtIRfcujL8IE6N7nJft0aU4E80YnjwTZhfb-bY3ejhxAX3pIJektgtGLNo
Message-ID: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 27 May 2025 at 23:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, May 23, 2025 at 3:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for PLLDSI and PLLDSI divider clocks.
> > >
> > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > PLLDSI-related data structures, limits, and algorithms between the RZ=
/V2H
> > > CPG and DSI drivers.
> > >
> > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> > > different parameter limits and omits the programmable divider present=
 in
> > > CPG. To ensure precise frequency calculations-especially for milliHz-=
level
> > > accuracy needed by the DSI driver-the shared algorithm allows both dr=
ivers
> > > to compute PLL parameters consistently using the same logic and input
> > > clock.
> > >
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > > +                                              struct clk_rate_reques=
t *req)
> > > +{
> > > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw=
);
> > > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pllds=
i_div_parameters;
> > > +       u64 rate_millihz;
> > > +
> > > +       /*
> > > +        * Adjust the requested clock rate (`req->rate`) to ensure it=
 falls within
> > > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > > +        */
> > > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > > +
> > > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > > +       if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_div=
iders->freq_millihz)
> > > +               goto exit_determine_rate;
> > > +
> > > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > > +                                                dsi_dividers, rate_m=
illihz)) {
> > > +               dev_err(priv->dev,
> > > +                       "failed to determine rate for req->rate: %lu\=
n",
> > > +                       req->rate);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +exit_determine_rate:
> > > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> >
> > Shouldn't this also update req->rate with the actual rate?
> >
> >     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MIL=
LI);
> >
> Agreed, I will update it.

I think not updating req->rate may cause clk_get_rate() to return
an incorrect value (can error_millihz > 1000?).  Any chance this fix
can simplify the clock handling in the DSI driver?

> > Would it help the DSI driver if this clock would provide a
> > .recalc_accuracy() callback that takes into account the difference
> > between req->rate and dsi_dividers->freq_millihz?
> > Or would that be considered abuse of the accuracy concept?
> >
> Our understanding is that this describes how precisely a clock keeps
> time. A clock with 1 ppb accuracy will gain or lose one second in
> approximately 31.5 million seconds (1 year). In our case the meaning
> is completely different.

Yeah, I know...

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

