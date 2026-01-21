Return-Path: <linux-renesas-soc+bounces-27250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGfUBPNfcWkHGgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:23:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A25F707
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB0AD5271A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E3A4534B6;
	Wed, 21 Jan 2026 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Bdsh8e/j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E855A453497;
	Wed, 21 Jan 2026 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037162; cv=none; b=i7UE6G4FtS9hyYm0TNqQ1b13KDPz+zo5Pn/+84HzP4VqtrnGfiy3N78637c7v3cDGMUJQ6yowHM7BgcnVW2qa1UNTZdqzKPiMD4bndj9tm+BdmbAaC106asKnf0ox2+vRDgLBCdlqn3ywE75Go6nL4RK/WiQKrihKXfkpLHCOgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037162; c=relaxed/simple;
	bh=hCHqtlzjf8hfwQdQf/281KKgSRCsAqoR8Oqfjk55lRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOs3ibh9J8M5I5ZNK8tw+Zir4YnolNWihYP9NbMaMXQRsEb9kKmcVgF5uIAKtV4dn61dKCSgNjCFH9DEEFafLfSykzFAp3csRDFYAmC8TlxyoyJOQKmmEwAJtfxk80cx6rZgf2nSQJ2iJsmMSG0ERQRxtj4/0Cwpu2EUXmD1XME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Bdsh8e/j; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dxKjK256Rz9tZ4;
	Thu, 22 Jan 2026 00:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769037157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUppZQenPpvUBVIu8nhMr9sOOwhAjEPUOGG5uM1B7CI=;
	b=Bdsh8e/jKNvBIKaT8T5/Z31Ug7elNln9wGfimMrHMSe88uFcmg0+XuerXVmHUWeU2IwmXj
	n6rmTSkw1NX+JiPJ2M7TR1X+NlLdWUCLLNoIfPbUPXH9hALEi3CsBq0qK05RlbmRYSQM3n
	oduIrxVPpr/SJpjV0z7Eo2EFanKlN11YE+KVan1savUeKOWwNRE40E/eRIxsOIEzNE0dIb
	pZwILFd+NbOdnWqT2zwZg4XQp1BkdF/WFtplIM9rkvEFVg2dpEmIFcxDgk2ba+UN8lE4uJ
	rZsBmkWnMoV6EPtBngQ2KujTYI2tPgJ5maP5bLc0Y2VD34xRYehT/dltMDn9NA==
Message-ID: <afd5a80f-63ff-43e3-a682-56eae25896b4@mailbox.org>
Date: Thu, 22 Jan 2026 00:12:35 +0100
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
 <cd8f71db-c2d1-4c85-8148-83822762a916@mailbox.org>
 <tuvidadi4sezm5b3ydvuie6pcxpf7pw2jrysafwdhpmtz6vjxl@o4zqdnjxkaed>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <tuvidadi4sezm5b3ydvuie6pcxpf7pw2jrysafwdhpmtz6vjxl@o4zqdnjxkaed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: a6ny3dojr7cz961m8hdk1jkf53w1g3jf
X-MBO-RS-ID: b8f65b731047e0b376a
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	TAGGED_FROM(0.00)[bounces-27250-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 024A25F707
X-Rspamd-Action: no action

On 1/21/26 11:53 PM, Dmitry Torokhov wrote:
> On Wed, Jan 21, 2026 at 11:42:55PM +0100, Marek Vasut wrote:
>> On 1/21/26 6:23 AM, Dmitry Torokhov wrote:
>>> On Tue, Jan 20, 2026 at 11:50:53PM +0100, Marek Vasut wrote:
>>>> On 1/20/26 7:31 PM, Dmitry Torokhov wrote:
>>>>> Hi Marek,
>>>>>
>>>>> On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
>>>>>> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>>>>>>     	 * the touch controller to disable the IRQs during update, so we have
>>>>>>     	 * to do it this way here.
>>>>>>     	 */
>>>>>> -	scoped_guard(disable_irq, &client->irq) {
>>>>>> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
>>>>>> -
>>>>>> -		ili210x_hardware_reset(priv->reset_gpio);
>>>>>> -
>>>>>> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
>>>>>> -
>>>>>> -		ili210x_hardware_reset(priv->reset_gpio);
>>>>>> -
>>>>>> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
>>>>>> +	if (client->irq > 0) {
>>>>>> +		scoped_guard(disable_irq, &client->irq) {
>>>>>> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>>>>> +		}
>>>>>
>>>>> You already have a scope here, no need to establish a new one:
>>>>>
>>>>> 		guard(disable_irq)(&client->irq);
>>>>> 		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>>>
>>>> This part ^ I do not understand. If there is no IRQ defined in DT, I need to
>>>> call ili210x_firmware_update_noirq() without the guard because I cannot
>>>> disable_irq() with client->irq < 0, else I need to call
>>>> ili210x_firmware_update_noirq() within the scoped_guard() to disable IRQs to
>>>> avoid spurious IRQs that would interfere with the firmware update ?
>>>
>>> You do not need to use scoped_guard() because you already define a scope
>>> in your if statement:
>>>
>>> if (client->irq > 0) {
>>> 	guard(disable_irq)(&client->irq);
>>> 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>> } else {
>>> 	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>>> }
>>>
>>> This is sill a bit awkward. Maybe we could add to interrupt.h
>>
>> Let me do the part above in V5 , and then the part below as a separate
>> follow up patch/series. I already added the later in tree so it won't be
>> lost. Does that work for you ?
> 
> It does, thanks.
OK, V5 is out, the disable_valid_interrupt guard part is coming shortly.

