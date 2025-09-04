Return-Path: <linux-renesas-soc+bounces-21320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2EB43688
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 732E77B12AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43B12D3725;
	Thu,  4 Sep 2025 09:03:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA4230BFD;
	Thu,  4 Sep 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976580; cv=none; b=fGVdVpa3q0gdu1l0daXnNEaE5vEu2IyugK4UdHYtu6Rqz8LuveZ7iSpBg7nN9oaxjlqPNTHn0gwIGQx4qSEs+ynCcOJf7+UtGrm5WDjO48bFf8iX+2eQcaSACcE15c4caE3ImuIr3gUXDjrs/mapG8no4lZLq45fr3c0flr++GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976580; c=relaxed/simple;
	bh=6a9B/LMmosZSjvkQZ22ISQBb8/CDfupfugcrL4K6H5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUllQQU4F6OUmpqRT6r04G2SBPbn91Z4jxMta9HF40c/KEfZh3yRuakBsa5OveEnw8zmU0wZwCk5N42zViqdQfRJ5rywdKNqqF8lgt0T9K51h4x45cgr9bcH2u+rxS4/R2Ip1FyJu78qXh5E6eKuT9CwaUeu1RhNOkOzb6fK8S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso576680e0c.2;
        Thu, 04 Sep 2025 02:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976578; x=1757581378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf2UXeQpUCNSrRy/zIjB+baZ0t2WATM0TZaxGsoMeRg=;
        b=BNs1tOY1Ia57QZbGJCj59XetKaY4AcuQQwLZLizFeykPzWO/HQTDem1c8VSEwTh4ze
         ydnyy9pSBrbwYjbMNSGc+6SbVgY39P6Bo0s5I4oLkJkusyWh+e/U0LUNzc41GcvTGaa9
         QyQiTeXYdLaWPHT/rbeSRAeRIkyGEB45GycOgABICDFlk9FbP1uDIfzLK/e0dCoMz5mv
         myqetwj+gaiT6FPgq6YlDX2QijMnIaWjZ4syllcNqPOohmHFHkZ9wZFqlO4rNmHHq44t
         U4q98ByOjIMqbwak393Zf8hOGHxePsli+2NA6A49Oa0yUIj1TN3tAPKFMmcS0uCyNkYV
         PQXw==
X-Forwarded-Encrypted: i=1; AJvYcCUjK/KcqwHnO1Itoo6Yp6JiRpUJq530UB6NlCrT9Q5DLUKVsKnrIxh/uQ84RETTtVq/7f9fnQcSP3iwsx79df0vzbY=@vger.kernel.org, AJvYcCV6piJv9KC8avuzrAIj25Ol2qLnNCSJKahnVGfa9qcg0HN/jtCDNFZQen0uTgH90nkuaB5PYfMdKTTUN3wG@vger.kernel.org, AJvYcCX5+qlLapTfKNbAzxFJFfyR4ZWrdGu+YdxRQDeOs3zNY/HFulZRX9JCH5mCOFVd8q98ls7JhsE48K9b@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWjbffWvE5nVeCn9ac7KTwWuyPRA0KrrQv4hPG7bGOskAyk6V
	Nl3mW2KrslhROZbdvOrW2DaQunjnw9lgTTXrp/Wkm8ga2bX2UUrWlk0vD6Zk2+QL
X-Gm-Gg: ASbGncvEiK3vQwatrGS0DHJgc1F/8eMelP2d1b50KPnlcWY3AAK+8WVEbjuK/1rLNsc
	yEFPIaOOh4i99IMi92TDM+UM3mieGQKhiGlVpEUvKIo/XOwfoelTEWdAVE4VI9n7idj2JClpm7D
	ndiWHbhmSL7pxdf74yZu2ElnWOSJVkXaIwzW2ZEYFNpCkOqD1j73nTESNCGWSQDptrjYDPXmYzR
	qH2QIRgCSDoFQsu/XR2H2tcjap1geY9mqKznV/V6jChfoxptcgeP9Fyr0UiK/6WFCJZL76eHyjx
	Px40hSeSLnkDNBsZQOgecyr/66MW9bXYM3JL9A2b3aY7AZuGOLESwg0M6Bj0Lne1nxQ5k3W6Bgn
	f9jwVEu7XIUDWuDDUB1KzFSKSFVIoMATbzzEITLtKba7P94THyMw1zCCKll6FCw9z9d+y7Io=
X-Google-Smtp-Source: AGHT+IE9JHQpA+JRoU/dDjobo9NZu84Djc6IwYaELzQcavZpwrmjZKL2FrZRkthRm1bf9Lo3Oz1kuA==
X-Received: by 2002:a05:6122:1350:b0:539:3bb5:e4d6 with SMTP id 71dfb90a1353d-544a0196ec5mr5549020e0c.1.1756976577073;
        Thu, 04 Sep 2025 02:02:57 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464aebsm8000183e0c.14.2025.09.04.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:02:56 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89018e9f902so414529241.0;
        Thu, 04 Sep 2025 02:02:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWPXPwZldt/ohT48CDihrQ39SmTElgR8n6+5AJ4E8J0Wl+NVy4F5pGL61XO2eEot4NUsTlCn456yBRUPsVE2iuXYE=@vger.kernel.org, AJvYcCXBXvBucULPHMq+VXa4X2WVkRhq6eTYxkXMPefTM1/gNfClsvQrnVFx+fA57eLYPDClvrltM7bBf5jnHiLV@vger.kernel.org, AJvYcCXD+waoiUqSXp+kHs8IAHRmdbv7eGWuQNug5ffRZi1/yZPVIZa3GmroxmPcbcAnxjHuaN0JiZiUdxsr@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-52b1c887eafmr6490467137.32.1756976576275; Thu, 04 Sep 2025
 02:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVxDcunZcqg65O3Ap9usJUTPnYh34AUk0pmB-pFqesHGw@mail.gmail.com>
In-Reply-To: <CAMuHMdVxDcunZcqg65O3Ap9usJUTPnYh34AUk0pmB-pFqesHGw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 11:02:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzZQ4N9LGsq=Gr54SEybBb1hukzTVGmL02ZPfP8jXdFA@mail.gmail.com>
X-Gm-Features: Ac12FXxH9T5HOnIC_v5EMqfhkxpW959ceovgansllU74BPLiXRwkakgcuRFtzm4
Message-ID: <CAMuHMdVzZQ4N9LGsq=Gr54SEybBb1hukzTVGmL02ZPfP8jXdFA@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a09g087: Add USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 16:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add EHCI, OHCI, PHY and HSUSB nodes to RZ/N2H (R9A09G087) SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
>
> > +               hsusb: usb@92041000 {
> > +                       compatible = "renesas,usbhs-r9a09g087", "renesas,usbhs-r9a09g077";
> > +                       reg = <0 0x92041000 0 0x10000>;
>
> "0x1000", as the region starting at 0x92043000 is marked reserved?
> I can fix that while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

