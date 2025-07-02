Return-Path: <linux-renesas-soc+bounces-19036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B46DCAF59DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22A767B65FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FAA27D771;
	Wed,  2 Jul 2025 13:37:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D9265293;
	Wed,  2 Jul 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463451; cv=none; b=sO7uzCQ9JB9hq8hCVXV/tU8zUS8LHVh68limAE2NgcW9g5XmgDMxnUYoLt4rpvs8k+K7H9IoDFaicsLzM1fBt/p1np1hhodOHUqdIvYwy4bbyipnoTgWNSfGldDroIQBYjZHT7/MT32e94NrlP2ezjWfVElReptXGKtqTqSL1To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463451; c=relaxed/simple;
	bh=paLD67x1FzaRwqR/xpvFzQ8Fc9DlFlVSRz8qIEb5eEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cluka6Z0cWBLIHN7sG6a+RsERmtklCYFWKcv5HVMPxhYVKW/HQoBg+pupAQjA4WDLh9F+MsEnKEJF+stCRbyFY4IxsCKsZXVmHy+rfM8HCG/a2UVu7ZcYxEG+noYPcc41EdT3iiA62oxDEep0Sr3o1eix+9yhS6QcoKU0PWTGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7e5b6207bso1258771137.2;
        Wed, 02 Jul 2025 06:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463447; x=1752068247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPDxw2ki8ShPYUI34Gu+fJWCqybrGWaID95/meCOhV8=;
        b=h1xrc8fgwQO/r9sfveQBwvsq4rUazyztzKCmX4JDa7RZdcFjMPWxm90NrLQZqJPlCK
         JjhHo+5U8ahc6ckb//JVqg8bTbmcDQTZLNlvL0gjCmjl4sfXpAputrTjlWeZc/fjHyoV
         jtr7xgN8KEKh7JOgovpLphAc761k4hmYCRamW3YmDzgyWeItp1pty6BQvPzsKntsLKO5
         K6xI/GvaW01Nzf3NHAOVzqP+Yr0+1xz75+8Y3SlJbqGxzLZ4b0jdkrj+xXMcRYixuD6W
         1bNfvHZOcSu0kdItZnj6mztseit8PymEz6tpWXopIOO+8Yde3t0IFWW+tPmoW55r8fbz
         65zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0gnVubyS0VdKUJv+xAfuKZpUnwFk749sqP6YVPUyea7TDbuCVe64ml3spHCst3OG/uNDkjT9XDOq0@vger.kernel.org, AJvYcCVpVdLOg36CqzgYPgZJ7wM+ccvCopw5v8GZmzlKYuUmKFeREc8YKoKn/rrXRZuGNPgSV6y31JclWgzzSrxj@vger.kernel.org, AJvYcCVrrm5oD4zUoGmDtZqxTzpgl1dD7mK63r+/wDgKwvdrsBsEJPotFChvUE/2HfCXAPPsb2JxE2Upsvln@vger.kernel.org, AJvYcCWzyLjAEeeqFRxxBA8K+d12VGOZJ4VcZz1pkJRd7vdjphwmilk6Retg6N8eEzTRzlJp7xn81FsuWO7v8sSiVC5x7g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMar2o/KOeD8DJHifKvjIQHxKurqe20lSB2u7X3Lla9tfyVHdv
	xgJ5MJbXAQdGK3R7L8h2k/eTEuL9AsLQgQQh6bbBVwx/myAyIHocPhwiU9p/B57N
X-Gm-Gg: ASbGncu7v+VtPmbtxLIf8nFtR6Bb/cOo2ycyZGdpKvX+5XxCUTHK9m9qFeKOTHzN3pS
	RXSiBuZzzkKXDO+KnqbOavaxndCqEOvligU08wxSt9VNbdQaOwDNGQrDWjPelpVYTskPjlxk45y
	gIMm5tIB2a/WIk0s4+TMUOALfa+hAurMGtEO7xSQqVwzZqphJ0W1kxb/aZfu0QQgTDpghmtUhnL
	KNp1MbVBx9KZnlvhtoO4TbWYuw5sDLUJhBU/X67P1QC0u2qZGaP+YYlHmHclFFAB7MMxv2RP6AD
	GcY5pVT66OMwNl4dKsfHF17t3UTrxYhvitObs/F023umYqL5BPr6/sZBRRlaJhkLTm/MztsAdsx
	4LaOoMFifm1VZQUQHp9FOCd3G
X-Google-Smtp-Source: AGHT+IGpYnoOwBAUW76Ioy85tZfB46PELnL/75aSLlcKuL2VHEDnMgqkxi1d/jEn3dk3KifF31XNXg==
X-Received: by 2002:a05:6102:d92:b0:4e6:ddd0:96f7 with SMTP id ada2fe7eead31-4f1611d69e5mr1227194137.13.1751463447142;
        Wed, 02 Jul 2025 06:37:27 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c377e4sm2442883241.12.2025.07.02.06.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:37:26 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8815049d0a8so1105148241.2;
        Wed, 02 Jul 2025 06:37:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViAaFvbCHF2jsTMTxe+GkK/xUx62r9lxqDgG3ZeuYnsNjO3qFXjakDwD6eWC+iFa7vlD9SF1awD2HR@vger.kernel.org, AJvYcCWB+q5lMBK+T2IWvtKFwmyY7kb/8yt6Vi9H7BjT+UuSu1G6g0hKddaDOyBT5M3zEyaV7RiCRa29cfvi@vger.kernel.org, AJvYcCXK2gKP3jCa4Aiq5/ZToZPx01BNhQvGQbIeT4Qn/QGWPmJhfHLJCpYr5OTCkOwLD7gY4WaWsyIdHpg/CxZGvzn4qBo=@vger.kernel.org, AJvYcCXUgsI7PVBETUplGlLWjYTUeZwsQe33x8c6qiP42imIxkyVn8mG/NVdSBQO5CjlS1OKFw4KkkmAeUtrhW8d@vger.kernel.org
X-Received: by 2002:a05:6102:cd2:b0:4e5:ac99:e466 with SMTP id
 ada2fe7eead31-4f16123a957mr1134312137.18.1751463446206; Wed, 02 Jul 2025
 06:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625141705.151383-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625141705.151383-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 15:37:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbr5Rb7SNzYTQz+rBNuRrLCC4mf+XauTFA8FArFZzfNQ@mail.gmail.com>
X-Gm-Features: Ac12FXyffxCRE32g6fggFgUAuaDMG4TZHuxf_OzpBlyzNjf5XBDeWtqxbEOjIos
Message-ID: <CAMuHMdXbr5Rb7SNzYTQz+rBNuRrLCC4mf+XauTFA8FArFZzfNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas,r9a09g077/87: Add
 SDHI_CLKHS clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the SDHI high-speed clock (SDHI_CLKHS) definition for the Renesas
> RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. SDHI_CLKHS is used as
> a core clock for the SDHI IP and operates at 800MHz.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

>  include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
>  include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will split, and queue in renesas-r9a09g077-dt-binding-defs resp.
renesas-r9a09g087-dt-binding-defs, to be shared by renesas-clk and
renesas-devel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

