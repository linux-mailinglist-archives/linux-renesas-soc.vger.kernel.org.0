Return-Path: <linux-renesas-soc+bounces-25981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B32EDCD61CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9DA63045F73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550D33176EE;
	Mon, 22 Dec 2025 13:16:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE63126C1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409379; cv=none; b=iUsB7KEF+rsztCKqjTROzBX0smKSXZthWdgEfdRzG8/0C0qkKq79sshQjw2VUF6sslZ03m08y6NYBxyu45RdTQ4UIraZtAdkf/fXWSzkS2ltVUPvFotdg1r2ZgOZ3hHl2wJg83jhy418XtzM0q6gvIxDv2EANvq2etDO51jD/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409379; c=relaxed/simple;
	bh=5qy0LVDQI/8V4lQP8j4gHRFuOP8c7jSbtRzhHciotQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AewcFfW0hjhP4Mk6TIviGS6oKt00UI3g9ujpdHUGC9HZ1jSCeglz3mr6Y5PoxJXm0+HOOMvzBpS54b/4VPbiHaxA43kBPr7Crp71YjJQ6XcbNbRbo4dcQ3xNreyhL5RD7dvulys9uQOGZO/NqWdpXq9J8KgfGUneGPIu8QKQqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5e19e72c2a7so1135126137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409375; x=1767014175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvtN81E1khYX/7Xfo+cWN749NIQGHVHkmuXWl3/lbfQ=;
        b=dx8tB7ZVILJlfiCw67SOxzoMAtfdDOENcpsobRVleQmHC7BxQi2FEt+BvVkhnJwRuk
         y5fjSDpkAzAg9sEaqlU6lswQ6J+ZG08aYzwFI2pLceGnM4D0Q7xaTRpvgMAqfHa7DuXo
         YMs5DYTRzpn7BSpSb9MniPuTao2wPGrnYon6QBnObR6qUO96QEj8XdRPQ6ADmF5QWNa7
         H/h9SOOogw9kb3owAwTy89UNYtCaSe+Dxad8mhcQ2Mjht/4R6zpGUjp5GLGhHfQnujWV
         Yk5z2/Mr8LKGvDNpVc1N/kroZxO/g8QyZDs32daID+/QM/jXs0LPGmw+orEtz8YtPTap
         6nkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMjvLSRNmE4sw4yghOiLHNDKA7DWhSbMhD8zz18XEqRleox2zhX/VdiOJKRSTxSVApM4HCZvE6sAk3IqnQ32nouw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtTDCAtvFc15C2hbIgw5lfRSwmzVjineDxfZ1BFsd17x51Rxs
	hHnVMGDdxEMYN4rTAQuFxk+Fsr8c8fFy/SHAJAoIVvmEzQ0RwpcCHmumlIkoqFGC
X-Gm-Gg: AY/fxX5kw6mJhKhejDl1cFAbrKCZDFR2o2sc6Oh/3bkMl1mjTJ0dTB775zUR1IH2kC6
	LBAMxEY0DifFxk1ilWvDJxzEK1cRHficoi4Wr+eYGT5+NNU3aVTioJXQTpdvkcJsvdjdheFLYjP
	WIJ1lsvtKDeABrllax2j3XO7QJulOQBvVE+4O6eNipGqmKMg+UrUS/ACPLJuAoKpig0GmYHJiWE
	qdVb6tNAQnuZugvjq5Yau8LZOSew937ofGCGNNOAd34rW3vX78t0h4Y/y92ncDtliQImrK5YSYG
	+WzoObmubQVyZFrsl31+d39wnkc3qhhbMq/f1ra/CsOBdx9GoLmpeu2vHWbJdUidxY5XVAntOKF
	6AgTR1R8s9HvCF9iOkdoI3bOxSaqq6E54tFXA2E+UvSOEuwoWXUf0nJO6pSLbphhjD0QVFwBjWf
	zSexMyV4qCvvzBAA6ZPiEjfajOgG5yUmXNGs3c+BUD/xjoYQKi
X-Google-Smtp-Source: AGHT+IH+FnTiwZt356fg9ceLA7do1jKib/5MZxVNHP1ISRlGwKu2FBp0VWqI8A1JziSH7oxfSPHURg==
X-Received: by 2002:a05:6102:e12:b0:5db:417d:923d with SMTP id ada2fe7eead31-5eb1a7c1375mr2822221137.22.1766409374526;
        Mon, 22 Dec 2025 05:16:14 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac62fd0sm3393228137.9.2025.12.22.05.16.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:16:13 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dde4444e0cso1277355137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:16:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXt/3XPycOWqmhsL/pDZyTcHNxNYwDwuRixN6p6EV5VKCn+v2O7/uITHmNooqqw8PeTEFfUtqyNblcdVYXNtWcslA==@vger.kernel.org
X-Received: by 2002:a05:6102:2d06:b0:5b1:15:1986 with SMTP id
 ada2fe7eead31-5eb1a64353emr2784298137.15.1766409373012; Mon, 22 Dec 2025
 05:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201112933.488801-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201112933.488801-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:16:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm-31eJyA38pN0Ou=_HwSPaRHntEOi7FSCVPDd8zSmxA@mail.gmail.com>
X-Gm-Features: AQt7F2pH1olH6yEHXaAxTUGM1wtNbPvWiskaMHHzRKGkPhpTitp2Op0Qc7lDMx4
Message-ID: <CAMuHMdUm-31eJyA38pN0Ou=_HwSPaRHntEOi7FSCVPDd8zSmxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a09g087: add ICU support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 12:30, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has an Interrupt Controller (ICU)
> block that routes external interrupts to the GIC's SPIs, with the
> ability of level-translation, and can also produce software
> and aggregate error interrupts.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -865,6 +865,79 @@ cpg: clock-controller@80280000 {
>                         #power-domain-cells = <0>;
>                 };
>
> +               icu: interrupt-controller@802a0000 {
> +                       compatible = "renesas,r9a09g087-icu", "renesas,r9a09g077-icu";
> +                       reg = <0 0x802a0000 0 0x10000>,
> +                             <0 0x812a0000 0 0x50>;

"<0 0x812a0000 0 0x10000>", as per Figure 5.1 ("Unified memory map").

The rest is OK, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

