Return-Path: <linux-renesas-soc+bounces-33046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RvjmOOhhEWpclQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 10:14:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28A5BDD29
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 10:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8848E3011755
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 08:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C932D3ED2;
	Sat, 23 May 2026 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khtrc05z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718A2032D;
	Sat, 23 May 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779524068; cv=none; b=sIsvvCL7MfTibUn8dYSFzsjC19emS3w4dwGIkZZ1xMkF4gaXESvQF3XtYXmHwuSupAVb3UZl0J5OPu0d8ASPzUpBQecUjYHam48sqO44nBsT0X8qSalZIVuaF2hwTWrELvxkj1JG18dnz96szdbfnDCMPZokUEsAF3GIjq4FE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779524068; c=relaxed/simple;
	bh=csdmdrcuxLpdXVOAhfP7zCvOPa4UhfDvh9jpsP3A2Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jcjv63l5zciHhVzKZ5SbQMJjd6aqxCCqXOkd3rVMaMzqhiFHxxKuv/j1qTbN+lL4TlwQldnvLlZaW0ehls0RN+JCcBGdbMGc4SgN8RJDvi6ORXL2dX9wuJ/RWaJR5XHjBDBWzvATlqt3kGIYu6RJyaF1/Qe2CjT37EsoDMLmwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khtrc05z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C637B1F000E9;
	Sat, 23 May 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779524067;
	bh=GL+RzpSO6B/WqNvCitg5GgJC9+53s7fBCUotsbLyogc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=khtrc05zufZUSXhAft3+tmNq2hcjhNoTUEt7Y225qTSTtcZtrfnOVKAD8I8p2XmAl
	 9UG02p1KkaXVyYZUQCCpy7/5fI1zpJjRUYrMkQ3vGrGczxDvWQ91uNujrVNdb2HV28
	 lAbAenWkAUeHMLH7yGDzPFoVp/A+QzroKg11bCmSQtY9OWZNcd0r37i7Ot/k+MjU2P
	 zrasUeseBU1Lw/t/ZYOkFR7d4CE1fUizMwyAUkOojQwupS7BJUUQ1MzstNoHU2mdVI
	 EvBMrbuZNIEgBx5e+LoKP091QQgqmtcmXMvqweR7ELpKAmho+kZ9a2fp0ZjesxjD8Y
	 g1aeTZa5k88oA==
Message-ID: <67bd230e-df9a-47fa-bdd7-d8b1e2ff1649@kernel.org>
Date: Sat, 23 May 2026 11:14:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] i3c: renesas: Use the divider 128
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-3-claudiu.beznea@kernel.org>
 <ahCpQUIH9_8mB0CP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCpQUIH9_8mB0CP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33046-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C28A5BDD29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 22:06, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:00PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The REFCKCTL.IREFCKS field is 3 bits wide, and setting it to 7 selects a
>> divider of 128 for the internal reference clock. Use this divider value.
> 
> This doesnot reflect what your change, code add one more search for clks = 7

cks is later written in the renesas_i3c_bus_init() to the REFCKCTL.IREFCKS. The 
following lines are from the renesas_i3c_bus_init() function:

	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
	i3c->refclk_div = cks;

> 
> Frank
> 
>>
>> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index 36e3ccbe66b0..1917549cf6d5 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -559,7 +559,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>>
>>   	i2c_parse_fw_timings(&m->dev, &t, true);
>>
>> -	for (cks = 0; cks < 7; cks++) {
>> +	for (cks = 0; cks <= 7; cks++) {
>>   		/* SCL low-period calculation in Open-drain mode */
>>   		od_low_ticks = ((i2c_total_ticks * 6) / 10);
>>
>> --
>> 2.43.0
>>

-- 
Thank you,
Claudiu


