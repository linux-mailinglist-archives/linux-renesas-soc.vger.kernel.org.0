Return-Path: <linux-renesas-soc+bounces-28244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELowKJoAk2lr0wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 12:33:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E814302C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 12:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8CA43013709
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA942C0299;
	Mon, 16 Feb 2026 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kX93qde/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE87239099;
	Mon, 16 Feb 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241623; cv=none; b=KCiM/ySGgqR4h/8ejeWFZq1XkZ6w8JlbItAa6Ms3z4BBnI8eR/avQxsyYiljXvT2szEce63sjMNsSFBEqm3r0bBa84RV2TqNdZt06tvqMXlIGGIOJyKTkt8iGCtH5VB//mfe0she9XMKFUkUE/3VI49nDpbTWJsD0jhiKWOH5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241623; c=relaxed/simple;
	bh=onTyZagYpAPjiiOZuy6MDCXz/JCQKAyBYFGyzLZzLvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M4okgFqJQuJpBZYUdTiz6TBEKPxanfA7HzIserhJxKo3UJwUShr8s0EatPYnrN+rB6hklHNzczmu9vilWmqh638jEbLJI0zcBP9c7nYDREsUPrZVU8qtF4zWqTKGo4ihhN9/pbblc64ARBqhss74SDkCiJhUIF24f9K2Gj4t8Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kX93qde/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771241621;
	bh=onTyZagYpAPjiiOZuy6MDCXz/JCQKAyBYFGyzLZzLvw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kX93qde/2AGQpxYE4XsVcgtKBFHd2odwj54axOcPaJn8lH5LzoUWBy9va68nieeGL
	 st8DAbsV8+1gZXyLvwEOuO9eGmgXeCVPpqL09fLA0sNMoGscCZi8mfyoNgSR7J4Cqr
	 9hV8N3qFiyhH6GsO2kMOeH/CPcd7RcHteDX69oxzztgDmDtfk82HlyMTXQ79kSV6fR
	 hL8SnaIxskTYKK+Fqkx0A1KD5yIVES8vImsdgCP0w3073X3PZ6VaDmE6INjiIp2bvI
	 xN47yJb3drwTEFgYR4hRpmGIHpWYfrpsDuDaIHNz02NI8U7fRkHN8aNL437B6yqsbl
	 3oWfpQiB6miCA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68FA917E012E;
	Mon, 16 Feb 2026 12:33:40 +0100 (CET)
Message-ID: <b42a1da6-110a-4bd5-a4f1-23c3f25e2a17@collabora.com>
Date: Mon, 16 Feb 2026 12:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu
 nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28244-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[onurozkan.dev,kernel.org,gmail.com,sholland.org,samsung.com,glider.be,sntech.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A3E814302C
X-Rspamd-Action: no action

Il 15/02/26 11:02, Onur Özkan ha scritto:
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
> 
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
> 
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
> 
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> 

Sorry, at least for MediaTek, this makes no sense. The SRAM supply on MTK platforms
is managed by the mediatek-regulator-coupler driver, as it scales in a peculiar way
in relation to the GPU core supply.

Besides, you're cloning the GPU core supply to the sram supply, which is, well,
simply wrong... and you're changing devicetrees of SoCs that are running on
panfrost (not on panthor), which will anyway ignore the existance of the SRAM
supply.

That's also going to give all sorts of binding warnings, I guess, but I didn't
check anyway.

While the change makes sense, as in, I agree with Mark in that the SRAM must have
a power supply in order to actually work... I'm afraid that what you're doing here
needs a bit more work before it becomes acceptable.

Especially - faking the vgpu-core regulator (not just on MTK, but on all) to also
be the sram regulator leads to confusion and is, well, plain wrong.

Cheers,
Angelo



