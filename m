Return-Path: <linux-renesas-soc+bounces-28707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BJSNOjkpmngZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:40:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D987C1F076F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 673213001F8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB98522F767;
	Tue,  3 Mar 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kurKGptw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05924634F;
	Tue,  3 Mar 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544742; cv=none; b=g9Pc3EWwOJ9DNR52sn+O8meFGZpiJXMP3a6Go2Ss+R2e9tRWv8YAmcHfpjcSs1Y940O62ZxsWel9hwVchJVgXsgWwbQtpTWVhN51OZlFfj4GHmTkIwjIPBPveEILR/+VHxgntrXplhIroZHcAcqGUSV44bpYx82SOigx8I6+qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544742; c=relaxed/simple;
	bh=F4R4BuiVwaGL6fM5FKZFZ3bTTOYW0fP3BnbH3sBUzgI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JsxGY+WRfVQ7/W0Ds0T2fjCuPLstDCa6ZTyCfy9ON/4tNJ91vAmqrFxXCOLkjxR//9KtwrDPWJ4dwKrQdI9Go5eaeG++yT736Vmxsj2MUmpMpUHm/StA/++elsos4FqSb+HTG36NmtIWgs4ZxvzI/mhqNfj4UX34PFI1dQkzhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kurKGptw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 84ADB1A2381;
	Tue,  3 Mar 2026 13:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 581605FF29;
	Tue,  3 Mar 2026 13:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43FF6103685C9;
	Tue,  3 Mar 2026 14:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772544734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F4R4BuiVwaGL6fM5FKZFZ3bTTOYW0fP3BnbH3sBUzgI=;
	b=kurKGptwNBgx97Nbs09DD48evi4y4kAF/JfpG5R6MDoCLwN6bpvbKG84wy5su02C2n+/Ub
	xODc5dcZWF0djTm0RW0kdXEQ+ziLWLGIvVnbioFanV4L1uz3vuCaFRcCz9d3xH/Bdp1IFv
	y6QzJ1QkSCSs1VmdS4l0Ur1ICmM8XnWUOJJgZIvd/8lZrHj+QNjLdwOVk4XKVn91NPJeRT
	O01TtIUrvKpFQIBq3LYNfNCQBHmADV2K0jHPbg+r1EK628WnFdgC31+NRFgkOqDwn1W2+x
	JqPTvz6Z/QU8pLUy50w6O8Bemd2oGoKS/rL5+vDshBBAZ9oaTd82V8xDVl70OQ==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:32:02 +0100
Message-Id: <DGT6NVXAVDOH.1RAMJDTU22I4O@bootlin.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
Cc: <dri-devel@lists.freedesktop.org>, "Joseph Guo" <qijian.guo@nxp.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Robert Foss"
 <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Marek Vasut" <marek.vasut@mailbox.org>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
 <20260303-free-kudu-from-vega-20fb3e@houat>
 <13afd1fc-7201-4210-a697-8977d47857e7@mailbox.org>
In-Reply-To: <13afd1fc-7201-4210-a697-8977d47857e7@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D987C1F076F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28707-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,nxp.com:email]
X-Rspamd-Action: no action

Hi Marek,

On Tue Mar 3, 2026 at 1:59 PM CET, Marek Vasut wrote:
> On 3/3/26 8:56 AM, Maxime Ripard wrote:
>> On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
>>> On 2/6/26 12:48 PM, Marek Vasut wrote:
>>>> On 1/15/26 3:39 AM, Marek Vasut wrote:
>>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>>> any known panels which may use this bridge. Internally, this bridge
>>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>>
>>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>>> DT may fail, fall back to the original hard-coded value of 2 lanes an=
d
>>>>> warn user.
>>>>>
>>>>> The lane configuration is preconfigured in the bridge for each of the
>>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration=
,
>>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>>> so the actual count should come from DT.
>>>>>
>>>>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>
>>>> Is it OK to apply these two patches now ?
>>>
>>> Can this be applied now ?
>>
>> It looks like you have a reviewed-by already, what's stoping you from
>> applying it yourself?
> I generally try to avoid applying my own patches, but if that is OK
> here, I will apply them ?

I fid it a bit weird as well, but it's the common practice in drm-misc, so
I do it when there are enough R-by / A-by.

One thing I'm never sure about is the definition of "enough R-by / A-by"
though. I used to kind of assume at least a maintainer listed in
MAINTAINERS should approve the patch. But that also seems not a rule for
drm-misc, at least for patches that impact only a specific driver and not
core or otherwise shared code, and/or which look "obviously correct".

Based on the above, I'm applying this series right now.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

