Return-Path: <linux-renesas-soc+bounces-21245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FDB41988
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9D21885670
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2253F2EF675;
	Wed,  3 Sep 2025 09:04:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEB223DCE;
	Wed,  3 Sep 2025 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756890246; cv=none; b=iD7oGVPLEcfS7leAeqC2P/ZmJC6/lwoft4eco4C1FaU+hDtpCogVizoRt1A00tnhade1BDMlrvEBe3ZW7wGt7UwEdKz7Z5Pxw4VwVdKap8U4ogHfZzas+i/QY5DLzEwUbBfbAa9Do4PTdC3D+A2cFiI755WYM31oPWz41+/8stA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756890246; c=relaxed/simple;
	bh=vA9jnmlBUP3FklleJJI5iKZg6DXJS/5anQEmrvZXGp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3OwTWC4Sl+Qz/cQ5L0pUNPJhZEmWf9i307401+GRh4mgHZH8CWyC9/kJIp7ZT0rrm3BXcwrf2RKeqRe3NfChOSjKj7F5ofInBd/qulB+3HFh1Cbzpnmbe6Fi+OBClmIRKjYSETJfhN+BSK8WtQPCgAdNIDF9zG1oHMZYjyjjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-545df2bb95dso46113e0c.0;
        Wed, 03 Sep 2025 02:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890242; x=1757495042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8E1gfV12IoHmzjtc69UL/4JE5r/dCdO6yqQdpD9wQk=;
        b=AGh5EZIp/W1YIwKqy8g1a8PZ+pxw+qsIFRE/uA4G+//+BaBk93DTnq2bv+tPTQFSNM
         hBA7WT56IaU0MosxieRrctQ4VLT0OkfaQpoDdGZmcX5nkpq6OTm5bH65KO3n0PUjgOiW
         i6rL4CprGazPm6XrSQ5mVV70JH/EEIfCgQuClq2hUon9DdniYDx670paHS65ied/FH/G
         A+deQWtQ9CS5pd3YH1dD+s/mJQUdbl2EJ1yJiPsYM+SuooDJmebXuyqPX3XrmhLqHUkE
         MNB2EV1jHBdEf9ouWxxp5T1AaQm+oQ+Bc291Vd2boS5qZ1zJ6cBR5ScrjMejdIxb5eT9
         +gEg==
X-Forwarded-Encrypted: i=1; AJvYcCVQQSGS/nw/MWWxblgNEuAiMx/8N0/SQA8Fb8qkwR1C+P/zC5Af01ZpT3nelzS9CX7mTuLrfXHvIwD3@vger.kernel.org, AJvYcCVxhRq8orZyyXfWNEqpdP3O0TFB3BoYi4C7ILvz844XUKuaNGCsyKZAV28xgWH+1VErtet5hP+0s3c0Y99h@vger.kernel.org, AJvYcCWZqpS69rCPXwoDE9cYvfK1ZAhESZDwhRYlZZpSmCHUmFUHDNYFMgr08OdUgxsQ/1St31wxDVuHdYRTMCyOcR3EC/Y=@vger.kernel.org, AJvYcCXBk0eIdWxQCJ0ofle21k78bBA8gqOdC209ywU9WOAbZLF4ywOKGFONmU9+CAGJl2BCAEzEqDhoe6NI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VGksHE/KC/Z8ZeHlljOyjMzM4gZKL4ADcBCn+OBBbe8o9g7N
	WX/sFFr6MkrVo4NUP1J53hitF6/uNA+VCEkOm0mq2/RUkel1GN5L3fNMRIKb68gw
X-Gm-Gg: ASbGnctHFSWjzEDx9aInIbAzwcGnqplvslfMU0RPExjDuE5XLPy2KS4XgfqlXeT6D9f
	fuJ7ArExuIKpmRFvl+UmDZyrYX7g8aofKjbW0g7X3FakniQBHEyg/MArwjkqNcLvzmQuoqpG0mO
	P1fAo0ZeUQjQMkisqybuiSCQSqOcCcqqTaKzVWmVov+plIi5CmVH+FyI2dfgsEQuuvYMd5luYDP
	QoPAnSCirm0Cdybbuhdoyz3bwea71iF+t1nBtOEwtsf2+RGAxiPQMPgHQEYXcgJ0trg42MbsLU4
	JEOHJexxyELKUxMvztO0tsYynU5eqfkW3Y3fQjbfK+B9AITU0NLLRXB88XVNkwbTD6oIfOh1eZu
	zuQZxUbLMcQCqbO7CdrH6S1/aSTcpZ0k2GBAvl3OloFV0CKXTXnyC4U8UgbyXP6RZ
X-Google-Smtp-Source: AGHT+IFLpw8/G+iiDbZHYmo+wVyLT6enu466IKkpf28l92eQHFQnud0lNGi6jd7hyhWl0dsSLLlLog==
X-Received: by 2002:a05:6122:1350:b0:544:9414:105f with SMTP id 71dfb90a1353d-544a018f69fmr4091500e0c.2.1756890242410;
        Wed, 03 Sep 2025 02:04:02 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491318ecbsm6508305e0c.11.2025.09.03.02.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:04:02 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5448c576e3bso2040062e0c.3;
        Wed, 03 Sep 2025 02:04:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa0R8AqMyxCtblcyjiJL97CfRztkCqT9GAnAu1V2RwXH5uD4d8DLExjg8QhU3XnnhQZ27QATpafKhpFUyn@vger.kernel.org, AJvYcCUrUKWNz399T+Sm4WZ9J7dB5s2h+U5W2jVcN3dCjDnTIkMl+w2kDZTc31vrH4IkFjUNncD9+Wy6Dxd6Z6ZQhgATA+Q=@vger.kernel.org, AJvYcCVEzk/XWwo/t+J981e1hTAY4YoRz7DnrP0Ht9l9DaxX03XkAG0QBQSZneTNwCCpLz+l/HzD+c92+Dke@vger.kernel.org, AJvYcCXZpblgmikVQ/Uuie4c3NDtBKtjDzY7Sh3iTPDzOBqNl14xg7jlgTgbuBUtfbRj4nhqHf1bTs6Oi8Mv@vger.kernel.org
X-Received: by 2002:a05:6122:2022:b0:543:88f1:6621 with SMTP id
 71dfb90a1353d-544a018f9e2mr4632015e0c.3.1756890241565; Wed, 03 Sep 2025
 02:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901183000.1357758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWARu=9__pqcHXUq92LYuxAQPZNJ6Fn_b7Z6x78i4twDw@mail.gmail.com> <CA+V-a8t1PDpqqMAdWxPeQfH6MWQe0GHsuBSzRbaRFRPPMf_iQA@mail.gmail.com>
In-Reply-To: <CA+V-a8t1PDpqqMAdWxPeQfH6MWQe0GHsuBSzRbaRFRPPMf_iQA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:03:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN=ofULw+TZVA6eY3hAyaiKMN6z2Z57KH=EDUzxbDf1A@mail.gmail.com>
X-Gm-Features: Ac12FXyZJ2tTmfzSZt6j8i3Vojt6dcDScwwN-MKjTprlJ7ET5Z105TlKcWgucK0
Message-ID: <CAMuHMdWN=ofULw+TZVA6eY3hAyaiKMN6z2Z57KH=EDUzxbDf1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem
 core and module clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 2 Sept 2025 at 17:06, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Sep 2, 2025 at 2:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Mon, 1 Sept 2025 at 20:30, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
> > > Ethernet MAC (GMAC), Ethernet Switch (ETHSW).
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> > > @@ -181,7 +191,12 @@ static const struct mssr_mod_clk r9a09g077_mod_c=
lks[] __initconst =3D {
> > >         DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
> > >         DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
> > >         DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> > > +       DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
> > > +       DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
> >
> > According to Table 7.13 ("Overview of Clock Generation Circuit
> > Specifications (Internal Clock)"), ETCLKA is used as the operating
> > clock for ETHSW?
> >
> There are 3 clock inputs to ETHSW,
> - PCLKM -  bus clock
> - ETCLKA - operating clock
> - ETCLKB - Ts clock
>
> Based on Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yam=
l
> we have two clocks for RZ/N1 (Ts clock is missing)
> - description: AHB clock used for the switch register interface
> - description: Switch system clock
>
> - const: hclk
> - const: clk
>
> So I was treating,
> - hclk -> PCLKM,
> - clk   -> ETCLKA
> - ts    -> ETCLKB
>
> Since pclkm is used for register access, I added this entry to the
> r9a09g077_mod_clks array as I was under the impression the clocks used
> for reg access need to go into this array.

OK, thanks for the explanation!

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

