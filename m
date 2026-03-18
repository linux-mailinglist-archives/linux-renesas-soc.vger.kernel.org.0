Return-Path: <linux-renesas-soc+bounces-29788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGQDKIa9ummqbQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:58:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410742BDAD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB77130EF0BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F264B3DB64F;
	Wed, 18 Mar 2026 14:54:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718063D7D9E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845695; cv=none; b=cdOKwYfjZ/NaYEmAiIt7bdMBKH/B+RTwcvThHmo6OPUxkdVjmX0Ome+EwHybs6UaPA0KKFpG5mzm70ACCCVXbcCQ6ybgNEN6avpqjKejyjDhs3CmXa48TUmgbiijSHI82twbkTcpQ3Lm0HYeotXSs7HNnW5qRYlZV4fAKUwAz7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845695; c=relaxed/simple;
	bh=dAi6IZesHxnAmUwcmtHAHa1sgnlJ4W6rUQVDgY8jnKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFhbx3oI3q2V+AtmFG8gEha/3BInYzbhGYGj3mmxsOcgXNFZHOfc0dpLRDYggHCZiSbloBWhV6mANFLVJkn7CLfzUxyppZghbRuB38Ytsj0n2L164j806CS7d69/YrccsLe2LUF5Um7Oc1upl+m3A1uaHuSEWW5azWz3IiKokjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3428577241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845692; x=1774450492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/Qg5QrFMlprD3b/zTBt1MydRArt+JmYG67GEAUxq7Q=;
        b=Ab5vWXfeYQ7XcPAidmLt/Oyzak8lVzvc7lYXtOivps4Nqkek6eNftaG3nvyzQ8CTfb
         fulbGHRpFLnhiF0mCwhXDEYswG1dfYPVZSu7SFRBD5qJ1dndryuO+gUuR8BV+BJGloKE
         pAA1WPFrLcgvvDdAI+QqLJPNsBMWacI+VFacXnzuY/OKmfczBB1LEyiqzIzoP0TcXM9Q
         s9Hnu7JazHugfDXEZOrE8Wvg6fHh9co+B2vy4M1Y5sJUM0i7BAkcBIejB2y4Kn42ODtI
         vibNNAPopwH1/oz1EHbkr9f7VcznXuQ2isjQRa4qnF8AY6+dB41J5d0ldsc2/SXz+Zav
         9GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwryzvIhTexKssqcLe3CPuCf5PTFEzg3D1jlI+QYG3/+bQ2M4gcR+rrT68a/gna5SlrUrKunr1cyeiiSWvnf1Xxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4Om3u3a8RpMZVFexJsxTyHrkFh/SNyeRjMjEWlGqkjmZgqq0
	EpIPcbazP821q+lWb4A1TqYN/rbEoX3zXx6PlWTjkKtOGdCTvX+RnXr5z9BCbHHZ44A=
X-Gm-Gg: ATEYQzyjfgn2Qmo9gYgBbaPMyCJKaMxJ7GEDM1qJW7M87wQeO34bzm1D7iPOEtzgiTm
	B0JRx1Y1pJLCeP8XxSj+LjbCRIWIioAwVIOdSQs+DZVXfnrctm02apMRkhJ3UxClJpB1FszznE1
	yUKhaCbt/qqWpv7+RjO4J4ZKjYD/7Bg1hcysRFS2A80wg/eLjLunXg2Du9sOIGtm9De/ze7qNlt
	Cz6cwk8th8OK9KecRdrOuoRjCuqurJOW8JWjQkPYLKW9YoVAts2CzqtltaG+V9yMN0kf1c5mjfK
	TdURgEKuEM8debMmBY2f6ImybEJxcdBb+wa4KA+6yEGXCN2ElyaUew4KfjAdUkZG4Phpnhaxdr5
	6DuCMcAeXzEaKDmhibIKbgCUdsscQpslcl/dL46Sb8g96HwUiHIdV6z6wu0+aTjY5qaPBeLoGPC
	OnQWSzyEQpTT5GsJ5zomK7+WV9RKKIOWZrTi+R7l1xRpCru0iinN5cKo2HIUI+
X-Received: by 2002:a05:6102:6cd:b0:602:6e95:bc97 with SMTP id ada2fe7eead31-6027d2d2260mr1778054137.20.1773845692467;
        Wed, 18 Mar 2026 07:54:52 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eb6533dsm1614926137.1.2026.03.18.07.54.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:54:51 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so4176748241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwWwY4auG7C6xs9zObfp7O1cEc7td7P2fx22r4rFBcHuL5agj6f7xplTv/vZvxF+Z8X5DdKYeyGuO3Gq6YNYjKcA==@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ff:e25c:9285 with SMTP id
 ada2fe7eead31-6027d12f8c6mr2071916137.15.1773845691435; Wed, 18 Mar 2026
 07:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
X-Gm-Features: AaiRm534vCHGPCtrnB-8VlpCeb3tHeDCk7nE1s-NfRCX77If37iIL3qBCG4cSVg
Message-ID: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
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
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29788-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.363];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 410742BDAD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks may be left disabled
> as the hardware state is not automatically restored. Unlike regular clocks
> which are re-enabled by their respective drivers, critical clocks
> (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
> must take responsibility for re-enabling them on resume.
>
> Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
> entries in a singly-linked list anchored at crit_clk_hw_head in
> rzg2l_cpg_priv. Populate the list during module clock registration by
> checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
>
> On resume, walk the list and re-enable any critical module clock that is
> found to be disabled, before deasserting critical resets, ensuring the
> correct clock-before-reset restore ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -130,6 +130,12 @@ struct div_hw_data {
>         u32 width;
>  };
>
> +/* Critical clk list  */
> +struct rzg2l_crit_clk_hw {
> +       struct clk_hw *hw;
> +       struct rzg2l_crit_clk_hw *next;
> +};
> +
>  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
>
>  struct rzg2l_pll5_param {
> @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
>   * @info: Pointer to platform data
>   * @genpd: PM domain
>   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> + * @crit_clk_hw_head: Head of the linked list critical clk entries
>   */
>  struct rzg2l_cpg_priv {
>         struct reset_controller_dev rcdev;
> @@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
>         struct generic_pm_domain genpd;
>
>         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> +
> +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
>  };
>
> +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> +                                          struct clk_hw *hw)
> +{
> +       struct rzg2l_crit_clk_hw *node;
> +
> +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);

This ends up allocating quite some memory to store just a single
clk_hw pointer.   Alternatively, you could use an array and size,
and grow that using devm_krealloc().

Another alternative would be saving and restoring all clocks during
suspend/resume, like renesas-cpg-mssr.c does.
Thoughts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

