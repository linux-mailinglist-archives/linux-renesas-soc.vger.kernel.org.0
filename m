Return-Path: <linux-renesas-soc+bounces-28089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDp1FD8JimluFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 17:20:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B9112722
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 17:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7191630138A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 16:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56235342CA5;
	Mon,  9 Feb 2026 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ToSjream"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B51F3BA4;
	Mon,  9 Feb 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654012; cv=none; b=tAr50h1X2+EicLLTitmVaNL5xI8xsTm5Ehb7Lx66X95IyUNIobzsq5Aiz6fckWx9Rvt62lAcom9eXKQ6sb9hT0stX0aUjQWwFUZ+SajQIBYj+XGw2K+NcWRqp3rxgsW23/1TOmv+fdln+5UbMCD1Czks/EM2dBw1mD0ROqBq0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654012; c=relaxed/simple;
	bh=sRVcQwDVq6e2uWgaZQhS01lsXJcLMZ1Ppawm0dOnK5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tb9+ainQ4R7AcHwurN8VWDpsSv5u3TS71T4tVImtvEqcaJhk1YBjqRROZT+eEq0i+ojLvywqLVmA4YXmRRVFi3CP9ADOtQAIStFefMwv+cljPsNedJ2bDZmu7sNOSIVT+jp5cmZpv+oXNf3yNphC11j/rBfaoIdNhQE+MmJCz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ToSjream; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f8qfb4c8Zz9vGT;
	Mon,  9 Feb 2026 17:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770654007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mheOQ3ZsEitKxTfDWvElUu/CWXpGhuWicvtisrl9azA=;
	b=ToSjreamnbDhZ+ckfkQfh7To3b50S/SvtMGUmX6pm93aFO5cwtHPAEq7Ts5dgluYhbTY8Y
	2VxCSwxAGp94nVVd6Q+p02EU/8sLw31Ab7k0aqRGo4ggkVrjTloPJ09KSG4aKovphv1EJ8
	GN8KZs0gOGr6PjHPSWBGQRYVPt2aRQdEH+uIRtA0YllZIqxGGHR5agfsl28sxLnnphgDwD
	fYPtmrY/owxlbA0RD+VFvGFC9i/TCJckbK9WFQPAkIHrB2r4CxBbO2trjLpxXXtD+QimS4
	gRDm8THR4YWrIHq50fdTUfChWdPvq9Z7W9te2KaiFVuVtMilnD6z8ZvXiLt8Eg==
Message-ID: <6ba32e90-9db9-49ab-886b-966e0aa171c4@mailbox.org>
Date: Mon, 9 Feb 2026 17:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto> <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: e1q3d1hmpyss1sw191f8k6td7mfr1fpp
X-MBO-RS-ID: aff92f44e05a52bfbda
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28089-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,arm.com:email,mailbox.org:mid,mailbox.org:dkim,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 860B9112722
X-Rspamd-Action: no action

On 2/9/26 4:44 PM, Sudeep Holla wrote:
> On Mon, Feb 09, 2026 at 11:53:19AM +0100, Marek Vasut wrote:
>> On 1/19/26 5:57 PM, Cristian Marussi wrote:
>>> On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
>>>> Implement new property arm,no-completion-irq, which sets all SCMI
>>>> operation into poll mode. This is meant to work around uncooperative
>>>> SCP implementations, which do not generate completion interrupts.
>>>> This applies to mbox/shmem based implementations.
>>>>
>>>> With this property set, such implementations which do not generate
>>>> interrupts can be interacted with, until they are fixed to generate
>>>> interrupts properly.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Cristian Marussi <cristian.marussi@arm.com>
>>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>>> Cc: arm-scmi@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Drop no IRQ handling from SMC transport and update commit message
>>>> V3: Rename property from arm,poll-transport to arm,no-completion-irq
>>>> V4: No change
>>>> ---
>>>>    drivers/firmware/arm_scmi/common.h | 4 ++++
>>>>    drivers/firmware/arm_scmi/driver.c | 4 ++++
>>>>    2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>>>> index 7c35c95fddbaf..7c9617d080a02 100644
>>>> --- a/drivers/firmware/arm_scmi/common.h
>>>> +++ b/drivers/firmware/arm_scmi/common.h
>>>> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>>>>     *		      to have an execution latency lesser-equal to the threshold
>>>>     *		      should be considered for atomic mode operation: such
>>>>     *		      decision is finally left up to the SCMI drivers.
>>>> + * @no_completion_irq: Flag to indicate that this transport has no completion
>>>> + *		       interrupt and has to be polled. This is similar to the
>>>> + *		       force_polling below, except this is set via DT property.
>>>>     * @force_polling: Flag to force this whole transport to use SCMI core polling
>>>>     *		   mechanism instead of completion interrupts even if available.
>>>>     * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
>>>> @@ -254,6 +257,7 @@ struct scmi_desc {
>>>>    	int max_msg;
>>>>    	int max_msg_size;
>>>>    	unsigned int atomic_threshold;
>>>> +	bool no_completion_irq;
>>>>    	const bool force_polling;
>>>>    	const bool sync_cmds_completed_on_ret;
>>>>    	const bool atomic_enabled;
>>>> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
>>>> index 3e76a3204ba4f..f167194f7cf67 100644
>>>> --- a/drivers/firmware/arm_scmi/driver.c
>>>> +++ b/drivers/firmware/arm_scmi/driver.c
>>>> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>>>>    	cinfo->is_p2a = !tx;
>>>>    	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>>>>    	cinfo->max_msg_size = info->desc->max_msg_size;
>>>> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>>>>    	/* Create a unique name for this transport device */
>>>>    	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
>>>> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>>>>    	if (ret && ret != -EINVAL)
>>>>    		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>>>> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
>>>> +							      "arm,no-completion-irq");
>>>> +
>>>>    	dev_info(dev,
>>>>    		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>>>>    		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
>>>
>>> LGTM.
>>>
>>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>>
>> Is there anything left to do with these patches, or can this now be picked
>> up ?
>>
> 
> As I had mentioned here[1], I am happy with it and I will pick it up for
> v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
> I had sent my PR to SoC team for v7.0
OK, thank you

