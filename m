Return-Path: <linux-renesas-soc+bounces-31885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMWcFtxt9mnoUwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 23:34:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A34B3860
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 23:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAAF2300B9C8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 21:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C5A3A3E68;
	Sat,  2 May 2026 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="knvsL8k1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A463A1686;
	Sat,  2 May 2026 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777757655; cv=none; b=RvYctMbpKSpfIwi3ywJ3RIyUOp87d9gewU1xrTzVjmoZVrKSGoLhC8Afk7EekveIhIRl+76HCUuBXDlWH+J6RVTi0v/M+r4KYaaLLw8xYYRhwEs85iCjWvobZ3IRBig8pxl85eCEbuCETBwv5s1L33WCu4gceYYNFbG3P85ZO0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777757655; c=relaxed/simple;
	bh=aTizUp77vFtdaVut/y6EEzccWuA3wNr4gRWnrrdF4zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nstkQjZapshrwhO5FjwO0htB/4hoPCtPktjxmDyeb03r02FNFH9vcc7pUX4z+9hIdR6feIgmTi0tiLx6XdB6CECbBeD8whMBmwEmr+fKWIrEYMObcFndamXh7MMIMz67Xn25MHyAOAmMWIMMGtTHOGE3aIKDcCTttXJrRoAn0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=knvsL8k1; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g7LXs1LTVz9tjW;
	Sat,  2 May 2026 23:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777757117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krWvEte6rzYQK7UVqWb8Xrr0bPg1zlcGnKUfpj6lNEw=;
	b=knvsL8k12JbPXpYAlE9cBexu30rqoUtTFLzP18ypZSmRCQPvA/hch4OLnCGgip9mSiF17t
	2sFEMq2QuB84fTcucGgg+aAC1VQ/v1WOjLI4xQTvz1zpaaSH3YUELU//a2fRpHLY7DNnL0
	+01jP0ak5enIm3CWv2Zvz3YEheA7CdBHUeATtHWkFO20v1Td4XLRx38Tx4qS7uBOUvwo0N
	Qry9PMuiJ+vXurTP60Wc3kNEGqOJLdM2ckDM4IcwIZOoId2ryzCZIhDB9Vv8Jf7qa850BO
	L8PCX6o4eBHX6TmsUL5qXFs8bZx0q3skIid21QoyjqrksGWRrn0panx7kh/EYQ==
Message-ID: <321547f5-40b6-449f-8a6e-5396b70823e6@mailbox.org>
Date: Sat, 2 May 2026 23:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD
 M3Le
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
 <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wgjgs6jskon4uskfcndud97puhskkd3w
X-MBO-RS-ID: 03f2f67987000091c2f
X-Rspamd-Queue-Id: 036A34B3860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31885-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/29/26 12:10 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 19 Apr 2026 at 21:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
>> similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
>> not present.
> 
> "and DU1 is unused." (whatever that may mean...)

Fixed in V2.

>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>> @@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>>          .dsi_clk_mask = BIT(0),
>>   };
>>
>> +static const struct rcar_du_device_info rcar_du_r8a779md_info = {
> 
> Assuming for this review we do need a new compatible value...

I will be dropping this part in V2.

[...]

>>   static const struct of_device_id rcar_du_of_table[] = {
>>          { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>>          { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> 
> I also don't know where "M3Le does not support 4K output." (which is
> a VSP2 limitation) is to be handled.
R-Car Gen3 RM R19UH0105EJ0230 Rev.2.30 Aug 31, 2021
Page 2468
32.1.1.1 Features of VSPI [R-Car H3/R-Car H3-N/R-Car M3-W/R-Car 
M3-W+/R-Car M3-N/R-Car E3]
point Video processing and point Performance of VSPI
indicates R-Car E3 has similar limitation due to VSP bandwidth.

Currently, this seems to be up to user to avoid the higher resolution 
operation on hardware which has lower VSP bandwidth.

