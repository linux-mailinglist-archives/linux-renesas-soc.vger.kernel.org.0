Return-Path: <linux-renesas-soc+bounces-22315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00039B99D04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6CE27AFCBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 12:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC25303CBB;
	Wed, 24 Sep 2025 12:22:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF3303C9B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716539; cv=none; b=UjyhV3q8g2+r6muiiTl0HqcHr1PoYUqIib2S9Z1t0GvK2vBdilLGgNZ59dGh0Ka7XhEeO2XVAUARoy76iaV3ABUgmx0xxr4+ejkxGlLTs1SOt/e7gUx8zBUI0Dnplhog7Ycm0Tt84d+chzu/kPz74kcVk6nRnu+DzXi2AirK3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716539; c=relaxed/simple;
	bh=DYWtNAd2ipu6vMvUNjTxOuC6nLmwhMubAsibachtn+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3SCJb1GXWaU7DDwP9+Dtbp1hUEnN8cVmqyxW0uOsyYDrCNEM0rSDLqTer40W88o8mF35D1G/k0IUEDDZlmus0//YZgAQwgajkHVMlRjgKi723vJJq9qQnUXrzhalILZd7VHlSWU4g1hA9zVgXABQ0JmCeteTxEmmmp8hGhU6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8d02f793882so4288551241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716536; x=1759321336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tAtYXWN7ryUB5vWJvXtt7rrilhjlT2dOX7k08gBfcc=;
        b=cwd4UDUtpKaVnhRCKOo5wDJ0YkERQxfAdoklKi14L2h6RTcrk4kTfg4ZJTJqZ4+vPl
         +t9kWK7omWDJ3r/ZOWhJk4/+YzagWekyzJ9R81C2h7WyRFlufDUudMibGiqn2o+rwt+x
         IYIA+6/qkcLL59ZhykkeWdJYFtXvI3VohrEAYo9s53rwch7sC9HAeRavtC3wJwLlcoFj
         WyjG50ea1i4OTNsN9HWFNSZvjZY+T3B0V2pVP1s3Qv9sft1U1LhpOWkainULa+immrXw
         ZQCw1aKyVMLP0+bg8TnziW7OpSX3EVQWjT2Bl/nU1Rm2tSFmCKL3AO98y9zBNfRG7mvw
         J1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJwNc5v2YVfSRYb+gZSqTXO8nbLwzuXDymZZ/uKqsg1CyfV7V1N0xgC9HkjnpOCDWx9ZJMBC38d2rYN5BzT9eX+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzErr/iZgqp2sV2BRgz4PRET1joT8SzfSUby+gfqxRwaP+sNOig
	EcXxlzD7vA/o0JiYSsVUB24Y74GSTgtEboVdlhWk9JFh6McHew2Y2PScR8ahG61Y
X-Gm-Gg: ASbGncuCteHaZvwKJQppHYYVX7+ZJ8qdWwcwIF8Pbfb8+RuYluCQwmbmPeUyXrwtBiq
	crn/SlAkfXNe8O/Q4aG9SN+RTFu6UUk9D6ojW+2CYG3elkBxnoQVlOaRj+XddD4tlO55jZgdYrd
	UUDiGIhEoJ9ByPQxbPJ458Vyn+kmg6xTYwTqC4gzeXfiQtg5hlETo/PCFYZ3Ipn9/psFLl4ZBHw
	Xx6yABTnfwfbjo/kC6eeCdSKrtp0xG/Ot5tCNjKRHqQeHwYQKiGfP/OXGuD8T8Bk99OKfDmV57J
	k4e6Qa/qom704LEswjZj+4Rxa4qvzuNhShcAGvg42gsiZJ+eE/wXd9d3T2UU0X9q4mfqYz7pbM1
	jiueWNTeuvV3o7WvYJdZsMXZBdtDbtqiqAPeORKSbIpyp7GToOJivSRqMUkdt0bR15IU/9HU=
X-Google-Smtp-Source: AGHT+IHRJ/exJ22VFUlndQ+DFT9P53XkgEZj6JhClrG27WAM3ujKbQt0PREWz+g1kG+ga/PM8TAzFA==
X-Received: by 2002:a05:6102:2c0c:b0:59c:6e9d:23bb with SMTP id ada2fe7eead31-5a58118f848mr2864259137.17.1758716536275;
        Wed, 24 Sep 2025 05:22:16 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-579dd258df0sm4606704137.1.2025.09.24.05.22.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:22:15 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-55716f2d3b9so5154853137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQH9AcBPcrvdMXImxDQ++/4oQ8clDsLHbqhhZqK52ArXWKrEKDAHGouOI+u7O6CM4bC+OYUrWhY+zrJitCC3ajAQ==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:51f:66fc:53af with SMTP id
 ada2fe7eead31-5a582ed6587mr2478165137.34.1758716535525; Wed, 24 Sep 2025
 05:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com> <20250916150255.4231-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 14:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgjgsAG5my_vDYF+2692NyFOuDqMXH9F-1zE_KXVzigQ@mail.gmail.com>
X-Gm-Features: AS18NWD96xgwB4aeZ6Vi7llmU6wbBVQwbgzGfR5YAigBPMea8x1UL6uuirF4Jr4
Message-ID: <CAMuHMdWgjgsAG5my_vDYF+2692NyFOuDqMXH9F-1zE_KXVzigQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: renesas: Document Renesas RZ/G3E
 USB3.0 PHY
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document Renesas RZ/G3E USB3.0 PHY. This IP is connected between
> USB3HOST and PHY module. The main functions of the module are
> as follows:
>  - Reset control
>  - Control of PHY input pins
>  - Monitoring of PHY output pins
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

