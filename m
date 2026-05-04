Return-Path: <linux-renesas-soc+bounces-31962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOgwH/0j+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:55:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E37614C49D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8111301AD2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDA938B150;
	Mon,  4 May 2026 22:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NEL0nBiD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316738757D;
	Mon,  4 May 2026 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935245; cv=none; b=kr5pFAucB96dDziL4wbwxcvRPH63el+L4Wr0jWpWfOnGFvEvS6Fkwyqxss0KFBCneb0WxAyt4IPr6NasZjiDjqYv3oTpWluQdoo+ddtmc0415xqVOgVAtOZjsusaBoWih/HaF77jcpO/R2WxMZm2yvv22gD6e5z3OmpI3rOFxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935245; c=relaxed/simple;
	bh=IeYdyg+c0wfLWSiUDFciO3AOSrOYt6CZULUeuH67dwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5vdSH6zEctzet4X8TL/rfTRSCascUMlKT6cqLTcnQAEPc+f8pLBdlbzmi0/crPNighjl9UpDuwTumgqBfhqGijqepOohU2GeUgrNbKicEsdzOQ9GQ7O8lIbQeISARG9zBRXdqs4Yr651h3gQU5lK0y1j++QUXzayygYEv6CjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NEL0nBiD; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cQG2K5bz9tpY;
	Tue,  5 May 2026 00:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VukkESAFe3Dz4ubR3JzkbP1ey9khSmUL81vcflLLR9I=;
	b=NEL0nBiDrxWMgFQ5JESDVgyazhUvcXpuJD86ARYio6oZH8DC7Ds2jFMZSLv85pm17lVz8i
	rCDmhGR7jEnlxdht26yOp41wy9JuVqHVTju0gNN0L2hnHDm1kwMEPS0SBgYj8tFwClrc5C
	nNCxr68taV+QM03lbeYph4OxB2fb7uU1GBfJEh31fITvSnpnYpwo7SpSrjyZubvhJzU4Gu
	36Y1SXbG1RoRdr/+blUlyywZm+jhbsVQw72mCbcIQQU616cFIzk1G1DxuktlFmnG3gyZ69
	/38iZWVKcn1VfN553gSwkg0mSuDwhWOBGEazuxO6lCeFboL0gO2TszVzJONUKQ==
Message-ID: <5aaf1bc2-351d-4bd6-ad8d-206f58af1c26@mailbox.org>
Date: Tue, 5 May 2026 00:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
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
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
 <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: db7b2fc70112bc46d8d
X-MBO-RS-META: 3ezkm5km4odom3wm4cyftc36h38gwj6t
X-Rspamd-Queue-Id: E37614C49D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31962-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:url]

On 5/4/26 11:24 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> Do we need these two? We don't have them in e.g.
>>> arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>
>> I believe we should add them, the KSZ9031 PHY does require 100us delay
>> after reset is deasserted and before MDIO access is possible:
>>
>> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>>
>> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>>
>> "
>> Note 2: After the de-assertion of reset, wait a minimum of 100 µs before
>> starting programming on the MIIM (MDC/MDIO)
>> interface
>> "
> 
> OK. So please add it to the other boards, too.

Will do.

>> [...]
>>
>>>> +       pwm2_pins: pwm2 {
>>>> +               groups = "pwm2_a";
>>>> +               function = "pwm2";
>>>> +       };
>>>
>>> What is pwm2 used for?
>>
>> The signal is accessible on the EXIO connector D (LBSC) .
>> It is up to user to use the pin for their purposes.
> 
> Usually we do not enable support for random user wirings on EXIO connectors.
I'll remove that in V3, thanks !

