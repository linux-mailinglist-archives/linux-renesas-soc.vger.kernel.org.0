Return-Path: <linux-renesas-soc+bounces-20618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE6B2A272
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7180622B67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194831E109;
	Mon, 18 Aug 2025 12:54:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5B31E0F8;
	Mon, 18 Aug 2025 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521660; cv=none; b=SLSMSsD1lzrSIYD/Fngz/UETAZM++qjEfyQrb0aR9R43/WbifUNgcSoCfmgY1PwAf+Rt2/pX1LnWvqEIA7FyXVd4p9nu4Jn3mBiZijt+EplETCeuB6ya83/ckVa6e3AH3jg8Kz/e5B2/kZ4LMuhsTtEJQPTgjSypK1w8J5sUoT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521660; c=relaxed/simple;
	bh=rOwjQJ3QPErja8EBRr158jnGld3jFwTnuhBgPtp1H28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqzhqqX8hEjtcDrPFKpTZKQxOAue1GgoCZPYvcCSq+Y1E0gv2xGg9Vh+t2gZYkTS6Ns7jzcUvAwgXOyE2BL4ICROYi8IYLSFkqIhOb82aMSSnUShFq7u6oliEVY82kYJBcWwiKMkeTmh+8Wn2HzetYqLjl6OLAq/8xTfVr78gf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53b1717c562so2775954e0c.0;
        Mon, 18 Aug 2025 05:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521657; x=1756126457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeHyZrf37i4a3VsBmcY4eDL9GMiORFpnEXWLMfz4GOk=;
        b=u+72pO5wnmAgTP4dhUkXLVgJc8G8ND8CF39wThQFy4uzALfZ6NAdRw39YWJBMLMMxu
         bgs3QUU6SZXtdlzAAOD8EMHUrnVpjLha0fkxnV7FHUrk93F3/O7eQ/9B7ilVz+5bW8cd
         Zoi1jhBIfNoef5dMHqWcuKUDRM4IQc67zmSwVidwwnqT3/nXBzxehCV/8xqje4zBnPbc
         FQKxtVKIrOV/t9oY7d/pvu1hAlC0Xvt+1+5Ug8M0efKMiKLbucrgrGTi7Wqi/8jSEhuP
         1UvCo/zdCOCH0kJTdhNs43+9esawzl/ipIRkFFSycWhUA0oWIGO5vafXFLG+kSSFT3Dj
         WYkw==
X-Forwarded-Encrypted: i=1; AJvYcCUtZvjYOfCsAOFZaaS2i734r3GMBpFKUmSiiIkYk5w1kb0Qj0RqR/i5y+zOYUzkfT3+Gs+QoX5VNaLBywf2@vger.kernel.org, AJvYcCVeIgKSRZVrqyc94o6/SCt5KVnerdqlTBCfXhJrNNHfICbnfvSOJByQrumXrwG9nQtWaN/xxH7yOhFM@vger.kernel.org, AJvYcCWNM/h6IHYiEsh7BR4woAT+RPMpYjIsrowFlTZlvSq0X7n+0npXp99mvpISVSduSZAY+P1DCafMuXxlLak1xO2gOfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60UC2i4VSE2M5a0zq4UN54FuRu8ZkPQzV5DXTFjuUkUeULws1
	BeFqCyIL+RG8YQyuGfcUdWkX7R0n4yuLL1brvfB5LuLtQeuRQzeegDWpx22yxCP5
X-Gm-Gg: ASbGnctpq8brWADC61WWq+ydO5V0bbj356hxothqWC71hn8opHc44LeOVSDEXjcxpJ2
	dKKcZNs0tVKbZegoMdsYnKvTYb7lZ2N1gnuApxLTizE3xbqVMbI0RnDVTubz8cYaTl7x/yesYc7
	XC+BRgzHS6C5HS9qm0MuFt6V6mYySym/9pw5NWDvn39p3HcrshiEOdkWQXHGQ0WwllC3/X6bbkU
	8rz4yiwCgBqS3yjpDAEi6lGTtPd7UlkJSaIOwb+H3CZyzHSZwfnoyWMVxUHLItmWbK94L1hUjdL
	NYDTiu9jqhHPEVB5sCOQ4Ob6R+1LNiDoFy0TL1BvfHd31wc31WAd1u8QY4dGQkBBEuyOG7rm59c
	2iSmBOD9piVwzsze2oUToYkpHCxDMdI47uSiRpNB4skasUVLv6IhtFU2srWI9
X-Google-Smtp-Source: AGHT+IFEDkQrGG/WVMFOyuwjo1cAdGB/LSmC9ebuoQhDLRko8jjKaW3D2yMllV4a7+5APtDOymmEgw==
X-Received: by 2002:a05:6122:501a:20b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-53b2b983fb7mr2762077e0c.12.1755521657423;
        Mon, 18 Aug 2025 05:54:17 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2ba75b1esm1972776e0c.0.2025.08.18.05.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:54:17 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-890190b1aabso2524714241.2;
        Mon, 18 Aug 2025 05:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAkbBwqQ/vfkD63XaiseUtodfjHGHsDXDzrhg9uoYwYF2PwZwQKl54YcGLeGBKO51w9owPhuCkVB53@vger.kernel.org, AJvYcCUkR/5TXhex1cpPeJvB1ck0UCMbI3FqteLCDtTPedejEOy3JVSsOyV2Ygd4QO86JI3NcKmDUrZXLeX/t0XwGdr2U3I=@vger.kernel.org, AJvYcCVd539yBZA209z/R0x430G2TAOZjDS7ZOSHZJ5m4DXMQiuBmXSayNfAuSEui6mvYOjLWQ+M4O+Lx+UsN7NU@vger.kernel.org
X-Received: by 2002:a05:6102:3f13:b0:4e9:b60a:441 with SMTP id
 ada2fe7eead31-5126cd38486mr4768016137.13.1755521656759; Mon, 18 Aug 2025
 05:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 14:54:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWadWCCU9m3m24LYqZW_+xS_80RPBtR0tN79vpi=OOzGw@mail.gmail.com>
X-Gm-Features: Ac12FXx6Mua2AKpGUL14EEaX3OQPN3ndNcCkzgcG5PpXAwIiZf6i3f0AjuQJDrk
Message-ID: <CAMuHMdWadWCCU9m3m24LYqZW_+xS_80RPBtR0tN79vpi=OOzGw@mail.gmail.com>
Subject: Re: [PATCH 02/13] arm64: dts: renesas: r9a09g087: Add DT nodes for
 SCI channels 1-5
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/N2H SoC exposes six SCI controllers; sci0 was already present in
> the SoC DTSI. Add the remaining SCI nodes (sci1-sci5).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

