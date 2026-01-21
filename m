Return-Path: <linux-renesas-soc+bounces-27243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEzZNKRXcWkNEwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:48:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 649335F043
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7AF69007DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 22:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2E344CAD7;
	Wed, 21 Jan 2026 22:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MF4BYXuD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F503A9607;
	Wed, 21 Jan 2026 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035384; cv=none; b=dIDCrsXQiD+nuvvvUAE7Jccs9dfJodc0j1I4cYu0peZ2QffhZuiGHTSQguXHT2OaP1cQHp8w0REYJaT1ILmfHPk+daEcsOvxGhmaKoH5O9zhFz4tzZ1lbXbzMxV8jCtMU4/uHTnqosZ85iN1y7qWM69frdrq/0+5nApJfX9m6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035384; c=relaxed/simple;
	bh=fg8Xk9PX7JILvXU8e++2P0P2K8c7zescrN7pFCtqjB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7H3Dahj6A+KL7jY4G6W0BpRXM3KA8WnzniGho8+y9AwHxuCLIUtWIt+xnzdQ8GjUtstqQdPn5nZFsLn//ZInNFRMOc5X4MEmbYK0VaeDwKIxtA05zBVluxLJOLf/vYynsKpUAMq36oORUxL/aEPN4qMDXyLFe/b5gsC8M4lfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MF4BYXuD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dxK363Jmjz9tSn;
	Wed, 21 Jan 2026 23:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769035378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY17E3F+Snom4B2+4ldWn4VuYehY/YFwS5WM3KAejnk=;
	b=MF4BYXuDH1uTLN6WU0zw1cVzx4xzSQxrfCG9wUgGaoFr8r8IUicFDYUBEaxUT4vRC5qc4X
	vQna4Xb4hBI0QPGj9phekxn/krGmQzH7ze9+RKd0pj0Cw5R9/D/XcOhicwcN3+eQ84+PSu
	9ytqMZ9PJWpPuunF0VcAUbMlB9WcHjphIEbqTWLe69xIDl9JPbe07zgkiqJ53ta0zeYkoa
	gStgtuduuKttaSykpXwox8CcfphDvCwWYJxhpdHveONadqgiMXLtPg1VkIJeLksWxN4seK
	j8LVUCXzuvMD4mKEwZ1K5XSeg654abUTEVmhy3ruzALLlcbbPsoNA6V/OpO3mg==
Message-ID: <cd8f71db-c2d1-4c85-8148-83822762a916@mailbox.org>
Date: Wed, 21 Jan 2026 23:42:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] Input: ili210x - add support for polling mode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
 <wv3vil4b4lgfrqt4qnzxiffnniw422xjfdiz4svkklnfrslz3g@yzqc265pj5t5>
 <bbb7fb54-5b04-4c38-840b-8cab58eeec7b@mailbox.org>
 <nk5qn7ye44lbtppp2opa273ut7lxkcz7jsw6giagwngiwhg7rr@puexvdzd2ymq>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <nk5qn7ye44lbtppp2opa273ut7lxkcz7jsw6giagwngiwhg7rr@puexvdzd2ymq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xyueama6a8jsbrxfa3gfqf1wsw768fui
X-MBO-RS-ID: 7ab20b14f0adaa54e52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27243-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 649335F043
X-Rspamd-Action: no action

On 1/21/26 6:23 AM, Dmitry Torokhov wrote:
> On Tue, Jan 20, 2026 at 11:50:53PM +0100, Marek Vasut wrote:
>> On 1/20/26 7:31 PM, Dmitry Torokhov wrote:
>>> Hi Marek,
>>>
>>> On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
>>>> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>>>>    	 * the touch controller to disable the IRQs during update, so we have
>>>>    	 * to do it this way here.
>>>>    	 */
>>>> -	scoped_guard(disable_irq, &client->irq) {
>>>> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
>>>> -
>>>> -		ili210x_hardware_reset(priv->reset_gpio);
>>>> -
>>>> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
>>>> -
>>>> -		ili210x_hardware_reset(priv->reset_gpio);
>>>> -
>>>> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
>>>> +	if (client->irq > 0) {
>>>> +		scoped_guard(disable_irq, &client->irq) {
>>>> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>>> +		}
>>>
>>> You already have a scope here, no need to establish a new one:
>>>
>>> 		guard(disable_irq)(&client->irq);
>>> 		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>
>> This part ^ I do not understand. If there is no IRQ defined in DT, I need to
>> call ili210x_firmware_update_noirq() without the guard because I cannot
>> disable_irq() with client->irq < 0, else I need to call
>> ili210x_firmware_update_noirq() within the scoped_guard() to disable IRQs to
>> avoid spurious IRQs that would interfere with the firmware update ?
> 
> You do not need to use scoped_guard() because you already define a scope
> in your if statement:
> 
> if (client->irq > 0) {
> 	guard(disable_irq)(&client->irq);
> 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> } else {
> 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> }
> 
> This is sill a bit awkward. Maybe we could add to interrupt.h

Let me do the part above in V5 , and then the part below as a separate 
follow up patch/series. I already added the later in tree so it won't be 
lost. Does that work for you ?

> void __disable_valid_irq(unsigned int irq)
> {
> 	if (irq > 0)
> 		disable_irq(irq);
> }
> 
> void __enable_valid_irq(unsigned int irq)
> {
> 	if (irq > 0)
> 		enable_irq(irq);
> }
> 
> DEFINE_LOCK_GUARD_1(disable_valid_irq, int,
> 		    disable_valid_irq(*_T->lock), enable_valid_irq(*_T->lock))
> 
> and then we'd be able to keep the driver as is (just adjust the type of
> the original scoped_guard).
> 
>>
>>> BTW, not a fan of the "_noirq" suffix... Maybe drop it and add
>>> lockdep_is_held() there?
>>
>> This part I understand even less, how does lockdep play into this ? The
>> scoped_guard() disables and enables IRQs if they are available.
> 
> Ah, sorry, brainfart on my part. I got confused by _noirq suffix.
OK

