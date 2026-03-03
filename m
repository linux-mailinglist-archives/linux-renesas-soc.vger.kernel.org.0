Return-Path: <linux-renesas-soc+bounces-28715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IGYK5jupmnjaQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:22:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0E1F15D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 15:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 083BB30C68F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165F83DEAC6;
	Tue,  3 Mar 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bX7R4Mos"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36D3D6480;
	Tue,  3 Mar 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547356; cv=none; b=KuPm3gg/M7QrlqOlYKU91Xo4lRGYmlMeXVTS1v2wH4DSwAW5ojzT+ACbjVJxaAeyUwie6wMP+JLdoR106Utk2tvyN0ls8QhR3JL8s2oHJQ/rUsd6/yN71cS+0L4WhkrIwXtDBGFDjMJYKscP7hh6jlYu+EUloXwKFknSozLXYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547356; c=relaxed/simple;
	bh=Gicao+9lu9MvYgyTTephIYFRDsgSVj1OSu5Lvq1Ev10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfLYZANS04mN4zm3huHlmNb38rDvvnxsOac5qudMKHnblBuGofQBK0CrrmIj5pe1kEjHtzBMqrCy9M8Iq1jGkdlh28x/OFMyfe0gec5SV9Gc1cX6xpJ4MWDG/zlv4PG+2lOXPZVjWpizO2F8sZGsqlCKiRHkfSr9C4VgVP0lnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bX7R4Mos; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fQHs25dxRz9vCJ;
	Tue,  3 Mar 2026 15:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772547350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vkxg76Zvr5nEIh4+DPVppUp2uw6hT8c9cXZv6TYN+wg=;
	b=bX7R4MosXKdYmrqTRLni21XP9YeHU4+puTDdwo5DE1ey5ibk3lwt1H7ZlBSo936dgmW8Sc
	WhaJvZgZP5JvrFb25A9EgTbzJdEPOEmpjcGDZfHA1jFj8onefDPmXSQihGuIkLsmzKTTrD
	up3ty7Bs9dIdCbyDOHj80JnhfuHR1t3+/U/xPq0uvROodBWBoTI3gWvhA4JOVbWKeYASpX
	XKjwgrd8voOmcyWdNT5Noq/hHHzhqLo6YVM9hfku00nnwc/uSOWjnWXt4tWPWVOPqDBJ4s
	FiFoKzCYbmHaSNZQpEX3AgMgQu2bMf1oTlPedkzbKPDtFl2SF+J3CKGr4ozWZQ==
Message-ID: <eab056af-cc63-4ccf-a089-03d8ccdf89d1@mailbox.org>
Date: Tue, 3 Mar 2026 15:15:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
 <20260303-free-kudu-from-vega-20fb3e@houat>
 <13afd1fc-7201-4210-a697-8977d47857e7@mailbox.org>
 <DGT6NVXAVDOH.1RAMJDTU22I4O@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DGT6NVXAVDOH.1RAMJDTU22I4O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: mj734nhz7wpm6zqbqdizwigeorrak6mj
X-MBO-RS-ID: afe2d02ea44f4e40261
X-Rspamd-Queue-Id: 37C0E1F15D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28715-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/3/26 2:32 PM, Luca Ceresoli wrote:
> Hi Marek,
> 
> On Tue Mar 3, 2026 at 1:59 PM CET, Marek Vasut wrote:
>> On 3/3/26 8:56 AM, Maxime Ripard wrote:
>>> On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
>>>> On 2/6/26 12:48 PM, Marek Vasut wrote:
>>>>> On 1/15/26 3:39 AM, Marek Vasut wrote:
>>>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>>>> any known panels which may use this bridge. Internally, this bridge
>>>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>>>
>>>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>>>>> warn user.
>>>>>>
>>>>>> The lane configuration is preconfigured in the bridge for each of the
>>>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>>>> so the actual count should come from DT.
>>>>>>
>>>>>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>
>>>>> Is it OK to apply these two patches now ?
>>>>
>>>> Can this be applied now ?
>>>
>>> It looks like you have a reviewed-by already, what's stoping you from
>>> applying it yourself?
>> I generally try to avoid applying my own patches, but if that is OK
>> here, I will apply them ?
> 
> I fid it a bit weird as well, but it's the common practice in drm-misc, so
> I do it when there are enough R-by / A-by.
> 
> One thing I'm never sure about is the definition of "enough R-by / A-by"
> though. I used to kind of assume at least a maintainer listed in
> MAINTAINERS should approve the patch. But that also seems not a rule for
> drm-misc, at least for patches that impact only a specific driver and not
> core or otherwise shared code, and/or which look "obviously correct".
> 
> Based on the above, I'm applying this series right now.
Thank you

