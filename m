Return-Path: <linux-renesas-soc+bounces-33201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF0mJEDEFmrOqgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:15:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2E5E275F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5DCC300B9C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCEB317158;
	Wed, 27 May 2026 10:08:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C293EDAD4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876530; cv=none; b=a1HbAq8utOB27YNT2a2rVJ6qLEjpOXTAc1t20J+fmOB7GBBh6ghBtMm9QxUh0teJ+qciIZSHcQzYgurFpGYtTpMQeiRgMC0crKag5h84SYU9iBlZNkwW0SBjxWpzdYzmFcjjYLapzY632mfdrP7MwTwXO+/M+izuE0vCJMMH2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876530; c=relaxed/simple;
	bh=t/6YKQHuNy5iE+ILTpFSI2KFKjawttSyluj0sbu+qZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrPun7qevS2fzxq8F1pxx22Y26yIsP/1EfGjiCQtN6YUT2ti8lcFlaTodKTe6UM8krISvjFwWODWONQD/IgG1/Xjafo7ER9o+dRxWS5kr+znp+/INehdGjrTZpj2P5l44tXyj3bDJ6sksVYXyyr9KJ2Z4MCEOtssuP2mX0/IGa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-632a055fa9fso4236878137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876526; x=1780481326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT2WytwVbdAnIW/wWW0UCgT8THJamN0RLJxguVXBLBM=;
        b=D9uXQGC3QRPwz025ArQh2bvCDCiWODegZWPngtvxtkWffSOqwuMraPUdjd3ZOe0NWO
         8k73UlHmuIfJ5MpUb0ObkQHLcd6fLgfIqiawlHC6JlIoJgrlGuia0I3MG8dZCW1CjPP8
         VIH4KqCsKcV50UbYDxm8cLcRzJmKZuzANsKPBi8IUr9BSYMSlcP7ocfUk+deJO9sXUS0
         BGAFzLQSyLCJ47PWkvjAyCGJmjxQwqdT0jhCf/poIgWri6CWJqUPs6XcaHEa4PddQGmW
         E1Wl3E7r/Ki9CAUvpTJdwBQ/NK0a06f0Ial5OER9yxsw0RU/xy/inNjouC4JdMm/76B9
         7pWg==
X-Forwarded-Encrypted: i=1; AFNElJ+NiITFQT7n8e+L04ON/FmSywDjYoBUEDaYlpV5peofFcL0E0LrnJIn8VbnkoLzRKOPnPWRa7B6iQR1I/HBODMutA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvE4gwiufiRlXvnZUBKRpni9vQvMw0KGNd1Q3Rrm8ZyE32ZvFj
	Twh9PPc9rn7srn/ygLKoHu/wcnVMXJZ/qHbx8ZYLyFogdRjJN9O9u7j/ezCg1dkfnTs=
X-Gm-Gg: Acq92OG1BeHHVqpNoFewPVulbuE6f2Mh0YmBffMJ0buSKc5mpYQ1EhjDWXcw2l1ULwc
	ir+AkyvXjFkH9oM1wcsmhMPGI4VeYf3YI5WYAyFNJokv87+Jrvwv+fcqTqN0ZNllepotXrP6chb
	esrfKoIZusQrEyfSVfQvAPa1VEQ2JGea4dgAufzb44Cou7STtLbSlc3TcMg15F8EEa3iQfOopJS
	goG7Vsw8CENfKCueDNRUWeXW2aFIOwEwIDgIiOkZCeS1xVtkE0TGSpXI6/G6M4D9lf+aazR4/pV
	Kmx0nofGabcrr3yd/6P0BrWuUFGOfPoTgH9lVnoGXvzTp6TI2rJILgZUMDAfQoMA+8r8BUFmV32
	MP4D2G3UM53cTQLW+fQ6eqM1Y9UNK3VJGVd5nEaDmN/UFewd7Ai1JJiUn7TDvj3dUplAlpGkWyk
	2XDtJjYQkCGkPyL6Q23egykQUDPXSI32EiKPS4iW2fqmA4ajpXi6eRmLWMjZ82SJ6dxKszQbzgl
	fA=
X-Received: by 2002:a05:6102:1590:b0:60f:7499:9b6e with SMTP id ada2fe7eead31-67c854898d4mr10091473137.27.1779876526096;
        Wed, 27 May 2026 03:08:46 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e4ae04sm16286735137.8.2026.05.27.03.08.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:08:45 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57513a91514so3868329e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Bv0HA39bRbuIsmu03qVfVz1/TQn5Pyide2R0c3qZ2imy8yY3Y6q3c1ZmFNgkgIbDbtGL7E3GlwGM27BGKUV/ilQ==@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr11358742e0c.0.1779876525680; Wed, 27 May 2026
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260505120153.680979-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260505120153.680979-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:08:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU82_2iJegVFV8f4gDD6shtcxNuAJdpisOLiY+H5mYEPw@mail.gmail.com>
X-Gm-Features: AVHnY4JfFxtT36vAaw579o5UiOGjx18u6RiSwEHYEnjYP6FwUvZezqDmmVkEb5A
Message-ID: <CAMuHMdU82_2iJegVFV8f4gDD6shtcxNuAJdpisOLiY+H5mYEPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33201-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,0.0.0.3:email,801c0000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 33D2E5E275F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add xSPI (Expanded SPI) device nodes to the RZ/N2H (R9A09G087) SoC DTSI.
> The RZ/N2H integrates two xSPI interfaces.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -1009,6 +1009,44 @@ mii_conv3: mii-conv@3 {
>                         };
>                 };
>
> +               xspi0: spi@801c0000 {
> +                       compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x801c0000 0 0x1000>,
> +                             <0 0x40000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 4>,
> +                                <&cpg CPG_CORE R9A09G087_XSPI_CLK0>;
> +                       clock-names = "ahb", "spi";
> +                       resets = <&cpg 0x4>;

4

> +                       reset-names = "hresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

