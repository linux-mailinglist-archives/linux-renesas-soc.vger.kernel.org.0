Return-Path: <linux-renesas-soc+bounces-25710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FBCB78A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 02:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E1C0302530A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 01:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6F923EA95;
	Fri, 12 Dec 2025 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZXPO4alD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3DfD3WRH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275D19067C;
	Fri, 12 Dec 2025 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765502846; cv=none; b=uO+TqWZl7gysnapTwXucGjoAqoYKuT8HJFExTNne9WBGTB0BwI9ioczMXmh8aSAImMPVXABpYhpuBChkDJ85CK2yIwU5gFkxckoyvO6C1bTw5Pt17PC52hwoa6nMyq55DXCf6x4CL20OJrK3T1TzgXWU81heMC+5pFoCRvceqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765502846; c=relaxed/simple;
	bh=Jgq0RLoiT9+jff0IstUKH3Um5OWq2m/2BrCmb/x1RFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FenqsR+I+KTE5umCO/jnSOk3Gvu95sF31apefI+0GxCqSl57JLXriIv2rppIkfmH0/j3VhZH8CBBAhGMUfvBZWZSkbzY5V7N/ukNcjmFSsZAZOepnt4ujjGogWBzh3WHGB/k6dFsMSZYGsTIZbdxynvoz7OFKk2cnw1j38XlpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZXPO4alD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3DfD3WRH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765502843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OaMnphTqktOpkqienFmb235BNgNOVZfNfr2TnIb1Qck=;
	b=ZXPO4alD6O1udp8b8q1nYnbhXp0cvXN7INVnSakW5fsQ2YV0gf9CFQw8uJ/bxT8ucUVzVo
	ROHI8hstWSxvwhpq4zt1Xp0k7GH19fo0iTusRhtpUPLmlh6FFTMsFQp5i1tYr/v9qrqR+2
	B5A4/CJeE8DdIha36S6rbrJLccHUSZH67FgeiZHw1gaeWwlFblhJz67VgbQ3jaeXR6Dciq
	vfdl68Rg+jNbSD3hWpd56Wo5n7DVSwRI9Owm5mDwVzYKd4ElYfqqGzLX2WWaH3GxTZPTBB
	hxn4uEera0CecgpBbgwq1TtKstvKTd38WAfR62UCFWaXo4+gN8dTGM35rOhIgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765502843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OaMnphTqktOpkqienFmb235BNgNOVZfNfr2TnIb1Qck=;
	b=3DfD3WRH6JIdddkN688AXbZLmxq8gLkLSqi4e/BnFjLv8LwF75R/NQOCoYsoalS7XFyir0
	GCj4Uo+A5oSQdNDQ==
To: "Rob Herring (Arm)" <robh@kernel.org>, Prabhakar
 <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/V2N SoC
In-Reply-To: <176426377371.294874.17331116412829860585.robh@kernel.org>
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <176426377371.294874.17331116412829860585.robh@kernel.org>
Date: Fri, 12 Dec 2025 10:27:20 +0900
Message-ID: <87o6o4ebgn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 27 2025 at 11:16, Rob Herring wrote:
> On Thu, 27 Nov 2025 16:24:46 +0000, Prabhakar wrote:
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> 
>> Document the Interrupt Control Unit (ICU) used on the Renesas RZ/V2N SoC.
>> Although the ICU closely matches the design found on the RZ/V2H(P) family,
>> it differs in its register layout, particularly in the reduced set of
>> ECCRAM related registers. These variations require a distinct compatible
>> string so that software can correctly match and handle the RZ/V2N
>> implementation.
>> 
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>> v1->v2:
>> - Dropped using RZ/V2H compatible as a fallback.
>> ---
>>  .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml         | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
> 	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
> 	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
> 	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

Confused. How is the change in

          bindings/interrupt-controller/renesas,rzv2h-icu.yaml

related to the errors your bot found>

Thanks,

        tglx

