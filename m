Return-Path: <linux-renesas-soc+bounces-25159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BEC897D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B7A3A8AA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DF932039E;
	Wed, 26 Nov 2025 11:22:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E0E3054E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156178; cv=none; b=Iftrn5lAmPf5FqbV20oYegGKN7vTUVicct8SHzGrF5e5/CxbOep3dKjqqK1cWX3Mkzt7wrENMLNKF4nXKa6N4cVAvXYZymAxqpXFQ+b4WCO0EOxu5FGaJaocXtNQN8LNwrF+B3sHqb6I3qdQHFLClzzKqhCCOY5iV/MZxgATEok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156178; c=relaxed/simple;
	bh=tEYTMbsYK7ct2Fp0wE54TlfKQsCQQbQ8O0Cva3Vy/6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUNk/lq+kF7v1DhKrXUWNmRuukquzQ9u4yngLFFz76s3kV3xBty1an3R3NDHRmTOVgirRuJGWtYFgPqKtrpL/V2rStNQGh3icygkOCV6DviceEnFFazW8nLhtJugR9rw/EXpwOeOZNDkKO8mHF+OdlLYeJl3LA6cIuJtvf8uyKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b302b8369so4119283e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156174; x=1764760974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8Ls8M39NeOXUwFAsWdHfYPcCU2t+MywIN4mgVtnMyg=;
        b=WoeMzLI1+n/BDXuvASG6V60PXjV/AO3Et2bIKEk9t8CD7RTbITsz1jAI6PgD2y7zIu
         yDGlJHlNyqW8X78MycIa8gglrzBoOoSvxE0PhFIzW46DZomJGO7Wa7j3ZYFyoLUk3qOm
         nxf79mReQUAQJJtGwb3VwZrFsv0lPGs2zwEU9Pzt8cNNlxIyurBH/jEw5mvG3v+FQq+x
         8ZvZaHMIGhPdwfcozVMpVccJ2H/FWO0lnxdzoGxpIfA7xTv4ZS5Nrp8Td9s/WY162s00
         O0jmh90OOeZlrcNbzNcRSRPt6bnSqZ85Dh9WEq9FfgpbZ6IsGO1eS+AGbV4JkHTAWrGx
         TqXw==
X-Forwarded-Encrypted: i=1; AJvYcCWoNCNAPxUkkq0s8DYFLi3lFyAC22f/lcB73N7lsoa5Rfo5Ry6qAN7HvxTKoUtNBBhRooTIZAbZHVQFOVFAz6mzBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvazJA39BuWLrm05IqdX3yhWUTtOnB4drB5+Bl2pTNpyjoK3qz
	JvuSQCMGjO5lxP4sgwUnzScpR8MomyNRxj9ZOBIX6Hr1ft29Qd3bNaI4wEvrVONQ
X-Gm-Gg: ASbGncsdbe3EjXSc1bEHDhkmexIAT/BefwJNWOpPtwmDXCAiP5y7rbv9IG9t0VCsX1t
	uLRtWqgEvXx5FPG1BSadMV0Tz2/99jPnvrFmSwzWbnT51n2y0licIWzqMYsSeA9iSKpfIur8K6K
	IO+L0YWiaaDuBQN59Ntc9SKgGV1FiWsf2tdfyHwL7y5n30xmg5gZT4LwCzFhSTYvSYwldZwiZai
	eG01vT1jnxTPocrRyqqVsvBecFr3W5wiG/y1nuj1d734GEVOuXI3GRWaHH7/6rwvuEMzGdemLNg
	4Nw8In1Ow++F95VVN+MF5mjTkvDOGgqv9+0PGd/B8MH1MbhCVDe3ds7FsSoIKQFMCjv3PTZY61N
	CpLYOSq6/WQYoDI6xsniif7DJlhacqNgSE+CtFEPW+fhNprDZE6TTkVvhwqStHM50Jl+AuIpT2k
	wavulZrOluxV2rkrJ/hNmBUByCErPdj/L3BA5AwPOmbMFlAV4hK+qo
X-Google-Smtp-Source: AGHT+IGPU0LeqeqDwZnIHUu8uLKeEJLPFnUCkg3hng7RGuJ2AOWz2BVtx3bvNLVC+jpL7etmcdr7SQ==
X-Received: by 2002:a05:6122:d8b:b0:55b:f45:1874 with SMTP id 71dfb90a1353d-55cd773b401mr2114495e0c.11.1764156174134;
        Wed, 26 Nov 2025 03:22:54 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f774612sm8774276e0c.14.2025.11.26.03.22.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:22:53 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b09d690dcso2213596e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:22:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUSdeqhih5RXeTy5jW0Rpkj/xx8Qhe0RSXBn9fsuEOAC2yOd4mhoUFM0pZBLCuxafsVDKnjes+DpPxmvbfYoAl/Q==@vger.kernel.org
X-Received: by 2002:a05:6122:9003:b0:55b:305b:51b5 with SMTP id
 71dfb90a1353d-55cd77a507fmr2238874e0c.18.1764156173122; Wed, 26 Nov 2025
 03:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125213202.270673-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125213202.270673-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 12:22:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKQc3kyT5e_juyMfWz64-oPHig840zAt5qrA+X8chYig@mail.gmail.com>
X-Gm-Features: AWmQ_bk0cEiVh2yimBZRbt8jG3N3VDZN3Okz16mggcQlgTn6rxZbjVlj052TfqY
Message-ID: <CAMuHMdXKQc3kyT5e_juyMfWz64-oPHig840zAt5qrA+X8chYig@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: renesas,rzv2h-icu:
 Document RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 25 Nov 2025 at 22:32, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Interrupt Control Unit (ICU) on the Renesas RZ/V2N SoC,
> which is architecturally identical to the ICU used on the RZ/V2H(P)
> SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
> @@ -20,9 +20,14 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a09g047-icu # RZ/G3E
> -      - renesas,r9a09g057-icu # RZ/V2H(P)
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-icu # RZ/G3E
> +              - renesas,r9a09g057-icu # RZ/V2H(P)
> +      - items:
> +          - const: renesas,r9a09g056-icu # RZ/V2N
> +          - const: renesas,r9a09g057-icu

Given ICU on RZ/V2H has lots of extra registers compared to RZ/V2N,
I think it would be better to drop the fallback.

>
>    '#interrupt-cells':
>      description: The first cell is the SPI number of the NMI or the

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

