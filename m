Return-Path: <linux-renesas-soc+bounces-17538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B750AAC4B69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733F717D282
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 09:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DDA24EF8B;
	Tue, 27 May 2025 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o6fF8r5z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D821DF26E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337685; cv=none; b=dXRt+xjWUfoFss6SAQgtsjBNMrMZn+bSoTEwGec3zW1CqAIqb4ZxEogk+2HG8xAh5gaJfkpDcCCyQYyAtX5RJA0MZreHeR0YcEAftVz0mBFL8McEoqpx9J6Mfs/ynI31SItXmENV8C5nN5hwnMe8vZm396dRGwoKcTXtXwUV4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337685; c=relaxed/simple;
	bh=aU4tTmGE6PwSfp5Zrm4HzzSBwUGriVgUjtSna1PuC1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyTrguVYdhHbLAiPs+wgE6fUQGVb0XZVAMV/oxs/s8EIeHRFTfR6cHlcgJERIMrNJFfYDRpvMgaK5eY7cACMEjUjqTLWXdAruNecGkknt9z0O1UWRJWAE8ymmmU+KTLU8eU1aAAx4mMO/qLzlCAze75dSvlhXL+m5aXaBe4O8Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o6fF8r5z; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad574992fcaso595086066b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748337682; x=1748942482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJZ84TnqLVLQMfUYB4KTz+ZhjBEAAQ03HCTe+FswiUg=;
        b=o6fF8r5zJrkKha8W/YcUJ9ytcicRnQ0laB1Cp+gjra04qFyZnxCNYiH8VARccOkAZb
         66JGxhv1n9GZbkYTn85F0O+d1YLdGILqEZbBeAo9k3qy1ZOlYXm9aaW2pO/crr9b0kE9
         IeMohji0asB3KUEPwcOrMApk/GNODOqzkVoZP8ip6ynFGNWTnCa6+nDElopGlKDGibkm
         E3mjcV6X1Ed4j7TknZkADY3hDHq//3n9ZgcdQF2DpGCNydD5rlOGTqoGVekPec23kw5Q
         SU6egoABpbAt9yIOoDFfeJIL4yOrHghnC+hiWrgdVW2jHuT5q09OC7GHKKsqGJeiJUK9
         NgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337682; x=1748942482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJZ84TnqLVLQMfUYB4KTz+ZhjBEAAQ03HCTe+FswiUg=;
        b=UYw0Scdj5Tuiyv4NjpXDU4XVTsWxsAhtssdwg+izzwDCd0jGlDd8yQKXgJPcWBWrtg
         02GYGGIz9AYELnt7aLECwgI89tqLsaTaoIbc+3ptDhZXQao526eKaAEHkJ/KG2Xe/aNV
         75tySLPQNGTDk2/0UL8xhFyEPNFD/GqaEZEPzGcT9KZzGYIBmk0lrNklHUdFbGxkwAjT
         HYypyWnuSTJgnCwwgm25UHp3ROOQbC35uDN3fO9iTqkOC1QXXiGrmVyDjB3yomGcPldJ
         YK1YRQXoo4yAl1lejSOxuPotgPd9t0kBJtEwZMGHWqdcwGq5y0Zye2MuwpAYpybJs/QA
         rErQ==
X-Forwarded-Encrypted: i=1; AJvYcCV62NN7MfnDVtY7r+4Y/Ckq266nefs1jNpuGaEtjYY6EMN7w+9n75RLd1B2yhwYrsbjvRU99eg6ixtVPlgdC2Iyvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpt5W1UM2vyJO82VafXPLkoOO4BzllKQMuRNfeRo+t1JWHst5
	0Yn6l1kWuGUn2FLIop6+NjlQO3GLWdspIevFc04SEQ8k41cg4gpOQS+9pzohd2d/tR8=
X-Gm-Gg: ASbGncuHXKBOS6t08/SiToQKKZrLgG/+kBbq88Bx9uLCrJpDmVLxvfxWWcc/FQF8uN1
	ltt3AMYsVIX1qXSGSlEnVBDqOgMV6QMyW7VLsOrkx1sDMMz2uoyjkYBR9TARxxcwQZ4uc/kXDqu
	/AfDSpnGRHxgdhyvUShaQZp/wCmjACmvQYOa00+yosrIEUjpuvmlhOy8mA5/fXCyRX3cMgbH5pY
	TwVTJ1wJi+1ns0tdjvYZokldvyFjdXiaApiiS7ipz24M6J2vM5bGPn4QCT6P0FPsDSSHCj96eq1
	KJGzGzJbFoDFZJYwVPJUVnXK+U0cDBKxfM0JGgjyYYaGOhjAgX8GnUb9AH8=
X-Google-Smtp-Source: AGHT+IGEMTnj9ijROVpm6lDQg2rWfa2ajJTSsgb1BKNc4AtquDxbR4iZUOL745Q8IF4UCEsE/EcCvQ==
X-Received: by 2002:a17:907:7e88:b0:ad5:4c1b:b49b with SMTP id a640c23a62f3a-ad85b22a5c1mr1081881766b.42.1748337681530;
        Tue, 27 May 2025 02:21:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad892483ba9sm52849666b.147.2025.05.27.02.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 02:21:21 -0700 (PDT)
Message-ID: <f5812f35-2cf5-4dc9-b233-fff59d354d18@tuxon.dev>
Date: Tue, 27 May 2025 12:21:19 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
 <20250514090415.4098534-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWNrU=XOZr3dKKXQikzCzJ1oUPGQofWFdRX9x6rhYn3XA@mail.gmail.com>
 <b0d15a62-e164-4a8a-b4c7-77d9c3b2e7b2@tuxon.dev>
 <CAMuHMdUT57QfwfeoFfp-rL0yX_32QQNU3-c3MnPgdbSWi182Hw@mail.gmail.com>
 <87a923c1-c996-4769-86bd-b28b42574c3a@tuxon.dev>
 <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
 <d318550c-25cb-4305-8a39-4e4ff51728d8@tuxon.dev>
 <CAMuHMdXufBWPawkSMsvEdq66EPKi2SrB2REJjaLqu1RkSO8CWg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXufBWPawkSMsvEdq66EPKi2SrB2REJjaLqu1RkSO8CWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 27.05.2025 12:10, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, 27 May 2025 at 10:58, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 26.05.2025 20:09, Geert Uytterhoeven wrote:
>>> On Mon, 26 May 2025 at 17:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 26.05.2025 16:33, Geert Uytterhoeven wrote:
>>>>> On Fri, 23 May 2025 at 09:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>>>> On 22.05.2025 17:46, Geert Uytterhoeven wrote:
>>>>>>> On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>>>>>>>> module has one or more MSTOP bits associated with it, and these bits need
>>>>>>>> to be configured along with the module clocks. Setting the MSTOP bits
>>>>>>>> switches the module between normal and standby states.
>>>>>>>>
>>>>>>>> Previously, MSTOP support was abstracted through power domains
>>>>>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>>>>>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>>>>>>>
>>>>>>>> Previous Order:
>>>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>>>> 1/ Clear module MSTOP bit
>>>>>>>> 2/ Set module CLKON bit
>>>>>>>>
>>>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>>>> 1/ Clear CLKON bit
>>>>>>>> 2/ Set MSTOP bit
>>>>>>>>
>>>>>>>> However, in some cases (when the clock is disabled through devres), the
>>>>>>>> order may have been (due to the issue described in link section):
>>>>>>>>
>>>>>>>> 1/ Set MSTOP bit
>>>>>>>> 2/ Clear CLKON bit
>>>>>>>>
>>>>>>>> Recently, the hardware team has suggested that the correct order to set
>>>>>>>> the MSTOP and CLKON bits is:
>>>>>>>>
>>>>>>>> Updated Order:
>>>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>>>> 1/ Set CLKON bit
>>>>>>>> 2/ Clear MSTOP bit
>>>>>>>>
>>>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>>>> 1/ Set MSTOP bit
>>>>>>>> 2/ Clear CLKON bit
>>>>>>>>
>>>>>>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
>>>>>>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
>>>>>>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
>>>>>>>> from the RZ/G3S HW manual, Rev1.10.
>>>>>>>>
>>>>>>>> Additionally, since multiple clocks of a single module may be mapped to a
>>>>>>>> single MSTOP bit, MSTOP setup is reference-counted.
>>>>>>>>
>>>>>>>> Furthermore, as all modules start in the normal state after reset, if the
>>>>>>>> module clocks are disabled, the module state is switched to standby. This
>>>>>>>> prevents keeping the module in an invalid state, as recommended by the
>>>>>>>> hardware team.
>>>>>>>>
>>>>>>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> - udpated patch description to avoid plural in the configuration
>>>>>>>>   sequence description b/w MSTOP and CLK_ON
>>>>>>>> - use atomic type to store the usage counter; s/refcnt/usecnt/g
>>>>>>>> - moved MSTOP_OFF(), MSTOP_MASK() macros to rzg2l-cpg.c
>>>>>>>> - dropped struct mstp_clock::critical and use clk_hw_get_flags()
>>>>>>>>   instead to get the clock flags
>>>>>>>> - used unsigned int iterators in for loops
>>>>>>>> - keep memory allocated for a single list for clocks sharing the
>>>>>>>>   same MSTOP by updating the rzg2l_mod_clock_add_shared_mstop_clk();
>>>>>>>> - s/rzg2l_cpg_mstop_show/rzg2l_mod_clock_mstop_show/g,
>>>>>>>>   s/rzg2l_cpg_mstop/rzg2l_mod_clock_mstop/g,
>>>>>>>>   s/rzg2l_cpg_update_shared_mstop_clocks/rzg2l_mod_clock_update_shared_mstop_clks/g
>>>>>>>>    to keep the same naming conventions for functions handling mod clock MSTOP
>>>>>>>> - use the newly added for_each_mstp_clk() macro all over the code
>>>>>>>
>>>>>>> Thanks for the update!
>>>>>>>
>>>>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>>>>>
>>>>>>>> @@ -1209,6 +1232,94 @@ struct mstp_clock {
>>>>>>>>                 else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
>>>>>>>>                          ((mstp_clk) = to_mod_clock(hw)))
>>>>>>>>
>>>>>>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
>>>>>>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
>>>>>>>> +                                            bool standby)
>>>>>>>> +{
>>>>>>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>>>>>>>> +       struct mstop *mstop = clock->mstop;
>>>>>>>> +       bool update = false;
>>>>>>>> +       u32 value;
>>>>>>>> +
>>>>>>>> +       if (!mstop)
>>>>>>>> +               return;
>>>>>>>> +
>>>>>>>> +       value = MSTOP_MASK(mstop->conf) << 16;
>>>>>>>> +
>>>>>>>> +       if (standby) {
>>>>>>>> +               unsigned int criticals = 0;
>>>>>>>> +
>>>>>>>> +               for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
>>>>>>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
>>>>>>>> +
>>>>>>>> +                       if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
>>>>>>>> +                               criticals++;
>>>>>>>> +               }
>>>>>>>> +
>>>>>>>> +               /*
>>>>>>>> +                * If this is a shared MSTOP and it is shared with critical clocks,
>>>>>>>> +                * and the system boots up with this clock enabled but no driver
>>>>>>>> +                * uses it the CCF will disable it (as it is unused). As we don't
>>>>>>>> +                * increment reference counter for it at registration (to avoid
>>>>>>>> +                * messing with clocks enabled at probe but later used by drivers)
>>>>>>>> +                * do not set the MSTOP here too if it is shared with critical
>>>>>>>> +                * clocks and ref counted only by those critical clocks.
>>>>>>>> +                */
>>>>>>>> +               if (criticals && criticals == atomic_read(&mstop->usecnt))
>>>>>>>> +                       return;
>>>>>>>> +
>>>>>>>> +               value |= MSTOP_MASK(mstop->conf);
>>>>>>>> +
>>>>>>>> +               /* Allow updates on probe when usecnt = 0. */
>>>>>>>> +               if (!atomic_read(&mstop->usecnt))
>>>>>>>> +                       update = true;
>>>>>>>> +               else
>>>>>>>> +                       update = atomic_dec_and_test(&mstop->usecnt);
>>>>>>>> +       } else {
>>>>>>>> +               atomic_inc(&mstop->usecnt);
>>>>>>>> +               update = true;
>>>>>>>
>>>>>>> Shouldn't the update be conditional, i.e.:
>>>>>>>
>>>>>>>     if (!atomic_read(&mstop->usecnt))
>>>>>>>             update = true;
>>>>>>>     atomic_inc(&mstop->usecnt);
>>>>>>>
>>>>>>> ?
>>>>>>
>>>>>> Indeed, it should be conditional as you suggested.
>>>>>>
>>>>>>>
>>>>>>>> +       }
>>>>>>>> +
>>>>>>>> +       if (update)
>>>>>>>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
>>>>>>>> +}
>>>>>>>
>>>>>>>> +static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
>>>>>>>> +                                                   struct mstp_clock *clock)
>>>>>>>> +{
>>>>>>>> +       struct mstp_clock *clk;
>>>>>>>> +       struct clk_hw *hw;
>>>>>>>> +
>>>>>>>> +       if (!clock->mstop)
>>>>>>>> +               return 0;
>>>>>>>> +
>>>>>>>> +       for_each_mstp_clk(clk, hw, priv) {
>>>>>>>> +               struct mstp_clock **new_clks;
>>>>>>>> +               int num_shared_mstop_clks;
>>>>>>>> +               bool found = false;
>>>>>>>> +
>>>>>>>> +               if (clk->mstop != clock->mstop)
>>>>>>>> +                       continue;
>>>>>>>> +
>>>>>>>> +               num_shared_mstop_clks = clk->num_shared_mstop_clks;
>>>>>>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
>>>>>>>> +                       if (clk->shared_mstop_clks[i] == clock) {
>>>>>>>> +                               found = true;
>>>>>>>> +                               break;
>>>>>>>> +                       }
>>>>>>>> +               }
>>>>>>>> +               if (found)
>>>>>>>> +                       continue;
>>>>>>>
>>>>>>> Can this happen? With your current code, the answer is yes.
>>>>>>> But I think this loop and check can be removed...
>>>>>>>
>>>>>>>> +
>>>>>>>> +               if (!num_shared_mstop_clks)
>>>>>>>> +                       new_clks = devm_kmalloc_array(priv->dev, 2, sizeof(*new_clks), GFP_KERNEL);
>>>>>>>> +               else
>>>>>>>> +                       new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
>>>>>>>> +                                                (num_shared_mstop_clks + 1) * sizeof(*new_clks),
>>>>>>>> +                                                GFP_KERNEL);
>>>>>>>> +
>>>>>>>> +               if (!new_clks)
>>>>>>>> +                       return -ENOMEM;
>>>>>>>> +
>>>>>>>> +               if (!num_shared_mstop_clks)
>>>>>>>> +                       new_clks[num_shared_mstop_clks++] = clk;
>>>>>>>> +               if (clk != clock)
>>>>>>>
>>>>>>> This check is always true
>>>>>>
>>>>>> If I'm not wrong now, when adding the clock to it's own list, and the list
>>>>>> is empty (!num_shared_mstop_clks check above is true), if this condition is
>>>>>> missing the clock it will be added twice in its own list.
>>>>>
>>>>> Sorry, I missed that this function is called _after_ the clock is
>>>>> added to priv->clks[].  So one question and comment here:
>>>>>   1. Do you need a one-entry array (actual allocation is two entries)
>>>>>      for module clocks with an mstop entry that is not shared?
>>>>
>>>> That extra entry should not be needed. It should not happen to have an
>>>> mstop clock in the priv->clks[] array w/o at least a clock in its shared
>>>> list. I was wrong in both the initial code and the reply I sent to your
>>>> initial comment. Appologies for that.
>>>
>>> So no single-entry arrays...
>>
>> Oh, I missread it yesterday everning. Sorry for confusion. Let me try again:
>>
>>>
>>>>>      Perhaps for critical clocks? That could be handled in
>>
>> The clock is added to its own shared_mstop_clk[] array to avoid extra
>> conditions when all the clocks sharing the same mstop need to be checked
>> for an action. One example is code at [A] (for critical clocks) that was
>> available in v1.
>>
>>
>>>>>      rzg2l_mod_clock_module_set_state(), by explicitly checking
>>>>>      the clock's own critical flag if num_shared_mstop_clks is zero.
>>
>> The clock was added to its own shared_mstop_clk[] array as a result of this
>> comment I got from you on v1 (with regards to checking the clock's critical
>> flag):
>>
>> "If clock->shared_mstop_clks[] would include the current clock, then
>> (a) this test would not be needed, and
>> (b) all clocks sharing the same mstop could share a single
>>     clock->shared_mstop_clks[] array."
>>
>> If I understood correctly, in [1] it has been proposed to have something
>> like what is proposed here to avoid extra conditional check (like [A]), in
>> rzg2l_mod_clock_module_set_state():
>>
>> for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
>>     unsigned int
>>     struct mstp_clock *clk = clock->shared_mstop_clks[i];
>>
>>     if (clk->critical)
>>         criticals++;
>> }
>>
>> /* Increment if clock is critical, too. */
>> if (clock->critical) // <<< [A]
>>     criticals++;
>>
>> Please let me know if I misunderstood your initial request?
> 
> You did not misunderstand my initial request.  Until recently, I just
> hadn't realized that you still need to check for a critical clock if
> the mstop is not shared, sorry for that.
> 
> However, I think it is better to just add an extra check
> 
>     if (!clock->num_shared_mstop_clks &&
>         (clk_hw_get_flags(&clock->hw) & CLK_IS_CRITICAL))
>             criticals++;
> 
> to rzg2l_mod_clock_module_set_state(), than to allocate single-entry
> arrays for each and every clock that does not share the mstop.
> Do you agree?

Yes!

Thank you for your review,
Claudiu

