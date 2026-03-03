Return-Path: <linux-renesas-soc+bounces-28699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMrXIKjbpmnHWgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:01:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F91EFCD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0619330683B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A69D3A451B;
	Tue,  3 Mar 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="auC7ZHoC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7B421A11;
	Tue,  3 Mar 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542832; cv=none; b=NyZjlBgek+P9ng5zyOaF32uFXOXDW6oDVEpT5fp6xlz3FMEdEgj9F6mnWe7ngTx3jPY4FT2/qCysxpPWCRvqsqT8ed+jNDgosJoFHydb5CB0VMT3oijyJv0Q59wi989wAXFyFI5EMCE8pcsCPTZIo2OrP+8q1y4OS6fQTr4YDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542832; c=relaxed/simple;
	bh=sLU4CjvGmfRPSBy+bKtHBq8+3UW5Gg3xy4yxHwf3Ydk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ca108SsU0AiKhNpO+9re7vSy4p+HrTLIG239SWY/FZPiG5C5REywSKotiZttUA00KxQQbAwSxc5JFTN78D2Rk1UN/dJztU8RLoHVeeDUPaEFTb9O9mlgmlRZdZD0Bgae3VX22Tj1DjB0+yOZTOZmuj4O/m02FGAFD8Gd3DmtZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=auC7ZHoC; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fQGB24shvz9vGs;
	Tue,  3 Mar 2026 14:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772542826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2VFwF6lZsmTW7oUF+jxKFfgSQs3+fOdg1QHvGpURYM=;
	b=auC7ZHoChPVSzdYpdeM17nz90XevHtLoWdH5iSzvQD6vWd9PKTA+ibllMZYQ1Zd/FAf3EC
	ZRJ/Y643AL09UhT6EaeVOHgy2OPwts21ZHbOEZNmydMnYqmP+vIWK6o6rgiK8WCRlPIzFK
	ckaH/Nww4irICSFS53nRpuKkEKn3voEQz26WRQYS05RoQKAWdLdSVy8LCISkSDDxt8Ywgm
	+bkNFzPM1Re+1xjtcf87O0Dqo4OIJ1wZDhGPcMhCWIrsMzz2bneyNrWgV2IMWvEIU4Squx
	3U9JHuwep4+2OXA216Qdcdsz2JsrH0BWBf5QZfARc1Z3P3988AvaKHhxHm/Bnw==
Message-ID: <13afd1fc-7201-4210-a697-8977d47857e7@mailbox.org>
Date: Tue, 3 Mar 2026 13:59:58 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
 <20260303-free-kudu-from-vega-20fb3e@houat>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260303-free-kudu-from-vega-20fb3e@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b037b58f9c5badefe51
X-MBO-RS-META: edztfuaxehkphj7e7z6idixxbwhj1df9
X-Rspamd-Queue-Id: 3A7F91EFCD2
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28699-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[mailbox.org:query timed out,nxp.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[qijian.guo.nxp.com:query timed out,marek.vasut.mailbox.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 3/3/26 8:56 AM, Maxime Ripard wrote:
> On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
>> On 2/6/26 12:48 PM, Marek Vasut wrote:
>>> On 1/15/26 3:39 AM, Marek Vasut wrote:
>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>> any known panels which may use this bridge. Internally, this bridge
>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>
>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>>> warn user.
>>>>
>>>> The lane configuration is preconfigured in the bridge for each of the
>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>> so the actual count should come from DT.
>>>>
>>>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> Is it OK to apply these two patches now ?
>>
>> Can this be applied now ?
> 
> It looks like you have a reviewed-by already, what's stoping you from
> applying it yourself?
I generally try to avoid applying my own patches, but if that is OK 
here, I will apply them ?

