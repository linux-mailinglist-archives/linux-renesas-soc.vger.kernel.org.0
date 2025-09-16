Return-Path: <linux-renesas-soc+bounces-21914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB6B59583
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492B22A3C7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 11:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869B929E10C;
	Tue, 16 Sep 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GcmbaD5B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E12798E8;
	Tue, 16 Sep 2025 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023337; cv=none; b=nj6Aa4VDTzPVGbK51UJgDIesmzXUxTonsnWXHs7iMitEyUUyOOT1xZf0rlj4deRoQnLD4b5FJn+q8SX9gylHVWMS1NTiKO5HnHtLlO3JJJJn/6Rv0jqp/z5zWwZ6hd8t/ixmo9WXr7HzAwMKFwk2vJg53+5BDoz//jEJF0k/EYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023337; c=relaxed/simple;
	bh=GwhyWrj/p+81Y0gcFpWC49wjY8EZwxBQ2MSBb/tbDWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy9vMA9fJPtwbOxBgUFIu2jAnSWeiDUARWuznu6qfQkhkuJA+9Et6sSU/0EuxsRoK5i5+ZHl4FR55e8KRtYufMIu4RwGYRnxPItn3FRDtSk+6L3HyGzxLXKLxoyKxh8yLVqB2MA7blI0WeupR5htJGBFEgB6kW7DnntlSAVfo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GcmbaD5B; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cR0Xs55dgz9sbL;
	Tue, 16 Sep 2025 13:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758023325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcFGlRoKIj6vF4dMWDu8Sjw62t7Noo0vir0sZxMvFJU=;
	b=GcmbaD5BVTEZqDpRA5lcbmA2hlJl29Nkp9BeZWYSFyH9x19VWhpcy9Fl+rQLVEI5KMN4dM
	bS6JxzP9onXGbEOLc2glp2sTPmNuyRKsUirz0D5+FEUSE9tLx6Mj4vGycSGmA6TqRNYgdm
	nxNjNzi/mMBLFjcnE0328a8LWUhaKRLUh+H4H5nvIL/IeDbTg6ErUE8zXJTVgjHPzYsYN/
	y/NVsNWx67PqNwbHAu0lqCR1sDosN01mkdpAwhT9h9ltah6aqNZckGjhLjKIEKqteTHhHl
	89RXEGZhm8M8irJ1/BGWxjpnWiZoEjeQ+nmSdENXkcuBKjn0vhXePedObylQUw==
Message-ID: <0cdd321a-4eb0-42aa-ab7f-71fffb96ac73@mailbox.org>
Date: Tue, 16 Sep 2025 13:48:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
 <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
 <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
 <004e4b73-b695-4e37-b484-4fbc340701ea@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <004e4b73-b695-4e37-b484-4fbc340701ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c15b1ee4fecdf23f472
X-MBO-RS-META: 7shz741ueftarr57m5zz73xfddgfaxaj

On 9/16/25 11:52 AM, Neil Armstrong wrote:
> On 16/09/2025 10:15, Marek Vasut wrote:
>> On 9/5/25 9:51 AM, Neil Armstrong wrote:
>>> On 04/09/2025 22:01, Marek Vasut wrote:
>>>> The ILI9881C is a DSI panel, which can be tied to a DSI controller
>>>> using OF graph port/endpoint. Allow the port subnode in the binding.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 
>>>> 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/ 
>>>> ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/ 
>>>> panel/ilitek,ili9881c.yaml
>>>> index 434cc6af9c954..cf0aa996e072d 100644
>>>> --- a/Documentation/devicetree/bindings/display/panel/ 
>>>> ilitek,ili9881c.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/panel/ 
>>>> ilitek,ili9881c.yaml
>>>> @@ -30,6 +30,7 @@ properties:
>>>>       maxItems: 1
>>>>     backlight: true
>>>> +  port: true
>>>>     power-supply: true
>>>>     reset-gpios: true
>>>>     rotation: true
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Would it be OK to pick this one up via drm-misc (and possibly also the 
>> other ili9881c RPi 5" Display 2 patches), or shall I wait a bit longer ?
> 
> yes it's ok to pick via drm-misc, bit it's too late for v6.18.
That's fine. Will you pick it up or shall I do that ?

