Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D9C3D38A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 12:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhGWJq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 05:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhGWJqZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 05:46:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C408C061575;
        Fri, 23 Jul 2021 03:26:58 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l17so1126438ljn.2;
        Fri, 23 Jul 2021 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I2KJkpC/JxGDhvFZuc8PzqIINBATCpAw50EeW2gxpsU=;
        b=coXdCv41x0o30B2RMnagOydqxle+s9Zaq++Wmei0LhHiDGKny6sbsmNji9DFCR5UYE
         YxIyKMLjPo0wq7AZZHYyzMXK6ktnfe6wQnXSFZ7esSU86/iChwELHSIcZPnbDLH53vSf
         r3/TzHKx9phtKD0dWU374xvhFK94T0BMN1gXUBUDPLVrAgw4e/G8w4wtvkiJ7uXqv2KJ
         6IG33q8zN3+U3i31e/AP7Ltgdw6Jnx3DKfANrM8eT95LEmujxWcWKA4M1Y/m7KpPqvXQ
         ND4W+DmbAZVDd1tQ+gW4LbmSTaSt6KoVL3LHAMKer5OKozmf6b98n+IfywFRcnXpuUl9
         b7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=I2KJkpC/JxGDhvFZuc8PzqIINBATCpAw50EeW2gxpsU=;
        b=GIqS2GHXBa2BZ+/cksGf2yliaqzqmnRPr2Br5zKWHUluEj2JxkP+2LIYxBQ758Juut
         NAK968cgbR2/zyl0Skv+0/WnCFrbvHtEzoEGXA8Rfd5V23v3mQGq2QomYMPryMnN0dIe
         P3wDPAvyHiR7Jk9LY9XRlNUi5qTAtDuTl35I9igu7ZwvU5M0gxI3HQ+Bl4KhDtq6R9si
         VefG6lsIVjuUmoWwnHRSD/9JAV2lstTF9YEOrmB+ZxKaRmyiQyQpQxvQLg3bc5kwone4
         1YSvBbjWcd9TQtxSN9jgbwgS7VZ96PsOrKL7vgVby2UCFBChVATMwSngiIil6OybOj1N
         QfqQ==
X-Gm-Message-State: AOAM533XDTwVaQSsvxBJu5S0+EI9HwcZJAS4MdHAAzusYxj8Gu9Zs4+7
        x18Nr6H5Eu/IPOCsRnkOFpCwRxFVygs=
X-Google-Smtp-Source: ABdhPJwm5FURqPU81tiELrMaFcMo0Z1Mwjx+QwEsh6aX74lB1rDOeGs0bAmKh18nqKlFFhBfVIkUBA==
X-Received: by 2002:a2e:a911:: with SMTP id j17mr2856559ljq.341.1627036016448;
        Fri, 23 Jul 2021 03:26:56 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.84.96])
        by smtp.gmail.com with ESMTPSA id m25sm2177114lfo.247.2021.07.23.03.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 03:26:56 -0700 (PDT)
Subject: Re: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <9871f557-0088-bc51-d793-58c410269de9@gmail.com>
Date:   Fri, 23 Jul 2021 13:26:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 22.07.2021 17:13, Biju Das wrote:

> Add support to handle mux clocks inorder to select a clock source

    In order.

> from multiple sources.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
>   drivers/clk/renesas/rzg2l-cpg.h |  9 +++++++++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 3b3b2c3347f3..491b10da5766 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -130,6 +130,27 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
>   	return clk_hw->clk;
>   }
>   
> +static struct clk * __init
> +rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
> +			   void __iomem *base,
> +			   struct rzg2l_cpg_priv *priv)
> +{
> +	const struct clk_hw *clk_hw;
> +
> +	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
> +					  core->parent_names, core->num_parents,
> +					  core->flag,
> +					  base + GET_REG_OFFSET(core->conf),
> +					  GET_SHIFT(core->conf),
> +					  GET_WIDTH(core->conf),
> +					  core->mux_flags, &priv->rmw_lock);
> +

    Empty line is hardly needed here...

> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
> +}
> +
>   struct pll_clk {
>   	struct clk_hw hw;
>   	unsigned int conf;
[...]

MBR, Sergei
