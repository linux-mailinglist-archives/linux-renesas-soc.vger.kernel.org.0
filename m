Return-Path: <linux-renesas-soc+bounces-35029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ugRFBvHUGrj4wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:19:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B632A739994
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:19:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 635153020EB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFB4403EAE;
	Fri, 10 Jul 2026 10:15:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330343FF1A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 10:14:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678500; cv=none; b=tg3pv3M+8EASAwUI7u8UY6IAI46cHy6fFKzaPYavtHXWihiYXzYEWJEMbEp+mJ6CWZgFNvIGnlEFaBlJxlBjl6S1JlwSUetDTjs5SjyeeMXgf8x4YoXd+4gbMTErdo0/WxW37+cahlo4kIchYc5bv1U9eZkmPbw9+WrHoQcqzb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678500; c=relaxed/simple;
	bh=jStoTu7RQA8BRTqGbaAV34VwUP2BPEMz29vPuO1fGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOWImEEI4ux9jjGy1KJL7RhwmEy7ZCqVn5HI3fUOJq7GetbC9Lr4oPvSaVwxi8O5dpexf0310QUBpC21dsjej5wGhwTV/ktUeGw98HPXY4yEZnRtz4BCzMVwYKM0PrKxwzxwjpOSQ8k12ZpqESLK090HuUl7yYXdON/6Wdg2XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso574799e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678498; x=1784283298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GbEWAG6xIcV+3P2phIYnj4SrZfkvn8WstI+WFIFJ95k=;
        b=QeBJmeLtA4DjlJ0x20TM3ChnKq+mDa5aqwKfHwycJaCtFzUAzWVpw4o569/eNXFzK+
         +ZUxUl0zOqG8ejB1OHhGvbRe3eej0NMKKudiWBzXe7itMK07wvew8prOUkKUpcZvjaNV
         QIqtfQ/Q/RL4XPruqEqPB79H3Vt/z17vJFFIjtC9f7B2Q7GDVDcbLPsuLf98Ho5+NHYF
         WAslsJDWxHtaY21uIS65q3MP2ElpL3Lvvj0GoY7fw4PTa6Z8icoVZR0m+F46ze2WGDku
         JvmYt82jcSStF3ROFYToqMF2ECsICutzG7scSOS7baMckUEDNtLuZ6Zq8DqnLWyRTzay
         U6cw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ48ejwR6cSVa0hnKkT8gCRuA+llp9pu7+XEfTUPaD1IDhSYt5QrF9o5UKLylCHmrPF+dx5I8xdlyRCvTHIGiBvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwToxC45AojXDnBQ+oESh7Fa0p6qBzvEm4aKn/ErE/NfYozWlJj
	BcZgFfgHfWsbxz+fbyhau+9x4ZEQCEmH++axcAYEcpBcoYKQpVWTC7jnB57xMXE3HxU=
X-Gm-Gg: AfdE7cmYdJnihHW64ctTrlbWS+TTJ6tTVGJwYlqduuKXQu29JxkuFUWC1VVN/JofnOv
	cjm1B3Un91reUER9fqA3wn9CE437fGiTnlDHm5Usx3I8KzQ4SzlM01kWnGjQmCv6InFmlEZston
	BX+0HPb4NwnngXnWlHZm0DyYaupkY5Li+BnEUQE/CrJi6q/H9pYw6jbZOYRYe6O5gp3/7q7tgBl
	6YW2VTt226F+VjBjPIC2Iuw6LLHyG86Ma+S6tZOkDGLH1x7ihyllipIQ4mo1ay51Gw4yBKjkVmS
	YBMdM3OuRun/NiGprtnwxnYH1pTXJdtQwVGOHb1UoGmJEpii7iaYBYTlyj7ub2BilQVr0v2kgc7
	LuN6kwVsBxTWqn6xiE2sKHN/UQow7SCeAbtcZEaFrXjXBZbwAcpyPZsM4ehXkTXp/shmKUgi8yY
	ZVdlxL+g8fiUIgumn2mbAHZP4oR2Fr7B1iPFGTBzKtV4SZwftxgw==
X-Received: by 2002:a05:6122:4b8d:b0:5bf:6dd0:36d with SMTP id 71dfb90a1353d-5bfa49fbc0bmr1576357e0c.8.1783678497993;
        Fri, 10 Jul 2026 03:14:57 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfb10285c8sm339031e0c.9.2026.07.10.03.14.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:14:57 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-736eec08c43so661502137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rra0UAvQEwxgqjs3xDrpEVKwgc1iNVlniB/hlhuJ93FKgWLjToW8M/nF2y/+rMDQnBESCGlHjauQVxukB7CLAgqkg==@vger.kernel.org
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1278940137.3.1783678496645; Fri, 10 Jul 2026
 03:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:14:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
X-Gm-Features: AUfX_mxSD2HzC_Ku4zRdh3S4Ewoz9pnRW_48syvAhXfLnIrebj7osOYA05aUezc
Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35029-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-can@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,baylibre.com,redhat.com,bp.renesas.com,renesas.com,tuxon.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,tuxon.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B632A739994

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 128 acceptance filters, compared to 64 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - forbid renesas,no-can-fd and renesas,fd-only since the IP supports
>   only CAN-FD; for this didn't collect Biju's tag

Thanks for the update!

> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> @@ -267,6 +267,7 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a09g077-canfd
> +              - renesas,r9a08g045-canfd

Please preserve sort order (alphabetical).

>                - renesas,rcar-gen3-canfd
>                - renesas,rzg2l-canfd
>      then:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

