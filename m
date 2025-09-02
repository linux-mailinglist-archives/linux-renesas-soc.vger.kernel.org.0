Return-Path: <linux-renesas-soc+bounces-21202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F6B4067A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 16:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030103B803E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E213302743;
	Tue,  2 Sep 2025 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W16qivub"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87574305E04;
	Tue,  2 Sep 2025 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822785; cv=none; b=CFH0uMvFJSf5jHgMHR4Tgxn7M5Os6a39elHtutYBIkxqusUayHv1FAg2y4Gk6IIg3LFSFJ1EAIvn7JRpRDHvKuoHeJ3kk0Yhdz6KruehSl08jL8/nqkor8JtQXN/h7khn0tn4uDCj1GKfr1Dzb0IK79AZtXf4J8IX4VFc7HvsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822785; c=relaxed/simple;
	bh=cKittXnQFm9HgXD3AmyGM99Tj/ZL60OZ7IaIGVEIRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5icpr7ZNpUi8RmQ0B0O0TOvQP+x+fSabKDF8JtlLdPjmEx3zSkn2EOBfVaHwHhYLvEyYzr0NvLw/2XRyn90/Ydt9hm9tcfCWIps27W/QurxeiAkn1csPMPa8++2ebLg5VgD3zhY8o1qITUNORBscvkj70crfL7dhGO2WfdQZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W16qivub; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0411b83aafso412500766b.1;
        Tue, 02 Sep 2025 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756822782; x=1757427582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7PwLZpdNDUC1VnlOAO9Pz/59D4P6tjjZBVB+LA8u3s=;
        b=W16qivubj2uGrczY+SSnKq5wGDyidSG+M/ivfzvGYxP+AokEWrHkYD579u0E+p3RMl
         QAI8hqPGCCHR4vXfhTtwl399IM3wquPipBEHg8RSPFMXPV1aCN4ku/rrfPm9MFmXVrso
         KVznmuVasqwqLXtbG4zema/MjUeTYA2CvPPSFTNXMfF8Te3QHeRMEIgjo7FGepcneYqE
         TvBhUxqApjbQGHIQ62D/+YANP95VdjlzMtN4JteA/6VYjtQTEriKb9AJQEcWMyt/k7GL
         PMOYB0YEp31Bvqi4G7vqI97yjNrbyeCWbpvY9HIm+/A7BhEwE7We+q/B97GpxGNgGdFs
         es+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822782; x=1757427582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7PwLZpdNDUC1VnlOAO9Pz/59D4P6tjjZBVB+LA8u3s=;
        b=bfnQ2Oqu786E0HogxJcB/PwCEEAv8u9ZDYEBBiWUiEOGeCs/SIHJpg4KTiXi46JJl7
         /wmw1q2/W1ZBswbd5h+u1RTrVqFGZnf+CoFmIyKBzkbMx2sBvDZGAcm25rWhA/YJRB/z
         SN6qqPcoOFa/Q2nBrD1qYiGVqPuqFFxUsHhvdu1htH1+0eSPShyqWDM1OzlNUfebtl2w
         aUjgEeYx0yFT5AkHI4EQa/L6ep3McIcsvNdUkgPBMjWoPWBR3HbVrbLFb6CrrvuQh6xA
         PGxDDGIgbIIS4YodG4/UMN3M+f7xYKr0JdCx+Y6eMKg96gD5+gRcj7qyY0wFEfNJZLmq
         xSZg==
X-Forwarded-Encrypted: i=1; AJvYcCU96/eKU+fGF6wuorCqbzZ8n8/e9AQLrlnEPSuAVAV0BefYsBA7romm9HNwhZCqM7iA5kAgKl3C@vger.kernel.org, AJvYcCUNiScQGX5rMsnvrClbZ5ndg/fCvEFsLMAtaOhQ4VeA8ZKbEkw2P2ervSuynN6Q0ezRRLdjkZ+Bbwe8cik7@vger.kernel.org, AJvYcCVbVC1J59wdrAxfdxH0tugnHLDMpnfgGcfCUPpnwOg97NaoV0rmns13NsFT5fg4NhK3lfJ8fxDzGLN9TUZCtwvsb4s=@vger.kernel.org, AJvYcCW3orhn8k9knIN6UubNhBmhDrPCEHP1cBTFv5pxBIfJQYvPEQv3lb4tTZJMoDXMw9+3ecCCprGzY5ZF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZxSs1Q/mgrTnL7Mvvyva1/cgF2LT1ZOL86AqywpuST+EfIq6
	Z8nd8HvNOPps+KY9LMiPUuhyaDTgCPTrbHaOUXPDWVni3n5L3FPcSQ7NeEGMAXcphQ5x49cl5uI
	ATeVbnaLhT8rN0++G/FqDhJCKFLHRWqU=
X-Gm-Gg: ASbGncsDdW76lA22f5Gg1m5rCtnRUJu+3gxs8qG3X2FPayCndOReONLq+gPVfNfaoDI
	8eZlruEV5wu1oP0JeAfCw/IOOK2O/q6Em/DiRbb7BuUjjpzjaLQILLhjcDmFH4qQLKI7RAI8ThR
	ZdCXZHvQW4kNjQU6s9/zFLxu5dJQdnC68iUuWrXFd/0CeHL5+aN/FfyOyFaG0h0A1dqHRIACTOd
	kvSPci5xsdKWlo4KjbwWrsgcp6Zt04VPIs3xuMMleCYd3nP/cQ=
X-Google-Smtp-Source: AGHT+IGrboGfKgTi+NH84TUA1B3uD5e0lPBqZ3DmRhCqCMFGcoWKrI1dg8Km/+cUzqCDrl6XWcKCCLy0LJj/iOhSDwU=
X-Received: by 2002:a17:907:3d0c:b0:afe:c099:aea8 with SMTP id
 a640c23a62f3a-b01d8a266abmr1111765066b.9.1756822781645; Tue, 02 Sep 2025
 07:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902-enlightened-hidden-copperhead-4eefdf@kuoka> <CA+V-a8sSiNQ6W-ggmL8PP_G1sFq170DS1LJLFJs_WW0RC+XVEw@mail.gmail.com>
 <5ec3efce-653c-46c5-977f-5a46391e675f@kernel.org>
In-Reply-To: <5ec3efce-653c-46c5-977f-5a46391e675f@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 15:19:14 +0100
X-Gm-Features: Ac12FXyk3vuxA97T31qPqwWJO_EeAZlrRjZHxzovyZOhR_qt_-3LfD3odd8Qv_g
Message-ID: <CA+V-a8uQ44AXYoGuPtioKC7wObdz7vQHYniJyD=MRdW8vomqQQ@mail.gmail.com>
Subject: Re: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Sep 2, 2025 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/09/2025 14:17, Lad, Prabhakar wrote:
> >>>    power-domains:
> >>>      maxItems: 1
> >>> @@ -60,11 +77,11 @@ patternProperties:
> >>>      properties:
> >>>        reg:
> >>>          description: MII Converter port number.
> >>> -        enum: [1, 2, 3, 4, 5]
> >>
> >> Why?
> >>
> > If I keep this here and just adjust the below for RZ/T2H case I do get =
errors:
> >
> > reg:
> >   enum: [0, 1, 2, 3]
> >
> >
> > arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: ethss@80110000
> > (renesas,r9a09g077-miic): mii-conv@0:reg:0:0: 0 is not one of [1, 2,
> > 3, 4, 5]
> >     from schema $id:
> > http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
> >
> > Any pointers on how to handle this case?
>
> So please grow this with '0' to cover the widest choices, which you then
> narrow in individual if:then:.
>
Got you, thank you for the clarification.

> The trouble with your if:then: is that they are huge and they also nest
> patterns and if:then:.
>
> This often is less maintainable, so maybe you should consider having two
> separate binding files? You can have also common-shared properties.
> Anyway, I am fine with current approach of one binding as well, so up to
> you folks.
>
Ok, I will stay with the current approach.

Cheers,
Prabhakar

