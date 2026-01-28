Return-Path: <linux-renesas-soc+bounces-27546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOG4MUAPemmS2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:29:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E996DA225C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12AD1300D4EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD5D353ED6;
	Wed, 28 Jan 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xybBbXel"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5D353EE1;
	Wed, 28 Jan 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606942; cv=none; b=OJd2kRehJ0W64/3vab1WuwDynl+mGp6J6UCwTNEmmwnfiljlph+jt2BqTF5v5HTpTtHcm3bknuw5meL4KznC3wnQ172x8utRnNUdqJNpqDmIcSUASbG43biWnTMIA54aKxFVnN7l5IWhSdJPXPY09JFQgDHhGhq33LA6cq8XUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606942; c=relaxed/simple;
	bh=y5vYOLgx3cVJ4xsFoUREyI2wOh+cp6RjX/o+7apYM1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUqVeEZ9dJT55IXKVfOzQGatE5K6aD5bDVA+0t1b386iiXPYG3SGAzOG0rmZ/ZVkPp8G7UGz0H/6L16Ho/kpNncPDdN7Q3+vdk1wAlNrZ2S3JKbZhGJdTXmRzBNboxv7Ir2oKAlcFVwXSfZNEsO0Wvlphiuse8AgVtyz1Xlbuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xybBbXel; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f1NQV15DGz9thG;
	Wed, 28 Jan 2026 14:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769606930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KM8GzemEIH/Q71xxgkibRWwKmhIZTb6iheRXTA+oDaY=;
	b=xybBbXelV8xkd9SD4DOiSdqkruqY7uC3a0y9oddbIMCY7KtrcGa6t49uubVg5k6LOHtjk/
	DLGndw9T4BXsgBQCl4+MH/mZRDCQcVzQUZrkiWtGgc/NekIxufqhaJWD8faSTa+UPhYLHm
	fCu+4U8rYeNFiWb6ZWX7xyAV+7CNyqiC6MoaAkReDuiNGV9ZQ9QIwZ2Tt8mE+928T/zjjk
	SPn7yHrTxiibTpZDjF0sPLCmCwrpuKMYORzaf41aYPobjeYcbQYAbcRsgDRoA/4SlvRq7Q
	UshN4ybDYCOAQEkrGblIvwSjBrSTaEBnPhNr/7DnqZBkkSJkzjJwBipY25keng==
Message-ID: <701e739d-2e82-40e7-87b5-b4ec92903af6@mailbox.org>
Date: Wed, 28 Jan 2026 13:23:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
To: Thomas Gleixner <tglx@kernel.org>, linux-input@vger.kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Marc Zyngier <maz@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <87sebrbenj.ffs@tglx>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87sebrbenj.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ff3e1687a4111fcf642
X-MBO-RS-META: y3u56ynwk98nrqzd85s75cucxghctzn9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27546-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E996DA225C
X-Rspamd-Action: no action

On 1/27/26 10:14 AM, Thomas Gleixner wrote:
> On Thu, Jan 22 2026 at 00:23, Marek Vasut wrote:
> 
> $Subject: linux/interrupt.h is not a proper prefix. Just use 'genirq:'
> 
> Also what means 'allow ....'? Subject lines should provide a concise
> summary of the change, i.e. something like:
> 
>          Provide conditional disable_irq guard variant

I did admittedly replicate the subject and tags from prior commit

c76494768761 ("linux/interrupt.h: allow "guard" notation to disable and 
reenable IRQ")

Fixed, thanks.

>> Introduce disable_valid_irq scoped guard. This is an extension
>> of disable_irq scoped guard, which disables and enables IRQs
>> around a scope. The disable_valid_irq scoped guard does almost
>> the same, except it handles the case where IRQ is not valid,
>> in which case it does not do anything. This is meant to be used
>> by for example touch controller drivers, which can do both IRQ
>> driven and polling mode of operation, and this makes their code
>> slighly simpler.
> 
> How many of those have this pattern? From a cursory look I found not
> even one as your example is neither applicable to upstream nor to next.

One. I think I have two-ish more candidates for conversion.

>> +static inline void disable_valid_irq(unsigned int irq)
>> +{
>> +	if (irq > 0)
>> +		disable_irq(irq);
>> +}
>> +
>> +static inline void enable_valid_irq(unsigned int irq)
>> +{
>> +	if (irq > 0)
>> +		enable_irq(irq);
>> +}
>> +
>> +DEFINE_LOCK_GUARD_1(disable_valid_irq, int,
> 
> 'int' because it matches the function argument type of the inlines,
> right?
> 
>> +		    disable_valid_irq(*_T->lock), enable_valid_irq(*_T->lock))
> 
> disable_valid_irq is a pretty non-intuitive name if you look at it just
> by reading a usage site. It's not really improving the readability of
> the code, it's in fact obscuring it as the reader has to actually look
> up what the hell this means and then stumble upon a completely
> undocumented lock guard define.
> 
> I'm all for using guards, but using guards just for the sake of using
> guards is not a really good approach.
I wouldn't even be opposed to converting the ili2xxx driver (the piece 
of code in patch 2/2 of this series) back to simple enable/disable_irq() 
. I am not particularly on board even with the disable_irq lock guard, 
or more specifically, lock guard used for non-lock things like this.

