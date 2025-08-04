Return-Path: <linux-renesas-soc+bounces-19965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEBB1A18A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 14:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF9B175B7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 12:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1214625744D;
	Mon,  4 Aug 2025 12:38:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3024DD11;
	Mon,  4 Aug 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311133; cv=none; b=d44pxnapAffz5jc74uk2Ox3g9aQNyBwtrMJd1zqZMYUKH/vaOTcLrw+B1Sus2CE2K9MZRkTquOWGj/1+h+h9+SyAEyYFi3AMqavyztczYW8NeVr/dWYevrK4C3PbTBcpK6+I/G+1PGNS136UyvrJQuotje1lJ0M4djgdP9Ygl1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311133; c=relaxed/simple;
	bh=IL5fPLC3Pk0hoIBYQYmcxQ4TFVhH95HWl8gvZ3MV+nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfaXb7/BwucWipGdojTazhIRCxH97eI61/hhGTAQHxURTZ8WCSBla/TMnc8KpHYKL/KRskUrvHcrhwGtSqYl1D8cXvabtorrH00qsJom2vctlKr3IYsMouOI5c+1Zf0Kwm9ULpbw5Xf9H3psuOXLhp1blUi6KnxEfKIUP4YjAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4fc1094c24eso2584153137.0;
        Mon, 04 Aug 2025 05:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311129; x=1754915929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OP7crYCBUfvlVVEMFYC8Qh4lOutHMfe5J2vx8pbxfr4=;
        b=DDsd+OEJJvMMPhSvOngI+elVysYo5Gn58kF15j9lyTbMCEFYdKTIlwzy5JiU877M/3
         +ixmE0CJJF8JhWoKZGyh+AztPvEyo6FVfJG/nosog347QlqR2ts82S5fwJ0GQmMljJiK
         dBIqNl5zjOQFdGBPQJa1gnDI6qCFhFJ53kmFr5OX8kMvx0qwtkwuGW4LwPqbLxhYveut
         sZe7s/yxBtLKvX4GKuKtkiC6dKaQKvFaD7OI+UVci7E1EonfJKJQPrn8emCKsUgnDUE2
         mW1sDRr9Bo6cH8XNstjqE9wd7pKjrJJn5+bPRnFUPvb9lwCQf1dxOBO8y9rjs0OqN3FH
         agNg==
X-Forwarded-Encrypted: i=1; AJvYcCVSETZWkTpzPwmaOsYXsLpRfjQpv8KSFPWgIhmr/cV96oIcFhiYGjqjAvKNvS5Bucw5c7MY2wR/787UJ6yw@vger.kernel.org, AJvYcCWuunckdcOaVe8r/paDNgy3CkUT8F/IOYdxS+rMsY9Vl0+h6FLqqSEiEml1m9cHGNoHPWoO1n2t496HImtUhJw5ch4=@vger.kernel.org, AJvYcCXrRMIfMrd7fHBu18NcakQIH/6Tcn7VdpUYzI6pejo8Jnf4LhuO6eSh5u6lZxU3pKqRlSRAiqKmfB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1S9XZZM3jDB0DcePxPrlsT8om3QZjudrMIsHgF98lZJ36E9jW
	g7sLh8vLnLGxOobUE9AKOc43h0EwlHhbsdeNn/frmlI8aC6Hs3Zi6bCsawgIilx/
X-Gm-Gg: ASbGncux8JCCWFYVoAjv8TkQWAsU44/wVhuWB40XYSG+o7uSKe35kiwkzZ1JuhCX9dK
	v1HmhShr0lBmG8m2VeORGY5huUGNhnM09Gvg77fAixij6PYPorxATfv7pb0IwgdW+N+kX/T8hlK
	ld2/vQ380I6XWIGFOTNgt3c52S0GORHNN4wRpFgKnWg0qNAVID6DQAX26pSlpJUx2YZ0EcXo8Nw
	/OMHoQNy1IF6L1dL6EAuOx4FFOjPVmBRhEzZI++c9ugkYFU3UkLvFzPixYMz90sNqyFo9aIfpJm
	q82hve3aGQsiybp+zFPHrPDbX7HXfkD+1Y049jY1ekEANTEfeAWedshFztU7/BFyzRiUIZITzFf
	N/CgR7tC8XJerelUQgh+VNx3xS58naSc9kJEkO/k+5PKRX8VdhHUwduHO1Wu3TWog7uEqZ1o=
X-Google-Smtp-Source: AGHT+IERovn1WpkCgp2RnRIKiHoSBcPgM+jDgXCMmojYzvNv7pJbG9y/wT4mAPjmmdF2ovwXuaOKSA==
X-Received: by 2002:a05:6102:162a:b0:4fb:de9e:6d87 with SMTP id ada2fe7eead31-4fdc2135299mr3310731137.11.1754311129345;
        Mon, 04 Aug 2025 05:38:49 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4b98sm2263164137.3.2025.08.04.05.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:38:48 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so3010392241.0;
        Mon, 04 Aug 2025 05:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAd6Y3gbIwv52TBPDPgIuHglx+c9fU+N61HErY9M+xCPq2KBXkELLvNsXzzSUps+pCzsSv2CV3RBE=@vger.kernel.org, AJvYcCUGTcbGHVEQOIwKglPiGE73TajHcdrP0J4PZFIhJXbv/G1yrA6PAhA27EdQ6epzs3JMCenD1HbAf62BD85S@vger.kernel.org, AJvYcCUsYhqEvlZAQmiCu6ZfJPbPhKku9XxhG1Mv6IVaqA42aDiLZapetg7ygCRfhwqLLOyn54qF32vpjMSLzllrN3rtzls=@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4df:4a04:8d5e with SMTP id
 ada2fe7eead31-4fdc203e703mr3232319137.8.1754311128643; Mon, 04 Aug 2025
 05:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com> <20250801084825.471011-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250801084825.471011-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 14:38:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQWL_3R9D0-oB1Ke0xSDWsA_=tXaFN14N=iGGDx9QO7w@mail.gmail.com>
X-Gm-Features: Ac12FXxFI7NGW6mc7-0lLglNRzDoBUvWdnin04p7KWDuqU98UcQ_A3M9ztvkdFc
Message-ID: <CAMuHMdVQWL_3R9D0-oB1Ke0xSDWsA_=tXaFN14N=iGGDx9QO7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g047: Add entries for the DMACs
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Aug 2025 at 10:48, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/G3E DMAC IPs
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

