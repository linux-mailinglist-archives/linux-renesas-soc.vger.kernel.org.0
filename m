Return-Path: <linux-renesas-soc+bounces-34133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/w+Lpl3Mmqw0QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:31:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0831698840
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:31:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D42FF3086162
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FC33F4125;
	Wed, 17 Jun 2026 10:20:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F339FCCD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691600; cv=none; b=Kq0225Z4z7IyqOuPOYlQspyGS26Io+lanhGBJBGC1TNXH6tyAGkPqrCNaNpkQNGcW6VcRSN+uaFeii3G9C2hTbPR6FHNvc5ajUoz9iZY021oRnoApfotnbqZypufyHYCobjBBPjjEc75tDXuM1Q9lEUNnavdnNJ+6bTCmLfR/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691600; c=relaxed/simple;
	bh=fhhVqur+2oyADwXnCGlIiz3wYgJIfSyj6S2t50E6LsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UecWE6F2wxQ9t6XgQ6VbXTgpe+zhGfg4G5DKRSnx5ZXmTyk3ritPmunacp8CB/chv7oHBBiT2iZcpAvDzWeH8ZtJyuH1yivNlYgnZ0dlEoJfeQJxzbvTg/RUVJ9JD063JLGemYM/fTI+3UJ5qgUAtpsVKqaM1N2g7PyKmVQcIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c5ac3fa819so1864457137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691594; x=1782296394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbhigZJZc2KejwaKau8dWpZN526FbWqjZpYcysnO3xI=;
        b=ml8flaCoE3yighAOyDM/BZCagign5SnCYTeYN7YhLGa3wQrLhNbFQTc3XOTBOg/ql+
         QYOSOoQ52j7EmCXnBrHyVlMf6ucc3Xs8o6/e+M+khjtYofl6XLgStykjjli0dL0V98I7
         1DhwmorTAA7NO7+8VW+1sSdSkgu2K93WNa2O6HKDBZTp4is2lZawBx5ZKVpAnDA8T403
         M3GsKTJ8kVwuSsf6mAYtTKAnL0SOg4vtgekUyx5A4S6pV7QxT2gT3MOXRVgGp26IdfYX
         vpLMy8Grsy8Tqsms3d5UAuJa2UdGAljbf/5tu16LEQhIb/k1uewyGK5sNH7n/pqxJWKx
         Pphw==
X-Forwarded-Encrypted: i=1; AFNElJ9RsTPdCW4CVBwXWlNZlvI/a1vg4+wQB6ggT7y8buErM7YhOybIVIqxZY8GfW7eA9yyKiPH18eFB1OdZKb/WkYzag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHH/XJ0P7z0g1+C/50xrdfdpr9/B1NzMHK35odeonzYuOAKw6
	3qTDVwQ1BCa3CZiSn4ezzQLZBeKnLwclamwABsuUZWR9MrpQb81gL4WIZsvwSYpZ
X-Gm-Gg: AfdE7cn3TGgM3+gU4XTjDXJgAOs8U4KCUYeZlcwnL8m39WzsUCzsu8TYZXat4GNIU7C
	KVSnm4ObwWBUa/We3u9HXuGLq9gDKXgduW2DJojsWibX0F/0RrZVUZV/sDl2mwqmD5B8QbrJv2j
	nPaAOenskI6otw3w2ycFQZtHp2gueF3qOTdEPNvbU3RNlKzA9zDPDj8u9Dox/QnB574PijKchzW
	I6SVOnBL31wudVeBlbJBUFlxmeDLc8om2gOcc15mw0VVHfyPqO3KneQ4aK92Zs33PCAZ1QkYVFs
	eyc5UoNHEtv6W6ksLiCaJGSxRezaL+eyus5DYLMsC++ZK8pjAzddNFZQwSxdGInbdg+qQYKERmg
	TelyldUz3IwkqTT9ijlrYOu6kvps72w0jdXbOFLmgW1/v5edTXSsEFiRK3JdP0jvINZw5mRONZd
	gJPCf0MzOehh3jDgqJe5l223OMZopi/+GpmZupfnyGruWYbZnwEA==
X-Received: by 2002:a05:6102:5110:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-7245d75a012mr1516169137.8.1781691594460;
        Wed, 17 Jun 2026 03:19:54 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966c5b6389asm2921738241.13.2026.06.17.03.19.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-961556c15ceso1638829241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UDxeIHOp+4BI9hLyWg78xUu/xfFc3OUg6uUIdvpl2XXV1CqO/eyVvWEM97Ayg39koffK//r18yRsRvrYKVoI0OA==@vger.kernel.org
X-Received: by 2002:a05:6102:f95:b0:631:af51:7d8e with SMTP id
 ada2fe7eead31-7246c886ef2mr1476763137.17.1781691592901; Wed, 17 Jun 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:19:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
X-Gm-Features: AVVi8CdHxDV0xPCDU1TgXe-cGUQHmtLwiKcsibD6yTiuMTrRlEAumDcsx_2I-f4
Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34133-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0831698840

Hi Prabhakar,

Thanks for your patch!

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
> on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Note that the LCDC_CLKD clock is utilized as the operating clock source

PCLKRTC

> for the RTC IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-dts
with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

