Return-Path: <linux-renesas-soc+bounces-34302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O4/KH4UyOWpqoQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:03:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DB6AFA29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:03:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 893CC300B467
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EB73AFAE0;
	Mon, 22 Jun 2026 13:02:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D23AEF47
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:02:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133379; cv=none; b=I8NiqJ06+j61R2rJwPpT7Or62UpFxM9qVzBLHeoV8GN+JGKpewKP+Mg5+Tlk6IDECvP27wNvzX0FJvQneykse697KAD5bgLy0OI67RD09QKe4YRLBKkVLFIxAQEUJIzdXaA+T/zboJs2CAGCROeCnU9884fE8kFli6AyS9zKDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133379; c=relaxed/simple;
	bh=vpZ9OKBxRaFankypZ6LbMStZQAMty0CYmOmvVJLTcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0b2U8nB/IOH++oP65yfKC6TyRHiOqlumvd6Ihj8F7n+5j1KTPptk0QKcHfyjcmkprDl3M/Q4Hzz0fUjzFfzJXnrKukHr4Uu2/FmXAl/sZL+nd1wtMijUeo1Zn/eYz1OvNRiHl76uX0C29KQ9VSqDRvQY4bFbmw8+SGRZVS8//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c0868ca8738so484341666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133377; x=1782738177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9wtzqvmTPlyh3hNxuU2x4nVM8ZntPzt7m+UykQwrGE=;
        b=apQ2qc7Q4obKflIPHZ/zSSZettWz5K+gF6d+6ocoZUrgaJmymFI+D1395BFtvW4oyt
         crcUKZ4LtIh8GzzqRUfooNkkh4mHXpyTG4uI371Jqnpdw9H9rSE2lsw1hGoudkY6yoP8
         91qIV5LbooRqrQzR5bGcjRB4bVkvNe3TuEizRf7Fp18Nzda7FKBhdnQtuIBS0QxlInmF
         POLKjfHAtf0Gw2SUu3JAHJsqiqUShincweCNjqvA4Fwkec0wEmEJc0kUA+t5lLoh9dXp
         4vCdte0iZaMcNU2HAwKUePiZpsBvLaKx00eVzHLZrrjs1IUdeRG7h4bx6z+6v7IxP3Cz
         6awg==
X-Forwarded-Encrypted: i=1; AFNElJ/yOTW7RAL+wessAzPRPyb7x5Ug2XVn7EIH3sZFmWEmHt/bK+9hvvW72dA/iPXvL0vfNDPLtaX3q5vEJR1JwnucMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf8hub5oSYS/VdD23pHDJ0rTGwJYw+XE8Ze/SjCdnRQqeKJsZb
	zLzxnMuHeCJ9HSBCj1BSR79/mjtf9o1fJZc5tri/7vy5zr7hY2XquePQdIaOo1J9YI4=
X-Gm-Gg: AfdE7cl7c/7gPEUvF3GYCMfd+t6UsRqvW4fyF+nsxyfYKCpl7G8IRTadkU7bWVSuiKe
	BBrxEU47p/9JteVT7No2+Z/139/bokICfzp3MssJgmLkd32wnapHW+IdOV6YbzRCz2Vj1oQ3J12
	LpCgu3vZQy8Tht8PDTdPA6tjG2FaddqG71KI7iF5DBCclfoxs6qmoFKSzqGBNM8jeuOwG+RePCF
	cBIeYXkQ3Uy/fsV9h7iKT+JFskFSZngx4r/t8cjOStJgROrva2dydVIk2DxwwLbk4UZBI3MgCIT
	fWXuylieeo1Si78Q2puNnkBoWtNYKXwafzN5NMt8x82eOth+lW9vdMqKWH851PyLcAwEb+Y//8c
	fH3lKBgC3wSN3VVx7t9txiYURSAOwolsoNw+k1BAkgsneePok2KZjxyRsreGCJpqrPpRPzmjDY0
	yqPSWj8Dpgqo3fPClTPEjMAOU7/pCTG9znQuG7hjATk5EdGHs/AA==
X-Received: by 2002:a17:906:ef07:b0:c0f:de3c:dce with SMTP id a640c23a62f3a-c0fde3c0e53mr58969166b.41.1782133371674;
        Mon, 22 Jun 2026 06:02:51 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0ff4c9610bsm16883066b.42.2026.06.22.06.02.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:02:42 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697ad7f663cso1499856a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pznfFDJjxG5iRp/uLl3NiiGzrx9WmXaSAVbaJkxeWkDM2CJ03a8IQsBp3INyaudupRFF02qy33IhTKzGlM0s7wQ==@vger.kernel.org
X-Received: by 2002:a05:6402:3548:b0:695:837d:529f with SMTP id
 4fb4d7f45d1cf-696e5221662mr7072149a12.20.1782133339417; Mon, 22 Jun 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
X-Gm-Features: AVVi8CfgIAfwOmCE6zZuFwVKPTX86BS9YPtcpPMAwipkZXEClLrZPjNAjwEsi_c
Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] clk: renesas: Extract RZ/V2H PLL calculation
 helpers into shared library
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34302-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 208DB6AFA29

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the RZ/V2H PLL and divider parameter calculation helpers from
> rzv2h-cpg.c into a new reusable library.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig symbol and add
> rzv2h-cpg-lib.c to host the PLL parameter search algorithms currently
> implemented by rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars().
> Export the helpers as rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars() for use by other drivers.
>
> Update the public clock header to expose the new interfaces and provide
> compatibility aliases for the existing helper names, avoiding build
> breakage for current users while allowing future conversions to the new
> API.
>
> This prepares for reuse of the PLL and divider calculation logic by
> other Renesas clock drivers, including upcoming RZ/T2H and RZ/N2H CPG
> support, without duplicating the implementation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

