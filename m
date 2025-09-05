Return-Path: <linux-renesas-soc+bounces-21524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF21B462D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D77189BEAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532BD315D29;
	Fri,  5 Sep 2025 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A1F6ZdL8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4083191D2;
	Fri,  5 Sep 2025 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098163; cv=none; b=L2FA2LuNANSO491pwmxaLoByByhT2iuwDP26V8G+SOMMwzIs6E4ZRaWcTHkCe68P7i2a1sVf+5gYIYS2KBjsba1GIw1ro2P17Uz7Rg+1oUKU4Z8Lw0nK1cb274CJOu5XZQG4jE90f4gdoeXODL7xrm96E/QsBxqUsXKNbgZKhhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098163; c=relaxed/simple;
	bh=cDilgVdPulKRA6zOJptchP97SOWysD4wxUe3yhPNBEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJWD/BgEikjyDSTG+JF6qzh8QFmg/sn93K+3eU1CEXfahCAxQ1VtC7cZwXv+Fje6K0Y9kFRwAB6QR7IxCKIh6Vc6+ggoXobSjgqOMfIouoOdaYnl/oc6v9jz8aX95FQpG0rJSU1ZUr0vpn4JdwrZpFUeTq8b/au+Ra/82z7WXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A1F6ZdL8; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cJQP94zhVz9sy4;
	Fri,  5 Sep 2025 20:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757098157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piM5GpYP0/JjOOtB/OL5Mi52Mlnt5KKMVKTr17VEvDQ=;
	b=A1F6ZdL8zZO7WRL95eCCYJ1wqkGxZVneo+ho4DCEaYfLOrUaV475ZSwYOReNtS60Sfyqgn
	luAj53qpfK4aWiu0+ND3gy2LOBKwWs6b1Cvi9q9fNMsgGd6Wn5uOreaGEYyDMsjuINb90H
	SX78wgL0z7iJnR6fEG4L7HMOTJOpQYKnTaoe3zcpj2biaxAcj3GxbmqeCcwH9rCoogL+HF
	+MtJXBdLlHO4HKdTSLwNn0GIvBpo7iiWqDNybtY2/vCsJ+mzjR5rS2dRvwG9pwoNQ86jJw
	T0+VYCvjKdrkJD4OhL+8g5vaNdPv4sNsWEXG7/0JhdkZWqaA/7t0y/bQG2JKIA==
Message-ID: <f008539e-2a7d-4958-a3b9-6c2a8b2e7388@mailbox.org>
Date: Fri, 5 Sep 2025 20:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <175708447882.930461.18275572084838852328.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <175708447882.930461.18275572084838852328.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b500dfba776a01ce9eb
X-MBO-RS-META: wfunmkybopnrj571915czhnsbtiws1pb

On 9/5/25 5:02 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 04 Sep 2025 23:01:21 +0200, Marek Vasut wrote:
>> This controller can have both bridges and panels connected to it. In
>> order to describe panels properly in DT, pull in dsi-controller.yaml
>> and disallow only unevaluatedProperties, because the panel node is
>> optional. Include example binding with panel.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Drop the dsi0: and dsi1: controller labels
>> ---
>>   .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>>   1 file changed, 51 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
> 	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250904210147.186728-4-marek.vasut+renesas@mailbox.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
I suspect this is already fixed in

[PATCH] dt-bindings: ili9881c: Allow port subnode

which updates the ili9881c/rpi panel binding a bit, to allow port subnode .

