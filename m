Return-Path: <linux-renesas-soc+bounces-15199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDFA76B08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340483AFC67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220B4215793;
	Mon, 31 Mar 2025 15:27:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED66221F1D;
	Mon, 31 Mar 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434847; cv=none; b=eTGJyYQdf9YpfitnY3VkXsvDKqdIgihMX7hWo5xPUgAUnEWcD8Y73F+4MaKQOBmy8cuu/OdaztgUUYBW+ufun+/JdIq5DAYl/oY4AOnt7aVPvUlkULAh8zDjHg3sFcVYwgjy5bOeX0WspQDDGsvwxckbqu1eVLLfKe4InErtwYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434847; c=relaxed/simple;
	bh=3BmdPE/0iwajui9DVCMh/FK7SEJe4xwobEgxXIiwFb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWcIHnC7rMffc78gffridGiBfigutuS0LVzYfzFLBCfbWwIUn7X5Y1ReftUQhYzIYFYg7iPjgfOLd0J7Y5JCFLy1Tamjg0EdE4XksmkcbnJeZ8Mh6LKX6VHST4d4r5qu+MM8+nrw7y9CoWZYbaSqYRO/hQKs3L8eby83brrP8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1918328241.0;
        Mon, 31 Mar 2025 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434844; x=1744039644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDBig7qfZytfixFp1Uo2o00+33LgDqS+dWU1ZyWo8yM=;
        b=KhnC7CS9eSSLlF0D6eX8jlZTqXVVwajaTJexTiEYeXrzdx3bacFAMTfHidCTAQvOZI
         t1RsClsebgpNdnvmN3tLUsf1rzdZzMO5snoCvu6kHDfnpZK3Y1hc733qFEtBvPR/3fmB
         5KI7sxp89LqDPri7ORp1O6rdqHL6bhVPi1liWgrAsx5/57xadzY53vRpSX/cgKWlH6B0
         uB+J6/kixj4ASn1IKXvVL2Wy2bMfL9nrABWPhGnvoaV1pkbA3Daz0DEbfvh9qgt3Xrlv
         VBK+CNHEEc+ZS0/ceSzi2DJgfXSC85Ed6UvZgMOxiLzfT7tOE9Jc7oBlCN+HZkheUFfF
         QspQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdcaNFwNdSUg6ROH+I2/K8AphfF6yDpcfSOy6F/vxOVQXuWWd1RMVzMcEdaWMnFShDkxvl/v3UHsE/Ci6r9K8dI1o=@vger.kernel.org, AJvYcCWiKNfVieBj/yt8sscFdNlhFyh8jW2mg2GFe+bA14DWyS35SMPyLyS21Tt5IQ2MS2bZN58F86hUTFuA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1haCqaQjZqPhpqW3+BamcCvShmUj3nirlu0bSrCklp8O1oTCJ
	5Amz18kQK+55wA+toiEAfULPnxIYIy/iMGYQi7WvpSkA0FIduVdQBEZHgmDs
X-Gm-Gg: ASbGncuT0NpME1SCrt7qd2KouDi/Tc8HS+1/GB2mgoNqsT5T2uo708AylAYL3ixQngz
	lqyfiS0HOHz5wV4/xbCFDBDTk9R7Dq0vRUDauCSqpupUs3R+CfKETl91zRBiZdfazjp8z0jXOyz
	/xa4rveQHRo7EqcIejZE4DCp0RWLLHPoPfkZFZmRgSxN4z4wgfQriLMMTvMsbA3lEdZOo5AxUv/
	vUPdXqbPbDp/g0thLMX+AlNZHtFBxk5XSfvAPNZquUDkdihiz/MJIdLv6yHttzn/quZjCm9eB8N
	J+qOOz4v+/MCGGzv3B4eJuttAz3VO3C0PPA7j6QuqjuNY4xnk5A9W0bAEEYQpEqoyzepgqbjgx9
	8a3r/aoZWNOGcUdjBzQ==
X-Google-Smtp-Source: AGHT+IHu7MzrzLkGy0oA5+FsvgEre7pgkFSSeMhajORGfG8mHUF2//tEsnW2SGJfKHMeTQOZwBerNg==
X-Received: by 2002:a05:6102:330b:b0:4c3:6979:2ec with SMTP id ada2fe7eead31-4c6d389032emr5864050137.11.1743434843939;
        Mon, 31 Mar 2025 08:27:23 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfe5f8ffsm1629140137.30.2025.03.31.08.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:27:23 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so2067392241.2;
        Mon, 31 Mar 2025 08:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzpbhmfvWt2QK3648bXjBkz7tWnHMIA+7W2EabbPxWfNV5Wf6m7soAq4VBKtTKwSVHT9xQmcLHmxJR@vger.kernel.org, AJvYcCXfKnNS1LG9UT03mA51ogtA8htTCSNRVs6FwB0lPYxvvrhTUU6PlQCb3Lirf88wHuJ4+BzI+BPkCqbjVf8B6Vxmfow=@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:4c2:20d6:c6c3 with SMTP id
 ada2fe7eead31-4c6d384b02dmr5471275137.10.1743434843557; Mon, 31 Mar 2025
 08:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com> <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:27:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp5hHwWVeBkG_3wg9vmJ3zKEXZPNiLQmGwf0C268FZMzEcsHQH6UajoR9Y
Message-ID: <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
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

On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 31 Mar 2025 at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document support for the
> > > > Expanded Serial Peripheral Interface (xSPI) Controller in the
> > > > Renesas RZ/G3E
> > > > (R9A09G047) SoC.
> > > >
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,r
> > > > +++ zg3e
> > > > +++ -xspi.yaml
> >
> > > > +    spi@11030000 {
> > > > +        compatible = "renesas,r9a09g047-xspi";
> > > > +        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
> > > > +        reg-names = "regs", "dirmap";
> > > > +        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > +        interrupt-names = "pulse", "err_pulse";
> > > > +        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
> > >
> > > On the next version I am going to update spix2 clk as <&cpg CPG_CORE
> > > R9A09G047_SPI_CLK_SPIX2>
> >
> > What's spix2 clk? Ah, re-adding dropped line:
> >
> > > > +        clock-names = "ahb", "axi", "spi", "spix2";
> >
> > > Based on [1], the clk specifier cannot distinguish between spi and
> > > spix2 clk, as entries are same(gating bits). So, treating
> > > spix2 as core clock to distinguish them.
> > >
> > > Please let me know if there are any issues in this approach?
> >
> > As you wrote in [2], you have to check the two monitor register bits together. How do you plan to
> > handle that requirement?
>
> As per hardware team, spix2 clock is twice the frequency of the spi clock, and the clock ON/OFF period
> displayed for each bit in the monitor register varies slightly due to the difference in frequency.
>
> So, if I monitor the bit of slowest clock(spi) that will confirm both right?

(perhaps naively) I would assume so, too.

Bute then why did you (or the hardware team) write:

   "So to check the status after changing the clock ON/OFF register setting,
    please check the two monitor register bits together".

???

> > > [1]
> > > https://lore.kernel.org/all/TY3PR01MB11346B3B6CFF1359411B475A386A62@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> >
> > [2]
> > https://lore.kernel.org/all/TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

