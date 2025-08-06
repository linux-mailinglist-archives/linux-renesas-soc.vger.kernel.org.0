Return-Path: <linux-renesas-soc+bounces-20029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F15B1C3B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836C43B8A57
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D36B28A411;
	Wed,  6 Aug 2025 09:48:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F1288CAC;
	Wed,  6 Aug 2025 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473696; cv=none; b=Lrjr6lQJuzZ9+1MkTvR/QVS3NU0Wb1nvWZmyGlNKx/4MIkB68oItKHzFdTRPtUtNDbs/q5W0Q91KTNJW/6fOWy7Vx3oloBpPnyDUiuiueWx7FlNhf+C2K/x4QUjZDBLcC9rEMPv1fXeQJM9WalRCkooAEsSU2GRxe6WmoP0OIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473696; c=relaxed/simple;
	bh=tjWkxh35RPqFN8H9d0n0CGUywg0YbE1PsJ+WkFWAnDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkbpINPAWGUxABZ/RDfxnE8shx5u7PejZyu8GaYMu2nSB/Df9Blay3HF4hdmFS5oFS1DLHY7iavl1M4XkS/++7CFJ+dTUrZVUzylxSLmbJJXX6cju96TJeZyw9c8cepdQbBlRio0NIX9VszglxD9xXDolRWvbYPN7vYge6DaGLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5392c221192so1655944e0c.2;
        Wed, 06 Aug 2025 02:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473693; x=1755078493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCYDlAttcY16uLILNRX1i8+V30mkMn3okt66NE/k448=;
        b=Ky8elvnaTGjTlVhXXpouGHRqRcilv7hp5ZCGcD5tX06zdXdG/3CxgfI2XSeNZ0NZ8u
         2ZTCgqTNZLQwSrQojNDfOqI6QliFUa2EgUz8lKxxR2DDY7svZ9MJ4vecw6TjW0Bz6C5y
         eEJYDIDLFJJpLBMOwZFdv2OF7J/OPkTcAR8TIVxb8yAfkKWv0XGAz2CkhwGBVdaPOAlT
         FZ3vLXaSeKD877w3uH8adjxoks10Vhih1Z5N5LwfRITPNeY//Uv52l1u5IPIwKAqWzNO
         +ZEgeoQ6YLsBoOYKTl9ns+nGIltIdDcKycA2wq11Z+Ex7oGTN/43P6Itu7agUw/yUDDQ
         28HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0C/iLpJ4zwDx3IC7Bdn/nlnJbjIpZbyCGRFm1fqW2p5i9GvI836jBO4wznDxQG6uCbaQMgnhod3S4yfO4@vger.kernel.org, AJvYcCV88tZ5255/YP3tQEj1DRSAokkTYjz/mRFC6BVHsa5V+jBzD+dAJa5MlkdSaSJPvFO4jheRTC9+FbN3eg9TVcq5jss=@vger.kernel.org, AJvYcCVxQ0suP35JnnFfJ4rhjM0z29nG+aQrnhOgk6cTMclkhYzDibLRH1uMrWsSDTahXQ/PtvyT0EE3KXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kWfrbUWGV7T1gmUfRQuD4eSgU8LOGXqWyCsO8q32wHSg+8V7
	e8iFgGoVa8ECX9v3Ed1N9p8uAtoHu2nhWtU8dByJZRTFO3l4jFVlUEBhDT7I1E3G
X-Gm-Gg: ASbGnctrmgGK036WVob3cf0hiFq+UFEM8m9PopuWeALq/ICDtf+nPeziksSALGlKcJF
	oOlPIb6xnYm+FbadcOar9srWLXuVbNm2Y/xJAPAD35lOvG7XFCTSQuKrEEzKu+0plFdGUkL5hHh
	kRiRovAwYPPPO72Ed1eoeK3oIhCrjEBqnpq+P2DZB6YR4CzWhZPIP97zJQBoa94UxV0X+wntw9H
	enzJ8efVQzqql+jtKC0mWkX3wKnHtGYI8oRMnb9N98Ttp7iLNZ2g/et/nqN8ClvPAU/8u7X8cly
	mO46uAwkMIpu4FlriNFFIkm1AHqD7NEx2K8FsJWgYrXTBeb1rlmng+JZzDBf+Iti8x7xQEvxkHv
	QtcZ067cJBS8bSqRcG/jZWl5oO7kAxV8OnIxyAEp+hsKKyFt9WqlRgA7j2vwM
X-Google-Smtp-Source: AGHT+IHQ1Y4P6WGrOHYy1Jj8xd8R+/SsIxlR5HHjcbGB/ZyaIvAfT0nAp3fqLwmM2SroPLW/djOVNg==
X-Received: by 2002:a05:6122:1d94:b0:539:3b3c:617a with SMTP id 71dfb90a1353d-539a15046e1mr650544e0c.8.1754473693273;
        Wed, 06 Aug 2025 02:48:13 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d11640sm4110131e0c.24.2025.08.06.02.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:48:13 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-88db7a27cdcso1277160241.1;
        Wed, 06 Aug 2025 02:48:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs1c7KZoK3V3qSaLFvhpcwOo0c+K7esQp3OAF2uXiCjXzz5lyzoHe7eMz5mjSH52CKY94ZblW0Zw1yRi7c@vger.kernel.org, AJvYcCW48Hwq974m3dfwrdJf1+EvxhSAQJM8aK3K0jxkcCw+4ULRzCOWEsA4DG/oX3lB/qubHCDmt/Sz3mOm/nXFeiLbEg4=@vger.kernel.org, AJvYcCXljIIBqfUTlUyu99Hlk17TomMgBG/Ewg9LcBIh0ad8A30ev+jsNvSgGMxQzetrxRluILJbaGn8Y30=@vger.kernel.org
X-Received: by 2002:a05:6102:dce:b0:4f9:6a91:cc95 with SMTP id
 ada2fe7eead31-5037b6cb958mr659603137.27.1754473692834; Wed, 06 Aug 2025
 02:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com> <20250806092129.621194-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250806092129.621194-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:48:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
X-Gm-Features: Ac12FXzY7RnHom93L86B6DLVASotnjL6u6JZxqUpxqP3DkdbH4mZ1b0n-y0Z9bU
Message-ID: <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

Thanks for the update!

On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add MSTOP configuration for all the module clocks on the RZ/G2UL
> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).

RZ/V2L is handled by r9a07g044-cpg.c, so I will move this comment
to [PATCH v2 2/4] while applying.

>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - added MSTOP for GPIO

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

