Return-Path: <linux-renesas-soc+bounces-34132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sibmFy51Mmof0QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:21:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF266986DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77276309599D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8BD3D3CFD;
	Wed, 17 Jun 2026 10:06:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD73C4B85
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690781; cv=none; b=foJNI5FfyRJZDnVnHoDY60X/3yjK9EHY2bhFy3wiW10+b3yygl+SAA8BwI1yJwFlmVCnKxPMcjA5g7HFn/VfywIZypF9OlvBaKiMcT1Zg2+t5p/KJjwSh9pqn3Ktwuaz1XcuDV1QZTbemSQKh6DhgZY9bxyCGZ4d7InbmGky8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690781; c=relaxed/simple;
	bh=NBj1YiJugs3AlafyrUeHVh/u6KhoB/ett9CLqIWPL7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvSf28T8013FNc3NMejJmPd6QBFsKsTkMo83IKxr4x4IiZ54ErYjeLx1XNjft5nZOaymFWlSCyWCMf/gRujkixpWFECbl1GVd3WfHve04IWAQM0c0tT5hA+EDIsqpJmkBrYDF2zFw2Hq/htNbVBhE+aX+Inn8TDIbSFwMaNtXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6c87709aa26so3050815137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690779; x=1782295579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaeWQDm3vXVlskudp+NZaXeXqiWlY2esM7Su4qAUzM=;
        b=eTigVZtlA0DUzIwHAHirv7A2MKXdDTH9ZhwkQRK/0McFHdcbpecvTLndb9hlViQm68
         VfLCzb7O50nHwy1BYNOZARAmEgoRUWsEQvckc2dV70vldBNZUWbKWNiu8tDQXGI7GdVs
         6gpr/V257VE85/X5Vk1Zy/KsMTKGsDfaUz8TlijBRXPTN5eomj09Vnmu/xqhDuVotLXQ
         NqDix/f26dfd1+h4pc1YnZUhWugw///TluQtD4MU814kqkoiENrblGWaKqxSLpfT21hA
         ZPlQ8XlOcOrSq6TGCfYt88EGnIhCbZSq6tsX3PYLPwb0nspL1rndzMhIgkfZ5hJfeS33
         6B3A==
X-Forwarded-Encrypted: i=1; AFNElJ9GjCRwsoGGi3astoTJpn7rpGlC6LP4rs1aArfKsWWWl3GX0Gg3dKBdxI+8ssWZq1hLsOPXn8YjlxPjFGrYVnrxQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPS2skP6w8NIO5R3w3jz18JSEdLH3LMCxioDYjk/PXeCxA03W
	DoV8j9MV4J+DuTIWwxXuZliKXoHiZ/ZlLuWnKvfWYJRa5KVwGIUQkNcI2zIEOp9m
X-Gm-Gg: Acq92OEskXrtEpZjf+hlYI8vwsJBe+i3aVqDUbYNNxDl0VXGzTEQ3c73zlh4IiFursS
	8JZDdkYdUkPC78DdJQqLRgarCZ/u/3d1ae4/chLg7gnBDHN4s0ie+6uJXVXi53uXepLxESUYG2q
	kcdluyiOv+G7xEorY5ElbYuOJYTRYgNVKk8kvt24Za9U5hoSYAI7HfnJ3ib/ftypwPBXERN8iY+
	2M4YbdqmY79TZ1b+UrcZ4lzjoZrXGiOSmDULfp1glspDVNzlpBCB+iIx+s7naI1n/0ErE13X305
	jUtsGYg5MDHvrcled9N3lHCSQwbz8oxgqVnAiwRSXRtRA0qdtLTQKOEnKvRoUUaAffa89mniz4E
	5TM6tL4xlM30I6Ynqi3/fE9A+cfgfngDZ+4KM37e9TE9aH2yIejJlgStkntsp8HT7h3jbuOiQir
	tTEWP9MYOEJQOYbL1tVj88mJnDc9IUVfwCLwYzpmliwyJkIGMR5g==
X-Received: by 2002:a05:6102:1483:b0:6e9:47be:3ff7 with SMTP id ada2fe7eead31-7246c678d69mr1704584137.13.1781690779017;
        Wed, 17 Jun 2026 03:06:19 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878866dbsm6794699137.11.2026.06.17.03.06.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96392241154so4211129241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MBJGr0Zk95HP8TGHMCAk+sGJAqL7nlJeyM9IVLRh2973wJ/OepumIfWUP6NIp9hDlPoQ2KyxX9DDarZNwzFJTWw==@vger.kernel.org
X-Received: by 2002:a05:6102:688f:b0:62f:3e1d:a55a with SMTP id
 ada2fe7eead31-7245cfe81c8mr1616278137.2.1781690777077; Wed, 17 Jun 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:06:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
X-Gm-Features: AVVi8Cets1-ArzRwsMw_T-p_ZzilvzmMs96iuC7Y-2iJnpSKywpmvUNNJpZxE04
Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34132-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BF266986DD

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - In r9a09g077_cpg_lcdc_div_determine_rate() made use of
>   clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

