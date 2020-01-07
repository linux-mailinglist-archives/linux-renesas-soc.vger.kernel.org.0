Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC80413376A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2020 00:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgAGX3M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jan 2020 18:29:12 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43042 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbgAGX3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 18:29:12 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so994758lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2020 15:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Nd2AL/Eg5Ng2+0yTe65XuGOIJ5dD5MH7iNyEDJ4VLbs=;
        b=ntelrtW4cSMgT52OVyId5geDkVCgk2UKcA3HNpwPS+uD2xeMyMgTQVM39U/UoSkeMX
         uta0AiBaCZZqgi83b9YVm1rdmB7zg2duelGUSpwxWPOpbzyhNwAvXs3Hulhnc8L7txa5
         RsDaVS0ELNmRc3GHh7nm01SZqsDhNj2q8neLSdFe1ZYLmQqfwXZV/UReE0vX3gIKtU+M
         6vd9dUNuevyS/ocuIQtcvI6ZRK3bZfAGJeE0aNuCZBC7F22aIvFSwAdRy9OXQ1PzsAtb
         ApWaMVwIeb0sYcu7N6Avnw2ynotFg3rp6yCAubeVzwur7gHfJeW6i7LlkJNuCXX3gwW7
         zsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Nd2AL/Eg5Ng2+0yTe65XuGOIJ5dD5MH7iNyEDJ4VLbs=;
        b=lbWCY6GIpr5WWKJCKTkVCY3tdwIKH/PbJCh8Ntmfz2gmimD0Hp+wgIQoeUYnosfFVA
         22aOkky9i4GBJYu97fhQ1XEwspuOZA1GxgprZAQ1A/qNwVTdgr9pRsStzqtIP+VOA2Dk
         Mkq9hk989/QdeHHGblEEtXPiiZvG+ABDG4DuwkzGm2yrk0r8XT4RSG3NWesZ5KbFK2fn
         AM8uoHgaosLQUvRaNIQ2+dO1Zq6Im6SFrkZjQ85C3s4Td08iqMe1ZKXzGbU6cNqbDtTI
         5sRyvqKek0sQf6dqS08oJqam668ddUTdewvnne/Lm8NhZblApcH0y0loBivN+uURJMD0
         u06A==
X-Gm-Message-State: APjAAAX+dhCM4ouGrPkTFLVcMvga45eiq1t0JubM0i+roPZT3oKzbQP0
        kuPMUgXONf2iAzIJV0AVAIHy3g==
X-Google-Smtp-Source: APXvYqw3vo7AbulNWDRnQCerL3xJbu5DNsy/thBp0WJeeK7e2u8QaAJ09MlCvE5zA/7jX7EJDYcNoQ==
X-Received: by 2002:ac2:43af:: with SMTP id t15mr1129988lfl.154.1578439750046;
        Tue, 07 Jan 2020 15:29:10 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id y25sm467870lfy.59.2020.01.07.15.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 15:29:09 -0800 (PST)
Date:   Wed, 8 Jan 2020 00:29:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Prepare for split of R-Car H3 config symbol
Message-ID: <20200107232909.GS533370@oden.dyn.berto.se>
References: <20191230080902.2832-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191230080902.2832-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-12-30 09:09:02 +0100, Geert Uytterhoeven wrote:
> Despite using the same compatible values ("r8a7795"-based) because of
> historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> (R8A77951) are really different SoCs, with different part numbers.
> Hence the SoC configuration symbol will be split in two separate config
> symbols.
> 
> As the Clock Pulse Generator / Module Standby and Software Reset blocks
> in both SoCs are very similar, they will keep on sharing a driver.
> Extend the dependency of CONFIG_CLK_R8A7795, to prepare for the split.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.6.
> 
> This complements, but has no dependencies on "[PATCH 0/5] arm64:
> renesas: Split/rename R-Car H3 support"
> https://lore.kernel.org/linux-renesas-soc/20191217183841.432-1-geert+renesas@glider.be/T/
> ---
>  drivers/clk/renesas/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 94ef2bac289fb45a..250d8165167aa013 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -20,7 +20,7 @@ config CLK_RENESAS
>  	select CLK_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
>  	select CLK_R8A7792 if ARCH_R8A7792
>  	select CLK_R8A7794 if ARCH_R8A7794
> -	select CLK_R8A7795 if ARCH_R8A7795
> +	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951 || ARCH_R8A7795
>  	select CLK_R8A77960 if ARCH_R8A77960
>  	select CLK_R8A77961 if ARCH_R8A77961
>  	select CLK_R8A77965 if ARCH_R8A77965
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
