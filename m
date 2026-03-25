Return-Path: <linux-renesas-soc+bounces-30210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJEzFU+uw2nAtAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:43:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C350322636
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93236305ABA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D53739B94A;
	Wed, 25 Mar 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFYZZxjH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73230E857
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431819; cv=pass; b=CtE8PugoJmSPvTFTy1W0bE34h9/KbxFb6GSMGeB7bQ+bYfvv7DTnozAWW1PiFv4KNKgieL0WFuqJJATHR9xiYivZ/rhCLHyHyCxG5qo3d3xUstfQ+5JxAZ0tYVWyqZdHAK1/+t53YfvABRwKt2bPBIWpZ+3wE20KNGSIQhz2zVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431819; c=relaxed/simple;
	bh=ec+NdA3zHGUESIcSYiIluqbC7orAYPTkxLb4Lo7OT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Emfl5Fb/tSrhrgpj3rhbNZP4nIg40BH/7xsX3rln7eJNc+gtpDAuTXn4nVD1RJVA8eDMrSKjvDUMkN+BLPD+0vArzs6cKHfo6XGZRYLY+30BEJem1VBbvTp+9vMZUc1jhaMT6Y///EBQBNCSTfZfyUUZ5KF/emnh0s0cYCReltU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFYZZxjH; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3101468f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 02:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431816; cv=none;
        d=google.com; s=arc-20240605;
        b=P9MeA1AIOKlGFVvXt4iRucUd0r6BlumQdXRFEsd0bj4T8PLk2NqfaG6JyOsVQTYWhw
         WaNvhqAwXvwnjGLOxys9lCXwE/T9ze1YLwXbBycIJuOyVTPCL8duwnkbHbBJje+39jnf
         MdAmdhqPInqECTL9W3F9ud2S+udbjO8t6+KdP6pISUJ5hAEdSPOIwwf5WGSKj1JoiYZD
         Ib7dT2dMMHWEAGtqxx+ymWbpc7ecRcildiCZ5FVtK91n8Nv3gFH3HKWo+1JnYOgnBuFe
         zwws+l6GdLGl8xMtCrfh7rVGKWeXF87ic7u0WHOj5lZjbAoNYv7Q/BkOf796dGnUqaEA
         rzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        fh=v14pb4L3Ur3/S2UnEhuHsR1NJn6fy70iv/VshFH9yP4=;
        b=PaJueOj6DvAPm9eh4TQcRSDGgxcPIzd2QHAl66wD4zwtXcufSCfq30n3MenGGFEy9R
         Gsi0U4/MuljMYW13QTF5QFcGRb/FqKX98mf9fGWoiVh8d8QqigFMcJ8iASfmJAZDA5f2
         gBvAcsQyJQDk1C3FXS8O7o8qHYpzWCQS4UhpRdWkIAXCU1+ae8XMuHu7kENzBiqhZXkN
         kGk84R4EbAJT1PGm53ip9jQhqkGfHDRLeZHtnYAbqQFH8hhZ09R9uSFz/kdiazkdsEGN
         JOXsVagHTglRv89k1UPqK/XSkYqrvG0C0WSt/r1OPgUjBovsfHceAbyH6fbUB3oF0B4b
         uRaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431816; x=1775036616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=oFYZZxjHE2EV56fYMyNZ7a/ip4CWRTyYqoS1EJe27BLAdI2INxdFA4xFKi3Oue6M0W
         TymzRVtMz82pkOpWQhYOE8Dh6nF0yUYxF53KrIwCXUp2zWw3/RH4vkp34tqaNi7GPjOQ
         NHXudRZYiGb1rLfd+8Pp6zVQ5UdYbk86dbCctLqWIme6o2y/CPGe5TZu6nJ5Xfeed/Eb
         T2sKbDfzUTI/uqK0QWqnd4NF9/ai6tU1Wiem6+/GWQHximKph5OQb4HrfxYexeE1YKJh
         6AidGlxm4WvVvzWCkJwd876ODBVgkM693+4nR/swI4d2DnlALcnUTZqF9CUbodS+z6jr
         p33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431816; x=1775036616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=RqLwAwE4yaRfF+X3Iez8Qao5iTE4jSlDBRTiSjvHTTPLQYIQHKXPNGcTE1QYyGkcYl
         fUXJ3wYqKrCLqPAZITt8PIU61tNgxbTF3dfCvUs5mTPFywANWri+Drv8zFMm0QuXWUMG
         GQoaKN8mfgWO6/O5lJLrUoTKTJkKVOVWDhDRsbVdNIaKn/0c6FCv72PRDtms3TcC92s6
         BFReMRuRVVJ89KKRe6iD8BApJQoVRvgkfiOZwHTmKMrA7wKs2aAEDyGUdC/H5YwRRees
         oCgP1Ef1t4FeNvJYmnmrhToPHFPfTwb9cFr4Wuw29TaFuvtJrDierSWHQRikzWMWUMFi
         Vzog==
X-Forwarded-Encrypted: i=1; AJvYcCXQamGk6tDHhKi40ZZjaP+ldFwTpXbY/YDY5q0fa/B8VmfCPlo0aw1snNZJAx2ScwnX/JwEQjTn+o3n7xb/XwzTSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCbl8he5VZeQL1fTlv74nmSqrcXMkCld4AWreA6aFnAYcAhMs
	E8tea4/CUMueAqKs9mwzKbQh/Z8jNYZw5UrZ2T/HdZygj3tWmI1U0Fm4rbT+U3rN0Fw6SM1Zkak
	esp0AhycLnPJm+pgHC4ZNpB7pH3uxOVA=
X-Gm-Gg: ATEYQzwfaVnFrQnpmo7J0w5Quw/c2EIw5eYVWvsMuLQPxyZY68mfrxQ8dEOXSu5kZca
	pZRGielj77eFf5ar751vU9626APf4DATrboS94usSctLOFSu8KlOEQKVybcjmcydYRX2Lh644hj
	YrMCLFM++53xX8VrJgLBWfvfFRuSS9h+HyQZ24gNjUrKedFC+rI5j2nMqmh/SSbsI+04QO6dAGL
	nWeET53kSUFrCIYvWhBzj7fJzSgPhDOMimP18Mv6YYo0vXr2M1AY7B2LMw8LYu4McIgl0uB74vp
	WwZFG1WS2df/3OLIpoNXxrXnswIwMBKOjs4tI4/HUiUSpmnqGRZeqR7cC1etFJuQNfzJVg==
X-Received: by 2002:a05:6000:18a5:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43b88a05091mr4247725f8f.34.1774431815552; Wed, 25 Mar 2026
 02:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:43:09 +0000
X-Gm-Features: AQROBzDFDTBtO3a_1v86L3_iqhrOnSlLOGOv1FeNaTZhn03Rr9fvIwgKgyBVauQ
Message-ID: <CA+V-a8vbDvbc83TjHhmMMnCCeB++-B65wDq4aGti0t29t98BCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30210-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3C350322636
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:58=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/clk/renesas/r9a09g056-cpg.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9=
a09g056-cpg.c
> index 549c882f9a18..2ff2935aeb0d 100644
> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> @@ -273,22 +273,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clk=
s[] __initconst =3D {
>                                                 BUS_MSTOP(11, BIT(15))),
>         DEF_MOD("gtm_7_pclk",                   CLK_PLLCLN_DIV16, 4, 10, =
2, 10,
>                                                 BUS_MSTOP(12, BIT(0))),
> -       DEF_MOD("wdt_0_clkp",                   CLK_PLLCM33_DIV16, 4, 11,=
 2, 11,
> -                                               BUS_MSTOP(3, BIT(10))),
> -       DEF_MOD("wdt_0_clk_loco",               CLK_QEXTAL, 4, 12, 2, 12,
> -                                               BUS_MSTOP(3, BIT(10))),
>         DEF_MOD("wdt_1_clkp",                   CLK_PLLCLN_DIV16, 4, 13, =
2, 13,
>                                                 BUS_MSTOP(1, BIT(0))),
>         DEF_MOD("wdt_1_clk_loco",               CLK_QEXTAL, 4, 14, 2, 14,
>                                                 BUS_MSTOP(1, BIT(0))),
> -       DEF_MOD("wdt_2_clkp",                   CLK_PLLCLN_DIV16, 4, 15, =
2, 15,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_2_clk_loco",               CLK_QEXTAL, 5, 0, 2, 16,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_3_clkp",                   CLK_PLLCLN_DIV16, 5, 1, 2=
, 17,
> -                                               BUS_MSTOP(5, BIT(13))),
> -       DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
> -                                               BUS_MSTOP(5, BIT(13))),
>         DEF_MOD("rtc_0_clk_rtc",                CLK_PLLCM33_DIV16, 5, 3, =
2, 19,
>                                                 BUS_MSTOP(3, BIT(11) | BI=
T(12))),
>         DEF_MOD("rspi_0_pclk",                  CLK_PLLCLN_DIV8, 5, 4, 2,=
 20,
> @@ -571,10 +559,7 @@ static const struct rzv2h_reset r9a09g056_resets[] _=
_initconst =3D {
>         DEF_RST(7, 2, 3, 3),            /* GTM_5_PRESETZ */
>         DEF_RST(7, 3, 3, 4),            /* GTM_6_PRESETZ */
>         DEF_RST(7, 4, 3, 5),            /* GTM_7_PRESETZ */
> -       DEF_RST(7, 5, 3, 6),            /* WDT_0_RESET */
>         DEF_RST(7, 6, 3, 7),            /* WDT_1_RESET */
> -       DEF_RST(7, 7, 3, 8),            /* WDT_2_RESET */
> -       DEF_RST(7, 8, 3, 9),            /* WDT_3_RESET */
>         DEF_RST(8, 1, 3, 18),           /* RSCI0_PRESETN */
>         DEF_RST(8, 2, 3, 19),           /* RSCI0_TRESETN */
>         DEF_RST(8, 3, 3, 20),           /* RSCI1_PRESETN */
> --
> 2.43.0
>
>

