Return-Path: <linux-renesas-soc+bounces-33593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EO8CFi1/IWroHQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:35:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0B64062D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:35:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DEFDA30497AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D85E27707;
	Thu,  4 Jun 2026 13:35:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976747B42F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 13:35:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580136; cv=none; b=Wd94BenFeNOD/QywUy/EkfPMLsHFNF4uYtpuYuVn/Iv2Vp4kwxqo9TQD5vA7X9rpQo1PUCU/cfSJcgzXeDDb/czIVTyWtdICKy3O43VL1M8/Z0lPpGA5bTxMklHBRmERT59QPluXrXiqKc+p8bXGF/tqeEjX/Mij7qo/XoYYXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580136; c=relaxed/simple;
	bh=DlMJy/HbD7sdsoaWTVD2xSFGx5uxnG9kR+usD6eKtlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9JZXIj/I86rS8dZDNXbCVva+Z+QqUIr2o2TUoKLvPxyWZaGdazf3CEiH+owlCQ3VF2+XthEcjkEXkBXtYrrPx4pn0E0yfKNSxjkYvsVchh4xjAwmYwep+7iCl34p3D0vW0PLwABok0GAttG2JV7eTOhDv+6inP2dIo/6e8wi1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59bbe027424so558870e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580133; x=1781184933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeesPihQRAsowNF4S9BH5xHDdN+c+plhMp2PuD8yPAU=;
        b=kjNxnJtY/MimOGlI0SqPr1qkEUTm2N38a7HP/vIj5GJgSjljBOAOGes5t9nW+bPWYg
         WkyYxgFOl87orh2N6qvOu0Q7lzXCb9e7zXUHj7h3kTPKOb9vpRQuSbbRdhF2UAbot9YL
         KUM3u0W+0F8bTb0zIvDKhHEeBsS8+TxRTyyDLPUp3FRtfdKPfFQkaUuVazCeupYDRPVd
         0v6unt1E7kRZHYPM9ts38caQwPir92PRkHyoXImmaYTW+KhZ7/tSblCbGynFpwOR9nSi
         1xJ4Sz5sAMp8tBtbD5JyCULS8QJQmrqoSw1Gtpi2tG5HTsA4attDaW2AmU7suNMnxGs2
         lIfQ==
X-Forwarded-Encrypted: i=1; AFNElJ97wh8eSxF6aQ7r4Pt/thXY4cSEVp/Iir4tTckmfOW9G4FbyiYPfqfEShFtx8gOTe8SU8/KJUbtk7NzWiVVfwD3OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxcLxGf4rSNp+2GV1n4BAz9sr4WtLBa+6lmZtaLYq52KCZ0gF9
	U6O4TUlDasnMRepu4DSbhP1TkMgDppw2fiOYOf4IwWSDg1QUa15aMRskpMzS2k0nlcc=
X-Gm-Gg: Acq92OHAbtVkwGKxN7PsJmXhyghyalPT0KaEDmvqzUd6/wXElNmfQuC2tRdcT/L8I0t
	LPzgpnwcNs0bLMp+aHeSX46TZPn9aGifo0qQzIy8AGzA52yJP/1XPkP8TmEfaSWdo67s1IwYroa
	LoZ7Ws+PC5hS/tp9V+Ju5bQBbpMiihDu8hs/Q2dMY1IlMlXa+WZk9F6DLITI1tr3VOXoM0qsWJZ
	+3TmtxIEHmkcykxz8DP3C0/c95JVWRkDE8+7KKPvQb7OQJrvV7/CMMAiX4IeFnPFGcGPfpdOWjk
	6DeXCyUlvFICPo77lDQwJ+RX0xcQP1j+OWtnHGrYP5K6EeucDqnPRnDzfjuojOcOy493RvdGUV5
	PPfjOWD7CmcAClcj4LykQZwCNzVE6mKHWYjnPALH384vEK8h+9zS1KzfFltu8dqAeDYRg6C479c
	KgXG7/3l8mYHGEYf6cBUHhvC9iOsSzWAkLSxj9v+CahXNh0FPu8/JDopUP3X66pwRri8vC9pvjM
	bI=
X-Received: by 2002:a05:6122:2a45:b0:5a0:2018:4dfa with SMTP id 71dfb90a1353d-5a6e42800e7mr4945208e0c.3.1780580132983;
        Thu, 04 Jun 2026 06:35:32 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d777996csm5007459e0c.7.2026.06.04.06.35.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:35:31 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5873983d19eso659406e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:35:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+g3lE+85gcY4vpRgD/KTtZzEa27fqttqc76ab2WgsZJLvJ4+UCFiatlJnQbAVeD/0WBRF4my5VMv4rxfgbOMNGrg==@vger.kernel.org
X-Received: by 2002:a05:6123:142:b0:588:2fc:f169 with SMTP id
 71dfb90a1353d-5a6e90e544amr5469012e0c.13.1780580130987; Thu, 04 Jun 2026
 06:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:35:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
X-Gm-Features: AVVi8CdIzcWNzyVXA_Tw_6icOkxcSEk37xtaCQR10UrJHR4-KQNi5o_SyT4ZfIA
Message-ID: <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33593-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05E0B64062D

Hi Prabhakar,

On Thu, 28 May 2026 at 15:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the gmac1 (ETH3) and gmac2 (ETH2) pin configurations on the
> RZ/T2H and RZ/N2H EVK boards to comply with the electrical specifications
> defined in Table 58.11 of the hardware user manual.
>
> While restructuring the nodes into pin groups, fix a copy-paste comment
> typo in the RZ/N2H device tree where the ETH3_TXD1 pin mux configuration
> was mistakenly labeled as ETH3_TXD0.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -258,23 +258,54 @@ can0_pins: can0-pins {
>          *
>          * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
>          */
> -       gmac1_pins: gmac1-pins {
> -               pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
> -                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> +       gmac1_pins: gmac1-group {
> +               txclk-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
> +                       drive-strength-microamp = <11800>;
> +                       slew-rate = <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               txd-en-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                                <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> +                                <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                                <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                                <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
> +                       drive-strength-microamp = <11800>;
> +                       slew-rate = <1>;
> +               };
> +
> +               rx-pins {

I guess you want me to sort all subnodes while applying? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

