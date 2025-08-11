Return-Path: <linux-renesas-soc+bounces-20360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE65B210C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 18:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725EC3E5DB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866412D6E68;
	Mon, 11 Aug 2025 15:34:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6162D6E5B;
	Mon, 11 Aug 2025 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926464; cv=none; b=Tpo7qo4T72SoVD7RRZHiW0y2qUmsAZmw8Q9uFMbXKcn3+LgWRJfuRlAUpzdJZZCHwCFv8Sl2QBbvQjahkv5SFUws2RJa+CClQOwqMZsnX3LCuArA0WlX6073PRfx5hG4Mt1QrWrnPiMUlacRrUyOyeQh+3A4hLd9QJz2u6tYU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926464; c=relaxed/simple;
	bh=NEifx9UsGMLIJlvmMLlUhH/GVVnIGYM8lpRK2SSS9UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdU0gCU6nUIV6GUnckGK9g/jpty+7svlQOS2k0wdL0KndOa2WX/vxn6L5gjPBimuZtYMPKABAtksdodb4m06eoW/k7PslqRr1DGHJ8k9O3fjC2bdaanvWKreKqwD8rDw4Pa2gz3tRQlv8gn/uyU8JrumuI63aWBXVXjqT+Un/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5392c221192so1666808e0c.2;
        Mon, 11 Aug 2025 08:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926461; x=1755531261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiCIGep3OKmYTJ9C605oTGwbVNaKhGVdOfcXDWqwWBI=;
        b=LWlr9uZ6XQKcQOBMnnUJK+5vckmrcdQ552C632dTuF//g4oQ7Pip3bUKGIw5eBPGnM
         vE+VXeQu+wBuzRhbHz6NPy2SBacdvTGVz6DitETrdzq4ShSnGvIU+tLeaV0ENq8DnrWl
         kxre5xRabbW8k4tgQN+cstErFsGSQnI/ngysSBou8vsQEYrwZJAMNro8IAWwj5TAFUqN
         pS7D31fiJqVbMazAcxR9viYxX6UNpOQ7A/u3hQwFgi5BKGWf7BNqooU3mP9dBrygbYHQ
         82zJF/mGBiBix2pUC5Utjt7Aw0tuFF7NzOrifM3Wg6a13433Gr/ae/Ph5fRIKyOsiUMn
         IYew==
X-Forwarded-Encrypted: i=1; AJvYcCW6xqZe+6rllJg+EWBLq0mJwOs5O0SD6CrxOTFJHTe9rGkMMzKHx9VC0dzhcKnWXIB5n/mdEFHvz9cg8FDSh+D4QNs=@vger.kernel.org, AJvYcCXw8lLoD2Ay9hA3RNPRWE9LkFCsC7kNc0mL5iDz5wQayh4TsyESdKNLxebz+6EoVVjIm8GUi2L76BmE@vger.kernel.org, AJvYcCXwjr7bzKGoVD/ixUu1yV+lbr1JLZDk5NtRHdpWrnYU9FgowOZP1NNYU82AE15d1sf9XKvWQKyNa8D+rt5N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Q5Vpk0EZdy3dfZR9pa7g2vbwN5ob6V62EgdpCzqTBkZSyFN+
	9l0x7RPba9IY3nmXtjgKH0YDGnfSecJnkRCqFwYWUU8TzwOUXtG6NgRVaHbiuuyy
X-Gm-Gg: ASbGncshB25/7AhkXJood2gnJHPuav7+OWiGs/l1OwwsrlVX6nimNIiqLbA4CPT90wQ
	RFRKOQhs49RYOHEZ2XtfuIh+uAU7a1CiYsxE0HT8Ihc2iBKCzBL06jqGDkRJAdgulAVzeVnpiGP
	NI26Eag95WYWur7uiMv20Xz4DLpg7FIPEoX2ytNvVe54YjmiYn3F9GACVSDQD8MskPnbDwgS5sk
	6/bBSBI0bcjrab3SuEwPhlxjYdvrZHGBuXsRbYRw4DazFYo+RGv/xTeNNXzCAFm08y0rCU43ZFx
	peAXFQ7lbR4g/4BpuT30CyYmJR5J6tQx1emsEz6hUIxKf2haD6B/KwtCLgBI1X1BX21GFGx7ww+
	s9KG3PTcjXwnusiJSMoPxD//ARvkBjsRUjD6c/zmiw8YGW7up5DPyYP4piUUM
X-Google-Smtp-Source: AGHT+IGZ/hiYfNzUgCCU5llFvSyvIybvstYzNpEl8nE+tAUu0WDbkWXHg3zVxLlfsEDTKPCFnDSlaw==
X-Received: by 2002:a05:6122:791:b0:539:3548:389f with SMTP id 71dfb90a1353d-53a52edd34fmr4735347e0c.11.1754926461498;
        Mon, 11 Aug 2025 08:34:21 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b029fe36sm2780858e0c.24.2025.08.11.08.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 08:34:21 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5006f7e71aeso1444474137.1;
        Mon, 11 Aug 2025 08:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPIl9QzFLjzKodbj3Xq/2WrKnUrwBJTp5NpA/YYBnSx4Bp0pdeZsELzrDojJSzlnBy5jffXwjtnW3BU9AW@vger.kernel.org, AJvYcCVIDketFQklC+kGyanD4PVvASlRsuHQU61mFvHihN+eBG44oxnALZMYQaWwWXzvGoHfjDXmWXfuF+0R@vger.kernel.org, AJvYcCVPs4oeC/90eLGcdt9MoO7Zo7JDW0lL3RRa7VawBrbIo+k0M+UeexPMEX0qbrsFxQJ5CXvaNFcJ2058XZHk2haUxiE=@vger.kernel.org
X-Received: by 2002:a05:6102:c94:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-5060eae4dacmr4769533137.15.1754926460854; Mon, 11 Aug 2025
 08:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250707153533.287832-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250707153533.287832-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 17:34:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUc4DrU2ATT4hv0fq_aKen-h1_zS2qf8WmAfmwAKqUZKA@mail.gmail.com>
X-Gm-Features: Ac12FXwAO2U17UF2ZOTqvsTeHYdpNqxNr5eBZkQ0Shw8vBnHjhYeMDFBOcEDOLs
Message-ID: <CAMuHMdUc4DrU2ATT4hv0fq_aKen-h1_zS2qf8WmAfmwAKqUZKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g077: Add SDHI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 17:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Added "Reviewed-by" tag for patch 2/4 and 3/4.

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

