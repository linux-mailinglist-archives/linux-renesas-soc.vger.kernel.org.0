Return-Path: <linux-renesas-soc+bounces-4674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A38A7DB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 10:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54F47B2293B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 08:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F47C6C0;
	Wed, 17 Apr 2024 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rHmjyR5O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9E7C6EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341107; cv=none; b=kifynnPafI8sswXXGiP6oIXAA2Goa/bqwHq9D1RONy5aKmhLs8HSA9RBFAWX9Vt4jPi4XipkYcryLdBWC3Z2BYxhGAIjBDTCNpdnT7NxVE5Xb0+IDlku/2TxpIlDqzunk6Co1x7Wis14f0bK7g6eb3t549ud68Tztj1g7R6spVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341107; c=relaxed/simple;
	bh=C1EFsIbWU0ZubSXYq7sk33s+WMdT21M/TVCqhpXyoNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJzT05dvNCAC7aAaaeSW+i5SeBZG78aKuRf3OmwAS2Bd3v9JaogSXpmdRwSFOFYtXfizerPzSGSZuG20DlZx1zKp/j+xhw/2IoWEv9ESGNNAI0icFyGi0Ox35TOpx/Lb0vvPoRjgVJjX751498RuHo4qkDcFerMSC7iPBkP7lrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rHmjyR5O; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343d1003106so3735275f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713341100; x=1713945900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDh1nYARFcIFHrSlOw5FmvogrCxbEjVzOUM7hTAClec=;
        b=rHmjyR5OaI0ARdf6VgFtY1oo7/fjg5pcmnSs6aphrQPmlRyq5zXmkNQz6jUavWLLiz
         Bl6gEv2fj/WoydskOgZqUOETIqu454YJJhbMltv0GWZcOUE+7puElki1ZBMVcLa4P1Wm
         7nv2tdymLrrqjCwPMj/63A2wv6JRWJs/8LLbstaYldh7gfV4mNsDvT2IouAu/DOw3b7d
         eC7aiBnNqh3VCoDMDavGAhArPRmREzuTZPpkYyirADs+yZ04VjtfZZC8QYpGuNuJkW53
         yudrxGBFl8sC6dYuqjKRAlGowcB+fotDHyIKkJmWT14z3ZP2trNqM4vJfO4U9+VRsZmg
         NFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341100; x=1713945900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDh1nYARFcIFHrSlOw5FmvogrCxbEjVzOUM7hTAClec=;
        b=uM3YND7mDcRnGwaBZbAhX2Ppoh3u0F/jiIfEip2tI0wQi6xsXlLmi94KQePMOmDaNT
         bmSrsjxwl4eScu8nOUzqTMZb0PapfmE9bu21SRQEx+6LfybDCYntxHC4IU4x4rl3kwSe
         Ozhba8tIHQYpqmPbikzvhRQ0oJxYiHhD2eK9u6sLwQ2aM6IHgRihFSdbSjZ8KflvC7KK
         fG5qpq6GBJQfnCnIDT1VIm2b5eMGjKldpiXEmTzQNe3HKd5N1tFbM3nYM9Lgw6tnDMMF
         297ihwlMIPi8wdW9l6BySThFwBOP2VJsLR1hxGwUGZkVQDra4sCoDquatiBhLQRAneo/
         BoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6nzVNqdjM2ZHWt1CZgAcpr3EoOk9k048wWBm1Bp1/3eiDQ1klejl6LcNqSI9vtAVC8MEh00GXrnjjZSBxBBfAxMlCCUZcz2zFO9U+KzxBSm4=
X-Gm-Message-State: AOJu0YyK4rprfVaBAjQyZ0OELKp74EC4ximJJO39u02FbZ717Hc9IGPO
	8c7BLjqBjh3cNYqqTHTYq5ruTyHKZ2hInEsRV78EG1LM+BLAPOiQND070JqdAnxP2W1tJsNZzuS
	l
X-Google-Smtp-Source: AGHT+IEDAnizgJDxfpYLaComyV3Dn+QtrsTc6mNETBaS7bf2tJbEk7C25IxunYkc+x6S2zmsWFooXw==
X-Received: by 2002:a05:6000:2a7:b0:345:816c:6e16 with SMTP id l7-20020a05600002a700b00345816c6e16mr13893096wry.25.1713341099366;
        Wed, 17 Apr 2024 01:04:59 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d488c000000b003472489d26fsm13275040wrq.19.2024.04.17.01.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:04:58 -0700 (PDT)
Message-ID: <28508184-96f0-41b7-90bc-506d53cedaf9@tuxon.dev>
Date: Wed, 17 Apr 2024 11:04:55 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] clk: renesas: rzg2l-cpg: Add suspend/resume
 support for power domains
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
 <20240307140728.190184-9-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFos=FP3GxX+5qAmBpqrR-8Q7MRhhV3HvPAtu2K6x=7XEw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAPDyKFos=FP3GxX+5qAmBpqrR-8Q7MRhhV3HvPAtu2K6x=7XEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 16.04.2024 15:07, Ulf Hansson wrote:
> On Thu, 7 Mar 2024 at 15:10, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> RZ/G3S supports deep sleep states that it can reach with the help of the
>> TF-A.
>>
>> RZ/G3S has a few power domains (e.g. GIC) that need to be always-on while
>> Linux is running. These domains are initialized (and powered on) when
>> clock driver is probed.
>>
>> As the TF-A takes control at the very last(suspend)/first(resume)
>> phase of configuring the deep sleep state, it can do it's own settings on
>> power domains.
> 
> For my understanding, can you please elaborate on this part a bit.
> What does the "last suspend/resume phase" mean, more exactly, here?

The RZ/G3S SoC support a power saving mode where most of the SoC parts are
turned off and the system RAM is switched to retention mode. This is done
with the help of TF-A. The handshake b/w Linux and TF-A is done though the
drivers/firmware/psci/psci.c driver.

After Linux finishes the execution of suspend code the control is taken by
TF-A. TF-A does the final settings on the system (e.g. switching the RAM to
retention mode) and power off most of the SoC parts.

By the last phase of the suspend I'm referring to the TF-A doing the final
adjustments for the system to switch to this power saving mode.

When resuming, as the TF-A is the 1st one being executed on the system
(this is what I called above the 1st phase of the resume), TF-A moves the
DDR out of retention mode, reconfigure basic IPs (like in boot case as most
of the SoC parts were powered off) and then give the control to Linux which
will execute the resume code.


> 
>>
>> Thus, to restore the proper Linux state, add rzg2l_cpg_resume() which
>> powers on the always-on domains and rzg2l_cpg_complete() which activates
>> the power down mode for the IPs selected through CPG_PWRDN_IP{1, 2}.
>>
>> Along with it, added the suspend_check member to the RZ/G2L power domain
>> data structure whose purpose is to checks if a domain can be powered off
>> while the system is going to suspend. This is necessary for the serial
>> console domain which needs to be powered on if no_console_suspend is
>> available in bootargs.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>  drivers/clk/renesas/rzg2l-cpg.c | 66 ++++++++++++++++++++++++++++++---
>>  drivers/clk/renesas/rzg2l-cpg.h |  1 +
>>  2 files changed, 62 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
>> index b36700f4a9f5..b18af227177e 100644
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/clk-provider.h>
>>  #include <linux/clk/renesas.h>
>> +#include <linux/console.h>
>>  #include <linux/delay.h>
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>> @@ -139,6 +140,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
>>   * @num_resets: Number of Module Resets in info->resets[]
>>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
>>   * @info: Pointer to platform data
>> + * @domains: generic PM domains
>>   * @mux_dsi_div_params: pll5 mux and dsi div parameters
>>   */
>>  struct rzg2l_cpg_priv {
>> @@ -155,6 +157,8 @@ struct rzg2l_cpg_priv {
>>
>>         const struct rzg2l_cpg_info *info;
>>
>> +       struct generic_pm_domain **domains;
>> +
>>         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
>>  };
>>
>> @@ -1570,12 +1574,14 @@ struct rzg2l_cpg_pm_domains {
>>   * struct rzg2l_cpg_pd - RZ/G2L power domain data structure
>>   * @genpd: generic PM domain
>>   * @priv: pointer to CPG private data structure
>> + * @suspend_check: check if domain could be powered off in suspend
>>   * @conf: CPG PM domain configuration info
>>   * @id: RZ/G2L power domain ID
>>   */
>>  struct rzg2l_cpg_pd {
>>         struct generic_pm_domain genpd;
>>         struct rzg2l_cpg_priv *priv;
>> +       int (*suspend_check)(void);
>>         struct rzg2l_cpg_pm_domain_conf conf;
>>         u16 id;
>>  };
>> @@ -1676,6 +1682,13 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
>>         struct rzg2l_cpg_reg_conf pwrdn = pd->conf.pwrdn;
>>         struct rzg2l_cpg_priv *priv = pd->priv;
>>
>> +       if (pd->suspend_check) {
>> +               int ret = pd->suspend_check();
>> +
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
> 
> This should not be needed at all, I think.
> 
> Instead, genpd should be able to take the correct decision during
> system-wide suspend and simply avoid calling the ->power_off()
> callback, when that is needed.
> 
> If I understand correctly, GENPD_FLAG_ACTIVE_WAKEUP is set for the
> genpd in question. The only remaining thing would then be to let the
> console driver, during system suspend, check whether
> "console_suspend_enabled" is set and then call device_set_awake_path()
> for its device. In this way, genpd should then keep the corresponding
> PM domain powered-on.

You're right! I've checked it and all good w/o ->suspend_check() if
device_set_wakeup_path() is called for the console driver.

I'll send an update for it.

> 
>>         /* Set MSTOP. */
>>         if (mstop.mask)
>>                 writel(mstop.mask | (mstop.mask << 16), priv->base + mstop.off);
>> @@ -1687,8 +1700,14 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
>>         return 0;
>>  }
>>
>> -static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
>> +static int rzg2l_pd_suspend_check_console(void)
>>  {
>> +       return console_suspend_enabled ? 0 : -EBUSY;
>> +}
>> +
>> +static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, u32 flags)
>> +{
>> +       bool always_on = !!(flags & RZG2L_PD_F_ALWAYS_ON);
>>         struct dev_power_governor *governor;
>>
>>         pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
>> @@ -1700,6 +1719,8 @@ static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
>>         } else {
>>                 pd->genpd.power_on = rzg2l_cpg_power_on;
>>                 pd->genpd.power_off = rzg2l_cpg_power_off;
>> +               if (flags & RZG2L_PD_F_CONSOLE)
>> +                       pd->suspend_check = rzg2l_pd_suspend_check_console;
>>                 governor = &simple_qos_governor;
>>         }
>>
>> @@ -1719,7 +1740,7 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
>>
>>         pd->genpd.name = np->name;
>>         pd->priv = priv;
>> -       ret = rzg2l_cpg_pd_setup(pd, true);
>> +       ret = rzg2l_cpg_pd_setup(pd, RZG2L_PD_F_ALWAYS_ON);
>>         if (ret)
>>                 return ret;
>>
>> @@ -1778,13 +1799,13 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
>>         domains->onecell_data.domains = domains->domains;
>>         domains->onecell_data.num_domains = info->num_pm_domains;
>>         domains->onecell_data.xlate = rzg2l_cpg_pm_domain_xlate;
>> +       priv->domains = domains->domains;
>>
>>         ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, &domains->onecell_data);
>>         if (ret)
>>                 return ret;
>>
>>         for (unsigned int i = 0; i < info->num_pm_domains; i++) {
>> -               bool always_on = !!(info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON);
>>                 struct rzg2l_cpg_pd *pd;
>>
>>                 pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>> @@ -1796,11 +1817,11 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
>>                 pd->id = info->pm_domains[i].id;
>>                 pd->priv = priv;
>>
>> -               ret = rzg2l_cpg_pd_setup(pd, always_on);
>> +               ret = rzg2l_cpg_pd_setup(pd, info->pm_domains[i].flags);
>>                 if (ret)
>>                         return ret;
>>
>> -               if (always_on) {
>> +               if (info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON) {
>>                         ret = rzg2l_cpg_power_on(&pd->genpd);
>>                         if (ret)
>>                                 return ret;
>> @@ -1890,9 +1911,43 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>>         if (error)
>>                 return error;
>>
>> +       dev_set_drvdata(dev, priv);
>> +
>>         return 0;
>>  }
>>
>> +static int rzg2l_cpg_resume(struct device *dev)
>> +{
>> +       struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>> +       const struct rzg2l_cpg_info *info = priv->info;
>> +
>> +       /* Power on always ON domains. */
>> +       for (unsigned int i = 0; i < info->num_pm_domains; i++) {
>> +               if (info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON) {
>> +                       int ret = rzg2l_cpg_power_on(priv->domains[i]);
>> +
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +       }
> 
> I don't quite understand why this is needed? Is always-on PM domains
> being powered-off during system wide suspend, so you need to power
> them on again?

Yes, as power to most of the system parts is cut off during sytem suspend
(and DDR is kept in retention mode) and the resume is almost like a cold
boot where the TF-A does basic re-initialization and then pass execution to
 Linux resume code.

Thank you,
Claudiu Beznea

> 
>> +
>> +       return 0;
>> +}
>> +
>> +static void rzg2l_cpg_complete(struct device *dev)
>> +{
>> +       struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>> +
>> +       /* Prepare for power down the BUSes in power down mode. */
>> +       if (priv->info->pm_domain_pwrdn_mstop)
>> +               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);
>> +}
>> +
>> +static const struct dev_pm_ops rzg2l_cpg_pm_ops = {
>> +       NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, rzg2l_cpg_resume)
>> +       .complete = rzg2l_cpg_complete,
>> +};
>> +
>>  static const struct of_device_id rzg2l_cpg_match[] = {
>>  #ifdef CONFIG_CLK_R9A07G043
>>         {
>> @@ -1931,6 +1986,7 @@ static struct platform_driver rzg2l_cpg_driver = {
>>         .driver         = {
>>                 .name   = "rzg2l-cpg",
>>                 .of_match_table = rzg2l_cpg_match,
>> +               .pm     = pm_sleep_ptr(&rzg2l_cpg_pm_ops),
>>         },
>>  };
>>
>> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
>> index d9a7357c4873..abff85644270 100644
>> --- a/drivers/clk/renesas/rzg2l-cpg.h
>> +++ b/drivers/clk/renesas/rzg2l-cpg.h
>> @@ -301,6 +301,7 @@ struct rzg2l_cpg_pm_domain_init_data {
>>
>>  /* Power domain flags. */
>>  #define RZG2L_PD_F_ALWAYS_ON   BIT(0)
>> +#define RZG2L_PD_F_CONSOLE     BIT(1)
>>  #define RZG2L_PD_F_NONE                (0)
>>
> 
> Kind regards
> Uffe

