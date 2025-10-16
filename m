Return-Path: <linux-renesas-soc+bounces-23127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C43BE216F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95847407632
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 08:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D389022423A;
	Thu, 16 Oct 2025 08:05:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A072FE587
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601954; cv=none; b=k4garXer3LH8YKQo6dgwjyRcciESn+fSlv7KuQf2DHCQzIQ3b4plWf4AeN4z7dcUHHyGlDcBGVZzuW6kqHticLNBGbQPn6SAFp6b5cXk1Lv9DOk/xhkA8z8TE3d90zyKW76c87fo08pS6nXNaVc8hA3ItLzI8Ol74yQQ9ggBFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601954; c=relaxed/simple;
	bh=ztVrdpOWpfiqyCWWdSB0SBx90SpUsNbJ6mq/bCQFil0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dibFTLOwEIoNCuZdvpKftIJtwVWWC06CSi8QJZ9B2YAisgVSaBSKpqLQ5briG4HGRnB8TndMosrp5eS6/Dsx1nbbnRc2gEwvmCccqzI5Htaah+9CltpcDBODNEe7BYDaYhnYq2UyMep6ACVMkcAULtW+3TMzYr6gnmnI4K4a/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54a880e2858so321156e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601950; x=1761206750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOaWu67C1VjWzsEPqOzUQCmn+iSXUetMOVFsDVhAcDg=;
        b=ap3lyjOnjnGr78YMwPSx7o/DV2bIVq/Dfhn9sgVufOAXcNJPYkjESxmmaEqbKA2pQe
         dQNIlrq4y97dBvoLud8gjWpMN4PrltrCh7xccQtnpwFPjSAqbGOkfukJvc1T2D6GWtqY
         dqod2uuDOWnldXM9Hj4JoWwBF7EaIxqyuGKEtwiBqRnION+VolBlEodZ1uI8BQZ7DrYN
         ufjoqXk1tCLv8gkQyrCwKsmfKgG0HjcYFy4X6Wg9qILHrS86VpdG8HlgJnVzd63EguyS
         Qvju0zUfYLm0HAhLGIXg+cbKlI16gH+IDpuslsq7i/3Kr0E01QPfbgiTjQHckNy2OBbA
         5T5A==
X-Forwarded-Encrypted: i=1; AJvYcCXQvJ0J5MbBB/Jloef16Rf+8Yqgqi4Z0+n2rUo9aTZy6S0G2XVrsNVlqCfUwdTNa3DRHkam6zh6+Yu9gN20cJ3jcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZlEi1VxVQU/KPsNA68R9b5zhVECRXKm3K9LGBKB5nt2ZveNG
	vKOwDRaKUvCaoIU5vOTt/YnlnYvdQtm+LfFuGXZPeL1/d2LFQAewGsXB41cptM+r
X-Gm-Gg: ASbGncv/TgvSyNU5fQmXwYAtcbJ1XXHhb8CqHhm/J+w/xoJ9zs9zaFDHYasrQ6VavrT
	0WmsDsZkcX8aU5j7PMrMsWCv/IZEFnfohgS4YxMSraxBKDYijk2bjSTdhWQEQn0W7NgGQbc6ITo
	qSRUXfiNOPwOSNgZeKq69TO8DmVsUYj0EQXUzMQfuPgmd928+uUBIKOizeFUxs58Ji2ihLXZ2pq
	v1ypQGdDVveBfp3lW2ujKrTMhSmDaa6Gzy7Srp0NvgBDp3KQQmqOpqJ/qyOA5Q1tIz4N//OBhKG
	/q771C7hMtOsMSqK2kyZZ0N28pKdJDT7exhB6jKV+/SWil/Ot+Ccw2IK/prafrgvWUTxBoYEtSs
	UpKzHQ2abv5+fTSp7asutBRGjkp6PJvZ3HQOP+b799WFDEnDA5oHv5TWvgOJbf3n0VPeH3jVjDu
	lvugrIy+aqOhkjxOqZmQdSvRvlQ1P3AkiFi4s7Y9fI/Q==
X-Google-Smtp-Source: AGHT+IF59wq6uHBUO4RleOOl8fuHEP3hdGpMTJBGi/ib8jLenz94+IfyyW9U3gkVBs4tcvoH9qs7Vw==
X-Received: by 2002:a05:6122:17a9:b0:53c:6d68:1d2f with SMTP id 71dfb90a1353d-554b8be64d0mr12225355e0c.13.1760601949889;
        Thu, 16 Oct 2025 01:05:49 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80dc9e8sm5746794e0c.20.2025.10.16.01.05.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:05:48 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54a79cadd1fso369195e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMsPWtfWkFFDDMT/wmSOQfwRBiSndYv6miVwfCV4MeMYWUM0qTLphC57YrZpehIb1BsiiP8EsIrAgHBlkJAQxyQA==@vger.kernel.org
X-Received: by 2002:a05:6102:5f07:b0:526:db01:5fb2 with SMTP id
 ada2fe7eead31-5d5e23caf40mr12709050137.30.1760601948335; Thu, 16 Oct 2025
 01:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:05:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
X-Gm-Features: AS18NWBojpV8EGtFpRhA4ksx4kN18NVJp94-AwZBKhJOeu5MaqA3XKOopME9Jaw
Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the update!

> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu

OK.

> +          - const: img,img-gx6250
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -146,6 +152,29 @@ allOf:
>          clocks:
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
> +        power-domain-names:
> +          minItems: 2

I think:

    clocks:
        minItems: 3
    power-domains:
        minItems: 2

plus the required below should be sufficient.

As Matt said, the power-domain-names are already specified at the top level.

I guess they should be dropped from the other device-specific
constraints, and their descriptions moved to the top, too (in a separate patch).

> +      required:
> +        - power-domains
> +        - power-domain-names
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

