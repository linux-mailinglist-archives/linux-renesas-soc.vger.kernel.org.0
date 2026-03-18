Return-Path: <linux-renesas-soc+bounces-29789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFnqNuG9ummqbQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:59:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1F2BDB5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B966301868A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA013D9044;
	Wed, 18 Mar 2026 14:58:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323853DCD9E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845938; cv=none; b=QwUrkWxlpioYhhRXQkfgFalQ1gwUP//NILE46yXhus07hc4Rrueh1zHnL2BH+uDuQLiyL0QhBD+da+J3myfEmV2iLIhTA536vrwyi7SrA9BXoroevQpIBcEzN5Khw6wy3D3GgtTL/JBRVKfqSZCXZBmi4I3q9627sGo4oacWfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845938; c=relaxed/simple;
	bh=50MfmCN+KUemq5gXleHso1CH8MXsjSKPubK5G/ZXF70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvWz0PTsTIvgc709mEQbF1rT+5TCgMfBG/P5N74eLmUB3illT5406KlEIYKc9ewJDdKsyVj44619yCkWzrI7104R6xqoapwn237JH1zY0hA9U9+QEAniLFaPDEi3Os/8nZcPVifFlNLyCnt67jTcI+siwHNn8vHoprOu5rcYZbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso7394877e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845936; x=1774450736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIIcUcbDwIu+sKvFkfbi0aVtWpdCOn/cQkP6OcnI+Xo=;
        b=Z7wCTFJ/lsiZntmrZ8pMYQispDxPweJZtFxOQz3v1qQwVGONTOeFI+YB3CjmTdraLz
         FF1Ni6clw92kCHKwT/zQFyormd0H2bO4K0mVKe3nU80e2Qx3lg8LfNkov7c6bWmPGJ5r
         4X4cI1jguccwCKasmCuAeXDDRwJg88973byLYqSgYdnfD6uMpckkK0uWmeJ4LMQqy8qp
         tH8R7VSAC5GfiDmZHP/XZqlfVTG5s38+qUUWP2jwYexGkfBiPA8JCNGQrDpq67WD6/r5
         y+j/eBRgp1Hnq7rzyKDaXKYh1mwum2tk2wtyxUlZlpCddFKeRff/sEAyYfZz1xh9oAyu
         PdFA==
X-Forwarded-Encrypted: i=1; AJvYcCWp2ggNfXm1S5+/Fz6+1/H5KM11fw+KzartKqsxm+fytmyrXNqYgWf/MkJm5ogoOmkriDGKRwZEp8SfHpf1rN7tqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2IQoTE3sa9SJ8rPW7Kfx6idSsuEOsqO7tSsqmojk2T+zYXfe5
	LyeADQlZm2HR7N7U/73BH+erTU61IYmWNZbENZX/T17N4UGYzClYfxgaMvAOhVclBvY=
X-Gm-Gg: ATEYQzyXMgefdbYZcmBuaGVVZssD0STYAtrnJv3JRovTesF5BQIJEXVMUJRCbnk2dwV
	uvytsdWrg/Th2ylqfHiHfDmxpuk9bjlJgHYDwHuNFXwyAPgC34KBdM3hBntO8JqAkk0X6bUT81e
	7xpOCdkQX82OFjltRWaVkZwxkO7rYY6S2ybnSJEq+P957U5kEblEJzcv7jFPd6G9j941y1tb/HM
	BMXGIUBtHDHzr0PHhz1FtGNX+cv1w9ZvJGfs0PhAjyUAUw3OXmtVu0CMgtz1+0BrtzllcLm1vEt
	cCy+s/CeTYHOyHOU8TP5UtFHFV8mWDDzSiNOrMNKsl3IR3cqOBUudeVCEtEFeqkBB9O9ebQws0X
	h2yRXvZ4gqP8JsAkFjxvGDo1nbEJ3ENsTksyPt1zmQMvYW88PsPnnX2nlyQJHrCug01wXjRqlxk
	OVrlfl0rLcL6unX70IVsBJLrLSN1FQ/UL1odDT3taBM+afKa2j6wq1SRZ60diN0FzEMCYRRVU=
X-Received: by 2002:a05:6122:62f1:b0:56b:a534:42c0 with SMTP id 71dfb90a1353d-56ba71dd52emr2258044e0c.15.1773845907037;
        Wed, 18 Mar 2026 07:58:27 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95112e39b5bsm487529241.12.2026.03.18.07.58.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:58:26 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-950b8124974so2215493241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaE6WbEm5f97rWKwoux2WmUuxLRK3Fhd/lFZyJzyp8a9ywXTASGmmcMche/7laod5e0qYMuFBybw2j1mvGbAHhBg==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4b:b0:5ff:a0dc:1773 with SMTP id
 ada2fe7eead31-6027d09e097mr1964046137.7.1773845906277; Wed, 18 Mar 2026
 07:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:58:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
X-Gm-Features: AaiRm53OukJhR16tomRr9McagvrVaNCtjyR2KfZ-2HS-YMJlQs8CIh_0kBzvPN4
Message-ID: <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29789-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.193];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7DD1F2BDB5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 09:41, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no owning
> driver to restore them. This mirrors the existing crit_mod_clks mechanism
> which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
> some peripheral interrupts to CPU.
>
> Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
> allow SoC-specific data tables to declare reset IDs that must never be
> asserted.
>
> Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
> resets and deassert them. Call it both at probe time and during resume to
> ensure critical peripherals are held out of reset after power-on and
> suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1765,6 +1765,15 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>         dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
>                 assert ? "assert" : "deassert", id, CLK_RST_R(reg));
>
> +       if (assert) {
> +               unsigned int i;
> +
> +               for (i = 0; i < priv->info->num_crit_resets; i++) {

for (unsigned int i = 0; ...)

> +                       if (id == priv->info->crit_resets[i])
> +                               return 0;
> +               }
> +       }
> +
>         if (!assert)
>                 value |= mask;
>         writel(value, priv->base + CLK_RST_R(reg));
> @@ -1802,6 +1811,21 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
>         return __rzg2l_cpg_assert(rcdev, id, false);
>  }
>
> +static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
> +                                         const struct rzg2l_cpg_info *info)
> +{
> +       unsigned int i;
> +       int ret;
> +
> +       for (i = 0; i < info->num_crit_resets; i++) {

for (unsigned int i = 0; ...)

> +               ret = rzg2l_cpg_deassert(rcdev, info->crit_resets[i]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
>                            unsigned long id)
>  {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

