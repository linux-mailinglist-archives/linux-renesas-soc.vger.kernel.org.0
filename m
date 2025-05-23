Return-Path: <linux-renesas-soc+bounces-17417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BBBAC1E6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7A11BC0BED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BAC288C1B;
	Fri, 23 May 2025 08:13:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25482882DD;
	Fri, 23 May 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987983; cv=none; b=rOysi7dkQdo2/5DqXFOBC7kKp0ZDDK8owhWAwByMoyo8n6jsgmIWbLb4r+nMEzSep8ZVYwH3f5jgcKLQkB98gS0C/Mt6PM5ZzCjb79XB/6FyOUMP/+p+27YSH+EyP+GF6wsPwA8YS9T7oyfko/rIZ6fsqUp0PneyCckywKFMX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987983; c=relaxed/simple;
	bh=Z6J6xnMXs1j40siPftwTFcd1QlI4OXxeMO0biu3MF7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCOPy42CVcemflJB2XDCwhYuu2G16fx5WDkcVlWgb7gs6WRYXwRsXrMNGBoSgvj/MxObQLChgbJuCk8O7GV7gnBxwv5KbltQk40a2GwKqXsNCRIk60gxYT6cPMVdJ87gT+INpNd7/sfnbZB1YMmJ/xQ+rX/cT61Zzbc7nyiKh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4dfa7c8c008so2471172137.3;
        Fri, 23 May 2025 01:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987980; x=1748592780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W292GyjdR/QKGjd7O8Xk8fDN1GMGk4UkkYHnVL0ihWo=;
        b=ZPBZGOX/WU8WvHuf11TdKjLja1GOtU+F1OsPW9w6TncRi6bpGQut41PaWk4/Kg4cqQ
         1am3LM5t3bis7GwlcP7OOXau4Y76jdi3tBup0V7mbCxmf6smGB8lbwDRdxPLPrbxhhTe
         fD6VSr/JuKRhAC++yzOL4iI/SFAMDWDa12qWnqiZJptls4uL8Ljt0IZYnxIGFiGXbD/t
         Jot8Wt8KRw/bIFSprNbXKrbwTzkPK9JHElncnCvKUIfDvUMUgN26ISfO2+b17YI9RQMj
         NdNp8XehEYOXR7i+Z2VOZzNKHHLuJHSDelLmYmRk1p6LHQGrojgVFTxcpb7GEU6YsJzN
         YOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWOu5YeHVEu6PDu3DcJZkeXZgMZqqRB8tHUIYGAKRP4txYGIAvqZX9wzEjCvA9nuvNKdUryCTruKe0uw/BXJZDsCQ=@vger.kernel.org, AJvYcCWdyqeCfg1zQ5fWuaYaPsZgJwqwPK+Nj+Ik0DPPepdqeFZEzU0RVasvu8/ulHHfcXbv3Jkr2RvNCm8O@vger.kernel.org, AJvYcCXzyG8hdgeb20BYtbbzUZVZkxLWtlrQg33rPcMRHhZJZ8dOvunjCB93Nz+IvdL+FNI1F513pJYGWRCKsCqQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/EW7JzBxETSp53mpiF6DopB6v9v8aLfGUCLMjXWiUYm/ynv/
	Swld7YzQKqGF28vh/s0vlbT1FHVePVv1Croq5lydN6gZ0zKmYGiufHGhGlvzL/1y
X-Gm-Gg: ASbGncut4nI8dKRzCjYOQSFdqI1ObiDhWv2mvLYFIpJYlKmqz1a0xR5Iv5UCczC2+w8
	fmsvMMZuOYkg4j85p6o9V8+V0YgDdu23n6x7yhKDPCnpbzpWg51Mhr6wAt5Rw0iQcxon7vlH9Ey
	G4yHXm/neqRYB8YXYzsFhwjS1VLWAbhbT40rVXJjNuNWH3R2dhYn4IhGs2ZdrnJUwt8Dv4MPtrO
	KX67k/WjQPZJD1X7YU1LOKbckvcSwMNwZ/CVYFjaaSPDgItCFywyxL6ci54F4/Q6eKBJQkbYaG7
	6v2c+tcBgX3YgO0Xi+Rnc1hgXaqj4XM8Q8z7oBl4ZsAvvgREaJ2rwwm45jX71mwzUQKklgIIfuR
	G6i563abnE+/MpxGZIw==
X-Google-Smtp-Source: AGHT+IFYgc9wA+sGuAznVMBgti82AR1bjMVZiLeaL7lLe4eGSD22Zzz81qWhcq8kXqkAKfX5HyAQaA==
X-Received: by 2002:a05:6102:1516:b0:4df:93e0:fb3 with SMTP id ada2fe7eead31-4dfa6c085b3mr24925655137.20.1747987979650;
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec1ef436sm11477634241.23.2025.05.23.01.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52ee2242b24so1724774e0c.0;
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4a6gbMkL+pOOOlokkdoZnBJv8dY0MO8Lq2jHJmzSf4BF7xl52TlMg7FwxyzoLvhKT935Zgc1gx3CWKlZk+J1qXoo=@vger.kernel.org, AJvYcCVDiNqxy8UvGUfrxmoKsZB+mSBR4wyIndO/KrlSEV7t2rCYz7FQsSUvJ88iVwfwi3llzAP+h5P+Q5SBPoNA@vger.kernel.org, AJvYcCXbtv9GdgmF8ObGI71ZUY5Bjc3L37ecZDnAgtbT0Sx7xaGchGorfXoWf1Adux36vb9yPdEh28BGF4BN@vger.kernel.org
X-Received: by 2002:a05:6122:354b:b0:52f:2a3:4bd6 with SMTP id
 71dfb90a1353d-52f02a34d2emr10327365e0c.3.1747987979210; Fri, 23 May 2025
 01:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250515183104.330964-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250515183104.330964-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 10:12:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC0MGokCwP7gXg+kxfQP0LAqxzb2jAdepwyN2WiCFt7Q@mail.gmail.com>
X-Gm-Features: AX0GCFuqVVpQ34_i3Rvo7K0LxQM6_p-dARUhQTx2NEO4f2mSE1aCflIP0vaI99I
Message-ID: <CAMuHMdWC0MGokCwP7gXg+kxfQP0LAqxzb2jAdepwyN2WiCFt7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 15 May 2025 at 20:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable USB2.0 support on the RZ/V2H EVK board, CN3 supports
> host only operation and CN2 supports host/function operation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts

> @@ -303,6 +326,28 @@ sd1_cd {
>                         pinmux = <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
>                 };
>         };
> +
> +       usb20_pins: usb20 {
> +               vbus {
> +                       pinmux = <RZV2H_PORT_PINMUX(9, 5, 14)>; /* VBUS */
> +               };
> +
> +               ovc {

Moving up to preserve sort order.

> +                       pinmux =  <RZV2H_PORT_PINMUX(9, 6, 14)>; /* OVC */
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       usb21_pins: usb21 {
> +               vbus {
> +                       pinmux = <RZV2H_PORT_PINMUX(6, 6, 14)>; /* VBUS */
> +               };
> +
> +               ovc {

Moving up to preserve sort order.

> +                       pinmux = <RZV2H_PORT_PINMUX(6, 7, 14)>; /* OVC */
> +                       bias-pull-up;
> +               };
> +       };
>  };
>
>  &qextal_clk {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

