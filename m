Return-Path: <linux-renesas-soc+bounces-13214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B2FA382DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BDEA188903A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2610219A78;
	Mon, 17 Feb 2025 12:23:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047DF16C850;
	Mon, 17 Feb 2025 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739794992; cv=none; b=XAdhXzUe6u7N78SKH0yGKSeZSTT84aMa4T/k72aCNc1gY8xm+xmhqO64FIHKCaC2tPRWIdiwvaKheHhD1xqPwo1YJ/mKN0Le8ADaqaoyKw87nZIJuDkNEPOKWy8jcMv62a/eaCX8PxiFHD+UDZRu10BPQntsSPC8ssTszN92n/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739794992; c=relaxed/simple;
	bh=d6HKdSoW+LC49oP1AHpy+Vz+THWSRgOw/hZYp8L/Kmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOyvUOzXvcZ1VPWFaPdR0Y59d82N8agz0JC6XIyd2RERc0HS2K5rO+YjGh9dTCZWFFiEAgFNm2+zdigb+9Rd51lDVJtvYP0AWudAOLsp5IRetpSE/1gejbhF+2fIhFt8zj59a/jyyvsKLpZGjw332WMr+Qb4ZSKcZ7Emw5LLo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4be5b33ff91so192811137.1;
        Mon, 17 Feb 2025 04:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739794989; x=1740399789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/68mrgPJT0iwzX72fBzkEEmk9QPdik/4VhXC9eWiAcA=;
        b=LfPa+qYQyHs/3/mcxx5oSEg6ict8nsJhmUYN8ZzgiivGNbLhRIJo0HAfXWQEET2jxU
         llocSxJ/D2kfxOZuVe+FIy99ZmYPeFqtpSyT13ZJH2qoze5L+ZoT+KtmErvJqFhSMEhX
         e01d0tQkun/Rr7Bvu4+VY5jq4tWwRHwfrtGi9iXLOtOR39+spJIbq0GOFrxU+0bVvYPq
         NQLGdrvSoNaq/2zyF3nGkDF3LhYVd+C7GzYQlmXPVhIPYD6bxAIWGz77+G62IFHiFE8c
         AF+hfZkdy0KP+3/esbEWJGjPszyFdd3ucfhTgqSshoEHG9tQT/0u7rOEs3MxWEka5Hhk
         kZxg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Cd5QmDUKuYQQeG7l7ooiLKiG7q1POWzDbg9J+lHZUvbXF7rdHaPqQPo7+KQHt7VZZT7uY7mCoAhtduiVvA7HVVM=@vger.kernel.org, AJvYcCVIGOgedaSKKeOSTUZ8/ldsLD3BL2G0D8o/G29OTt/BRJGcOow3XU2/KQflJ7LRFtH3By8oBvifSNaH/Cnw@vger.kernel.org, AJvYcCW1hq0ZWcpWj2qZyTRhNWUsByIQ6ZBP8eSkP2QpOXnU6fQc2utOjAIzr4ToHHsx49iAqtbF8tMfHEI7@vger.kernel.org
X-Gm-Message-State: AOJu0YwRx8sAJR15AR8xVRBfx1hGCXUtP4QJ14m/cQkX5vlo5i8SDxBz
	zm2BOk5cvpjsl9svPdDnbp67BA7ysw0na+vPmctZofPmX2zm1TRAN0hTHuuf
X-Gm-Gg: ASbGncsnYYcM4IvynYQMNwniwBDAqyFZ9TsUtT7vRan9hr/ft13DC3BBreoY0ao+jy4
	l/XoIAD8nFUtkXxXuojfVO6hItAid7BM30W3CaZb5Jujr8VlEGmNeq/7fQJtzglcBGkLLzOf1nn
	BfriNEw4sUUy1bBf9TW3AWUjTdtVdC9Mo9EXdzCFgrkbV4Aoi4A71cnU4MkgH3Df+GsZK72W95H
	vz6uDGEOP+BXn+Txck0OlTx8diKFcbCzRHzAZwfTXI8U4OjhOVbyn/AE35U1A/iNr5juQHA/lgu
	grNYb7WJyLozzzftX9oMfqM7PtOYuF16jQmZFqY6bs3Dpxc6AkGzhA==
X-Google-Smtp-Source: AGHT+IFamiCIpeo1adQV1tkYRRhSjPO61YtgJ4kl/RXX99cFGMZgRQDxi/n85YYZUKxNsz6xWyBy3A==
X-Received: by 2002:a05:6102:2acd:b0:4bb:9b46:3f93 with SMTP id ada2fe7eead31-4bd3fd29c19mr4342022137.8.1739794988960;
        Mon, 17 Feb 2025 04:23:08 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc68dd766bsm1548698137.20.2025.02.17.04.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:23:08 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4be633cacbbso162494137.3;
        Mon, 17 Feb 2025 04:23:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3flWjO6T38TPzTSPwi8VySO4HjV0QbZNgigaO5hP1TI9ziaETmZEZk9COGiAB7yBUu8m7vmzUc0Bp@vger.kernel.org, AJvYcCWGYc76IDYHC++xT7MVaBS65Kq67qSsEYTCZhMZQm74h1cTjsqHv/Vv+OhY+7S0efv+HLYIbgS6lawu6OESF4hDTdM=@vger.kernel.org, AJvYcCX+Rfpyoivkg2pxDrgNlKeSPQxkUoGof0w4U6iEUi3EOCD4CG8hVmJ+y9wpiAQ5V2SVvSeXNuEg5Z3whqA+@vger.kernel.org
X-Received: by 2002:a05:6102:d93:b0:4bb:d31b:7ae4 with SMTP id
 ada2fe7eead31-4bd3fea03e5mr3608344137.19.1739794987941; Mon, 17 Feb 2025
 04:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:22:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWt7_+C=Gx5_NuC_7F660DZmbDv0L++b_gdan6QP8_6xQ@mail.gmail.com>
X-Gm-Features: AWEUYZnFY0Eep43ojWYbXnUUS6xd_SpL6UdiabBgeeWab09cCOYr2bDr1heH2d4
Message-ID: <CAMuHMdWt7_+C=Gx5_NuC_7F660DZmbDv0L++b_gdan6QP8_6xQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
> documentation.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -535,6 +535,16 @@ properties:
>                - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
>            - const: renesas,r9a09g057
>
> +      - description: RZ/T2H (R9A09G077)
> +        items:
> +          - enum:
> +              - renesas,r9a9g077m44-rzt2h-evk # RZ/T2H Evaluation Board
> +          - enum:
> +              - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52

"renesas,r9a09g077" should be moved as a fallback to the bottom.

> +              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
> +              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
> +              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security

         - const: renesas,r9a09g077

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

