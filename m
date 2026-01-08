Return-Path: <linux-renesas-soc+bounces-26424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FDD02FE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72B63081E3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776113BFE3A;
	Thu,  8 Jan 2026 13:18:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCAF37E312
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878332; cv=none; b=fZTGDkcFf+VOD/lsYURVPU6u4+0iRKaPchP0otocO93jUkMPednJdiL9NTOLQe97YN5RsEfMvtgWovyDjOTE7PiuDaPpyGXuf4JsJej9Vl6W5VpBsCeAeaZzBvDrPzedLFg3RjbDUKKBQTN3R5QnZwblHikZkpngPQ/1ERLOjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878332; c=relaxed/simple;
	bh=R/ik6RCHy0vcmDiWODgzb7fmBMuxgNZfDeNSBubH6j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOofxsaODHfNeZQhW/KAZfJJ/gTijgVM9ose7BtJDltA1QEcmAx7HEeaQqbkLj3s+4O3tql3O0q4uRKi3TRRqWgjyu988Bd1/l1Sd3OnlwWCbtix9l+H8f9BtvMRV3OgXVnaJJsk1+k9H4NYZ7xIsxS8OBrc5gZ40u2eI9vtOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so989914e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878328; x=1768483128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBcKWVGEhtiifVCFkRWBbtuXpQVZDUsacun0dIyCZSQ=;
        b=jG4ef3JYK8KG3L5gAzkwOfO+Bj1JljNP3mpJlesNKaCbWlCjEKzFScBrcdCe+f3pgF
         vs1VXAzgaH2WQ2bZUpbUV2XwqeQ01wMPtHViEtjTopbRmgit4SYUwf5fehDXz52KlrFI
         6h9UuRmcaKtqudSpYEcc1H+xnJiccnfqZhqSH80yEUOSxeQ6yV5ZhvKYyZrGjj9LGxjT
         uYM5uDqPCpx/uC68sVE2MBYrT/wQnGgAHCEjnbq9KzmOSLZbLyDomEp3i6Hy6CNBpvws
         T/5TygQVDWb9q9HBEi30qn/kwiBboMHIvaVnGVtC0lTAs5bX7PuZxj5nLVXp16Amdplv
         KznQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmW93NIbBbNVcMyxGi4+lNAEU1sT/aVbuY/r3Exn7+M246a747K5l/j7k9cSxxyFgq+I3EuiYhfFbmo6+ciVcRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyED+vvqTnEPtQJ7oCGJF1cH8BMCu76HA6bzT93z1jwxBpKyaJ+
	gNroXpI+0lgBGRGicWAyMlTU0RZxP/deA/zVmhYVObdLgFEF6G/xfQ+F4q7LR10I
X-Gm-Gg: AY/fxX72aGMZ5TUlzCgo6j0W1Zkq+HnhRkoPxPIkjLFlw53OBYrrgnoO8oQVDQDMY54
	rRBEBOITvHJJbBoy2XSKWoFcTDpQK3ZKRoB+b2JFOUwER3h3E9I4tSuQWDaQa27d/aDJjzeX2kB
	XjTD3Pv8jI3ZaHLX1hkuWThLMASF+sTtxa8ruW1lafPnea5G0cdh7zXC5wjAg7hBJoJiygMVNjQ
	ptzte+OgBrFie7SiynD70Zag68ltxVZZciNjClv23BOxqcx1L4PTtZk8icN3/ZUXia9YqQmg7Fy
	cwPppLpPhbBOoysp2JtMy/pS5rbz9Uvz0pzcurU28c3YmSScPa6LGZVb68qpWAAoK8q3Li+sR/T
	yXRrR/OHlWfQhPdKEe2IJ9XgbsjrUoT2xgn5ra9OkPTtIx3LVZ37Toi8Uch3534gDC/Y66nHtjn
	3z8DCnEoW9CoJwNZVd7ZUSAeS+t3Wg5W4vG9uutLyD1vxQqFXDQd6QR9r46BJoadQ=
X-Google-Smtp-Source: AGHT+IEccFkRVhCKDXtO8mowmG962ESn8ptDtg3Kr1UGRaakP1iNAswyfiPXEBw1R2nLi2Ex5Q/PFg==
X-Received: by 2002:a05:6122:9003:b0:55b:113f:7e08 with SMTP id 71dfb90a1353d-56347d53d43mr1881064e0c.2.1767878327632;
        Thu, 08 Jan 2026 05:18:47 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a2076bbsm5985194e0c.6.2026.01.08.05.18.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:18:47 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56021f047d6so998959e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:18:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVcIsSaHE1nvyekeREa1qovTnMeb4A5HqZAht7tUeG3uWDhDQIfD15DsJB6AQZ7NAfXJFYWcVFr7J1mzOiDrnvzw==@vger.kernel.org
X-Received: by 2002:a05:6122:322b:b0:558:251:f0e8 with SMTP id
 71dfb90a1353d-56347fd4810mr2027140e0c.11.1767878326461; Thu, 08 Jan 2026
 05:18:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251215163230.227849-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251215163230.227849-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 14:18:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGaGcj2BU193+v8A4HQKVcaQtxi-aP=_3WwmYJTzLJYA@mail.gmail.com>
X-Gm-Features: AQt7F2o6RT1uScZLN7knEWw7zzwRk-uVlCC2UoePmf-BfftnoFVhaLPZHDMkN-0
Message-ID: <CAMuHMdVGaGcj2BU193+v8A4HQKVcaQtxi-aP=_3WwmYJTzLJYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057: Add DMA support for
 RSPI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Dec 2025 at 17:34, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DMA support for RSPI channels.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -705,6 +705,8 @@ rspi0: spi@12800000 {
>                         clock-names = "pclk", "pclk_sfr", "tclk";
>                         resets = <&cpg 0x7b>, <&cpg 0x7c>;
>                         reset-names = "presetn", "tresetn";
> +                       dmas = <&dmac0 0x448c>, <&dmac0 0x448d>;
> +                       dma-names = "rx", "tx";

RZ/V2N does not seem to have restrictions about which DMA controllers
can be used by which SPI instance.  Hence shouldn't these point to
all five DMA controllers?

    dmas = <&dmac0 0x448c>, <&dmac0 0x448d>,
           <&dmac1 0x448c>, <&dmac1 0x448d>,
           <&dmac2 0x448c>, <&dmac2 0x448d>,
           <&dmac3 0x448c>, <&dmac3 0x448d>,
           <&dmac4 0x448c>, <&dmac4 0x448d>;
    dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
                "rx", "tx", "rx", "tx";

Note that this requires updating the DT bindings, as they currently
restrict dma to two entries.

The actual DMA specifier values are OK, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

