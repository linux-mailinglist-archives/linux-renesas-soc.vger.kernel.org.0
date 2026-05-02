Return-Path: <linux-renesas-soc+bounces-31890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CObZMg249mmwXwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 04:50:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB744B42F1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 04:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD0A23001FD6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 02:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7D033B975;
	Sun,  3 May 2026 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="khdl8CnH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C092188596;
	Sun,  3 May 2026 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777776651; cv=none; b=BX8PJPikOSSH7WygIQKDiKNXXB7BfgBLehaPLcVX7N2BMQzv90643xxcq/qeZd/2hotMkHhI9qqhn3Cy8EwtliU5/XL/SRiuDpgq1CWWFth4QaXa+/Gic6P58HRFUs9TBLaeIJ58Y+hStOyXEmlfn8swEHjwacS4Ad9TeQRyR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777776651; c=relaxed/simple;
	bh=1FjViA5hvJyZ/LsmIK7ksV+Cft1GjoD3Thb5jztjDco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/LmGt3yrIZ3WrdwaukkGzgZPga/mXxqTjjtRQWdwGTzB6tb1hTddBFPJW7J2cvaWh3NUmIF8Q29R4E2MdNfY330MmP2B02PbG1TL4GkXfnZ69PrjuAeWHGqhutRcaHmmpD69o1paRrcja+Ojo+ECYhnF/VlBQs8FyyvQeo+1CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=khdl8CnH; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g7TmP5BtLz9tjP;
	Sun,  3 May 2026 04:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777776645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1A1qyP8QeOPCU1K/hsX1FmZmqrWn214Zp6AIo4nhBs=;
	b=khdl8CnHDmq8rAwn3UDgffvBS7llbtM4SCECCpjOR0ezbfjH17+dLJReJmvcKjc+UoOKGA
	RU3Z5xmkgQ3EoXJ8P1d+KjiiNYxCDEMTnsGK0BVWbBmRpi3lRxIkgHVYBx21GvhOhA71Lp
	t/UpvNPk7kWBDD1UDbXF7kszEoDs7pf83TpH/2zYg+fNcnh8TMcZOgXyQ28KDCUyXqDOvR
	8KaU9ZRoY/dTXZiwhyGmq1MKzmLi6C5ecTzgipWpegH4BMWYCPRoykeViDvgt1zE8Rb/gS
	2KAbXg+hCgk5E/4nw/oUmnlmpLfdtfkEme0SzlHq81QefByEtuFmo/MjNBucZg==
Message-ID: <8668e3da-fcd2-412e-9457-3413e0aceafc@mailbox.org>
Date: Sat, 2 May 2026 21:23:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 85931d5d9f889a08582
X-MBO-RS-META: i4rmf11wrmk77r1ympywfpfi9bxrssa9
X-Rspamd-Queue-Id: 6AB744B42F1
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31890-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 4/29/26 1:32 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sun, 19 Apr 2026 at 21:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Document backward compatibility support for CS2500 chip, which
>> is a drop-in replacement for CS2000 chip.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> @@ -11,14 +11,18 @@ maintainers:
>>
>>   description: |
>>     The CS2000-CP is an extremely versatile system clocking device that
>> -  utilizes a programmable phase lock loop.
>> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
>> +  drop-in replacement for CP2000-CP.
> 
> While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
> there is just "CP2500"[2].
And it is called CS2500 , suffix dropped and typo fixed in V2, thanks !

