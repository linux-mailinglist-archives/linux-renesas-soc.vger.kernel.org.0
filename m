Return-Path: <linux-renesas-soc+bounces-34123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5ueGPZvMmrezwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 11:59:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB36982F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 11:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B928D32B58E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C373D171B;
	Wed, 17 Jun 2026 09:48:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19903CA4AF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 09:48:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689738; cv=none; b=Qh9KnWeDB0LkgGtChpeLl6+PjAn62a3zUsMp6frVTNO5rQf9gcufjdBwq8W56rDVNyrzOLOU8QmCsESpLAHKHkt3C+hs2L0HIoBtuEvRUCgnXuBtDawEyCwmeXLnEqwiulo6U3EA1SFniAiiIBt7W/qSdPtpeai4DIACq4QeNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689738; c=relaxed/simple;
	bh=zgmF4G180wgcf5oiYNf7MKLkwNcY83CQ6T1cSixEe7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezM6KmlOWP6NYWeyVN0KMQpC53gm6V4IBCbOuSVBfpaDbH9urtC4iDs43ILj9uYvaClTAx/OzmtSB3YmKSp1ZZYW642sZMq5RZl/yUx765SxLnUT3ErUpiBGqflNbXV36On44wzZ/sTpMDOIzxFMb5fO1ds8nANObeji86lqRmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5a7c7e13b84so3278956e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689735; x=1782294535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzBIHbH3e9z5WB6Uvoc2w5PoH5awp6Q/fBEmuSHqk2M=;
        b=E5fC30O+1N4T9DUqj9X5sEqJOHNZyGqXr0Jyq/RgI4hPaZPRsv2byhykmpCGqapsrh
         BSNCIgMZB5Vn6VoKTEDmBo9FOTw8eubV5JKA6fVBQZx0XVZTpmWNTEPNNErR2XoNh1wo
         FPu2rK0gEpuO+5EE7TC4hoZE9RRk9TJ6RgHE4GhUBf4cZlJc7KyiKUC8Qe+cwviisydh
         /6KRz4Um7aW9t1YFV6dsPpmmQYax3lshBzpdQq1Ub0xAU0Y7P8wZrOm2apC9W59C5gs6
         JukvU26yJjgN8fCPLyBd52g2T5su2Pv0uANTgvpQ82kktxW46CjFRBfXdy1mcd8SxYBA
         LueQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Nt1fbn9nmk55gra6NRrgkFqQuAnS5gJ2+1sGIULzo/wiJLYmBN/89bdudcQvpZUfp1V4E67pm8IaEaNTMy+VeYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydouiB3SVk6Ftl2Ur/NpKp4UWwghmBLS5pJqqEdcRGkM8L97qG
	QIMIcqgXZBLYFZAMBAVrDsAIGNJdWIn+arPRgGPro7ajkWOmuHneyXVzaxD3r5cj
X-Gm-Gg: AfdE7clNFXLmtuUlWp6uyqbd74Ga+JitvtD+GcnJSBKeZA6iMvkNcj+88lxRVVEU75W
	8tIfmp61u7ZgZVPHM/HRFVZnqwoArkaXWjj/AdmXOSqtiyPPkZqsUNCphijCU7ysSjvs1/oUYgx
	Cjl5lFaco7p60RC+gUhJFBdzG8dkWfaC5cq+cyxh2yd6ZnBysh9sipfRepUHanyGhOhvY/9UJE/
	Ga/XDADHeJwxfsQm+O3Qo3jx/kZxz5y/BRxnN/v/jBd7IFLiBDvZ+ztqSFhkjDL9MZvtEQpUpWi
	Wl6a2Pkp4PpEmPkQf7BdSV6719KR5AmlaGn7KZSYR2p/6qgEzo+bQiyKscp6w25Q74i88WgQ1Zb
	5KceObr/bh5KCOBTa4HpHmm9t5c6KOjTf23fV9xQIame9rVlyUmKP9jLCe49eoTs8C7YCqdIryR
	YGi4yqEgbZty6GDTqNQBYUFGuqWVOKNxRqaKj7DZmy6UJ8V6bESw==
X-Received: by 2002:a05:6122:a28:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-5bbbe4ad315mr1392749e0c.2.1781689735569;
        Wed, 17 Jun 2026 02:48:55 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff961e3sm8125973e0c.3.2026.06.17.02.48.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:48:55 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6c3154fa47fso4243261137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+x9ApjhXAhw1B8MzfYCt1gCiXKoStlBmF0SBEByRiUuDEzPIKOgs1dXbFKvNSDJUdvd2p67Pli/Ra+6OPclKFXtg==@vger.kernel.org
X-Received: by 2002:a05:6102:3588:b0:6e7:5c89:3fc0 with SMTP id
 ada2fe7eead31-7246d42e08cmr1649434137.25.1781689734943; Wed, 17 Jun 2026
 02:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:48:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
X-Gm-Features: AVVi8CexHI6Cn-7af-3NwS7Fpca-DgZi_9j2_blKzUOte_bydlG-ZNQqhEBgXok
Message-ID: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34123-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFCB36982F3

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> Add an input_fref member to struct rzv2h_pll_limits. In the core
> calculation helper rzv2h_get_pll_pars(), derive the base input clock
> rate from limits->input_fref, utilizing the conditional ternary operator
> to fall back to 24MHz if the struct field is left uninitialized (0), and
> drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
>
> This abstraction permits the reuse of the common PLL divider logic on
> newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
> clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> disrupting existing platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz). If set

"in Hz", as pointed out by Sashiko.

> + * to 0, a default value of 24MHz is used.
> + *
>   * @fout: Output frequency range (in MHz)
>   * @fout.min: Minimum allowed output frequency
>   * @fout.max: Maximum allowed output frequency
> @@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * @k.max: Maximum delta-sigma value
>   */
>  struct rzv2h_pll_limits {
> +       u32 input_fref;
> +
>         struct {
>                 u32 min;
>                 u32 max;

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

