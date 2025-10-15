Return-Path: <linux-renesas-soc+bounces-23106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B8BE037E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 20:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7D74FE129
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 18:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926AD27A135;
	Wed, 15 Oct 2025 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L0YA6qK/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1253002C9;
	Wed, 15 Oct 2025 18:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553540; cv=none; b=Rj+N4zhtUsIfnkhDrxkJtY3SBT9BphjZumYpDi+fkV9HCK4IF9KBFFY8UdgNzh1c0kzpzjv/jPQrX33bVxPtTrQdz0bmSptw8YrOnqTbA8bWLooc2OP4wSO7LjD5R/tcJXxavEX+/viXSHTrny3qgyAirdel5gx/WjDYeI54F/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553540; c=relaxed/simple;
	bh=JNsjsmztpbrMbHw2L00RSaIuraDPT25WKoFIf1QqRps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EksTmR/AXfG1Csk9xHmG3K4Qt1FQ4DhS5r4RGFr9z83fXxQfnc5IJRsS+JddOS15drEJHv8uAh/KSdTtVPOkCixnq5ZoJhV18RTilVhqdQ8+kMBVWEgvtiIYLJlfyYh7zisT1bPNVLmXJGdSOndphEJr+aRouX9I8hPUTqHnYkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L0YA6qK/; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cn0Gk6R2wz9tcL;
	Wed, 15 Oct 2025 20:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760553534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMSfqTFOOxz3BI5gxHBbzrsmx6UX56DPc5IdGmMbF48=;
	b=L0YA6qK/+qwqyGzdmlgNk9FFQ/Hnb30IjR7tRRMximVvgg8VhA4sTDV6Nci0YOF699BdSC
	HDytgme2wZ2JXtAD9NWTiMd86orRY8X7a/nrqGilUlGTMrbetzClPpeW6qKoMQrB2A6hD+
	Ucr6cRe6ObD5btBmRxX/k1fdxaXR/Ij3a/fAkQH393hfKW36BvNqG8GyD2vCikswdNPLdC
	AjJIyxzmVw2UQ+N3ajYT0E7IYyqFOhiO1F3HXrOfSMKOo51THGMQ6iGkY0br+JrGsABUrd
	uB/ICQVefSai09vHfMT5dHwfGsn+BHAdMV7LoXlXFucGwyFSUCDlpVi40PZvTg==
Message-ID: <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
Date: Wed, 15 Oct 2025 20:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bx97qrbn6yau3qh7ddkjtc6pytrq343p
X-MBO-RS-ID: 98685ba3c8924c321a2

On 10/15/25 6:50 PM, Matt Coster wrote:

Hello Matt,

> Would you mind splitting this conditional block up? We already have a
> constraint for 2 power-domains (see img,img-bxs-4-64), which should be
> applied to the entire img,img-gx6250 compatible.

I will add a patch into V3 which splits the allOf section up such, that 
clocks and power-domains limits are limited separately. That will make 
this addition of GX6250 easy.

> As for the clocks, for the currently supported GPUs, we have "mem" and
> "sys" clocks that are optional at integration time, so those
> conditionals are based on the vendor compatible strings (ti,... etc).
> However, these older GPUs always require all three clocks, so it
> probably makes sense to create the properties:clock{,-name}s:minItems:3
> constraint on the img,img-gx6250 compatible as well, rather than the
> renesas,r8... ones.

OK

> You shouldn't need to explicit list the power-domain descriptions at the
> constraint level at all; if there's a build warning that they're missing
> I guess the correct place to add them would be on the top-level
> power-domains entry, but I don't really think they contribute anything
> meaningful.
The descriptions basically emulate minItems/maxItems: 2 here. I can also 
just set minItems:2 ?

I have one more question -- does GX6250 _always_ have two power domains, 
i.e. the constrains always set minItems:2 for "img,img-gx6250" 
"power-domains" property ?

