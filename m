Return-Path: <linux-renesas-soc+bounces-33048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEqlAjCAEWo4mwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:23:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F445BE7BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59143300788B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 10:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C9E383C9E;
	Sat, 23 May 2026 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUI+Xjho"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B837DE9E;
	Sat, 23 May 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531820; cv=none; b=Qh/qxzkDJCjIdHDi+q6Jook5aaG4z+n18WG1I47RmpSNROM+elaOi2d9h/OUAp+guM1Tyxx3/IUepnO3CwVEit9Dnl3kQuMXxXoO7ChIAWrVm9B7Op6zhTRs0W4ZB3oWK18DpEAI0bI3g5w0UPd8yJZdqm6JXvKNxALbFV1bZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531820; c=relaxed/simple;
	bh=W/8l8ScypkMZvMUEwSiVQEBIyPE48Ll+XqtmgPGqSHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhhVKI7YS4rB+d/9fthXc+4W8TB/A8Onmwc0Ls/RovvTZwkWxuQ/yQ128lnswA+usHESxtR474xLFdUfhy2URud4ifXGdrxLyigPnS8tXiOZfiION4Zk7QRza8IM6rQvJJVsPXzfiWKmto/kh3LH3hfuubChnmQdEFoq0xUEG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUI+Xjho; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB6F1F000E9;
	Sat, 23 May 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779531818;
	bh=ICIzDyBoCehYoL8IVnENyKvYnUKscdQTwuLa+4IjgWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UUI+XjhocYOZg9w8yfBxLG7CypFp6LwNDdDHYtsNEePdLV66uwNKYuuXATIGLORXK
	 sqAULjsaV2fydSlAEAMlelpXUm/GEsIxhsxlP9oVPsy/5HwNfIm67K8xqGtTd567D3
	 +P5eo7DgBZyXbMCmYtDeP9yVjxeoSnZrSXVIX5bNC5DjbcApAe/uJ490oHTJAD2Bz4
	 dcBcL/UIROHnn0UvUELZEgi93RLq6T3idD6MaGvYHoJisgelSweCK1Ydu5CGEVBmaf
	 QSaEn8Wkl2keJlYZHDoFP2TZWmpz0gxohL5L47+99DHe21HfBiejmuW65QnZO2vJnu
	 B7Wuu7PwLDbZQ==
Message-ID: <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Date: Sat, 23 May 2026 13:23:33 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: renesas: Add runtime PM support
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-18-claudiu.beznea@kernel.org>
 <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33048-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 87F445BE7BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 23:01, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:15PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
>> the clocks of the IP are managed through a clock PM domain. To keep the
>> I3C code simpler, the explicit clock handling was dropped along with the
>> addition of runtime PM support, in favor of the runtime PM APIs. Only the
>> code for getting tclk was preserved, as it is necessary to compute the
>> I3C clock rate.
>>
>> All the APIs provided to the I3C subsystem through struct
>> i3c_master_controller_ops are guarded with runtime PM APIs to
>> enable/disable the controller at runtime.
>>
>> As the Renesas I3C driver implements an asynchronous transmit model by
>> preparing a transfer and waiting for its completion through the ISR,
>> renesas_i3c_abort_xfer() was added to disable interrupts and synchronize
>> IRQs before runtime suspending the controller. For this, the interrupts
>> were saved in struct renesas_i3c::irqs. Along with this,
>> renesas_i3c_wait_xfer() return type was changed to unsigned long.
>>
>> Along with the clocks, the controller pin configuration is changed
>> through the provided "sleep" pin configuration.
>>
>> Add runtime PM support for the Renesas I3C driver.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 183 ++++++++++++++++++++++++++-----
>>   1 file changed, 156 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index a070db4d2440..3b9807a89b54 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -21,7 +21,9 @@
> ...
>>   static int renesas_i3c_probe(struct platform_device *pdev)
>>   {
>>   	struct renesas_i3c *i3c;
>> @@ -1360,12 +1448,21 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>>   	if (IS_ERR(i3c->regs))
>>   		return PTR_ERR(i3c->regs);
>>
>> -	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
>> -	if (ret <= RENESAS_I3C_TCLK_IDX)
>> -		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
>> -				     "Failed to get clocks (need > %d, got %d)\n",
>> -				     RENESAS_I3C_TCLK_IDX, ret);
>> -	i3c->num_clks = ret;
> 
> you can still use devm_clk_bulk_get_all(), if need tclk, you iterate clks
> to find 'tclk', in case in future, need more clocks than tcls.

Indeed, but as they are not needed in the current driver form, I would prefer to 
drop handling both of them as the final code looks simpler. As the clocks are 
enabled/disabled through PM domain, getting rid of 
devm_clk_bulk_get_all_enabled() simplifies the code, FMPOV, it drops 1 pointer 
and 1 int. So, I would like to keep it like this if all OK.

Also, if I'm not wrong, Geert (in cc) prefers having the clock controlled 
directly through power domains if that is possible. I concluded that from:

commit d303ce595cac
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Wed Mar 20 11:30:03 2019 +0100

     i2c: riic: Add Runtime PM support

     - Replace explicit clock handling by Runtime PM calls,
       - Streamline Runtime PM handling in error paths,
       - Enable Runtime PM in .probe(),
       - Disable Runtime PM in .remove(),
       - Make sure the device is runtime-resumed when disabling interrupts in
         .remove().

     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
     Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
     Tested-by: Chris Brandt <chris.brandt@renesas.com>
     Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

> 
>> +	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");
>> +	if (IS_ERR(i3c->tclk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tclk), "Failed to get tclk");
>> +
>> +	i3c->dev = &pdev->dev;
>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
>> +	pm_runtime_use_autosuspend(&pdev->dev);
>> +	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_dont_use_autosuspend,
>> +				       i3c->dev);
> 
> do you cleanup resource in renesas_i3c_dont_use_autosuspend(), look likes
> needn't it.

According to documentation at [1] this is necessary.

[1] 
https://elixir.bootlin.com/linux/v7.1-rc4/source/Documentation/power/runtime_pm.rst#L616

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>>
> ...
>>
>> +static int renesas_i3c_runtime_suspend(struct device *dev)
>> +{
>> +	return pinctrl_pm_select_sleep_state(dev);
> 
> Only change pin state, don't disable clock?

Clocks are handled though the I3C PM domain.

On the Renesas SoCs, where this driver is enabled, clocks are controlled though 
clock PM domains. Every runtime PM suspend/resume will call 
clk_disable()/clk_enable() though the PM domains.

-- 
Thank you,
Claudiu


