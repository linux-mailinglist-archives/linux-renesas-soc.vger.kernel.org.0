Return-Path: <linux-renesas-soc+bounces-21409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4219EB447FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1DF6189A1EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C34028DB49;
	Thu,  4 Sep 2025 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="quwR8jsf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cUzuDv8B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76928D8ED;
	Thu,  4 Sep 2025 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019792; cv=none; b=QL2QcZcpLEV9Eq7ArxRi5onv49IgS+CmZ1gl5y5OlOyurK5r0CE/4yu5mOokD+0ACw+Hr4F3AY+8D3JD7q1fkM/mT8WIdUamFxFz2sxXbcPUMkPDXGqMy4BYLhbO59jY8nFBYxNVLmDMsrlj+ozLm9T9Q7Ky/sqbEzjW1aSNoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019792; c=relaxed/simple;
	bh=s/dANQEI+/s+db1DBtBkJryAgnB/phci2K9/B9pnlEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eY+u1e+Hoh0sKpVoFH6sY8YVZiOi+zE/+iQ55StEiWye7dKIZ/V54LSYe0GOp5CVd3IGZzxpSGO2U2gbNzKWMsilBA2g0KhtMteu5WfqRHFHfivE22gZzwlx3Vdve92sqSBhVuuxZhNs5vo9LHS57tB8pGXh+D1EpLewSbGaFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=quwR8jsf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cUzuDv8B; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHsQ45BFRz9tc9;
	Thu,  4 Sep 2025 23:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
	b=quwR8jsfvnQjtTD8/HQnSbnUWpj2NWzwl0bMcKZ9nc2R/k90VqFtrDIpX8dzwReyHc8BeW
	4EY6ifikPS3E5m6hsKrasLc79GqPCK0GDt5LvujQXWswUqRGK6vRVOxMYI2IeGZlBWjhoz
	eW6Q8UTRjj0SnpeH3H0uBdrUe8SD1OJBb1BrUO6YJiEa9RzVp7tKsftK5Oqg0PwufrzE8S
	BAJBI9iIB4ozswCOaLkkoAnuTqxV19affKZkDoU+24qteN2tGSYIurVujEdpGLGrlBC02A
	a3n/2V98s105qSZ4o0/1FWmssC01D0ct1nKokECMzkd9nQWc2o7TS/TEG2jYpA==
Message-ID: <fe5e8f92-6f53-4bd1-80d6-f27d93f1825c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
	b=cUzuDv8BxsNOqajONwHHhcqnezzwr3+44lOS3V44ZgdPmsngmkkI8CujqcmxgHWaWrf3N9
	/ewV0e22UrRiO8RmFQhRUP7mQTKj/xUDfZ3+cRJ8tx5g07NWNhrMpXdOOu5ynBMO83eYCa
	inWY9QDKjn/TrnqRHIG9Oxmtr1C1zEy2LfyO0VG6/RlyO7JSlFPCG7S9F2TFEj36X/0Rhs
	G1ptaN4WObcp9rMgi2Qecrg5eqJ4UwgzBNXcsA824TIoSMfQbNemN1TjVXz54ttlRw7urh
	lj5fVMm5rU2OBDz3YNdFIpBLNPXhPas8SOzR3u2OQnbMBLP2be03KNQb5V10XA==
Date: Thu, 4 Sep 2025 23:03:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
 <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 80edf943af1d9f462a7
X-MBO-RS-META: 17ofh69nbdfj47cie4s645me1csma1jj

On 9/4/25 10:23 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -80,14 +83,14 @@ required:
>>     - resets
>>     - ports
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>>       #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>>       #include <dt-bindings/power/r8a779a0-sysc.h>
>>   
>> -    dsi0: dsi-encoder@fed80000 {
>> +    dsi0: dsi@fed80000 {
> 
> As you are touching this, you can drop the label too.
> 
>>           compatible = "renesas,r8a779a0-dsi-csi2-tx";
>>           reg = <0xfed80000 0x10000>;
>>           power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>> @@ -117,4 +120,50 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
>> +    #include <dt-bindings/power/r8a779g0-sysc.h>
>> +
>> +    dsi1: dsi@fed80000 {
> 
> No need for the label (dsi1:)
Both fixed in V2, thanks.

