Return-Path: <linux-renesas-soc+bounces-23075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2EBDF17B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9D519C10B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A74C28369D;
	Wed, 15 Oct 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LthLcyfE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DC1Mgh6k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D627FD4B;
	Wed, 15 Oct 2025 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538812; cv=none; b=i5QKCWoylf8EDQRSqtsRPNyhlGsqNXhHrN5AJResy1a3XJZr5iXc2iNZr30eMZjnh1EtFOu1tp1iG1EYHMsFuYGtRDtQeHS3RGFOytA+k+p15xRp03fB9+9htlUkgg/R0NJ1HT90rKjwEuJYfX2jLumb1wbGt5ekCzxW5NVnlCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538812; c=relaxed/simple;
	bh=TyCgYVyA0qBWnBrmbbRe+PePLx8LUExSXhsoiurofBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5qdCr5FuYGDuPezv7ZdRaz1ZHsq+o4CrqPjEJSEzrrNYWmNm86yp8qOWIWe1JqzdSiUMShfiBfy0oXoh9pGBVpMxt+xsGf52GA7a++XD+JDkB0Y7Wf88MtQQjoURYlKiTe+uzhjdyIHBtbmyfc2wtrVk8ujGfR49SyG0M+OfmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LthLcyfE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DC1Mgh6k; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmtqY0gMtz9tg3;
	Wed, 15 Oct 2025 16:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/cjSZfGXkfMX/oq1yvyojc5xqlL+Ltp0AG5OjB5oXA=;
	b=LthLcyfElyxrh4OtE/QaH42IDBlASpFRp34dmblnqS6N6+owvi+AGpLnnw3KCg7WNVlcPS
	KWe90qCvVVeqotrQv4iseL6lTeG130sJDlTGg8X+pxV4jkLSB5YHUpdr82Yap7LnDuoI2o
	CDpntdFSRYmrQ3yYGNdWjHtrUaUQgUdfBMGy1B3gAMmNqR/VpaOIlCPqBXVO5E3HGfhsFq
	OU8l2JjKybnt7bs5r1M+TwrH8JScxN8vaefudtQnxD3iOm1riqgfzSL2952UavuJlicPEc
	jrwyTWrpihhwMbXHFwKJagBoDNs7GKFJajQE65FpwkLZwQ7f9XqzjkJ8Ey316A==
Message-ID: <8809b170-9cea-466a-8f73-29ff560c92da@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/cjSZfGXkfMX/oq1yvyojc5xqlL+Ltp0AG5OjB5oXA=;
	b=DC1Mgh6k6xBxK1WRjL20A9FKI4waL0OXlyTdp8kRpVzBt5DtmT/53chovN0EQX/gf4Dr6S
	jYClvxnNmkzTxQ9NBBBVy4xwJQm3LGf7u6aYk1TvtlXzxMPW1UAfJijHyqCHlY07UNQ22J
	cPX6w1vl9TEO1C1BCPBwERAL/rM6R+tba7Sr/RNcuQHOUdAz0RFHqto2G2ZC6pqMBz3L4x
	kdb7QlWz6oKfisc+13bORkTkOYwt3serJaxkj3DWZcb4c//ZUI+WLfdruzrP5xIQ0+8eZn
	zAWdnHiQDHzjBTcGDGxTtKGipqgts9c9LtguySLScyQN49gk52CmHOJq0VXPdA==
Date: Wed, 15 Oct 2025 16:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
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
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
 <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
 <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7ttxq4j69pdefxjn89h4ju6n166yx5t5
X-MBO-RS-ID: 5fcd48714613e0e4852

On 10/15/25 12:52 PM, Matt Coster wrote:

Hello Matt,

>>>>    - Clock ZGφ: Appears to be a core clock for the GPU (3DGE). That would
>>>>      make it our "core" clock.
>>>
>>> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
>>> core clock.
>>
>> Agreed.
>>
>>>
>>>>    - Clock S2D1φ: Appears to be a core clock used on the AXI bus, making
>>>>      it our "sys" clock.
>>>
>>> This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock
>>> ? I think this might be the clock which drives the AXI bus, used by the
>>> GPU to access data in DRAM ?
>>
>> Agreed.
>>
>>>>    - MSTP ST112: Appears to be a whole module on/off control of some
>>>>      description, and definitely doesn't align with the missing "mem"
>>>>      clock.
>>>
>>> Maybe this is the "sys" clock, since it toggles the register interface
>>> clock on/off ?
>>
>> Probably.
> 
> Yes, this is probably correct. I got my AXI interfaces mixed up – we
> have both a manager interface for accessing memory (using the mem clock)
> and a subordinate interface to expose to our registers (using the sys
> clock). Here's the summary table from our system integration document:
> 
>     +-------+-------------------------+------------------------+
>     | Clock | Modules Clocked         | Dependencies           |
>     +-------+-------------------------+------------------------+
>     | mem   | SLC / AXI Manager       | Run for all operations |
>     | sys   | SOCIF / AXI Subordinate | Run for all operations |
>     | core  | All                     | Run for all operations |
>     +-------+-------------------------+------------------------+

Thank you for sharing that. I will send a V2 series shortly.

-- 
Best regards,
Marek Vasut

