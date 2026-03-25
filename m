Return-Path: <linux-renesas-soc+bounces-30247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKTgBOrrw2kAvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:06:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812B32668E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96EF83158707
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3679B3081D6;
	Wed, 25 Mar 2026 13:42:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7222576E;
	Wed, 25 Mar 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446144; cv=none; b=F4zP+m0o5laoHlit+g6pzxtikS+WAZhgPUbzdq4WxKyuEEoDqrR4gf1LWPgpkUDMRcdD8AZ1e2bRhHsSt8VO70G+Dwb9TwNbC8svAF/poqi8ES1z8LXXRffXZgiaPwSjI2pstjF9ulcbP9gun3qX5wjVhdvXTMdeph+CV7KvsuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446144; c=relaxed/simple;
	bh=HmWVUxrenyQ7CjxU69gBn92Lpj2Xad3skbuPKl/0QsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1vyT279vpfRblEZyQP9KlMFrb1GBYjHc6cM+M6ITHHArgt9fXrp0YGUvlI+5zv0oDPN2SQ2gAOk4+XNERUD8LhhYdSkitm8te1nasStzhTiwkVlxllJGKeQBw46VSxyaKqHvRP6OtamXwETairH2Mc3FSlEYT4YYEXkF6916ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fgp455J6pz9vD7;
	Wed, 25 Mar 2026 14:42:13 +0100 (CET)
Message-ID: <ecbbfcde-7f51-455b-bb54-b5302e43b582@mailbox.org>
Date: Wed, 25 Mar 2026 14:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex
 MIPI-HDMI adapter
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Scott Murray <scott.murray@konsulko.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8rtm93ju491ad1x3sjgu8jiqyor49wpx
X-MBO-RS-ID: bc1cffd0535c5fa0316
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mailbox.org : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30247-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,konsulko.com:email,glider.be:email]
X-Rspamd-Queue-Id: 5812B32668E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 2:32 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Fri, 20 Mar 2026 at 03:53, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>>
>> From: Scott Murray <scott.murray@konsulko.com>
>>
>> Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
>> on the Retronix R-Car V4H Sparrow Hawk board.
>>
>> Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware
>>
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
>> @@ -0,0 +1,94 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +/*
>> + * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
>> + * on R-Car V4H ES3.0 Sparrow Hawk board
>> + *
>> + * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
> 
> This include is not needed, so I will drop it while applying.
> 
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.1.
Thank you very much.

