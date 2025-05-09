Return-Path: <linux-renesas-soc+bounces-16836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE0AB1145
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E958188FE71
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3728F514;
	Fri,  9 May 2025 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="I+ZzaCtU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9A28CF51
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 10:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788069; cv=none; b=h7ZvK/tRWmyehQQJU/pDFCMlR8FspOUQ6bOd3ll4QR8LgtMtwiVC6lccM7oK5a2syDvuADZMIEGnafu97jcBTcsYAPb8r2KrcyL1tanHxUBXLzr1rmza9+tbmuvkS8TEN56BMS15rF5UaMt48PhPhkMctUmdU3Ahm8ZYk99jiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788069; c=relaxed/simple;
	bh=mGRFCgj9h5bTJw7ABvbXIICYipnfwd1bc3lMZ0hvxuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFnJpa33pQ0wi8wvRLcpFGxWXkUzmX+eqDbKR06JgKBHNWw94QtM4PSu01b/A1F52ntIQPnB5uaHHtz2tJSijEHXaQJCPH62xRfwVrrQkq0rpHPF2sDlSMdyRPFGh+GCupoa5ltIjE1IRyK6AX5lrVUGbAbmDkMDUIZ7h6Uj+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=I+ZzaCtU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so3712857a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746788066; x=1747392866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLIdLzT/v+ZxrdlLaHMVok4neUfENeTLsPAZ+uBDcSI=;
        b=I+ZzaCtUQr1jAm5GKquTBKTw21ggB2f3Z40PvlPARRVgKu40DXOWkPOuf109Wn8bZo
         JXw2IBXNYd2bbhdd4ucwaPOvVPJ10SiqF6NVKhwHvyrd4dhkzsX5Ri2eQge1gFub0Gql
         7AfHgyoeaXwzLhKo2oE/m2cadukDESyRiQEGuTufA2MNJlNhLgrqzzXvA99UOCzqxxyl
         o1I64R3AZ2KL5+kEy2Ukm2Q8oyrrBvPF3KXGUnkYtqziXX1B+yp7kchimxQHK8/QK3GO
         fxRgj1iyIeOMDhTmIFGuxIhPnISq8zO8eiJYVI+LDCHlHTmNTysVvEs6cipqZWCCe62R
         hqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788066; x=1747392866;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLIdLzT/v+ZxrdlLaHMVok4neUfENeTLsPAZ+uBDcSI=;
        b=eD28Tc/7WdLARZi3rtNVL4WMmFHtNJ5d8uz+4KosV98Elrwe26xR7f1VnmYB1lbe1Y
         LexfhxXksK5JaCISyi/IHt8HGGe3tF5NMEhaGXWO1w+hZ4XcGfJh/eLqxfLVk7ahMoyh
         iH0rD9BmpWbAMJPwy6QKlvpuLXqKgR39W7Chx0cQlH0vJoOsj2rwccX03RxiRleOd/aM
         233SRunSZGrslzcRosLQfUVh9fKR/QdGnJmOwgsy6+c9mG0YlFoVodZaOydV29uuVZjQ
         EmQ+AgRv/DEixsGTWAeeX6Y4m1324z++n4XrJFMYRpmbO1Zw0LmXLSq3JnbG/5PRU/kj
         bZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxXWVHiMKCADSDd8qPrW8C0YAkLmDyF1Sf262p3mZ/3DB7bVt5wc0YFTwU56MrIOuoUg5namLIOUDmJPjKYQ1KaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwbeow02iIU4ctshahLUL+XM9i9DW/hXdrVdG214mlwfk5754
	Uw+TiINYwRgXtGEyup5lQ12X3MT4pzUM+zTN9EXR2oTDdKhRJM4lXMIWo1zA040=
X-Gm-Gg: ASbGncszLBSq1jsYU7HVba6CbeEYJhmdA7W6FILdT3fGWmaFL3je9GE7x6hBehbfXae
	NwK+Li817pshZ4WbweWIKjV00y72S5JCybqU+FQXS71eS4aCaaUJcAWlfIZ2VAA5PqCine2lOp0
	a9U/okSFqbYeLowu307ARdiByHSe7UZSludPmrIheVk7nVbyHafsE1GLktuCHmurbQTd+cd0sOo
	iapIepz7PzS+ArIU1ffbCpEUGEnX3iPiXm6uc3ix02Ku7i/uYABBDaQuKf8iLEnx14AbsWRyul9
	kP7joVo+GMtaI0AY7Jk7ZJ7GqqHEOwxDlQ3Sq4NQU/H/cFyxRAISvC4szZ0=
X-Google-Smtp-Source: AGHT+IFvU/XM6WJ7lvVMHttCj3JCtHbBaU6vNbGR7wIV/k7/0uLPlCYvYLbFPr1tK1uDr4cZpMYPbg==
X-Received: by 2002:a17:906:6a0a:b0:ad2:2a5d:b1af with SMTP id a640c23a62f3a-ad22a5db5b9mr39920966b.55.1746788065842;
        Fri, 09 May 2025 03:54:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933beb6sm133655766b.52.2025.05.09.03.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:54:25 -0700 (PDT)
Message-ID: <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev>
Date: Fri, 9 May 2025 13:54:24 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 07.05.2025 18:42, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>> module has one or more MSTOP bits associated with it, and these bits need
>> to be configured along with the module clocks. Setting the MSTOP bits
>> switches the module between normal and standby states.
>>
>> Previously, MSTOP support was abstracted through power domains
>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>
>> Previous Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Clear module MSTOP bits
>> 2/ Set module CLKON bits
>>
>> B/ Switching to Standby State (e.g., during remove):
>> 1/ Clear CLKON bits
>> 2/ Set MSTOP bits
>>
>> However, in some cases (when the clock is disabled through devres), the
>> order may have been (due to the issue described in link section):
>>
>> 1/ Set MSTOP bits
>> 2/ Clear CLKON bits
>>
>> Recently, the hardware team has suggested that the correct order to set
>> the MSTOP and CLKON bits is:
>>
>> Updated Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Set CLKON bits
>> 2/ Clear MSTOP bits
>>
>> B/ Switching to Standby State (e.g., during remove):
>> 1/ Set MSTOP bits
>> 2/ Clear CLKON bits
>>
>> To prevent future issues due to incorrect ordering, the MSTOP setup has
>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
>> from the RZ/G3S HW manual.
>>
>> Additionally, since multiple clocks of a single module may be mapped to a
>> single MSTOP bit, MSTOP setup is reference-counted.
>>
>> Furthermore, as all modules start in the normal state after reset, if the
>> module clocks are disabled, the module state is switched to standby. This
>> prevents keeping the module in an invalid state, as recommended by the
>> hardware team.
>>
>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> 
>> @@ -1180,27 +1183,147 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>>                 core->name, PTR_ERR(clk));
>>  }
>>
>> +/**
>> + * struct mstop - MSTOP specific data structure
>> + * @refcnt: reference counter for MSTOP settings (when zero the settings
>> + *          are applied to register)
>> + * @conf: MSTOP configuration (register offset, setup bits)
>> + */
>> +struct mstop {
>> +       refcount_t refcnt;
>> +       u32 conf;
>> +};
>> +
>>  /**
>>   * struct mstp_clock - MSTP gating clock
>>   *
>>   * @priv: CPG/MSTP private data
>>   * @sibling: pointer to the other coupled clock
>> + * @mstop: MSTOP configuration
>> + * @shared_mstop_clks: clocks sharing the MSTOP with this clock
>>   * @hw: handle between common and hardware-specific interfaces
>>   * @off: register offset
>>   * @bit: ON/MON bit
>> + * @num_shared_mstop_clks: number of the clocks sharing MSTOP with this clock
>>   * @enabled: soft state of the clock, if it is coupled with another clock
>> + * @critical: specifies if this clock is critical
>>   */
>>  struct mstp_clock {
>>         struct rzg2l_cpg_priv *priv;
>>         struct mstp_clock *sibling;
>> +       struct mstop *mstop;
>> +       struct mstp_clock **shared_mstop_clks;
>>         struct clk_hw hw;
>>         u16 off;
>>         u8 bit;
>> +       u8 num_shared_mstop_clks;
>>         bool enabled;
>> +       bool critical;
> 
> I think you can do without this flag, and use
> "clk_hw_get_flags(&mstp_clock.hw) & CLK_IS_CRITICAL" instead.

You're right, it should be achievable.

> 
>>  };
>>
>>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>>
>> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
>> +                                            bool standby)
>> +{
>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>> +       struct mstop *mstop = clock->mstop;
>> +       bool update = false;
>> +       u32 value;
>> +
>> +       if (!mstop)
>> +               return;
>> +
>> +       value = MSTOP_MASK(mstop->conf) << 16;
>> +
>> +       if (standby) {
>> +               unsigned int criticals = 0;
>> +
>> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
> 
> unsigned int
> 
>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
>> +
>> +                       if (clk->critical)
>> +                               criticals++;
>> +               }
>> +
>> +               /* Increment if clock is critical, too. */
>> +               if (clock->critical)
>> +                       criticals++;
> 
> If clock->shared_mstop_clks[] would include the current clock, then
> (a) this test would not be needed, and

Agree!

> (b) all clocks sharing the same mstop could share a single
>     clock->shared_mstop_clks[] array.

I'll look into this but I'm not sure how should I do it w/o extra
processing at the end of registering all the clocks. FWICT, that would
involve freeing some shared_mstop_clks arrays and using a single reference
as the shared_mstop_clks[] is updated after every clock is registered. Can
you please let me know if this what you are thinking about?

Updating the shared_mstop_clks[] after each clock is registered is
necessary in this implementation to avoid wrong setup of MSTOP in case 2
clocks shared it, one is critical, one isn't and taking into account that
they can be registered in any order:

case 1:
- at moment T1 the critical clock is registered
- at moment T2 the non-critical clock is registered

case 2:
- at moment T1 the non-critical clock is registered
- at moment T2 the critical clock is registered

where T1 < T2

> 
>> +
>> +               /*
>> +                * If this is a shared MSTOP and it is shared with critical clocks,
>> +                * and the system boots up with this clock enabled but no driver
>> +                * uses it the CCF will disable it (as it is unused). As we don't
>> +                * increment reference counter for it at registration (to avoid
>> +                * messing with clocks enabled at probe but later used by drivers)
>> +                * do not set the MSTOP here too if it is shared with critical
>> +                * clocks and ref counted only by those critical clocks.
>> +                */
>> +               if (criticals && criticals == refcount_read(&mstop->refcnt))
>> +                       return;
>> +
>> +               value |= MSTOP_MASK(mstop->conf);
>> +
>> +               /* Allow updates on probe when refcnt = 0. */
>> +               if (!refcount_read(&mstop->refcnt))
>> +                       update = true;
>> +               else
>> +                       update = refcount_dec_and_test(&mstop->refcnt);
>> +       } else {
>> +               if (!refcount_read(&mstop->refcnt)) {
>> +                       refcount_set(&mstop->refcnt, 1);
>> +                       update = true;
>> +               } else {
>> +                       refcount_inc(&mstop->refcnt);
>> +               }
> 
> I think if you would replace the refcount_t by an atomic_t, you could
> use atomic_inc() unconditionally, cfr. rzv2h-cpg.c.

OK

> 
>> +       }
>> +
>> +       if (update)
>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
>> +}
>> +
>> +static int rzg2l_cpg_mstop_show(struct seq_file *s, void *what)
>> +{
>> +       struct rzg2l_cpg_priv *priv = s->private;
>> +
>> +       seq_printf(s, "%-20s %-5s %-10s\n", "", "", "MSTOP");
>> +       seq_printf(s, "%-20s %-5s %-10s\n", "", "clk", "-------------------------");
>> +       seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
>> +                  "clk_name", "cnt", "cnt", "off", "val", "shared");
>> +       seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
>> +                  "--------", "-----", "-----", "-----", "------", "------");
>> +
>> +       for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
>> +               struct mstp_clock *clk;
>> +               struct clk_hw *hw;
>> +               u32 val;
>> +
>> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
>> +                       continue;
>> +
>> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
>> +               clk = to_mod_clock(hw);
> 
> As this patch adds four more loops iterating over all module clocks
> and skipping empty entries, I think it is worthwhile to introduce a
> custom for_each_mstp_clock()-iterator.

I was thinking about it and I tried do it with a macro, keeping this code
in it:

    for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
        struct mstp_clock *clk;
        struct clk_hw *hw;
        u32 val;

        if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
            continue;

but it was a complicated macro and abandoned it in the end.

> 
>> +               if (!clk || !clk->mstop)
> 
> Can !clk happen? None of the other loops check for that.

You're right, it can't happen.

> 
>> +                       continue;
>> +
>> +               val = readl(priv->base + MSTOP_OFF(clk->mstop->conf)) &
>> +                     MSTOP_MASK(clk->mstop->conf);
>> +
>> +               seq_printf(s, "%-20s %-5d %-5d 0x%-3lx 0x%-4x ", clk_hw_get_name(hw),
> 
> Please drop the trailing space in the format...
> 
>> +                          __clk_get_enable_count(hw->clk), refcount_read(&clk->mstop->refcnt),
>> +                          MSTOP_OFF(clk->mstop->conf), val);
>> +
>> +               for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)
>> +                       seq_printf(s, "%pC ", clk->shared_mstop_clks[i]->hw.clk);
> 
> ... add add it here, by changing this format to " %pC".

OK.

> 
>> +
>> +               seq_puts(s, "\n");
>> +       }
>> +
>> +       return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(rzg2l_cpg_mstop);
>> +
>>  static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>>  {
>>         struct mstp_clock *clock = to_mod_clock(hw);
> 
>> +
>> +static int rzg2l_cpg_add_shared_mstop_clock(struct device *dev,
>> +                                           struct mstp_clock *target,
>> +                                           struct mstp_clock *added)
>> +{
>> +       for (u8 i = 0; i < target->num_shared_mstop_clks; i++) {
> 
> unsigned int
> 
>> +               if (target->shared_mstop_clks[i] == added)
>> +                       return 0;
>> +       }
>> +
>> +       target->shared_mstop_clks = devm_krealloc(dev, target->shared_mstop_clks,
>> +                                                 sizeof(*target->shared_mstop_clks) *
>> +                                                 (target->num_shared_mstop_clks + 1),
>> +                                                 GFP_KERNEL);
>> +       if (!target->shared_mstop_clks)
>> +               return -ENOMEM;
>> +
>> +       target->shared_mstop_clks[target->num_shared_mstop_clks++] = added;
>> +
>> +       return 0;
>> +}
>> +
>> +static int rzg2l_cpg_update_shared_mstop_clocks(struct rzg2l_cpg_priv *priv,
>> +                                               struct mstp_clock *clock)
>> +{
>> +       if (!clock->mstop)
>> +               return 0;
>> +
>> +       for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
>> +               struct mstp_clock *clk;
>> +               struct clk_hw *hw;
>> +               int ret;
>> +
>> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
>> +                       continue;
>> +
>> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
>> +               clk = to_mod_clock(hw);
>> +               if (clk == clock)
>> +                       continue;
>> +
>> +               if (!clk->mstop || clk->mstop != clock->mstop)
> 
> The first test is not needed, as clock->mstop is always non-zero here.

I agree.

> 
>> +                       continue;
>> +
>> +               ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static void __init
>>  rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>>                            const struct rzg2l_cpg_info *info,
> 
>> @@ -1406,6 +1655,12 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>>                 }
>>         }
>>
>> +       ret = rzg2l_cpg_update_shared_mstop_clocks(priv, clock);
>> +       if (ret) {
>> +               clk = ERR_PTR(ret);
>> +               goto fail;
>> +       }
>> +
>>         return;
>>
>>  fail:
>> @@ -1877,6 +2132,13 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>>         for (i = 0; i < info->num_mod_clks; i++)
>>                 rzg2l_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
>>
>> +       /*
>> +        * Initialize MSTOP after all the clocks were registered to avoid
>> +        * invalid reference counting when multiple clocks (critical,
>> +        * non-critical) shares the same MSTOP.
> 
> share
> 
>> +        */
>> +       rzg2l_mod_clock_init_mstop(priv);
>> +
>>         error = of_clk_add_provider(np, rzg2l_cpg_clk_src_twocell_get, priv);
>>         if (error)
>>                 return error;
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.h
>> +++ b/drivers/clk/renesas/rzg2l-cpg.h
>> @@ -82,6 +82,10 @@
>>  #define SEL_PLL6_2     SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
>>  #define SEL_GPU2       SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
>>
>> +#define MSTOP(name, bitmask)   ((CPG_##name##_MSTOP) << 16 | (bitmask))
>> +#define MSTOP_OFF(conf)                FIELD_GET(GENMASK(31, 16), (conf))
>> +#define MSTOP_MASK(conf)       FIELD_GET(GENMASK(15, 0), (conf))
> 
> The last two definitions are only used in rzg2l-cpg.c, so they can be
> moved there.

I'll move it there.

Thank you for your review,
Claudiu

> 
>> +
>>  #define EXTAL_FREQ_IN_MEGA_HZ  (24)
>>
>>  /**
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


