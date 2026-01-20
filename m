Return-Path: <linux-renesas-soc+bounces-27168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HjpGAI5cGmgXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:25:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC64A4FB96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEEC5B824BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB2A33AD92;
	Wed, 21 Jan 2026 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qWN0ItoC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D32DC321;
	Wed, 21 Jan 2026 02:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962252; cv=none; b=sK3RT5L3Yn4ckJJId66ARUtZWECBNgtDhNDEqgROyHSWVAnWu6z38SDU9+9Zm8chyym3VQ0JTRLpuNCpWKxRHjjHJX21o2T1w1d6s1GH/1ESgZOC4UNyWJXyvf7HfQ+ay2EJXI4YB+beFSn4l0tohQAd8cfaBft9lo4aShtrHaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962252; c=relaxed/simple;
	bh=uuWVUoGYHrkj4GBzW9gouueDc89AxfZzyrX4/ByjEcw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=P+MQ17HyiWqeoBMowuMZppJObO9mRfMvWZzAeEqEuC7MX1cwtSE8et/mf4ulKgyg5Gwp3E1xhxy/xidIQnItlS6MIYvvrb3aYjDXcdtB2bRLwz2PvdjH/VgRu70yZkkvv8kGQqfzeBxvGSJuG2ksvx4MTIz4yIPsbQJAYbPy1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qWN0ItoC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dwp0d3nKCz9tZ4;
	Wed, 21 Jan 2026 03:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768962241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Xk0V5+/P35y4eNpECrp9bUD8/V60w+BQqMMOVLK4aU=;
	b=qWN0ItoCokIwMsaZfw4q6fd5BUBVEn0eRnrtWwIS+QcLqPyPZX40pQqakewBBjiN4Ekqyb
	STPWPBkR651BjeF0giGiDwOJn6+Gznd3L+PvdF7L3XpTF1U6QV4UTeYpZ1xIQpXcNg8mg/
	JqUSzekqy6inJyohz+mX70+ia40TaKA9PDvZWqT1xRHuPM4f8msSkurQikuV35MyTKTzYd
	71FCwfTnpjNjxHiwQbtMs5cmxlO5soLxROUWZuMJeCjHs1MXsD/LvDeK6tsYQs/STb2r/f
	g2bJqaUP0E27kCVf9Dyzpveuz7mNT42mY7fVmYO7jayJ0i6wbyPH1y7mTJx5LQ==
Message-ID: <bbb7fb54-5b04-4c38-840b-8cab58eeec7b@mailbox.org>
Date: Tue, 20 Jan 2026 23:50:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
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
Content-Language: en-US
In-Reply-To: <wv3vil4b4lgfrqt4qnzxiffnniw422xjfdiz4svkklnfrslz3g@yzqc265pj5t5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ghmmbmxexk636ps4qygwgcegrqmzh68d
X-MBO-RS-ID: 1594bc70bcdd82069f5
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27168-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EC64A4FB96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 7:31 PM, Dmitry Torokhov wrote:
> Hi Marek,
> 
> On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
>> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>>   	 * the touch controller to disable the IRQs during update, so we have
>>   	 * to do it this way here.
>>   	 */
>> -	scoped_guard(disable_irq, &client->irq) {
>> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
>> -
>> -		ili210x_hardware_reset(priv->reset_gpio);
>> -
>> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
>> -
>> -		ili210x_hardware_reset(priv->reset_gpio);
>> -
>> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
>> +	if (client->irq > 0) {
>> +		scoped_guard(disable_irq, &client->irq) {
>> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>> +		}
> 
> You already have a scope here, no need to establish a new one:
> 
> 		guard(disable_irq)(&client->irq);
> 		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);

This part ^ I do not understand. If there is no IRQ defined in DT, I 
need to call ili210x_firmware_update_noirq() without the guard because I 
cannot disable_irq() with client->irq < 0, else I need to call 
ili210x_firmware_update_noirq() within the scoped_guard() to disable 
IRQs to avoid spurious IRQs that would interfere with the firmware update ?

> BTW, not a fan of the "_noirq" suffix... Maybe drop it and add
> lockdep_is_held() there?

This part I understand even less, how does lockdep play into this ? The 
scoped_guard() disables and enables IRQs if they are available.

