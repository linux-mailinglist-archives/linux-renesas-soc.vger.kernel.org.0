Return-Path: <linux-renesas-soc+bounces-12669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C4A20C3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161D718887D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEDE1A8418;
	Tue, 28 Jan 2025 14:48:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10546F9F8;
	Tue, 28 Jan 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738075689; cv=none; b=BI3rKSwXu2uwMDqz2wBvBA6j6CXg0dnqHFoYyXsdAjeTRrMa90eC3gfNZISfEFjGXuGdaR0r7PuvxcvBCb1ovUiKiYdthjIPdh3uPiYqXjxQnGHXpJE6rx4UtxPV2KtzZ+q85NT2zYe7s90TeqDCUJVTpzvV8EIQ6UryHXFrbfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738075689; c=relaxed/simple;
	bh=JGBOI0jWiJMIE/VtOyCKJHZtvJ7jUOtyoNaK1zFaKqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3OTlvqc9skCq/jRck3DIMX39wZ8LEqcS9XkhAjDao+jZ6kkb0YmgnfKI5EkbTt6rGvq8LVK12igQXLfFBhuXtqPZ7LeNRxpsked32WyniiC+l0a3yLVN0ieXuRdMS119aa7ebN7vjTv50XLqeFThuBZ3pselQQOl+N7h/tabQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so1822458e0c.2;
        Tue, 28 Jan 2025 06:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075684; x=1738680484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/emlu5iyumP7h0/eMpSZj0+L2wsHCfavXd9axlfYbf0=;
        b=NAT0TsCUullP6Axeqg5/bsclTb/E7ca0xqbcUc8a1tbeh/5XdUB/zVpdzZRNbw0Jvp
         s27ievPxmVI3Bw5zP2xHLORPeRWf1sW3jx0n6radxNxB/ZhipwQQR6GxV2LlrdCG9WEr
         7TBlG4GMmf3Zatdc8k3JoHaPPTDKS00lJteoMKDXDI3z5KizGWB3p2jAqBrzY8A17PRq
         COZDCYCJyMms3RkKP8ihXVzvuYX06WgPPB8mKGXdyAyTXlueu6XBRcGOBWr/Nfm8Vu9B
         3gbSLBnkj6iP/peQWjh2MPIl79+ubjhCsbhd9cztI8qWBZ7FlVNPA0b2QnRo3reZQw9R
         P9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUtVzVgEDrdUJ89r/NB3asZDWlKUHLJ1hTob4nCxoD0UyliTR+zuifToTYjgIq6WhQWWxdKdeEGvBr6VhPp9V2Gu9Y=@vger.kernel.org, AJvYcCVQLHpbQWpahrVUmGlmfN7EHYcDrUSY8z7LndZRWhtbZlJMv22vB0gT6ZGQQxugkzEa2Miu0VWdX6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qmGQx2RALVj6dZHtaswDKq2wvYJWxGG2FfLxvKAAaWLymx0a
	Sv+QN0vZUU/LKaDbRoLopjX/3vUsz1TUywQql6mz3Y8MN3VlrCyNxL2mb2BW
X-Gm-Gg: ASbGncv/d4DWJSBDwSOS0/fbc/bLVh8lLRFc84bkjiEPZ75rdMMt2C7kX4K4z8GRO5L
	mlPGRXBeM3XtFSpEl81DJ8+JsTMA3n4fg+0JPeB7c7SnH6FUSE9P2awhaMEvgSX7uP2vOvNLQMe
	I0d9J0pIID3munWuRtboyyfo4QPvPl82s8UcdHPHeRbcgsRW3kMyvydtoTNE3xUKXwuLoKStxxU
	mFzl7g+eBLL1IwrPu5VHm2L59uRIdwI7n9DAiKg8XE53a8XDrm2iRXDcwyxwn8BrmmY4UxBKDth
	lD7aa9Ea5q1pBN1f3qjlGw4Ano3A2f/neoCndkD5cm1qHKlRom5qAQ==
X-Google-Smtp-Source: AGHT+IHeg3UJGp0K+NaI5wdBjmUkqPK3YKqZRxA/ObP1jhEg5kQ4nE7Z7qwvkSY2kiA7TEN3fdv4vQ==
X-Received: by 2002:a05:6122:29c2:b0:518:865e:d177 with SMTP id 71dfb90a1353d-51d5b33f5c9mr37773464e0c.9.1738075683675;
        Tue, 28 Jan 2025 06:48:03 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e979fb6b9sm96908e0c.48.2025.01.28.06.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:48:03 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85baea70afeso1167107241.2;
        Tue, 28 Jan 2025 06:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDxFDFtz7RPMSHGiN49nl82T0MPztjbXLQ6wAcbYTbxk5cIQHOtDrgShyTWLpi05cmfTWwcCP45i9qP+NGapUCg/I=@vger.kernel.org, AJvYcCXFb61EcHrJ1l94IwEWWZsePJszzSJg8BOuP/nxB42O5qIZUHJ8DpJUSulC95B39nqT5CxDy3GWz/8=@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:4af:f3bd:51cd with SMTP id
 ada2fe7eead31-4b690cdd7e9mr37544407137.16.1738075683000; Tue, 28 Jan 2025
 06:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:47:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdx3jVNXjtoYCyf5KV-2bEe3FVpnnWJhE_T4Uc_X8L3A@mail.gmail.com>
X-Gm-Features: AWEUYZl_QBB7F3gufD9zX40mtUJ789ig9DK8UyWLYtp39vA-6oM4MO1Lz78c96I
Message-ID: <CAMuHMdUdx3jVNXjtoYCyf5KV-2bEe3FVpnnWJhE_T4Uc_X8L3A@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] clk: renesas: r9a09g047: Add ICU clock/reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add ICU clock and reset entries.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

