Return-Path: <linux-renesas-soc+bounces-32252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO3iKvWe/GkMSAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:17:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CFE4E9F8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5908E303B91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7B3410D1C;
	Thu,  7 May 2026 14:13:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8940F8DE;
	Thu,  7 May 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163182; cv=none; b=Z2v1DWu/l3j8AcIOWxuYIql5M4QcPEsZ7mf+3FV/3LeVeKZTpaup1+RH+u09CP533A+voWSh/NiRrVVlvRDijRULcSyiiAuSMXsCTz2OGQgIeqUBh82TIR/DBgtZVVKc36VKr1BIvmsxK604SPbQgEifrpZiDylVOiaKR6OG3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163182; c=relaxed/simple;
	bh=qO+TPGjPyIU90fyNONfH8qQZWNpD/rEJEKB057F0kQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSFXyEPFOsyy0wRx/C0HW6dM7O8RoCrB6dIQ9Uekf13wuEM2F54EJ3DS0CG0F46y51PgDWphQxp8YRHcRTwssc687224sZDyI1Rb8mTabG5hkXdcfpiAFhzrKvnuR3kx+zL9J81GeDHHtQXilqD4UtH//tBdtYR8Imhs4a/UY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2085CC2BCB2;
	Thu,  7 May 2026 14:12:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	robh@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCh v3 1/8] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
Date: Thu,  7 May 2026 16:12:57 +0200
Message-ID: <20260507141257.436456-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-2-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12CFE4E9F8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32252-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

	Hi John,

On Thu,  2 Apr 2026 18:31:19, John Madieu wrote:
> RZ/V2H, RZ/V2N, and RZ/G3E support external audio clock inputs
> (AUDIO_CLKA, AUDIO_CLKB, AUDIO_CLKC) that can be used by the Audio Clock
> Generator (ADG) to derive internal audio clocks. These clocks are optional
> and their frequencies are set by the board.
> 
> Update the bindings to allow these optional clocks for all RZ/V2H family
> SoCs.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -26,16 +26,24 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: AUDIO_EXTAL clock input
>        - description: RTXIN clock input
>        - description: QEXTAL clock input
> +      - description: AUDIO_CLKA clock input

There AUDIO_CLKA clock is provided through the existing AUDIO_EXTAL
input.

> +      - description: AUDIO_CLKB clock input
> +      - description: AUDIO_CLKC clock input
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: audio_extal
>        - const: rtxin
>        - const: qextal
> +      - const: audio_clka
> +      - const: audio_clkb
> +      - const: audio_clkc
>  
>    '#clock-cells':
>      description: |

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

