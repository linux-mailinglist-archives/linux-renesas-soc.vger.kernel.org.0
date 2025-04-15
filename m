Return-Path: <linux-renesas-soc+bounces-16028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C386A8A78E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85DE1190170A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9167D2405E0;
	Tue, 15 Apr 2025 19:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6f+84D2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD823F43C;
	Tue, 15 Apr 2025 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744379; cv=none; b=HvVG5lz0yJ9BagDta9BnmODw/+Gvq3lP6Ur7nepKU9UeKvcudYe5Ae8yLvcM1oSFjPPMs7SyrfuGXyzL0aDxLgb2WODNSfAP2piEpD0Gh6u2hVOe30e2dRVXhm0WHk3hATdJV6pI/e9jVYxaLfSKnuyf6tzBVhLCr3Z/CHgBayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744379; c=relaxed/simple;
	bh=5RP56zqAjsLXuC4xjZNX5pzeF6Z9hwZI4uLbEc7S3HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNrtTwmyn8YPU5jMBMpC1p1M1zFEGgNeXq4QjPj092rVqC1cx51Vj/KQzAWJd9mT2sX/18T3mHYljHL3sXN2n9G9KZVhPYW684g7VJzAlykpj8qI4yIkzwuG/V5B7EefTjYjI4L3W1wKCyvUDF+lmrELAs4h14UGx2SVwVTb5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6f+84D2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso30285595e9.3;
        Tue, 15 Apr 2025 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744375; x=1745349175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQm1BufbNO0g6ac8JFZOAF7HQLu+TTJG6FTm33kVTLE=;
        b=j6f+84D2T01fyIHuuD0u9eCeQKb/7aCiUxNAXBcLniXe9G3OniZa1jeENPOVfGniLp
         WOjAFwPdiWo6srN1srHw2gMe/Xiubgwj2KWkp9qOkCogQYOwEpLeBZipRUw3q4zF0KcA
         rH+5PLjMcHVUlYxvuE/DeDfiTnbA2ySjCLTbTUDSBJ4Yh5fGV7ko9Zv2DOWq9MswUEWc
         nx0SqysCW98qLZrf7PLJNHGZFmcNt9o1bssC1Sy0DXysdVRsf+eF4jWYuXTwfXpDccrm
         1X5scEXocSGk230JBpi85/PbSWOXSjZLfONciVlM6Q38sOozT+1l2c4/NLlCcRymETho
         sVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744375; x=1745349175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQm1BufbNO0g6ac8JFZOAF7HQLu+TTJG6FTm33kVTLE=;
        b=TrspSKAoJcIhvmXiP9pYJNaa19bXBE0nKAqwrAPUMz5GDOGijt3U5EFL33M6UVs9uF
         cCM2e7gLQjnGsM36/BCZwE7qiz8XdLzmWI25mabuUmwcgNek8bnt6RS6kAmq2iNLjjoO
         rJrJHQd+F+B3KxJDshDpg+9jlkauksIJsmKe1I36qQpf9bOUkB9X8QH+jg45Fr3fzB9R
         jRlolpOpql88yQNUEbJ21ryo5yBEHoJeaCod3KA1NnD0G/G8eZhYdIbcd7vfvhdMu/y0
         8sEUsATQKBozVh1m0bsftUf6nwG4MpERhnmsuKslAs0JXWrYYYHQ3HG6mOxJ6/Da1XqJ
         aV2g==
X-Forwarded-Encrypted: i=1; AJvYcCV1dNJgb8uRnzYKZtFkJNXLtkGv9Exeuqh9fauUodBWTjD7n5usGuzeq6IMuuXPbMoPuWmRpYGPbkJQrsAe@vger.kernel.org, AJvYcCWXTZnWOt5u0ig//N60kUBbJVbZLpMzAtRkBaHe69PYA57bj9JRyJ6wf4uWiz+6YZaI5OAlXVjKxxZp0+b1OBydyss=@vger.kernel.org, AJvYcCWdtRTzsUASi/8oAZpHlqqy2tlOksyxhKOUU2jSU6QKobY1ERx3RR77iGSjHbdcjrI1yTrRUnnrmh2+@vger.kernel.org, AJvYcCXg/q/6k6+541L7V8/rIU1++tqXLkzgmrFq9bnzRX5WMN1Jcyg0citoLg2eeZlQ55RrkjeeBgdKe9mC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3LOO+6icPPIE/fKAon3MnjzyN5hZjr2TvTQzUjiUH/+6mQNq
	L58nCN72YBo0iCgRVXF56r7pw8dNDewpO9bCbxhMorxqlStWl8Y8GTSGmlQdKeJ3ozGbV7NdyF5
	1e5ewfa0WXV+C3RRXHAC4s+W6NEM=
X-Gm-Gg: ASbGncviBsX1zTE5SsqCaXUihn/tnCTtzSw9ozwqedtlnp9/QvnfOg9rrF1zWryuIlV
	v5tOHB1xzXT5c8P1wpAOojvAmEeWtRM5amoIrukHQxovSc+eIPrZ//j9C9Z9k5TcH+YKeSrgi+X
	QSAZmrRo+/FUWnRAbga6mrkQ==
X-Google-Smtp-Source: AGHT+IHe7sCUzfMtiFR7BudtnYRtKQ/8KBehapGATrY20uIyvh2Lm2b6KndLPkcMNHT0KBRTWJhsEvX7NnH1Xajny1g=
X-Received: by 2002:a05:6000:2282:b0:391:4999:778b with SMTP id
 ffacd0b85a97d-39ee27519c1mr592070f8f.28.1744744375026; Tue, 15 Apr 2025
 12:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWZisqxyGL32Y-AD1UgQD9fWKG+a-o71R+KeuSqn=U6gQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWZisqxyGL32Y-AD1UgQD9fWKG+a-o71R+KeuSqn=U6gQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 20:12:29 +0100
X-Gm-Features: ATxdqUHg1_oZux9AM-a5ymd0MtduhpzojMxKqAMhDii231jK-UykH3iHu0nQi6Q
Message-ID: <CA+V-a8tBY3V1pZOs2yfGZxpPx+b5YbetJZE-PJj_1wLofXVOEw@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 4:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
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
> >
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
> > +                                       u8 ext_clk_bit,
> > +                                       u8 ext_cond)
> > +{
> > +       u32 value;
> > +
> > +       if (!ext_clk_offset)
> > +               return false;
> > +
> > +       value =3D readl(priv->base + ext_clk_offset) & BIT(ext_clk_bit)=
;
>
> As ext_clk_offset is actually the offset of the Static Mux Control
> Registers (CPG_SSELm), this reads the current state of the mux.
> However, can't the state be changed at runtime (despite it being named
> a "static mux")?
>
Agreed based on the HW manual this can be changed at runtime. So this
check needs to be done in the rzv2h_mod_clock_is_enabled().

Cheers,
Prabhakar

