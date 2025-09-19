Return-Path: <linux-renesas-soc+bounces-22088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31AB8A3F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 17:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10A5C7A7BD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDE6314B64;
	Fri, 19 Sep 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WFqOut0I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA9253B64;
	Fri, 19 Sep 2025 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295304; cv=none; b=DeKZhWmkzPOVA1S7KgZOHnnukLShRM/fAAVLUG0DrX5cxEl+8N83Pkh7IdYTMoeyDcimn1UiiuOA7EImfra0c7N1Mbw4mQ6YKyOOirsuqIOcTy7wwA9Pt0vwdhrI1gNOY4Q2Kf8Jo7O4jixWWSm7WngAOlrqz5WocQn6WBSTNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295304; c=relaxed/simple;
	bh=/Q3VULcApHZbh0mYrofsuxZoPIgmQRE2Mj3xl32fo08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVx9ywVNOAg7wsTUk3/BK6g3QijUAI5WYzzhXaiPLwXt1txdakJBaAnWemG+Yr0gaZmy//SopmwnTCLPUgSQ3ZnZpRUBJAf0DM1VTZhHs+9zcPb2oMnWOERiBdzXzqd/UvrRyQd+jM+iY7u2LybH147OBQ2XB8GxHpm8gFtRcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WFqOut0I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD1EE6DF;
	Fri, 19 Sep 2025 17:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758295219;
	bh=/Q3VULcApHZbh0mYrofsuxZoPIgmQRE2Mj3xl32fo08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WFqOut0IapQJ2zdcnW1+a2EvxW/XydeBUTQGUdAkknjx0Hk15vFeGgihEG6xzwhpb
	 mMQCNVZSDaKZ+46i4P6w3e6Ye+XPpfq/uQehon953qpdzmxbwcLFdjYDjWkhCOzMHc
	 zQPXmusrCFkefjWc2vzSXPsOqBfDp83PSQOIGBhE=
Message-ID: <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
Date: Fri, 19 Sep 2025 18:21:35 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 08/09/2025 15:54, Marek Vasut wrote:
> On 9/8/25 9:43 AM, Tomi Valkeinen wrote:
>> Hi,
> 
> Hello Tomi,
> 
>> On 05/09/2025 00:01, Marek Vasut wrote:
>>> This controller can have both bridges and panels connected to it. In
>>> order to describe panels properly in DT, pull in dsi-controller.yaml
>>> and disallow only unevaluatedProperties, because the panel node is
>>> optional. Include example binding with panel.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Robert Foss <rfoss@kernel.org>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>> V2: Drop the dsi0: and dsi1: controller labels
>>> ---
>>>   .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>>>   1 file changed, 51 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/
>>> renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/
>>> bridge/renesas,dsi-csi2-tx.yaml
>>> index c167795c63f64..51d685ed82891 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>> csi2-tx.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>> csi2-tx.yaml
>>> @@ -14,6 +14,9 @@ description: |
>>>     R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2
>>> mode, with up
>>>     to four data lanes.
>>>   +allOf:
>>> +  - $ref: /schemas/display/dsi-controller.yaml#
>>> +
>>
>> Did you try with a bridge? dsi-controller.yaml only allows a panel. I
>> think I discussed this with someone not long ago, but I couldn't find
>> any patch sent for that.
> Nope, I only have these two 5" and 7" RPi Display 2 panels.

Ok. My point was just that the dsi-controller.yaml doesn't allow
"bridge" node (you can just rename the panel to bridge to test). I
thought someone (I just can't remember who was it =) will send a patch
for it, but I think that hasn't happened.

 Tomi


