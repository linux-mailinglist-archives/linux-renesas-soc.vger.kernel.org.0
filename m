Return-Path: <linux-renesas-soc+bounces-17386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB752AC0E84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8EED1BA22F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8029628C2D1;
	Thu, 22 May 2025 14:44:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626E80B;
	Thu, 22 May 2025 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925061; cv=none; b=LKSuPCNt5/w510QQBRQBBlntkLRicw7RPNYW9uqq2aq7r7iPDILY2LVUBOm6cqGBr+B95c9lQwkHkU/ZzpaS0tXVgXCyEqrHoJBOMOJxWyvjTTZQYbcQSAbVQ8qU27IUd/CnfpCvNO6sZp2ujXQfiyY1IUN08fX+6fVyFL6bXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925061; c=relaxed/simple;
	bh=4FS1WD6Ohgai5T03cmhd+uP3hmvq4bHzXFA3UmPvFgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTAWmZS0zNAt433yLNqEq6GOxQwurKRliNsh7nra4SFK5UpZgpCuWaiOUryGcCJoLDnoFaCcxu1GICgV4mj9WKqGp/BqLw3YW9azT4yd93PYkxXBvNuhuzMARDNPFEA6m9amex4twsQNVD77wQhvxx5vOYWkOlWYeYV020sy1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52b2290e292so2449149e0c.3;
        Thu, 22 May 2025 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925057; x=1748529857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulHyZgCZJs6vw2PQiLxo4q/s163zTZx6q7bD+Ce1XJM=;
        b=OEkeSAfcXVbYnhmXRwsbR8cg37eX5g6wIbp11SkseBsI/JRbcyGXcieUduzx5ocOqV
         AnLhrvA/fTV/BqdP7fMuS9KP9dlVoVdApxC3UGzR3Va5GksVk6TYjQ2W64YPzLICWu/1
         3XKadMwiSAWJ2mFP6uZMuW7J1yRnKRbSJ1+BusM7C5SACig2zdkIeUTVx/t5P4uuyU0O
         Kj1bZlrGLWMci/8l0j2/SV4wIhv2U9gdKW+MZG6izlw5tf5RVgLXhZ7TlXXoUO/vhCQI
         kv/YX/alzi5uX2NCIEqEZI+7r8Pm5dctie1mDaIJzI3inqAqIpeE0OCodQK98plEiqbE
         cNiw==
X-Forwarded-Encrypted: i=1; AJvYcCW11ueQg/WmtDBIgs8fiDqqvHiEDdcS7w1XoAPXdK1aKAOcxtHePgxgoxZZfJbHjKtlSm9myTk5K43baMhzfbeL6M0=@vger.kernel.org, AJvYcCWmQ2CzvAMYhQpn+SYI4Maf5l4y9aW4jc/bWR3pFRpcjaR1jKsF7HKqEHKOQ9g5pZh6F9E0WkkuEDkg@vger.kernel.org, AJvYcCXwmvqDzQKip/RzqvujvzhgkQwa73pF4DtcO2beBVqzOQl+OGFAom0yemFuD4bsyoWqgXBe0ShUonsE@vger.kernel.org, AJvYcCXz0Swty2t3HgzD9mpTqluweDy/OD6xnS3u/vPMxmpHvtGPHufSZadj/nsa51v9X+YUaInRC5Rf1gZdTak2@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSeoHOWNKyVfOBIcSn25zSboaUGXjCuV9MI6A1xgnCP9JFck0
	sB9kifAhdwkLiuLE5b13Ggh0oPqlZC65Bt9tZ+gKtKka3foUcGILEdVsiZeTlBqJ
X-Gm-Gg: ASbGncv03QA9eZdu7eotl5IS/4JSBT2I6MOu+bwgxsVZg7zt1M8OQBpvCngV1f5lQdN
	SySF7BF2z3/dnVYYpz9Yrs2I64CMzxxXwUjf9SGfYYEA7680588sobKSHanrTaghwQ6DA2gzPjg
	SmMzE1TEaHbjiHhcvPEEAeaDhl/jbwDOBxGGRBpW8L1j8FN8GYs1cVRG37lHel4r1gjhG0D9of1
	e4+6qhagG3ggAlrL1tXrvAwgW9+hu1NnApk+ETYNY7hCiZIHMZOylEGMNMXGx3abdcw/bJ8gX7H
	0DJwKWZs/OFBTs2iie8lzqjcNwPQg6hJ/fLmgtL+Xstey54fdHhTtb5aBU0SuAi1OkLJNLvZ46s
	wynRk04x0rOSCDw==
X-Google-Smtp-Source: AGHT+IGSUPlHeWsY78d5dyV5adWI8xIGhHI1TVK/Ner7LmyZaEtwkUSezDyMSCZotaXjGg1CmY52YA==
X-Received: by 2002:a05:6122:178e:b0:52c:5062:c84d with SMTP id 71dfb90a1353d-52dbcab408amr19433372e0c.0.1747925057016;
        Thu, 22 May 2025 07:44:17 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba91072dsm11931423e0c.8.2025.05.22.07.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:44:16 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87bf9d00e1bso1587308241.0;
        Thu, 22 May 2025 07:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIEpdJXDUCTn9bDxE38JDRmSp2AWMmK2hwbk06vw5hBnw7AXQyIXIdbhGSlHWnwUrp488hMYKn9xechBTx@vger.kernel.org, AJvYcCUXFRw8GZPrQd6sOIPQYBbiAd8nC0Igq0ED/zoW2ukeRT8vEq6eOWxslcAOivkFbZUv6ffXMwojr0X7@vger.kernel.org, AJvYcCWW1AEBg2/33glrUDEIUjM7Ytw8eLAqI8XkBUdv8UWFRt9IHS5XRC99pWeFc1LulzRT0dk6rv6lLQeVg35sUC2l6i8=@vger.kernel.org, AJvYcCXwWtwU3oUF6MNzBmf6Fcx2VtxK5atogZnQswWxybmIUWNlA+KAJmAbKVMH1WYuweH9aMkX1GZEy7by@vger.kernel.org
X-Received: by 2002:a05:6102:1512:b0:4c3:3eb:e84d with SMTP id
 ada2fe7eead31-4e053c64e06mr22982552137.21.1747925056234; Thu, 22 May 2025
 07:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com> <20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 16:44:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqZBT6siQtt-jY8H+-NBM2NK6nqmXtQv3WFZ-8r-hTSQ@mail.gmail.com>
X-Gm-Features: AX0GCFuvftoCjkNI0QdHmFXYhUcsS-YxVKwyDJuwdT43XAXP4VA4uldmF_io67c
Message-ID: <CAMuHMdUqZBT6siQtt-jY8H+-NBM2NK6nqmXtQv3WFZ-8r-hTSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the sibling data is filled after the priv->clks[] array entry is
> populated, the first clock that is probed and has a sibling will
> temporarily behave as its own sibling until its actual sibling is
> populated. To avoid any issues, postpone updating priv->clks[] until after
> the sibling is populated.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - postpone the update of priv->clks[id] as suggested in review process
> - updated the patch title and description to reflect the new approach

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

