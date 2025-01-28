Return-Path: <linux-renesas-soc+bounces-12684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D78A20ED4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 17:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E859918896B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDDF1DE3C4;
	Tue, 28 Jan 2025 16:42:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C571DE3A4;
	Tue, 28 Jan 2025 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082557; cv=none; b=IL68e4nEaqEj1qWGyMFbCM+5sg0CoMAvg+SUUALuLJ+ZMCkK7SrmOaZHiaQlhlPQGfk36x1sG53ZDgja14LeWWYCvpxwUBV8J7R7RTpoAAlc/wwyjkK2pq1ZAO473fgOzCcc+0MROG4eixYfcrgX7zVzh/3mu/BEhOLrOgh26OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082557; c=relaxed/simple;
	bh=+WZI8z7n0FSgwHHcDKlJl1LJFJnVXi9UfYcUBxSi/5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHiPKE3WasHWZJI22mQslLAm3jxknCj5MtVsR5W8idL1DGY5CXSTUqybrTGPxD81JMu3GE3bTeR/ZWuMlAjppFi/9eTTzezIc9EWPaA5UC601fA7E1j75e5IoPBWeiMblv1m+G4qvYxxVNxryYcIiqPSLQzB+5ipeY5/1Ayuh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85baea70afeso1194924241.2;
        Tue, 28 Jan 2025 08:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082553; x=1738687353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7VHnvfdW7apNGhE4YsFPoHmJwdJYayC2KB2whVNBVo=;
        b=oCAhHkpLTbe0E7TVkMBV4vvXSMYSRhj05Rw+01RBLURl0/aRAaXs0i8reYl+NuZimb
         tpU3FDoO3AWHM0lx5J11WjvCjKpA35BhaSDxZAlNn3aqRRcgPS3ju0CAvnTpVw4FNf2P
         Uf4cqa12biraprYwKI4bXx51UjFmnOqr1EOrlVb8nVIBScyUwBU4EcuPQ4DzUWGJEieB
         TmDXHRJ+qbrm0QtJJbNNR/0+IP+ZbaQMtsPFxlMayXpkrTdaN7NEDn7DKNSIx2Ow8gH5
         urSI/Kynlf74HzoNBqZoa4YCrzHfkJsHCQhpQvct4V0A49hyYF2pDs9v898zPTGkmCPZ
         WyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVstEdpXquUj40qQX6nv8XCVoqs8qxowtoPswZx6921ywidfs6RzPHLD7PzZ3aLg4L76Ll1OZUDs+9bG5/ysKxZhak=@vger.kernel.org, AJvYcCXpa/ZUdvY8BbDk0THfNKymewvYgstOvlB8utuWQku6/Ss3XtNJAQaUzTflJZ01ueQ0+YVLJebODLf3@vger.kernel.org
X-Gm-Message-State: AOJu0YwvZxOuY1trs02wuJg5ut7DGTH5XC63ecebUK9/ntWt2GfE9dne
	iBXcOEIcAy5IdtHcQSjnukvKaQL6/j2v2rF+zEIucThyMEVSerB4ZIpOWjBb
X-Gm-Gg: ASbGnctC5+GA3G75dZXBgOsFlSfmvHBIBvu/vk9ift4JIIyHfVsdmdqJ4LNyte3TemF
	rOck26cLvGWXcciosBmDZ8G9ilQZfi9HtbHv6m1f72liHCQIEXqVY6BJTfCC6KCP+PecumIErWw
	p6YhxsFIJwymiUTVuetbIFdzwBsHKiafqfDaKf5txe+87MPDuZKwnB0x0zoqQtwWpHeu/MUBpEs
	dikD/eyw9dgNLcactLf44bVsOSad05R1MnImAbrmR/mmhrXB6LTDTwn8f4rrOYOYiSQ6eSBN7kI
	QcrARxobSO2TagaxOX7OrrY3t3VHGH5mS/f09rrbVenMV3Kg0lz+yW4Kqw==
X-Google-Smtp-Source: AGHT+IGVlqVyl3dkCaG24IKPFwUgwyBoFd9b5DPtXLoBLO650S6iC0yi/9VbkakdnAcsJikaOscTYw==
X-Received: by 2002:a05:6122:8c3:b0:51c:baa4:122a with SMTP id 71dfb90a1353d-51d5b26cb5cmr39661937e0c.5.1738082552854;
        Tue, 28 Jan 2025 08:42:32 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9adb4c6sm2465816241.4.2025.01.28.08.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 08:42:32 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5161d5b8650so1786318e0c.3;
        Tue, 28 Jan 2025 08:42:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTY1aI8fTE05lM3YeOlHpto4uN09Ny2zaKE0tdUuEa07YJsg3bCfgRI5tAGjhQhXBn8qgUpnhuAVby@vger.kernel.org, AJvYcCXHbLzGdQxIMLRyOSv8F0h8wh7d3YUC+0p+hGrZJ5Cj5UssV495ByRUneletr+Y5F7OI5YYQEDeBcEOqqOY4go9UYU=@vger.kernel.org
X-Received: by 2002:a05:6122:4892:b0:518:8753:34a6 with SMTP id
 71dfb90a1353d-51d5b39b873mr39087101e0c.10.1738082552346; Tue, 28 Jan 2025
 08:42:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 17:42:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvuXNPaN8AW7BMPEh1YBiVvq-xDMNy8AvXiBotCBbkSg@mail.gmail.com>
X-Gm-Features: AWEUYZl7FBOOVCl0ahe67lRJvEXTdXKacoGbpugHyWX-QPFjEG_708FXLPRxX8c
Message-ID: <CAMuHMdWvuXNPaN8AW7BMPEh1YBiVvq-xDMNy8AvXiBotCBbkSg@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: r9a09g047: Add icu node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jan 2025 at 11:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add interrupt control node to RZ/G3E ("R9A09G047") SoC DTSI
> and add icu as interrupt-parent of pincontrol.
>
> Also, define the ICU IRQs for board DT users.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -8,6 +8,24 @@
>  #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> +#define RZG3E_NMI      0
> +#define RZG3E_IRQ0     1
> +#define RZG3E_IRQ1     2
> +#define RZG3E_IRQ2     3
> +#define RZG3E_IRQ3     4
> +#define RZG3E_IRQ4     5
> +#define RZG3E_IRQ5     6
> +#define RZG3E_IRQ6     7
> +#define RZG3E_IRQ7     8
> +#define RZG3E_IRQ8     9
> +#define RZG3E_IRQ9     10
> +#define RZG3E_IRQ10    11
> +#define RZG3E_IRQ11    12
> +#define RZG3E_IRQ12    13
> +#define RZG3E_IRQ13    14
> +#define RZG3E_IRQ14    15
> +#define RZG3E_IRQ15    16

Do you need these definitions? And why here, not in <dt-bindings/...>?
The similar RZ/V2H ICU does not use such definitions.
The DT bindings clearly document the meaning of the cell value, and
the numbers can be looked up in Table 4.6-24 ("List of Input Events")
of the documentation, so I think it can be removed.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

