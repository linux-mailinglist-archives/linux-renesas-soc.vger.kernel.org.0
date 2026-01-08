Return-Path: <linux-renesas-soc+bounces-26462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC902D05885
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 19:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CBB63061554
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 18:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AB92F25F4;
	Thu,  8 Jan 2026 18:08:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD5C2EA15C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895702; cv=none; b=Qu8d5YLC9EeLTKl3H8bv41+VNtKDyI5xp5sUWz5LDueJ0xwvOuFXD2o4m2dIgON3jRmMOsipxbfvy7AgevLcDqxGTvBdTu9HJd5EUQ8ACX0jTvUJeoGQNNfZ2habo+3gQ3zPYrP4kn98vpYT1AK+q2wO9AsyEcA2C7/2ssCNdD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895702; c=relaxed/simple;
	bh=2xO+ZHQ5A8qFLt3P8aROWKAmWa7cUbLqr/lnbgCw24c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRSIjTFdmRiPC9bdqwi1XK8kWWGh0jcjrScJnPcYur+2uPcKC0PYCYHD9MNyz5iLioy6P1pYJrOgC6jcfsncbau1UUIFQcabh6plTFTnMbPGN8nNyu80PR92gjA2yXzQoI7W2zEmIzT0qwESJtLGRMYQl3PczBtjj3onsTnktSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56021f047d6so1120508e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895698; x=1768500498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfFjVTiVA/VL3JBWaNXNVyzJkm9nYhmIUTtZUIKm46g=;
        b=iJxE+dz5wsMtJgJ0sTncTGfI+pELo4CUiCVic+97zqQ8b6SlVE6D3vAcOx7lvslP7m
         ZUhRiXTyEd6bSFTaLhTdeB5mkvV7KIhm2uhpGi9OBOGgKTr6KNJOyCWwVIz51PyPVsH5
         WbwW18mm6UbyQ8xhzh6v3nzGomc9qs1qjq6opuB8lfLNdZXxjxAnokie1A6h1kvfDjxF
         LUeHKPbprrLbIkLAAMujobR5BxeJ/EbxAgL6vuSzVHBp5buAPoD5FDNg1xxZKWf+ro3n
         TXmGw72K3VaxMnpcGRDhA32R9A8RbGM4d/1G2FJsBslT3DfOfElchMKp4RTABJpTcZZ9
         +jLg==
X-Forwarded-Encrypted: i=1; AJvYcCUI/qAEUvDr+8u8PWaTunbaOec+MqxXBUt8rbzHijwu5pM3tJm5rNs1SoFx7NXPtuDTKBHylyrQnfQlGonevKo+Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmdry1erLekBhvhL7AbM6G/lfYZh0xG6lIKPiMsZfWXnAKspyc
	CEuolj3DMk1pXfETEZMuBphRDMBbePk513aWSfzYnCFF9Q4NJsvy4M3YcAOrR14H
X-Gm-Gg: AY/fxX71OVN5WjqVLtD0QuRZDvEIcRgzDWlCn42EkWIK6+9hMoyMtG7Rta/i3f2RmPQ
	+/M/uaHB3cG1MxFpNgDFhIbpLfEwMRi0fbB5CqOWWG2dXYAtSYQWca1hgk5VmyLCYWm5fMboZIe
	g9jhmC8ebdBe56Oe41FlwKeOM0eYF2ERk8JaBZORrV05LZH2h1HmavXoVKIiwntV3PCjBBiIb/1
	x+gz1Hqo3dZdWkzX0R51NATM/3xw8V2q9bTDcV3lBKuBmqNIIsUatG0bNb13K7aMTLdIL8kdfEJ
	uVGX7hPtQf91w0nIfBXAu89jEF8Mz779Pq+Y63sGopsAlB8+fCZ5E2R0xbapemHoKfJjlgJp3kU
	OQf08IvJ8JWvFGZxRnVzlf6bcWSaogqxzu7C24iQZ6lQPDCLz5tvTadkYeA4JUhxGbvYvL39fas
	kVhchbJrNWUpx7t4ZJTdqJ00rEBSuOMg6FEUMKGgEPAoApoir8
X-Google-Smtp-Source: AGHT+IF5wVORmTMPWBwRSkKZbCg2aGhembRjP410E1gu2pWn6HZV2jedhrriwtmiH49zDPHgsNhdDg==
X-Received: by 2002:a05:6122:21a6:b0:55f:c975:bd9 with SMTP id 71dfb90a1353d-56347d8366cmr2096453e0c.8.1767895697575;
        Thu, 08 Jan 2026 10:08:17 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a443e32sm6967618e0c.22.2026.01.08.10.08.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:08:16 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f542917eeso1120038241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:08:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdS3+vugOxcEur6OaWGuMSUJVX7vV6JddlGwS0ax2IBD0ULAHYl16jpH2hO/F0Ti4OMBdzQtohjM9LqK7W7HZjiQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6f07:b0:5ed:c98:37f1 with SMTP id
 ada2fe7eead31-5ed0c983b52mr1804827137.1.1767895696438; Thu, 08 Jan 2026
 10:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 19:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
X-Gm-Features: AQt7F2oZ7EpOfRC5VK28dLvBYQp2AsKz2b03nI7P4C3otujbnCexl7cMnsmNYpA
Message-ID: <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
> GPIOs that can be used as input keys.
>
> Add support for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -7,6 +7,8 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/input/input.h>
> +
>  #include "r9a09g077m44.dtsi"
>
>  /*
> @@ -60,6 +62,37 @@ / {
>         model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
>         compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
>
> +       keys {
> +               compatible = "gpio-keys";
> +
> +#if (!SD1_MICRO_SD)
> +               /* SW2-3: ON */

Shouldn't that be OFF?

> +               key-1 {
> +                       interrupts-extended = <&pinctrl RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code = <KEY_1>;
> +                       label = "SW9";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +#endif

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

