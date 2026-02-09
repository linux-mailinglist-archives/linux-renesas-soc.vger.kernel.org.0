Return-Path: <linux-renesas-soc+bounces-28058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDcpLq68iWmkBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:53:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E509F10E62F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 416703002510
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4007E36827A;
	Mon,  9 Feb 2026 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uZQEmMMn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03AE86277;
	Mon,  9 Feb 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634409; cv=none; b=rjeLxZWybw63ln0ROkCmgOPxXY3QWZUS3yVYQZb+N/FDe6148E625FYx002bSPIVWRfyk2PriIof6guqlrE8lX8ezPNPO85DC3Cunpu0j6+ofCV4aiscZAWglOlaExra9QcZa8QKgE/UzgUsXMmPZRuL9yQpqNdhZ0Flzrdrugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634409; c=relaxed/simple;
	bh=uDuWzyBl4dA9pi/IOlkf021Hxqs2hiMrQfiIO8VANVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h11MTFGOcQvf1iwZGe8fCT6nrOzOmPDejCea4+ShUN8Nvm5aGsOtryJsZGU0vHy8QNjBGIDl1V9wVpiffqF+QG+yH/BVvhfl8aSabyJ6wfvrCyN0fkhjgwQ2JpWta+38+MUfki/LDcoCtOM74/icViS0L+6ipFtpbNItU1i1YBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uZQEmMMn; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f8hPb5V7kz9thJ;
	Mon,  9 Feb 2026 11:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770634403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zydFrzJH+96vd0MZWYoBxPrLaZzn7gyZbiDZtRmiFmw=;
	b=uZQEmMMnqu+KKkZ6j/RoqENlHAYih92qjoTX2RaoOITAcMDFjc6Cln1dOivYcTvBwCo7Bx
	/b2FwwI4Ib4T7smuNHNINr6GWzQXiRHenm3gDr52is6xKWqgnc53uE3ve6WudEEU/mbY7d
	Wl75V0PZ4Mr53AD2oOnPvtMWnzskEdg3cby0JXhUQeZrXKayveXIz38/GYTpkK3rE4aEhs
	NEaUbUZA9WNyf2DYt+1AgsV5FS6lm3Sb5lQuMy38SKERsrDTTUnabxV57I1YS+Tg8JHtlo
	BFjD9OR+i411hQmxi436AgQqspwEZLlfOgLNLjJE+abCbisNU7+UVI9O8nxvVg==
Message-ID: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
Date: Mon, 9 Feb 2026 11:53:19 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aW5ifVcxVf6uux3m@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: cbaba4dbcdf869d6e0d
X-MBO-RS-META: wetqpb4rrqtabw7urz9ywxbqnbzbkuq4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28058-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:email,arm.com:email,broadcom.com:email]
X-Rspamd-Queue-Id: E509F10E62F
X-Rspamd-Action: no action

On 1/19/26 5:57 PM, Cristian Marussi wrote:
> On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
>> Implement new property arm,no-completion-irq, which sets all SCMI
>> operation into poll mode. This is meant to work around uncooperative
>> SCP implementations, which do not generate completion interrupts.
>> This applies to mbox/shmem based implementations.
>>
>> With this property set, such implementations which do not generate
>> interrupts can be interacted with, until they are fixed to generate
>> interrupts properly.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Cristian Marussi <cristian.marussi@arm.com>
>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: arm-scmi@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Drop no IRQ handling from SMC transport and update commit message
>> V3: Rename property from arm,poll-transport to arm,no-completion-irq
>> V4: No change
>> ---
>>   drivers/firmware/arm_scmi/common.h | 4 ++++
>>   drivers/firmware/arm_scmi/driver.c | 4 ++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>> index 7c35c95fddbaf..7c9617d080a02 100644
>> --- a/drivers/firmware/arm_scmi/common.h
>> +++ b/drivers/firmware/arm_scmi/common.h
>> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>>    *		      to have an execution latency lesser-equal to the threshold
>>    *		      should be considered for atomic mode operation: such
>>    *		      decision is finally left up to the SCMI drivers.
>> + * @no_completion_irq: Flag to indicate that this transport has no completion
>> + *		       interrupt and has to be polled. This is similar to the
>> + *		       force_polling below, except this is set via DT property.
>>    * @force_polling: Flag to force this whole transport to use SCMI core polling
>>    *		   mechanism instead of completion interrupts even if available.
>>    * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
>> @@ -254,6 +257,7 @@ struct scmi_desc {
>>   	int max_msg;
>>   	int max_msg_size;
>>   	unsigned int atomic_threshold;
>> +	bool no_completion_irq;
>>   	const bool force_polling;
>>   	const bool sync_cmds_completed_on_ret;
>>   	const bool atomic_enabled;
>> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
>> index 3e76a3204ba4f..f167194f7cf67 100644
>> --- a/drivers/firmware/arm_scmi/driver.c
>> +++ b/drivers/firmware/arm_scmi/driver.c
>> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>>   	cinfo->is_p2a = !tx;
>>   	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>>   	cinfo->max_msg_size = info->desc->max_msg_size;
>> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>>   
>>   	/* Create a unique name for this transport device */
>>   	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
>> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>>   	if (ret && ret != -EINVAL)
>>   		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>>   
>> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
>> +							      "arm,no-completion-irq");
>> +
>>   	dev_info(dev,
>>   		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>>   		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
> 
> LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Is there anything left to do with these patches, or can this now be 
picked up ?

Thank you.

