Return-Path: <linux-renesas-soc+bounces-29900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC0XF3n1u2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:09:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11C2CBAB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5255A317E1B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E943D47B3;
	Thu, 19 Mar 2026 13:08:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3F3D4134
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925688; cv=none; b=CSNn+IE2XUDuHAPPygsQoGYddaEVOl4lwuUp0JZ/mJ7MOTnR3ziqaFGamgRyha+GYtaLqL538Nb4XehRJae3iQZ3Kz2kNdCwSZ7eOZt67Zk8Oy/0Ym1nDjj+WlhPr2EjuHk6YtEggplJX0VdrOosb8s2SizjkwSPIa7ZzxYqyvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925688; c=relaxed/simple;
	bh=7MsYjH/9iUjhWy8P8Ia09suPqhf/e9RibAkv2+s9j5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebWqwW9d2FM0rmdEycLwSNY87SOb99K+sr0rUbpVtXuZCe0uitngq+rxg90ztvhQ0XFa0EgTlVF8pPXocTrKMK0LKDZRe1CCs/ujR3RgIxbyss62Co2rq2bflEsgif67/tiyO/Gi6CU+Fzg8P1llVf0z0cdwQxuT4rkX5+awrtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso668183e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925686; x=1774530486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjLOUfcSKffRbXIYff9Rhip3Lpi++Tfs6RDOszYrfHU=;
        b=k/WbUuzogETglCt3W67YBFjp5+4dgYp0VNvFclZHwfgatzHFNPSMBmm3hIvDssnL3I
         LnpRo/aj/haxs/3uu22Sh/pG18dZLv+aR8yPYv9eJl14209vpJfCAm1Ub2/FJSzd7r4t
         7yMnpDn+bK1shK10nO3zvde3UfdMjBsWM9CH2cUCOUyuIB+T4qcD4OAl76buP4kGhikR
         QnrogsAg7Nfk6EhkTjygs7WlNUl60rNQ/6/nIfgLFOC3pQPgcwMmpRN+eYfn57snNxlC
         uEhqs8UqizjsIFmb1b3eot8lWi+ezIlZO7sZcN86ZyskDPnY+tupsUr6O8cC0PbqlHiL
         PymQ==
X-Forwarded-Encrypted: i=1; AJvYcCV03PKljMcIlZj6G/09RZtzJbILf3tWQfgLcc/r4mvezr+mDxpdvKVh1XOecmLKjaNA0Ymm/f6krSqkNXhpr9B6Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCviMTfAgLPV8FdAFY4KcGrd8RE3mU+uPgW6R/KdpHchD1uj5
	IhyesKHQa6VI7y9C1RyjjZZQ63g0hsYjEG3EZEsBa52vSQ9zGaqN7Oc6hxp88LEK
X-Gm-Gg: ATEYQzwJ6AF+ghQkKm/Zo32lBCaexl/b7Q42t2Kzk+/NjSIsvbUn+W0X5GgfHEBY2uJ
	Z7h/M2eTEUYvMI8VDaXtlSes/h9ZTLaRxm+dcadAOAoYsRBu/tqHor/YAwQDOK8tbmwMwVrrIkR
	igf33yD0af9i7aBjhxq/YoqGBcwWnyVni2AsWcnzutA9wowlK1+CWYH2gA97M4FJQatZAt10n1y
	HH6wxoh1ofa7/M8Gg/eCyLZ+GRRI9GL2ZJe13CEopURUMiFtnAfiu7YE5roArlLVQA9PJ58haDE
	nCDqHr5Hs0ZEWVID95gwGncHdkoOuwMlOP0pekdOtdY8HC6rw1pZBw3J8n9xcLrKi41XM6w2//0
	wnWKyO7i1NMh+GTbK5ORaINZloK0ysAAExzoFl2fJCwKAMsFkfFXId4bfxMpAMPaO/JbFNKVdb3
	Bu+ErJR787oIm2aN0z2O+Kc9/wgwhTIs9xbHCjyYJheOCzasxvfdRPUJdzAA6PxhW1
X-Received: by 2002:a05:6122:c8b:b0:567:433b:e903 with SMTP id 71dfb90a1353d-56ba704a51fmr4202141e0c.6.1773925686178;
        Thu, 19 Mar 2026 06:08:06 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba7048d4esm3268850e0c.13.2026.03.19.06.08.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:08:05 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b91ead558so779463e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7Uyb1nLOu6pEP5N+z0UBz9zH9L4YAjpjVWX7lbHcRDjKT8G7OGGDoAgTI22DjpCmVNzAZJc4Es+v6LYszYMY+Ng==@vger.kernel.org
X-Received: by 2002:a05:6122:319a:b0:56b:7252:cbbe with SMTP id
 71dfb90a1353d-56ba71adbfamr4114004e0c.15.1773925684650; Thu, 19 Mar 2026
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 14:07:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
X-Gm-Features: AaiRm50gi7Y9EQKJ2SmUg1rxd2DUh1wC-OtlGU9PhNwDlWiLJtXmuaffqKLo2Hk
Message-ID: <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29900-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.003];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: AE11C2CBAB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC family requires DMA resets to be deasserted for routing
> some peripheral interrupts to the CPU. Asserting these resets after boot
> would silently break interrupt delivery with no driver to restore them.
>
> Mark the DMA resets as critical by adding them to the crit_resets table
> in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
> r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
> ensuring they are deasserted during probe and resume.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Replaced r9a07g043_critical_resets[] -> r9a07g043_crit_resets[] for
>    consistency
>  * Collected tag

Thanks for the update!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
>  };
>
> +static const unsigned int r9a07g044_critical_resets[] = {

With "everywhere", of course I meant for all SoCs ;-)
No need to resend just for this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

