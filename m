Return-Path: <linux-renesas-soc+bounces-24054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F2C2E5BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 00:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5623A4BEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 23:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F8C2FC037;
	Mon,  3 Nov 2025 23:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qvHnG+0W";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LG78fYJr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AA2D5410;
	Mon,  3 Nov 2025 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762210932; cv=none; b=QBiQiMpbyH4cJWpa3XdaFd3svK5bKSolYuI5Lid+w4XlbSuCxBG81HQms/XgsP7+0ntqVi1Sbl+MOwAzJpm3z1Va5dcJzjZrgzMB8k3On/nqNE0zJxQEu9ikQeWRFPdTO6Jm/LEhx/ccbtWOkvADzNafyd2dERdIpPdqla75aQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762210932; c=relaxed/simple;
	bh=ETGPu2OjPgHVTU0+ELqGrsiHoQgd4NAS1jOpguREKqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HN3C/HzTAQbEtMCNsy82DfxFQ4/k4cb9NdQllE99Os2Bnz7QOaTFiUpLs9E+7D3CFrBS7Amxo3AQx3OG6BItcTVL6RM3Ouxsje1b/bRNBHlZtH8/VeiMhyPO+lmxrT8Zl7W3jR2PcIGhZDvjRYoVn1R/Go6nOg8mj3duNeEV/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qvHnG+0W; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LG78fYJr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0nCb37bGz9t7g;
	Tue,  4 Nov 2025 00:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762210923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
	b=qvHnG+0WoaKQXtbJL5klMm80HXdEMR/yCPMt4cDpFjncDrFomRHYZgqTOWtdD7HHpCPG/A
	roSpkjXwDoikrh/cB549dRiyhdsuYBL0EvA6eiRDcxAw0/t/2LuuNFHVgwxmwOCZ6zdb2f
	c/Alsbxs8Sp3gmkGjbKv/s5b2LqhtRVnRf/+QIZP8SPqg+IaSSWIRh5wMTXrv2eFx64o9S
	de/cea7BYkx4eMELzz2g3aZbOHG1Z+OUS3ZRPJ13GLRaeHbmXrrty7aqQb/nSsx3XSc45b
	/PyTYk+niHl4yCs1eAhhJ4LvJk1p+OUgwx1mtyL+gR4lmEwP7sUDysBZ83XAnA==
Message-ID: <e1496b5f-2908-4398-8051-a136115c4a36@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762210921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
	b=LG78fYJr85oLkt9Fyat0uzYqmNEbJtj/hmm8V3dsMQcplkLqfaHWqTvxtaoyAnvOvvRSfB
	ylc34n9DwlnwxKaJzfcG0be92Xyg1f9h5uB1GzQulEl4pjrE+7XVLv46sGexgMz6js5X9m
	vZbqjRxRb/1tbzvnZ+RC8dvObJELXhGwdwz4BiObU7ZyAdRGCjA5jrYHCayw9dkXI2KQdM
	D+W/Lzn2PiX1a/yQLIVaWgwhrLkCmY7BTCRqjwAyyUGqYKdgRaWGQU7aqehaJ/LEqNqBoQ
	SyesOL4YL15jJqT5UK0oJDStiGqaF3b5rgtvoaPfG7k+o0z0/w+5u7npNp0/fg==
Date: Tue, 4 Nov 2025 00:01:54 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 67fa1408053679d5025
X-MBO-RS-META: 1p8m3picy9e98qxgrpbre48hu7k1nnmb

On 11/3/25 10:25 PM, Rob Herring (Arm) wrote:
> 
> On Mon, 03 Nov 2025 21:07:35 +0100, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)
I suspect this is already fixed in a separate patch:

[PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline

