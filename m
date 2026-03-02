Return-Path: <linux-renesas-soc+bounces-28673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJo6BrcGpmkzJAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 22:52:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC961E436A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 22:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE3953083AE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 21:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EB23845BC;
	Mon,  2 Mar 2026 21:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Dfz5DyTB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB853175A6E;
	Mon,  2 Mar 2026 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487349; cv=none; b=nYLisd3Vkf3zC/Vu1QdCzsBogNEJ9wgnq414Ifvsf3uELZ53AqKazr9PXmyzch7VcBlRrcEkNlOMewPm+f+YG8Kxo0axQ2htJ6LIanSzOR47Q7R3UbUFma6K+f3620tqloy+0/563ztSgIgvi1RM8C49USmZyfVO/M6mUxptKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487349; c=relaxed/simple;
	bh=MXrnbhwOtZ1tGNCzYX4BW2BB/uWvHFbq7kaPs9bC5uY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SgeJWXSB0jb5i25NbQLv90Sh+LLVbFlNY2egCoZlgBz+9aHYhx+hxSJeBWV3ZQFsxv9Tn6S2C/PIzkKF7aN83eVpDCg3ciYiI7Gmr90KLkLMs/fqXk+ytwVvtdJTlxe74/nBkO6hdCHBlyCFMD5NJmziS9x9HLKRat6VWAOZtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Dfz5DyTB; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fPsfy5NNCz9smr;
	Mon,  2 Mar 2026 22:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772487339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NIL6uWapbdqpgG2p/sw1LyDcO+MB0fwXIJZ+3kK7fM=;
	b=Dfz5DyTB1FJq7VJSjg7agABbEOTueivJOUnVhKT9L3mn1zdf1G7UeV+uZlfH0YDVTpkzht
	4QNaZRCZp8Ia0CWWtIzE/AJt4zLSmPdLYDrfcQazk6RuUJdckEASwDRr6tvZAOpO7zoq4T
	80JYUhSZzoyw7RM9RINEHI9bqNvp2L2vnBOvqDyc/H0zz0PRG/QMQdSGsDtP7QqWduJCry
	EggVpojN17RR5eu1w7gebHGJJsmSj5BLSjf7H165qevABqb0+pdtcRH9UiriHZ6waTPPtT
	J7vN+zOLvri/dcVcHcDk0PUJDQo7N/a4WkpqXwuAvlFfltd5xg09OLRtvH+ylA==
Message-ID: <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
Date: Mon, 2 Mar 2026 22:35:31 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
From: Marek Vasut <marek.vasut@mailbox.org>
To: dri-devel@lists.freedesktop.org
Cc: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
Content-Language: en-US
In-Reply-To: <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dkqf49gjzjuakfhs31ap9sy1mc6uzb4y
X-MBO-RS-ID: 06d59b41ff50c3666a5
X-Rspamd-Queue-Id: CEC961E436A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28673-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 2/6/26 12:48 PM, Marek Vasut wrote:
> On 1/15/26 3:39 AM, Marek Vasut wrote:
>> Parse the data lane count out of DT. Limit the supported data lanes
>> to 1..4 which is the maximum available DSI pairs on the connector of
>> any known panels which may use this bridge. Internally, this bridge
>> is an ChipOne ICN6211 which loads its register configuration from a
>> dedicated storage and its I2C does not seem to be accessible. The
>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>
>> To avoid any breakage on old DTs where the parsing of data lanes from
>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>> warn user.
>>
>> The lane configuration is preconfigured in the bridge for each of the
>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>> others seem to use 2-lane configuration. This is a hardware property,
>> so the actual count should come from DT.
>>
>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Is it OK to apply these two patches now ?

Can this be applied now ?

