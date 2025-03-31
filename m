Return-Path: <linux-renesas-soc+bounces-15211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92FA76CDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 20:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35DD188C05D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 18:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03028214A96;
	Mon, 31 Mar 2025 18:24:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDA6210F4D;
	Mon, 31 Mar 2025 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445479; cv=none; b=dX1Svgs66hFqisOkfqP8K2T1G+2r2TskPz9FbrK48i5wBrWY0MeCKhKvGvZoYCqLR7UG/c2BtRTRprqluuJSrTEn+CGSP4mb/9RW3VRUKgm52BVpUajAfd9ALPWgv9glFd8dkpFetTHn5PcsvlCQysuaq+XWloxrKIKuCAI2DW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445479; c=relaxed/simple;
	bh=DhiYM2oWAL6VD/NAIUI1LWt3PcZBx3qwuzuN6wbmor4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUbQGjh8HBZwghw7OQ2X46BB63OLHGOJAKZyyN7mo2wjDnuDdDvc06a6WAThQ/z94XTVCunvFJ+O9QnoDB9v2eFjaAPuatV3FKR+xcOoZz9Gtt7NmPEBUOz5h1mZPvqO/XHKDOzYzXoCTsGQzGZ1xAjEfp9BbUyV8DeWU1v9j7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86feb84877aso1934938241.3;
        Mon, 31 Mar 2025 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445475; x=1744050275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1asWoL7sD/5WqA9MnC+eOwA5QkQScjPDZOPXm8pPzU=;
        b=o/QPq/6+lZIXA/NYkD2LqFim3RhWp3q/VFQSJSEODoOxBl8w33wURwfi/2p4zAOyA7
         HJwsmHCsrQ8qKc8bq1eOh7f7yzEnEApax47f4eD/TDbR5/eCK7ZHlvcjbXZen4CZ9fgo
         Cvoecp/o7JOfQ4cJrzm2C8+PIwvzBkUnplXPy7YRO8xuMTvN9Rd4DA3Y3uUkAZolB1BU
         ukZdznQga3SpqVuNSOpUZiSObGr5CD79XevJpPwWrz4s77TuADEmlRxsyw6p7IkfTznC
         D3SQ8t9MprKRPLntWQsHJcrJrkIjnhCfJQ3e9+orQu4qm/ya71cwKKQ7XBy6bgsIDh7q
         bpCw==
X-Forwarded-Encrypted: i=1; AJvYcCWtyi0+ENesStx5+4IlwrUJZdVwRohX7ZnMaLUtAWEck8Jz1E97rwdvyMQH5QB+YCNPa9HGqc3MASDm@vger.kernel.org, AJvYcCX2+0sMOPQKkkJYfN6sFMmbnH3tmXGPOneZqO6/ihog3cC1kfnMyRdsSZMDcpS4FiCGnWZ6FVeI87RSyiKuBTNbUZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzISwZveB9aFzNNDtj+g8htwLdZreyhVKTBjplG8bN6ks+K7tzI
	u9+q+XFn5Nc1sYYriVqtu2abCHXSrXhO/nceDqrdydRfCh25Uu1Xehl7gnhQ
X-Gm-Gg: ASbGncvQSGmx/z6ooPIf0hcYSI4B5+JRajjzkcRNyE8b9/Zgt4hU0oPSmKs/PVej5rZ
	eSqm+UEozk0R9ej5OtQ7hjKiWKORw0jsnNQiqnf+zD5XndELQFS15gUsimyQDJPAuxmkwCTmHnZ
	4L72vMMz/Om74UQxR1bWkpSelBt7S4aLMXbe9irqGVbscdnrSpnOUEssIl6fNze/lFvY4t7fXK6
	vpfC1OEnhRmNwkFXXkXe93MxMe3bjAw7eTDaDVxv69BjwoTTdEpdB+saycJu05RAej2Sh+b46Zx
	hj61gx3DAfP2mdtynNZFdRrOolcLO9xvfslNGH6aoFRElQiMJ8lDB32Llf64qdJPb4SISJZHDd3
	6R0jE2w6+Skg=
X-Google-Smtp-Source: AGHT+IETXn5tYt3gXE8IMCpcHu6Sy0DFswPoV4OrGZavhwJLz2bnZ9+oBM5HIn9PaGuEGfsmLVqTXA==
X-Received: by 2002:a05:6102:3e09:b0:4c3:49b:8f78 with SMTP id ada2fe7eead31-4c6d39c9e36mr6499463137.25.1743445475093;
        Mon, 31 Mar 2025 11:24:35 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e6a1217sm1662813e0c.3.2025.03.31.11.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 11:24:34 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so2479294e0c.2;
        Mon, 31 Mar 2025 11:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVd1BN38q6U/zAZqaR8VJaKepGIayGom4nJjAQu9nqK1NP5qRLT1H2/vvmb98JJgJztVZU5Yv0+qY2/fXktT5smGjg=@vger.kernel.org, AJvYcCWj9jfKY8fc4m+LeCw1/TS4lLo442UFq0wFA3BV+i8zYiwwtaU+49Shb3+lBXkCANOiaOIZRD3lxeM3@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:4c5:1bff:4589 with SMTP id
 ada2fe7eead31-4c6d39c5b32mr6898800137.22.1743445474396; Mon, 31 Mar 2025
 11:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com> <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 20:24:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
X-Gm-Features: AQ5f1JrYK-HBxPyVhnOVlE3Axfm_RP9EAjXjn6LREhlN3HsAFKx6gEe4w3En2Ng
Message-ID: <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar 2025
> > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document support for
> > > > > > the Expanded Serial Peripheral Interface (xSPI) Controller in
> > > > > > the Renesas RZ/G3E
> > > > > > (R9A09G047) SoC.
> > > > > >
> > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/memory-controllers/renes
> > > > > > +++ as,r
> > > > > > +++ zg3e
> > > > > > +++ -xspi.yaml
> > > >
> > > > > > +    spi@11030000 {
> > > > > > +        compatible = "renesas,r9a09g047-xspi";
> > > > > > +        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
> > > > > > +        reg-names = "regs", "dirmap";
> > > > > > +        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > > > +        interrupt-names = "pulse", "err_pulse";
> > > > > > +        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
> > > > >
> > > > > On the next version I am going to update spix2 clk as <&cpg
> > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>

According to the RZ/G3E clock system diagram, (the parent of) clk_spi
is derived from (the parent of) clk_spix2, not the other way around?
So you can model clk_spi as a fixed divider clock with parent clk_spix2
and factor two.  I.e. provide a new core clock R9A09G047_SPI_CLK_SPI
instead of your proposed R9A09G047_SPI_CLK_SPIX2?

> > > > What's spix2 clk? Ah, re-adding dropped line:
> > > >
> > > > > > +        clock-names = "ahb", "axi", "spi", "spix2";
> > > >
> > > > > Based on [1], the clk specifier cannot distinguish between spi and
> > > > > spix2 clk, as entries are same(gating bits). So, treating
> > > > > spix2 as core clock to distinguish them.
> > > > >
> > > > > Please let me know if there are any issues in this approach?
> > > >
> > > > As you wrote in [2], you have to check the two monitor register bits
> > > > together. How do you plan to handle that requirement?
> > >
> > > As per hardware team, spix2 clock is twice the frequency of the spi
> > > clock, and the clock ON/OFF period displayed for each bit in the monitor register varies slightly
> > due to the difference in frequency.
> > >
> > > So, if I monitor the bit of slowest clock(spi) that will confirm both right?
> >
> > (perhaps naively) I would assume so, too.
> >
> > Bute then why did you (or the hardware team) write:
> >
> >    "So to check the status after changing the clock ON/OFF register setting,
> >     please check the two monitor register bits together".
>
> Basically, It is feedback from hardware team.
>
> <snippet>
> There is no use case in which each bit in the monitor register is used independently,
> so as you pointed out, I think it would have been better to bundle them into one bit,
> like the clock ON/OFF register. Note that the spix2 clock is twice the frequency of the spi clock,

OK, so one bit would have been fine...

> and the clock ON/OFF period displayed for each bit in the monitor register varies slightly due to the difference in frequency.
> To check the status after changing the clock ON/OFF register setting, please check the two monitor register bits together.

... except that this part says to check both.

> </snippet>

Oh well...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

