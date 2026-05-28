Return-Path: <linux-renesas-soc+bounces-33261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNDKApT9F2oTYQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 10:32:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEDC5EE9E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 10:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35891300C0DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5EA379EC6;
	Thu, 28 May 2026 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8EUTL3r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115E37996B;
	Thu, 28 May 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956992; cv=none; b=l9YscXBEGPO4C7BsSatopsBtK8V4Us6L1Z3d81e+6OAQ8n6WifNJ8IqTFDo8Uag9XX38w96L9d6+J/nOTBXIj2WjCqboA9eB625GlR9PG+sPFoO1RDXToa/mF0LD2Q4m5SsJOgd2A70PPUBZagc0nuVhW6GAXdtKlRPvQflByfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956992; c=relaxed/simple;
	bh=okD7iOXseNTi+jh7CHNlono8UQl09YO/P4GhYKk76mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwLsmQSgk3xfy/WdHBbMBoJN1zltWU4RjtW/Q2BFFnXHzsTRWATqYrnvRHzzNgnDPVa4qiJ6qSzdgINRPl1EbX/iNlBFUNjHgMDnbrWMXTko3ZXm60viM+qmADB7PG91wfYnp5bFlncWKQzDLLJs4jzVM/+xMeLZG0d+34xRtn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8EUTL3r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4767A1F00A3A;
	Thu, 28 May 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956990;
	bh=e+d+mPKVJtuyhvoelHxJWZa6tDGCQO++RJc+s3Av7ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A8EUTL3rvw6qP7SzzK9AGJw97EWgDbIh586kp9h8O6HzTwLLDgkjA+9rlVi01hNqZ
	 8UATqGu9KQbCI7qxlWYo4/9Q1BlghOf8IXR+DNO1SwbT5+PapFdd047vIqY5r/8H4E
	 So/E30ZseiHz1ULXGZtRffdpMFMS2NVIO5QKDUgW7FYnJmsxlC00x6K1BbKIh+Ukm7
	 uZWp3HHdDGqCnlfE9AdB8HN0upM/6H0YYbmpOG+nwFDH/gpTxAPuMwiQr76ZI6+Jvq
	 t1kVqf/socThqG1lWXf2Qhu0YkB3Q31F+N0cj8h8ZT+3mynQT9aul5peJCoSgsU5EF
	 C0XegRq11a9Lw==
Message-ID: <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
Date: Thu, 28 May 2026 11:29:46 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] i3c: renesas: Restore STDBR and EXTBR registers on
 resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-4-claudiu.beznea@kernel.org>
 <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33261-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 9CEDC5EE9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Frank,

On 5/22/26 22:10, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:01PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S supports a power saving state where power to the most
>> SoC componentes (including I3C) is lost.
>>
>> The STDBR and EXTBR are configured in initialization phase though the
>> struct i3c_master_controller_ops::bus_init. Set them on resume function
>> as well to keep the same state of the controller after a suspend with
>> power loss and a similar initialization sequence as in bus_init.
>>
>> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index 1917549cf6d5..6c23f956ad2a 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -260,6 +260,7 @@ struct renesas_i3c {
>>   	u32 dyn_addr;
>>   	u32 i2c_STDBR;
>>   	u32 i3c_STDBR;
>> +	u32 extbr;
> 
> can you keep consisent with above 2 register, use upcase EXTBR,

Using upper case for this will mislead the compiler. There is already a macro 
defined for EXTBR:

#define EXTBR                   0x78

Defining this member as:

u32 EXTBR;

will make the compiler try to replace the EXTBR in "i3c->EXTBR" at preprocessing 
time:

   CC [M]  drivers/i3c/master/renesas-i3c.o
../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier or ‘(’ 
before numeric constant
    65 | #define EXTBR   0x78
       |                 ^~~~
../drivers/i3c/master/renesas-i3c.c:263:6: note: in expansion of macro ‘EXTBR’
   263 |  u32 EXTBR;
       |      ^~~~~
../drivers/i3c/master/renesas-i3c.c: In function ‘renesas_i3c_bus_init’:
../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before 
numeric constant
    65 | #define EXTBR   0x78
       |                 ^~~~
../drivers/i3c/master/renesas-i3c.c:611:7: note: in expansion of macro ‘EXTBR’
   611 |  i3c->EXTBR = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
       |       ^~~~~
../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before 
numeric constant
    65 | #define EXTBR   0x78
       |                 ^~~~
../drivers/i3c/master/renesas-i3c.c:613:40: note: in expansion of macro ‘EXTBR’
   613 |  renesas_writel(i3c->regs, EXTBR, i3c->EXTBR);
       |                                        ^~~~~
../drivers/i3c/master/renesas-i3c.c: In function ‘renesas_i3c_resume_noirq’:
../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before 
numeric constant
    65 | #define EXTBR   0x78
       |                 ^~~~
../drivers/i3c/master/renesas-i3c.c:1451:40: note: in expansion of macro ‘EXTBR’
  1451 |  renesas_writel(i3c->regs, EXTBR, i3c->EXTBR);
       |                                        ^~~~~

The register contains both i3c and i2c specific fields. I'm not sure using 
i2c_i3c_EXTBR is the best way to go forward for this or just keeping it as is.

-- 
Thank you,
Claudiu


