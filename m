Return-Path: <linux-renesas-soc+bounces-21246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AAB4199B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E823A64D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399662EFD86;
	Wed,  3 Sep 2025 09:09:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC42223DCE;
	Wed,  3 Sep 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756890577; cv=none; b=ksgTJ2xkOrwy2XjGfrqV1Ay1b3+gQTPCKuMol7m6kSSqQ4WbM0iKAXlkBy6XwIA04gnEeq9qXYRH9nkqK3Jq1Hy63dN3mw7rj+2YthY6I+HYAkYSlWGt8w3mCVH4KR6FKDtDNF/NMrnp0NFcdHuo34NNewxhUh4Ovt/KYfHvmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756890577; c=relaxed/simple;
	bh=JG3kU4+IKhOimswTwjTS5/L31x/mRfFyh3IRcpw1f1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4jm95162Z3OZufoNmXDhRGrwDDxxQi+H9LdSpnmH8En8tZy8tzfQHeKCh0hea37Rqv9HK1eSHQrxwxRaXWyEaeeBtJitLNJ7PGT6Z9zJKcFST8WUtPtBmLm2x9o14yL2rPP2oEXTzkE3ag+CCzPo1jK+EOgDPpp20zQBXI/okc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-895fc1c8f05so2286497241.3;
        Wed, 03 Sep 2025 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890574; x=1757495374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj9gesqCWEZX1N1hZgTvpmSqcv2Iw8bLBhaQ9r1RKbk=;
        b=ZyV2MsJBKAkAyfBdpRGU0l/Ep72oQXoBQLmYFhgrC/WAPIVRYYM37EY6IN8s4xxJ0S
         1T/sTocUKwmV8U8CTkxyXMzHtqaYO43HclQF6nKCXQJEuIyiECuBJdbpcYQbRS+62vfA
         NIVUj4AOTPtUuXBPcUSTFWfyDtJPxgRGEGKfEgmGBFTM/M1DuoDUyF1997QGCygCu0DY
         Rs6RwrxE883wX2m+66njc8qf0H1UT5cPZk36Y3xkzL3eXbBD1cy/tf/MNFSLydPneRkd
         tlRmerUVcRCqWFPtzIY8wy6Y7qdSWAt1q5HMqVIpa6yi7F3Z7cMoznds7h4uCif7bsI2
         0FWA==
X-Forwarded-Encrypted: i=1; AJvYcCVc6MBbmeyI8uDvKpa+YwuL8bp48fJyGzATb7FZOsZs7GglmpCyDvtIjy2+OrJbrKqiWG68znAZ@vger.kernel.org, AJvYcCWo6K4GEYpMI0Mjl8J8b63ELU8r/9t9d8ilzoXmTxfyIS+uOSuGNqKwjEdzTf6p+vBVE79R5sxx5YMbu7hh@vger.kernel.org, AJvYcCWwzgfhljFPnDCHx88F+EvjsLNEsSn2/uciSnKSE1qMVpVqF3dlOBUfsM0wMW1CGyAh4DFCSODX9e4m@vger.kernel.org, AJvYcCXqa3nbrp7Jr/vXFDzOzfxPwUYvdmSUNSzEqVQ+DMRQHuiGPJiD8sJrNcZs8+2uj7UY74/ZPpV0aILtGxzqm6FXacQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IVfDyx9FYoXIZh7/fr+fPvihbHtoT095DC5oZCwv253GHBaH
	rW8P0ynHmDBaZiXpFxoG3DaZSnrhP2JoVAozZCAi+QuwhKhnIvJRavuMJcwLdBtE
X-Gm-Gg: ASbGnctHorCvdPJTIf0y7iEUUBfudsQrvB27OjFb2NzCVaZCEq48m/x9UDvtWUebBEK
	W8uXnqQIayCBtJBzbjKK7wArnGzVmWL3sqmYXwmCMxwMVt0oFxzYZKP+Y+rmLOddnjHLFNUNSUv
	oWgjLs+iVn94i8Xf4vATo8mZE5dz2NdllE4EihZcJxZQczShg/4EA4jGVEmMcCwk6Z7D1Irt6TP
	lXUp9VxHvS5cMX+S9LpwMozCXfcql5wZitr1SBMaXTBZocnHiFg7vYz1u+js08QQpR/MKssKmxf
	dRyGhDpWxe1rX5fBmOGS6oAQS8hk8jGdXOmtMGSVG0VlTOU4LaUTXtfYljKQRsSUgzfxQWaS0Tf
	8hrEp+xrJVTxQFtBhMbglPMj9sg1QdGReYJ11CIrkW/jHhm8rUGoyDiNbzNrWY4HlFA10zJk=
X-Google-Smtp-Source: AGHT+IGRVMbUsk9ZqVbooWta6KzBj6dA9KPYDQKwxh6UCti7AU/1R8vw0+D7CeAFEWuaR8GByFGHWQ==
X-Received: by 2002:a05:6102:6897:b0:527:4113:6aef with SMTP id ada2fe7eead31-52b1ba1ac44mr5595055137.17.1756890574341;
        Wed, 03 Sep 2025 02:09:34 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89607330273sm3302672241.18.2025.09.03.02.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-531fe8d4619so621408137.2;
        Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhIrSJ8Ckyo0dh+yDimegcT9BJxpcL9KTpy7lJ/atYjT1tNwN7wghibXdIrNJeWgdR3ZCNh1VVJmhn@vger.kernel.org, AJvYcCVlnLIuEfMYc/cZjv8K96CIYBPZB+zkRiLHH8fldS+4e42NAgdZjR7TVgAGjotjoQDBcWHbb2oaKRK7NUbD@vger.kernel.org, AJvYcCVmTeQOqv7c+e/qRrKul9AhPbXOYX1FhGK8XfGGpg5mUXkU/9rwWmecrXe2WS86kI2cNF0jvu/Dkyytd7EvP02UzCg=@vger.kernel.org, AJvYcCW2qyXGxPvEbK5gRzxB40/VR5xIM51VRWeGDqaM5TrLW576BO6W9OF984IA3dOyWqVTMcj+JvEy@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4553436137.31.1756890572867; Wed, 03 Sep 2025
 02:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
X-Gm-Features: Ac12FXxX9lgyaKAr8UpWw-SXRvkRdNef9IMOHkwD6ZbZ-DdxK6PzWj_7-XFm7Aw
Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Tue, 2 Sept 2025 at 02:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> identical to that found on the RZ/T2H SoC.
>
> While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> DesignWare MAC (version 5.20), the hardware is synthesized with different
> options compared to the RZ/V2H(P):
>   - RZ/T2H requires only 3 clocks instead of 7
>   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
>   - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
>     unnamed reset
>   - RZ/T2H has the split header feature enabled, while it is disabled on
>     RZ/V2H(P)
>
> To accommodate these differences, introduce a new generic compatible
> string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> RZ/N2H SoCs.

Until now, we didn't have any family-specific "renesas,rzt2h-*"
compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
as a fallback for "renesas,r9a09g087-<foo>".
Is there any good reason to start deviating from this?

> The DT schema is updated to validate the clocks, resets, reset-names,
> interrupts, and interrupt-names properties accordingly. Also extend
> `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

