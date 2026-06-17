Return-Path: <linux-renesas-soc+bounces-34125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q30zGSpwMmrrzwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:00:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E369831A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:00:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFAA83030B54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F213CAE7F;
	Wed, 17 Jun 2026 09:51:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B3F3C3C0E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 09:51:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689889; cv=none; b=D0Loz9ER3uRdKylGPP0RWu2pzdHzugRxr0hM6LHzLSlqCWdg03FM8t9qhMNgZ843arFu893c45r6DktptTy3OoK3MDpBeKEEghLXi+wQWzw+MKq2tJnFoBqlu1vVfaWKi5mWeSxDjfZibrAoR9qnu2aYfulymaDjLj5jbK3dpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689889; c=relaxed/simple;
	bh=jP5ExbFfsnARbi1hQgzABvYQm048KE6u4XKnezIt6f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtJ5l1uArONk9c1m1oAFDS0dZ1uKeUKbvn2VcN+VL795IUFZGkVyiLis8j2cjaJ/bbjckn2Vha0TAD8nCUDDB1sLaf0HR9G4Rh3Rsx+7JuzE92jpNvD8GSx6zXAomOjeXe1yO8DvtpPQcjHH9CSvKA53gwG3agsQidVh1+uZT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c3154fa47fso4244960137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689887; x=1782294687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHipzLKixYX8/nI/Atoa1w9c10s6+nrRqAvRxdIc4Bo=;
        b=fpyR0F/9Vr4fiK5DD9jIRq3gul04U0z5x65bhl5lIhnss8aaWq0tnWhbK9UrbVwlNZ
         0krcT7shn2DAxbxT344geh7PAthA5EqdPJZJeY3ZBaqP/0LVUvxJYg5NSGQSMRg6kKz7
         Y88l10qIK3Im9Vly1KDBvkCfnW/18FQyYg3uDlrbECQrph2R+D5QrZmXfKslq+Pfbl+J
         iW5BdgTMS4Znzgpg+A/7JNLI0bakzXvXOm6cuxfigi6f25pny8Eu98b1WSOer5nZLTH8
         oE1o9WNQAK05DH8wUCTqpKJaSjwnspzBQPHi7Zotwe8gJWmddrPuBOXCEhd9+/HMl0gU
         ZOEg==
X-Forwarded-Encrypted: i=1; AFNElJ96/R0SujGCnuAn0li0bEIuvFkSm1j8HKI73HEDPdwoLqExTJKPTlTgDxBQcIVBFNMqAT2Da8riFKHJfEY4Su4v4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyc8c0YgRPU9VWQ8yPPCbMhO0aImYfbfqUHY0nnu8pP66LtLaD
	uTi0N7CUIYyAzGT/MCNPbxyD1C3H9Jmzjk4NfQRquL0fOJCNiQBExEMF+uICocQu
X-Gm-Gg: Acq92OEENsile8dwGmkP187CXfmU6/iEUBnlGKg1rQuaCh/QaXDD1EUeVN4NNXFxiTS
	xKaSY4YKeal4tKaVdRXqNoJhd+p55geeKeuo9y2n99ppKW1t0IoKBuZRWvdbei8Q1cZgygCwTCb
	P5puPZ0nRn9zHyEQMMwwDjKO74Bhqw9Oz/nSau6Z+Oj+aJZckFIAn3gLUPFLkVAi3JiYyrTDYvg
	7/seNpRLDXIjp4oLlksJS9LSLLrBdSdQsY/Ll6pyUCCO1dYfARc/CMRRFRzUzqkqM5ACu/TY1+A
	GDgnFuvMCGSKJi0pv6mnx4sn3I2x+LVaiZK6YzlJt3A1VfGI9CDZ6CX0k/+VImy1bH4+qfAbdFU
	lnhVHY+CBc6ALNVFNQdf99WReDeJgLE76K7qQATTtGfkIX8elBrOZOUACJ28KMQYQkygK9MHD5q
	m9ULVjBELRePmgMDhHLwUPFliJg30GqABYC0KuCWG/YpGRDRAU0A==
X-Received: by 2002:a05:6102:374c:b0:6c1:85f8:29b3 with SMTP id ada2fe7eead31-7245d206e3dmr1531212137.6.1781689886947;
        Wed, 17 Jun 2026 02:51:26 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878872efsm6868351137.12.2026.06.17.02.51.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:51:25 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6c3154fa47fso4244938137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:51:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SONcEUbZqhemvl3k1b+nfqjV6UiPMdyadwi5rG83CWg3ardPjzwFwZNTbZeVMMYI8fEs3oUPXqNexJBEjFKh08A==@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:6c1:85f8:29b3 with SMTP id
 ada2fe7eead31-7245d206e3dmr1531191137.6.1781689885289; Wed, 17 Jun 2026
 02:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyHqrRZRx_CVpL2JiiRrjJWpJK494TwcetUu3aOvWoejYL7P2mBGPpsc4
Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
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
	TAGGED_FROM(0.00)[bounces-34125-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,microchip.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,vger.kernel.org:from_smtp,renesas.com:email,microchip.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B9E369831A

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in a branch shared by renesas-clk and renesas-dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

