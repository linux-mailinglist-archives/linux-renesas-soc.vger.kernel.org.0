Return-Path: <linux-renesas-soc+bounces-15182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F0A7677C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 16:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E34AC3A680B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE10F1E04BD;
	Mon, 31 Mar 2025 14:12:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B83234;
	Mon, 31 Mar 2025 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430321; cv=none; b=csrQJ8klhkrNADXI06plZGfhIHYsgjeqdMrMd35/sgXC7Dtd3wjNjJdOdcIXQndHKp7CGWrp8aJDB1CCB9Amblr/f4WB1ds2wfyr1Y1Pdv3bIKz/mI07TR59N+pgZC2e+iL86itg0hhdukHCzA3eBSxE1n6wArADB2Tq1dwbLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430321; c=relaxed/simple;
	bh=Do7s37/+QqqtEFi3YXwWLBOdGD7xd3Lwz3LUeGurZOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGIsNx2eVdZxwey+Q92+j1J5N4nZbxcTpJjVPauFcAPX0aZUPuxPN4zVtwz845BoWCoy3AWr8lVxWucCHJjZdP3Am65FWw0VMD/MlhZEIVnAKhSyOdVNlH8FIfUl7J1+A5q73D0JqqpqZ5DA4iu7GtjZAq3MnYsEdkI5ih7C3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fce04655so43751396d6.3;
        Mon, 31 Mar 2025 07:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430318; x=1744035118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXDnHLgurTg/qFshZI82nSulQvp2bPmmJIVIi99MINg=;
        b=tEsLafuXpXSYDMgfisznkGAz/ybr5YKCzcJFgpg0aNnJqEvUJZHrV65SNGll5YCrSA
         eVFiNaD60oAFoDNda0JoTtJ7LpB8yjGcn+9ArNmwmDylC5MdniaKoRHKbPw2gzwfl/pK
         jDtzSxrkKNO1AN4aN0dOdtghX3jXrERr3M0kV9bHSzo1ChNZY83h3ktbyKDzZiEIaBgb
         d0EbSxsvKqoftCrnNTeaE2VjBO4Q5awaZYSC+OJxzQWgL8H/mmK9/13WQ1V7pLt1BuIu
         tdWMbFNIQ1ROMZQh27E2xWojgH8pUmS3aNKgof+7V9TgQwc+D//RRkJIBtk+EoqJnjpN
         zVwg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDi4SHEovfC6D8rArwFoc7xVMZPVu6W9jn+LnRKnNhbAZ3T+ByHsxHCDZt/RP4awTPEUZXza3L4ZrRAM1JXGPDNc=@vger.kernel.org, AJvYcCWr+g2s6hCqGnFgUeRwja9qfcNTqavkTCpBwSwQup1D1q+60yw6gCY+tT+JliBL16NJpDkJ9ZK5T3zk@vger.kernel.org
X-Gm-Message-State: AOJu0Yybcds3mbapJDj73KPvwnZloxAszk3PhXFNmH9voTbnTPuz0Hyd
	9IReV+uFZvGB1hF+D1I4aB1ofeKP2ZXDNkrkHGOv8tVPmDj0s+YnNNJPksuQ
X-Gm-Gg: ASbGncsZ1XkPtmhERlZwSx4f4ZWlQ5Zpm1hVhnV45lzKWyaIBo5tT4Ktii6vs4M3RxF
	4lI0CYF4iJHvBbEaGra72eneTRbeQg1sw6hRmyMmtIGJIqQ9jr5hJALScixj5W6g0ZbUz6Xj7dn
	sO4wpAiFv8XNwZ9aQyHLFbPppvt3Xllt+4Omdq0xJPjwuEKlI5mNP2rPKKV3fltjHYk6SrRJlWI
	Jc5Nd5JdOXSIVJCq51XGLTDJZfvcDjmrKXG4q3K+WpC6dh1erf8JfraZGFfhLjBPL78I6HtnwqX
	A7CfQTILhrcM1po7t/M8G4MWIbvP231953bBrymCnEGU0sJtud16XwM1Rje5IdDnFcfSocv+0Cy
	mWzQJihKwqDE=
X-Google-Smtp-Source: AGHT+IF+vvp1IXAInffnK17tR4WvMtiGhkKp1fL4fQV/l2DwkWI4SENOOb5y/ulRTnp5Vn5FicXFlg==
X-Received: by 2002:a05:6214:e48:b0:6e8:96aa:6034 with SMTP id 6a1803df08f44-6eed5f8958amr125490686d6.3.1743430318053;
        Mon, 31 Mar 2025 07:11:58 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771c41sm47058866d6.76.2025.03.31.07.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:11:57 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c55500d08cso406818085a.0;
        Mon, 31 Mar 2025 07:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuv6ZpXhucxbJAZlMAtYxjQ/zFJLS5zTjFNkZeI+BH0BBqaL4S1m+xLD/guGsyxvGxS5nBtddphDgI@vger.kernel.org, AJvYcCV6SfZTT7lEaCnem9WYrY2X9FVigwcfO/smIs1Bs7QFfub9bBmOOfZNQBSTOLpGAZe/gT52Omiaz6LgW86vgjdAMOc=@vger.kernel.org
X-Received: by 2002:a05:620a:1996:b0:7c5:5d9b:b626 with SMTP id
 af79cd13be357-7c6908af2d8mr1386238985a.36.1743430317561; Mon, 31 Mar 2025
 07:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 16:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
X-Gm-Features: AQ5f1JrfSn58xtLeI1SWXo6l9KENK07iAjtezEEDfiz5_cJxxlK8QwvnC3tJc00
Message-ID: <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
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

On Mon, 31 Mar 2025 at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Document support for the Expanded Serial Peripheral Interface (xSPI) Controller in the Renesas RZ/G3E
> > (R9A09G047) SoC.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e
> > +++ -xspi.yaml

> > +    spi@11030000 {
> > +        compatible = "renesas,r9a09g047-xspi";
> > +        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
> > +        reg-names = "regs", "dirmap";
> > +        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > +        interrupt-names = "pulse", "err_pulse";
> > +        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
>
> On the next version I am going to update spix2 clk as
> <&cpg CPG_CORE R9A09G047_SPI_CLK_SPIX2>

What's spix2 clk? Ah, re-adding dropped line:

> > +        clock-names = "ahb", "axi", "spi", "spix2";

> Based on [1], the clk specifier cannot distinguish between
> spi and spix2 clk, as entries are same(gating bits). So, treating
> spix2 as core clock to distinguish them.
>
> Please let me know if there are any issues in this approach?

As you wrote in [2], you have to check the two monitor register bits
together. How do you plan to handle that requirement?

> [1] https://lore.kernel.org/all/TY3PR01MB11346B3B6CFF1359411B475A386A62@TY3PR01MB11346.jpnprd01.prod.outlook.com/

[2] https://lore.kernel.org/all/TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

