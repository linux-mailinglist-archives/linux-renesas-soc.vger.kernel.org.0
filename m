Return-Path: <linux-renesas-soc+bounces-13006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4BA2F02D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43163A74A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CA71F8BCC;
	Mon, 10 Feb 2025 14:48:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E9E252906;
	Mon, 10 Feb 2025 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198939; cv=none; b=CJ3TyqTwoCgHvw0et+k08XBqU4SaxO+RkcQkCEQR/VRpFqi5uKd0A2NsRSzOLptubkBzXw3V9dunPgGYOiaizzCkpxpiv9BcghclEWypfQsrZlRLskn5ZuSik0nmowyEGZL4g6hxTmhWSAQ2IQ0F3I8RQUUBrqMtpE/sD6EAKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198939; c=relaxed/simple;
	bh=9COVxLzKZseAYxARFBFeHUP0vM+MnKZUuXUAmWDEp/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWsNG0HGl74NYHrLYC/SBybuX87IlCwscCKTq1FsFTbOlbU5gfv43/pnznKemgU2QDIyALeX3GkQfxQ4NDr85MGw4W0QV2s7GsI8lKtCOilK7K1TaJey4W8PWhZOhEc8zWcpMpWWdZ+gXkBGKN8EyzdJ6BJ1+X9HRSOdKrEtl34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52031ffca74so565827e0c.2;
        Mon, 10 Feb 2025 06:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739198935; x=1739803735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwcSF59IzY/sbaPR253H2gim/DkadBRpCCKdYSENeIk=;
        b=jZkAAIELKHtN+bLeQhKV9gg3dIAovDu3aHlWOZFf2E3okbfojCOvJ3ti4OD+zYJyvD
         lSFBxIFIOCzkGxN57SpD90L6/wRKw+TgsDGcOhZ95zKDMLTSdaVhjfTzvicpAhKzv/9d
         jYcjHMhOVNv7MIYTaw5V7gOMow9POnoy7BXQXIMewdE6XRWUy5D9h4F1J8zAClj8cN5r
         Hni1JdoDG7+DhIFjc3juIoMiQmJ6q/5lVAOyHJbpBkMVI7O8VxFCFrOTF2C1oP5844RY
         Hu9plRWRptJg0P3SQ8epjiiNSRr/JE3D4BhmvJoGYeXe6H2ChiN2tf1ZRU+xecPWWPCp
         ZuPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUUjLsNPhX3z70sxGgGXsySUUfNxHS1VJUN3umipKZGz+ctkwTugoxXOO6aEaBT1QQUfHWG2/WVHiV@vger.kernel.org, AJvYcCUzd22oDpRJczyZtqovOWmLGmu4XgRgeP3qz5dvRWurcnunJVIy9F2BlyGUrnDKvM1m6uXftuXcX6+ujmjK@vger.kernel.org, AJvYcCX2yWRjw+LgeVeba4OTsW/aCHESKAw8YxAbQz9sIWfVouORooJE5VkI4eSbj34kWQ4B5hF0BiBq8ZxRSPbr@vger.kernel.org, AJvYcCXySPKhRBJgGAQGjbGiymnoISxFuLXOVZ5ynNRDT3Cu/iifSdjdnTcWKbhlrH+LR1rxRGGyB+CXxU1KcI7PXC23y14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPpsKfbk+T1I3VYM1tvVazXXPmzbndI/VlgRgMdvlRLkUu4aT
	T3GEMM+xMGxfOem+QTeWeAxNYH8uut9hu79LRMCzNUjFxkvfmLuo4aqvpdW3
X-Gm-Gg: ASbGnctD33lsi5K/ibiEpGcBw5ze6og8Tm5W7Hd2KECcqxeto2jY+mnOTwU6VoPqAbU
	w9mpbcEuc82smJxyBwjVkQf9OXn/xmkNZ3cgxsWrKZTl2q1Af70yzmH/bGDEMl6kiKN9tfrhrtR
	aODQ8wOLYjoSoDliQaePrMQMyIv368fO2qxpxMjRfjjZiC7QJ8Z2r2hy5Ji7nf6Ybpiq6YHe0ZU
	fROkfSNc583yvM9vLs2/WLsFtOi0P/HYv3CNbpS6H+d73qVUkdblGXWX9AcOeOJ8Ngm9a2AGt5w
	f/YdeK7hnT+buLXY7h1g7LT7nn1ucbNA4f3AkeLh30wbU4fZyrrqNw==
X-Google-Smtp-Source: AGHT+IGCWFMlyHEGblA5hGdod5/D90LAoajlMOpsRNPvd100BZyQ5PoVfZOr4+yx/nHhH9dF4bdfYg==
X-Received: by 2002:a05:6122:251d:b0:519:fcf2:ef51 with SMTP id 71dfb90a1353d-51f2e12026dmr8479550e0c.5.1739198935011;
        Mon, 10 Feb 2025 06:48:55 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52044da707fsm278307e0c.24.2025.02.10.06.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:48:54 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so1189335241.1;
        Mon, 10 Feb 2025 06:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2sDsjEmAVr1qDRVN6lE5OCAilIVCebniOdONgPbDiku6f9YrxL6tirilKySY7rkLXEbUQup7sOeTCuV5D@vger.kernel.org, AJvYcCVwMEpMoP5VHEnm2XebJnj6GzgQiRNZjYO+0xCPyXXWa4kzbKfRKwI2jtCI2lDsXgHAV4xh7G5XvENQInqE@vger.kernel.org, AJvYcCWK+uFSbIWGL3JG39934V6AhtGm33waSqko9qh6h8L2dVMyriWy+VzP4My5POj6X161UWGGpeGDbyHNKEMaspb8rco=@vger.kernel.org, AJvYcCX3K+2sd/alcfDFjaLHlI7rzBUvkpnf+wJmtOMOsqB/xdgOmGZnb6dkhy8VvG0/+tG2nIFOsX2NYyJl@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:4bb:9b46:3f93 with SMTP id
 ada2fe7eead31-4bb9b4679f8mr4371410137.8.1739198934075; Mon, 10 Feb 2025
 06:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com> <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
 <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
 <TY3PR01MB113461CABD5E18F03B7BE9B8486F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346287906F19FDFF7ACA52886F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346287906F19FDFF7ACA52886F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 15:48:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVLyY10AgqR8J9FHB5mKiPXSWZ04EkW5ykE6bDj6EGPA@mail.gmail.com>
X-Gm-Features: AWEUYZksMNriPrElI1r872-idh3W1qkzqfDu8Ca9WoDMxgWJZlnyPhBwWI8ZnOM
Message-ID: <CAMuHMdXVLyY10AgqR8J9FHB5mKiPXSWZ04EkW5ykE6bDj6EGPA@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 10 Feb 2025 at 15:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Mon, 10 Feb 2025 at 15:26, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > On Mon, 10 Feb 2025 at 14:19, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > On Wed, 29 Jan 2025 at 17:52, Thierry Bultel <thierry.bultel.yh@bp.renesas.com> wrote:
> > > > > > > > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> > > > > > > >
> > > > > > > > Signed-off-by: Thierry Bultel
> > > > > > > > <thierry.bultel.yh@bp.renesas.com>
> > > > > > >
> > > > > > > Thanks for your patch!
> > > > > > >
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/serial/renesas,rzsci
> > > > > > > > +++ .y
> > > > > > > > +++ aml
> > > > > > > > @@ -0,0 +1,100 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML
> > > > > > > > +1.2
> > > > > > > > +---
> > > > > > > > +$id:
> > > > > > > > +http://devicetree.org/schemas/serial/renesas,rzsci.yaml#
> > > > > > >
> > > > > > > "rzsci" is IMHO a bad name, as SCI on RZ/T2 differs from the
> > > > > > > similar-named "SCI" (sometimes called "RSCI" or "SCIg") on
> > > > > > > RZ/A1H, RZ/A2M, RZ/G2L, RZ/V2L, and
> > > > > RZ/G3S (and most old SuperH SoCs).
> > > > > > >
> > > > > > > BTW, I believe the variant on RZ/T2 is also used on RZ/N2, RZ/V2H, and RZ/G3E?
> > > > > > >
> > > > > > > However, binding-wise, they all seem to be very similar.
> > > > > > > So perhaps you can just add this to the existing
> > > > > > > Documentation/devicetree/bindings/serial/renesas,sci.yaml?
> > > > > >
> > > > > > It is present in RZ/G3E as well.
> > > > > > RSCI supports sci, scif, i2c and spi that is the reason renesas,rzsci.yaml introduced.
> > > > >
> > > > > If you plan to add support for I2C and SPI, you will need
> > > > > different bindings under Documentation/devicetree/bindings/{i2c,spi}/.
> > > >
> > > > OK, I thought since it is a single IP, we need to use a single
> > > > compatible and instantiate appropriate device based on the device
> > > > property rather than separate SCI,
> > > i2c and spi compatible.
> > > >
> > > > Yes, I agree having different device compatible for same IP make
> > > > life easier, no need to add specific vendor property.
> > >
> > > I said "different bindings", not "different compatible values"!
> > >
> > > Cfr. "renesas,tpu" having bindings in both
> > > Documentation/devicetree/bindings/timer/renesas,tpu.yaml
> > > and Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml.
> >
> > Thanks for clarification. This is simple solution.
>
> But, here we need to decide, which channels to be used in SCI, I2C and SPI
> in SoC dtsi
>
> or
>
> Maybe define all the channels as sci as default and override it in board dts for
> I2c and spi based on customer use case??

The latter, please.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

