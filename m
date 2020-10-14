Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A4028E6C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 20:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389241AbgJNSzh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 14:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388981AbgJNSzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 14:55:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C0BC061755;
        Wed, 14 Oct 2020 11:55:35 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h20so525781lji.9;
        Wed, 14 Oct 2020 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CsMM025rZ5H4lHFTQvlYy0ro5IwEHeoO/Ocqrwim8u4=;
        b=Pvsdl2pmTTCgraNfRxfBYXl4ltxppndqYUDpymgtYdMPU9035NdZnb6pWelgOQ51NC
         U+TYyoSHEdyquI9AtKfAvqDqmMN0tBtN6t4vELce0MsLHba4lCN4EPhsWCiWAA3f57zz
         XWapUia/pfEhxkZLfWRsyIcibxSSoYhKAgOSs4Lip++yUxYRSVHHcjECwlvU/76CivkQ
         qZTisRVGq7DUz83OhVcJCKvbKbsPyyWn1CcEBFsU+Of/0njb58us7eVyMhRS/RzJyaLV
         qA0W0s5F/IeL4iu9nQrpuVJpPzN50UQmF9FJMwyhnbSREREkn5S+qYHL8IwnUl37BdwW
         yvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CsMM025rZ5H4lHFTQvlYy0ro5IwEHeoO/Ocqrwim8u4=;
        b=iBvZ1pKi7aheDir9ArV9spW8OK1X6tfnRAdjRijbwCu9UyTOOon+UhVRi4bJ1mP6hU
         ON3X775c/Ta1hQToooT3R0KgLP196Lh4vFMLr2AV0AzNGPdsDDj4hUdJ9Gx6QbOlqyO9
         pQGyRigUESyrxs1cz0+U6jck6XRZK7AwcGTGxk2D0uejoiwiqmi+WQSX/vr7U7MTaGOo
         ln5YSF4beXE3BmiaGAackLqJX4cjnh9L7oezOVNlikmedc8Zn1kvugdxNwDyESR9FZBR
         g/2acwuh275ovIFLkn5A//pDDemkPZGy02eN45ddR6On9N/rBf0y7wPurFIQDbfxN/pj
         7jGg==
X-Gm-Message-State: AOAM532HwuXr2dm3aem63KFLjeZRuYbcTgzcs1m5fxtCnC7HRS/boAzv
        D9jxsExVYofUVOIF9XN5Uj54UTB/gaA=
X-Google-Smtp-Source: ABdhPJx5SKqdv6Lt7yRPn0e2vsLHoG9iHxgbpWa5J+p8UAg+5o+Jm9iquwOBnaCm0V7elY3f61iH3A==
X-Received: by 2002:a2e:8853:: with SMTP id z19mr41930ljj.142.1602701733961;
        Wed, 14 Oct 2020 11:55:33 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:49f:fda0:bd71:a4fb:5f8:593d? ([2a00:1fa0:49f:fda0:bd71:a4fb:5f8:593d])
        by smtp.gmail.com with ESMTPSA id v20sm196203ljj.50.2020.10.14.11.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 11:55:33 -0700 (PDT)
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: Add VIN[00-31] clocks
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-5-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <0de062e4-0385-444b-1abc-881c313a6479@gmail.com>
Date:   Wed, 14 Oct 2020 21:55:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201014094443.11070-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/14/20 12:44 PM, Jacopo Mondi wrote:

> Add clock definitions of the VIN instances for R-Car V3U.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> Clocks at indexes 730 and 731 are named 'vin0' and 'vin1'.
> I assumed it's a typographic error and renamed them 'vin00' and 'vin01'
> ---
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> index bd54a28c50ee..2a00eb82013f 100644
> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>  	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
>  	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
>  	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
> +	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin03",	801,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin04",	802,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin05",	803,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin06",	804,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin07",	805,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin10",	806,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin11",	807,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin12",	808,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin13",	809,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin14",	810,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin15",	811,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin16",	812,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin17",	813,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin20",	814,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin21",	815,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin22",	816,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin23",	817,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin24",	818,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin25",	819,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin26",	820,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin27",	821,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin30",	822,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin31",	823,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin32",	824,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin33",	825,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin34",	826,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
> +	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),

   The subject says VIN[0-31]?

[...]

MBR, Sergei
