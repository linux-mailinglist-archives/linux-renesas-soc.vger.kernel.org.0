Return-Path: <linux-renesas-soc+bounces-17388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9C8AC0E8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780DAA20A27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1769D28CF74;
	Thu, 22 May 2025 14:44:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BF28C5BA;
	Thu, 22 May 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925084; cv=none; b=rRlx4TsPFHnbBYZ5PlroOApVcw0JQUVUtFPNY/dEz8xN/bXe96Iqj10M9gSn5i5Xp5BO/GJ0f1F0gJOU6eadGUUJkF/AU5a1XcvmslyrkmXDMYMLwAw0Nsk1Te2Ouz7a6rvgTsiEz1SBIPIpyaSwHlREsatXB58ztjqnNCWdIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925084; c=relaxed/simple;
	bh=prK6C/BiONoyHdP+OUxD68ubCymzdizfsLRxAc6B0G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqri1Mn+a5hhCQz8VwzkPtIdO5Ilo/YjZfVCuv0JnB0VFaTl4Eex8P7C5SotNo8qRUJmOM6aYIGMk1obJRjjxbYNgzPpk2Jk1teDCoFhb0lLHa5TIvCnovJ18xqw9d7xSM3ijo/YICUYHmz+/2BBRVSGxwqf3XQnby6YSkplvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e14dd8abdaso2194924137.3;
        Thu, 22 May 2025 07:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925080; x=1748529880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJUDbzBviNdc5T8/kp9kNprEEREIznz13zHLhKOxuNg=;
        b=LPKqENBiDBWGzetIQ3ptIi8Iu0EBiPOIhmln0gdm604lI5ABzzdsEXG/c0HBfXVxzm
         9DbQ8wy4JwxCEv0Ea1fBgSvAfquJaQnTjAm46DgIrnK9JjMfa+XoDUgNXofYwExNvaT3
         zwCWhRopHaofQaeDis2EelCYIcTpK2C76k3+fdEe8vefOc+wXKrBFjoA2oOBBkUzIPpV
         GpeC2vXPKtwWpZeH1vBznAYs+86A137La2s65Z+XXmSgGcH0+eHJ/9SnOgJ0j81Uszh1
         wD1XwEHPMgml5nsLiu3vyMSMXj5ylOUzdyvhai5M4D2yrOUCBvQSiKVC/VE8yvdljUva
         VRKg==
X-Forwarded-Encrypted: i=1; AJvYcCV2S2+AwfQQ8S2THuF19d0PvvhnubF+9vqvd5meqUf3SGlJwoQ6FvBQwVgDni3OGFipQQjbKFzBzc8ihmBI@vger.kernel.org, AJvYcCV4l+fWvo4A2pDt8JTvvH7ujA1RRDUk7XCh9vbTdRTgSWipJMcX+Z/Ju9eFWuirHVmIpaSiHo1gOG9I@vger.kernel.org, AJvYcCWZqCne74wp8fxUu0RkAL/QM4mPgBc0KPmK3wVrRlEwd+swZRmWu3ciOecj+5/lSw/uwYtRA7Yj0NoWXzAhPfci5iA=@vger.kernel.org, AJvYcCWwNXuaBr83E80jxiAjPzxKxs1KpASPHV7ZSbpmvvf0CzLUicIpg3uvZQYgrs2+VXwqFyXpvelbmcBn@vger.kernel.org
X-Gm-Message-State: AOJu0YyPH/SYxmGEfuI9wj6WGEC/Xb8+QddvGPiMS3suPqljuoKxzzBr
	re771/yt0oTD9XuEUw+42d5qgQKqJjWFKBKfKWkU4D7tubL4ZJMxEN8z8rXIL1Rl
X-Gm-Gg: ASbGnctVBa+pZZVJs2+x3GdHlSDpC04ezRhzbes2mys4CU7sGfNjlNbx8koDzFg6BwY
	EUYh3DEtVLNK/pUCFJ5f9MIyePVU9cqneaqF247YaBial0dZX3hEv8vq7A5xFs4g0pLGYjmBCXA
	K8pHTSk/TrbOQwe8GtWJlqRSoyRmq7YZ/aBuCz7v+oqpYbeyTzLie3ugGo93KFsJIacbL6alklO
	LOU19x9ocXSVj0euOi8vbtlQl8m8r6wPxvKnfVQ5c6Shwc3wNSJpStiVS1JPPnqhNH8aISVbUeg
	68SWyhCPJnQ5CjOGDwp8FQzM0ODKaOr8rPhqwRKdfewsLLzBbLMvQNs/xfcUu5R+G47PV3inzvy
	hqFFKeqwmAg/nEg==
X-Google-Smtp-Source: AGHT+IGy1jOmkQYIzlvk3RJMC8zUVrMjzhxv8eufuzxP7ABVdNRWaXbIp9nlUjUl8EM32O9PZwsDPg==
X-Received: by 2002:a05:6102:dd1:b0:4df:8f09:7d94 with SMTP id ada2fe7eead31-4e049d151f2mr21686103137.1.1747925080520;
        Thu, 22 May 2025 07:44:40 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87dd98ce518sm386153241.34.2025.05.22.07.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:44:40 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87be9d1fe01so2134324241.0;
        Thu, 22 May 2025 07:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2kTlVKyQj0vTzqey5cN9g/UxnjDkmBJhQRgIx7iktBRhKZXcu+yyb8X0vzw8ht8IVNTPxLcYvLrZT@vger.kernel.org, AJvYcCV4lYvKaYA6PQwzuKH2LtY074j5oBDS7eSQaNdA+3ENgXTLy14GT+wHpVUdJkZcBE7OMsONG3eqFbydlW7FRjmgKi4=@vger.kernel.org, AJvYcCWS7s65XAVwtxpmQGJcW9bjtKmmZdR03FBrALEl9ZLaA64go/IrGWXnc92hN7JbGMxNBMLRJbjF4DIs@vger.kernel.org, AJvYcCX3tzRnWFkN2uaHTvIDiCme4EY2QJsfq2eDp7eTRDDfWG4AGLmBQCSRzZ6pl5zku3vQ45s7VhSrRfCt8MuT@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:4c1:86bc:f959 with SMTP id
 ada2fe7eead31-4e049d56f96mr24007854137.8.1747925080104; Thu, 22 May 2025
 07:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com> <20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 16:44:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJi1jWeDYCZoeqSdYZdQgZGOhZYTpjBdM5rMcmyRxc2Q@mail.gmail.com>
X-Gm-Features: AX0GCFsVfbLR1fQHmqBSXnFOqYa7p3LYDbT1lnMI1fESP4hQ5DYubbbHv3FoelI
Message-ID: <CAMuHMdVJi1jWeDYCZoeqSdYZdQgZGOhZYTpjBdM5rMcmyRxc2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] clk: renesas: rzg2l-cpg: Add macro to loop through
 module clocks
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add a macro to iterate over the module clocks array. This will be useful
> in the upcoming commits that move MSTOP support into the clock
> enable/disable APIs.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1202,6 +1202,13 @@ struct mstp_clock {
>
>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>
> +#define for_each_mstp_clk(mstp_clk, hw, priv) \
> +       for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
> +               if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
> +                       continue; \
> +               else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
> +                        ((mstp_clk) = to_mod_clock(hw)))

s/mstp_clk/mstp_clock/ everywhere, to match the struct name.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

