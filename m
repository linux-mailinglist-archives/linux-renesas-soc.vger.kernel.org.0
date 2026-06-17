Return-Path: <linux-renesas-soc+bounces-34136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x4AtKkV5MmoQ0gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:39:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F7698941
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D05A3035BA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0E744CF29;
	Wed, 17 Jun 2026 10:35:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C43F9A01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:35:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692533; cv=none; b=lcn4AktENMOcn72ajiRrmo0bvTsnufpeUV72uHV7Pf3yqVnwBc3+/fSAwyF3eUwYwKC0BTNyj78qvl9+yqI599F+kHpUVlqJefatNooSiCqXt7MbfAPaLaTok/VERCJ4pohGOWez6lNMdBBC07Uq/oR2AOfJPwg1UUgJYYAaflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692533; c=relaxed/simple;
	bh=9ylgy9lZAnEGisGJJ+K92s4diTRd1QMOEi60uc8E6F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d59M1dnyO87cpFMaVNmg3AorV5h2Qp6PikksqAPRP3wt47v+peW+Gm1zRD6yXrNereMvRSb9PRs35msaOotKBjHZxClpGOcHpUIP4qFtb9S6Xnu/W97lUz00y4VIqr6eWbdgizXGc31m5NZrOR2DG5qAr/ice/ciJZZKnxIjH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6c25b040555so4588398137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pgCUfOUM8Bz0qgtgoN+MxhTmTdVfQlveU2gE10ABVfs=;
        b=Jj6cgPLj9ABuBNkrQT1qBDyZbWlUnWr4VOgGmjIFLl2f7BXN5wKMdvov1q5QVI3MQr
         HaZlOhkehZtWH2ywtuhkMsoCQX/sVHmnfNDoajGvfotIGmypmtbyKCt2+C5YKmXXwDui
         67PCKnnOeBuv8Xpcw7CzgimTTEJ08maMHewHEvxAaSUr88PI6kZ57PYWe4Js3tZT3ImM
         yErtk379UwEOPh29NG9TrMe6GPJHd6lWdkLOaqGqC9i4YXudzHYnZHyxiXm56PGTvtpz
         3gkKE+wQXntQHQcQBNxRs3BvOWuHsWIBUy8Ni/bqOBRNSox6On/48mysys4xtKOA7YUm
         nGog==
X-Forwarded-Encrypted: i=1; AFNElJ/VGGEj3PTBi/k1p1GV/K7tfAepdkxVXXWcu0BkWXpLbcXJivKwSt9qDQFdp95RJukX0BOHjiNXBP4lbMuEYHMxtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPpYGpKnlPs5a/pGGkFwOeMn7lIKVmPXVnrmRLzaj50cIvXFu
	iweCikZKTGRdoqKvAdy9HZRPFqYlgz0xPSA9FLhNinxzbBpB6w+71P/Cxfnw1awo
X-Gm-Gg: AfdE7cm6ZJVshjT4OeYRbYxYh94qBOOjwOvkVuOAwuQWn1t5eHTmRSnUF1OwER5jWLb
	uw4MwCPeJo1iqB3ldr0VpY3w6hBjklTrYzlNNpDfk6Sek33JGD3i4YKKmPlNL5T8VlvyWx2MZbn
	4ILLNI7KTDZ9XdEOX7Ri2DRErbKRkInxpzyMY4kO56xnMQCzBlSVMRC87lgf+wFmiMDshYEBrYC
	TVHpBw2Do/usEk42YGl0Zp6FfcvJKKDhY4N2ZHVqHNdztF0tF1xP2Awah7UL62wl+YvKOL8L0vY
	USJ6ABPA1JT6Lir2Mn477UzBeJQUJ5rDD+BN8KC6VENETa0GFzQz9+mT1zHACgiDZTYvD7Jggrn
	jbHCBMbKnhMl4KvO5sHF0Hzta2rAItX/z0U0nVRKYncmT6Y+KEXiEuOn/r7UjonjVjqLepqjGvO
	8d7ARDDekbHxAY1YyA28FKlh0995UChOlRr1QZILjsGfvmowg2Pw==
X-Received: by 2002:a05:6102:4421:b0:62f:5908:648a with SMTP id ada2fe7eead31-7246da56addmr1572773137.28.1781692529265;
        Wed, 17 Jun 2026 03:35:29 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72084dd24cbsm6850976137.5.2026.06.17.03.35.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-72695bd3ba9so113357137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9h+3LXJAh2U/BTcQAFUdIvi8rijKPYcJlcGWLftQzt762f0sLN/5q8ozxNdQgX/2Jpy5Zix4Fm5EwyGt1G+foogQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a07:b0:631:4e9a:ba3 with SMTP id
 ada2fe7eead31-7246d325006mr1751407137.21.1781692528474; Wed, 17 Jun 2026
 03:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:35:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViTA80owpdLHtRhkO8i+jEDeMbnAgW42J6=R3QnmSUNg@mail.gmail.com>
X-Gm-Features: AVVi8CdA-Rr1oirE4y8pzhWsdywdxCE34hLjlnylVEjM69RqnaDVji3Jg_h6afs
Message-ID: <CAMuHMdViTA80owpdLHtRhkO8i+jEDeMbnAgW42J6=R3QnmSUNg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a77995: Add ZG and 3DGE support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34136-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,ragnatech.se:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D8F7698941

Hi Niklas,

On Tue, 16 Jun 2026 at 19:53, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Fix the ZG parent and clock divider are not fixed, but configurable
>   through the FRQCRB.ZGFC register bit field

Thanks for the update!

> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] _=
_initconst =3D {
>         /* Core Clock Outputs */
>         DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
>         DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
> +       DEF_GEN3_Z("zg",       R8A77995_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_=
PLL0D3, 1, 24),

You cannot use the existing CLK_TYPE_GEN3_ZG for R-Car D3 (and E3),
as the FRQCRB.ZGFC register bit field does not configure not a simple
linear divider, but selects between multiple parents and divider values.

>         DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
>         DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
>         DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

