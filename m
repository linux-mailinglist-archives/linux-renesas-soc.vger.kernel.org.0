Return-Path: <linux-renesas-soc+bounces-25163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCFCC898EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3153ADDCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86CF324B33;
	Wed, 26 Nov 2025 11:38:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F93246FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157130; cv=none; b=AGurt/aMgInE0HxdmGtg7c7GG4U5AkPlDEpgtHX1dOeUKoJLi1fRalKDt3DUuJtFMha2Y/SEvRtfG1P2jSHBMqvCYMonX3GKHcKlfNItYGSaR6Zd7MJz6FoymbLSd5Orka6geSfJL55wIZwil8cuieI5uIWw8OiQSH/vnMXanjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157130; c=relaxed/simple;
	bh=6vXU8XpgJra2p/A0mAz7uHu58fBrCRCKvus9KzogLac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ipn5GJB1UOz8BTOXlF48MuMjm+krbfRpi0ABQxI2wH9W8F7HEZgJnVWveqDNnTN0vO9xlfH1sxYXow0hoZJXxp7WOaVMmrPn2pKvwxqyGsxxBLwgC2llkGoHc/U1wGr3SQQ3BVKpDug+E7DvZwOQaeWgVdqjMIBDhYP1vnhXsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b26332196so1743101e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157122; x=1764761922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPs+Pvsscvl4vbT5PrYvt5m/TvwButtAFGURqG2jLmo=;
        b=Ahw6CXOgqqVYE1rvlS5V6j0hUYnxvzaOHfyJ9Z9DOscIoHe4JXUURVblrXbpyy2aGz
         OLLrntfzuwl0cyUmDFGARMNiwwTmd7gxHC/J1xELIYX9MU/UCsc3zSrshairY5+9e0bi
         jRdhBZsy1BVfa6MCXe+i/OGP8YD7E8o5ff5Kc6r8rGoq9yMaQ703EqgQGqD4H7wGjp+O
         AsYx+y5XoO8blj99EYiPZKJ65WfPUt4ag+r6rZYxu+BwwgtrAVkRQXTUBNTIfqtlEvsa
         IdBwkAe0F1bVPS4b88gE3fkVIKYanVlzhcTSyA3bmEtNhvwC9pWkMBQIxGEziJX7RVMZ
         Kdvw==
X-Forwarded-Encrypted: i=1; AJvYcCUkbzr4bdg5rRqGpBd7Rm+aLtHJO/KXpHxuHqKQdilKSHcVX156P+Pq+v59xdz+IL0gsiL7rk6XOLWR9c1CXnkWtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEuBpA0Y0P7ZHwBQm06C+aME+9i1lts4Wf7i0GST2wnOPVYnCr
	vYS1mSQroGTecYsgdm52CfDfjI8z8PO1CNYkv0zCye1WQ3SurBURPxxV/6yTxFfi
X-Gm-Gg: ASbGncsgC9Fqs+qTjGsd2FUopHHhbVscufWJUB2MM9Bp9acmNXw90MsBqn1mPpg+3EG
	/VPYVlwzKK7hIW3Z/uEuChG50YpLcsbl4iM+AQRHjchQjSwhHzXOUr6N+GfOX5e3OkzsqJKulMK
	3YNt00siGeSaypc2MJhq/hu0dbHrstB/dZ7kq9BlDB7pklaX3HC8YSRN3yEppOuUYLBlvE0+wWt
	yxQXIhDs/6oSNLU2wr45NLAX44ohVkvw/g1CelPT+KK3MaMDVyRlisXpmwVGeidFkrAkZLslZdr
	tHPNGT5cGluh5G5py1PqK/ImJ/k2gwYwvdmsCdeyGjzSs1Hg/4rXa7LNYuP0+4VZ/qr+oUiOZ19
	LfmR27TgHPRiG2bA3hvvLG4BbTY8IOMDKMIRNyFVHj6w3cL/o0hIasWYdpkXkc6lhdQlkHDtR/M
	yaAlJJa3KsYXuErYbC51hxiD9iff7i2Ei+Gn7KOL5RS7LylPEY
X-Google-Smtp-Source: AGHT+IFLjNpASvAOuo0GalaFrJObTBa1hEnsr6NzQJphWKGrH/v2fACKxM1K79RvZB3cPcbf/4/D7w==
X-Received: by 2002:a05:6122:904:b0:559:64fe:7d37 with SMTP id 71dfb90a1353d-55b8d6dd36fmr6119553e0c.7.1764157122462;
        Wed, 26 Nov 2025 03:38:42 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7d256bsm8029116e0c.20.2025.11.26.03.38.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:38:41 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93c6628c266so1651744241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:38:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAz+gAj3W2euQyD92eSQbmkPCkEJlvZEpLg3Jbf/tkjcBD25MzfJzOpDO3+aAfzK4FX/11O6v49Vw7t7ZhuponAA==@vger.kernel.org
X-Received: by 2002:a05:6102:38cd:b0:5dd:c545:9ddc with SMTP id
 ada2fe7eead31-5e1de374e36mr6204808137.37.1764157120891; Wed, 26 Nov 2025
 03:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 12:38:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com>
X-Gm-Features: AWmQ_blOpWFtldK0K7YO1Ee1EikL9Htm5FAvVFMl7KnZuWbZjrq2LybKioyiZEw
Message-ID: <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 25 Nov 2025 at 22:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the RSPI controller on the Renesas RZ/V2N SoC. The block is
> compatible with the RSPI implementation found on the RZ/V2H(P) family.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: renesas,r9a09g056-rspi # RZ/V2N
> +          - const: renesas,r9a09g057-rspi

I am a bit intrigued too read that the initial value of the SPI
Transfer FIFO Status Register indicates 4 empty stages on RZ/V2H,
and 16 on RZ/V2N, while both variants have a 16-stage FIFO...

>        - enum:

Please don't bury the enum between two items.  Put it at either the
top or the bottom of the oneOf list.

>            - renesas,r9a09g057-rspi # RZ/V2H(P)
>            - renesas,r9a09g077-rspi # RZ/T2H

For the content added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

