Return-Path: <linux-renesas-soc+bounces-21897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9BB59038
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CB651B24390
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 08:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF66283FC9;
	Tue, 16 Sep 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lhzYom0b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mioynGIP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F691D61A3;
	Tue, 16 Sep 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010707; cv=none; b=aEAeTSoHqstqOcUAxZ2unJEKrpBu8Yu4Zdyz+Z/JwKxRsnGo/3otXySl/swhrAFjnQOYS/j9D5CQJYJn6D0imJ1S1siiXDFYmKN+J9FUDIVPmJlh5ZSEdbhi1LmEjwf6jS/s51N8MRzQQnUXvtA3MnhjmmZ46HkBC2680QjiZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010707; c=relaxed/simple;
	bh=RoyAt8k0WjtbboVlWMkmlKVCMNkq9Gu1nwsSD2R42Ug=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UY/3s+HQaXAcKxwWKP5Hx0ccts7O6dbAj5oWoTpdQ+PWxhh4E8iMYkZAnzf2mT8myqeajVqV3E9EZ/DJ8y3mLcjut3+muvlS8rDRwIl1bhDF5y9r6WcyzrLjIhehtPOOB6FQ9AuMzoRJOm4xR0iW7RmFzbJZ2jFcVvKZH6LvTDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lhzYom0b; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mioynGIP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cQvt72Phkz9sTl;
	Tue, 16 Sep 2025 10:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758010703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ke3ag2nkHWRh5s971FXlUY5JVVk95tMOt7Ik/wFVpRI=;
	b=lhzYom0bIdGRM/1jIwXuSZNqB59H9nG5SiF5prWKqxyXORyHIA3p7JevE1z/oHL1CrlGWr
	KzlL7Q8UhBfEmKl+SOjQ6TumBdz3lRkG5TTjZdvWriUyUtxPelCK4aFmokrjDKxPGQGM3a
	sjFUz9zF4/NiV+t37blndOSBMeZ5zX0wcAG2Vrgwmd/1J21zHwMzhyRMfGk9/DaO+QpERv
	y/6Y9nNH0+XPsnI7wJatwX5fwUP+2FLySvVwL7U5jU82EitWzRXzoBmoVvvKHl6/C5iM0F
	BGtViMoPs8dkuh83e0J7692HjlTEN9C3bwM94YhXaDAJ3Q9F7gPa5gE81qoDcg==
Message-ID: <b43bbe32-c702-441b-a468-66c267f7513b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758010701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ke3ag2nkHWRh5s971FXlUY5JVVk95tMOt7Ik/wFVpRI=;
	b=mioynGIPgLgItCvim+XYLCxDf4V/0MF1P2dLZKJjGQvKV7jyHQeYV95DI1I26YkSSQKeT2
	Vv4ePYpT4CEc7fCENDU4e9YIfm+qn4PPDGdsFD0+SqU9lvHFsNq9BI2KmI9TgZt1Nghu8Y
	EcffPP9WQ88xlcOKswoL1MedSK3Hq/Q1/zmo1avY3DtHjIJ7DZDEuW2mKq6rk8dh5qNw+9
	8Kcde+CjpUS4JyA3nYNkpzPZgynPPH8tzP3aWVA8h7uYIPi5yH+Vhztsxn9Rc9cwX7Q29s
	1vGvPh5ZoXsrvkQLPqk0jmh546wZb3BFVVTkhZi1jUVzi1UeTRksRksf6POIKw==
Date: Tue, 16 Sep 2025 10:15:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
From: Marek Vasut <marek.vasut@mailbox.org>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
In-Reply-To: <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6225648f122d6cce5d8
X-MBO-RS-META: 1xa4nwi7kughgow8eamnxy5b1bugmfbj

On 9/8/25 2:54 PM, Marek Vasut wrote:

Hello Tomi,

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
>>> +allOf:
>>> +  - $ref: /schemas/display/dsi-controller.yaml#
>>> +
>>
>> Did you try with a bridge? dsi-controller.yaml only allows a panel. I
>> think I discussed this with someone not long ago, but I couldn't find
>> any patch sent for that.
> Nope, I only have these two 5" and 7" RPi Display 2 panels.

How can we proceed here ?

