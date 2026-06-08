Return-Path: <linux-renesas-soc+bounces-33660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id roJJGL2uJmp9bAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:59:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F66655EC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YpNZld1d;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 077FE30056DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D742F371D17;
	Mon,  8 Jun 2026 11:55:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C148370D65;
	Mon,  8 Jun 2026 11:55:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919714; cv=none; b=ckrNotTQr8IHYJm0OW36aVe9ku8kIdtLy4M9uitYVSo0Ezr9xtyHN1cHLQtDYfD2JHhJVIe29XXoDufgtU3eNRBsoTf9t0gA8uDri9RfTPHwxEaaJRC8PNmSfkrH0lJiSnAqRiiIOu4pIwVjUcQhtSt/BiZkWarJ5OrtVMYrlyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919714; c=relaxed/simple;
	bh=n/pQcNquc3IBtGz5ksifanqtdilJJJGYDH94sO7mx8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOt49asHYblCZCY3f8O05YcnpGb3Iy3C7hPgirrCEkbV0fYGhB5t9aTxRuhJ9W4p5hN5yDWYOWrdv1yLFrE1MHKgEOeV9rSenrCQcWqTVjBtvVmxpCdYybhtkNwJ+fbJMtp9PuoWHJTIY9sblIbFZ32KdOfgAcL6mPLB9T41SSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpNZld1d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C301F00893;
	Mon,  8 Jun 2026 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919711;
	bh=b/+jcWfRlqxoRwbs8TNKltS6NdjnRdq14z0GLneRQtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YpNZld1ddNMZFLDZ1ySu3eZpfM00Ig7kzPrhr1B12Yr6AR4HEvEs5dnLisnh5JIQJ
	 vTwiIusrUsTnzrUiR7HB9H9jUpcSxjxKW2It7PyOfwFHHo2+cnSEfCAeLd4W1kXD+x
	 TURotKaCHjpJwY2ba2G3iC+hqZdR8F9hhrvc25GIDgjbqrYsBDt+vG/654CLhGWHd/
	 MSdazDa8ARJWqFF+k2vxD7O0O5yln35d0fTtnM2FcIBpnvEgriowP1H0e1iGfjumtu
	 ITUZ8knSsgR79dhdOOm91jmweax0z5tpJN3qZjA4AcnwrxXbsv775WAbH7Obg34nzV
	 yB7PFnEY8yGBg==
Message-ID: <71bf9e6a-40c2-4ad3-9156-caa74a3dbaf7@kernel.org>
Date: Mon, 8 Jun 2026 13:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
 <20260608-alluring-remarkable-echidna-d107ea@quoll>
 <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
 <TY3PR01MB1134665BE4CE8FB734BCFAAAF861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5e8719f-6d85-4edf-a645-5be9be7ec980@kernel.org>
 <TY3PR01MB113469E3AB101C3552E721E11861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6960d660-2851-44e3-af89-b334ab6cecc0@kernel.org>
 <TY3PR01MB11346C66B7BD36CB89D19009F861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <TY3PR01MB11346C66B7BD36CB89D19009F861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:biju.das.au@gmail.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33660-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nesas.com:url,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04F66655EC4

On 08/06/2026 13:51, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 08 June 2026 12:47
>> Subject: Re: [PATCH] dt-bindings: mfd: syscon: Make ranges required for renesas,r9a08g046-lvds-cmn
>>
>> On 08/06/2026 13:22, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 08 June 2026 12:11
>>>> Subject: Re: [PATCH] dt-bindings: mfd: syscon: Make ranges required
>>>> for renesas,r9a08g046-lvds-cmn
>>>>
>>>> On 08/06/2026 12:26, Biju Das wrote:
>>>>> Hi Krzysztof Kozlowski,
>>>>>
>>>>> Thanks for the feedback.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>>>> Sent: 08 June 2026 11:22
>>>>>> Subject: Re: [PATCH] dt-bindings: mfd: syscon: Make ranges required
>>>>>> for renesas,r9a08g046-lvds-cmn
>>>>>>
>>>>>> On 08/06/2026 12:20, Krzysztof Kozlowski wrote:
>>>>>>> On Tue, Jun 02, 2026 at 02:13:29PM +0100, Biju wrote:
>>>>>>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>>
>>>>>>>> Add a conditional schema rule to the syscon bindings that
>>>>>>>> requires the ranges property when the compatible string contains
>>>>>>>> renesas,r9a08g046-lvds-cmn. This ensures the LVDS common control
>>>>>>>> block on the RZ/G3L SoC correctly declares its address
>>>>>>>> translation, as the device has child nodes that need a valid
>>>>>>>> ranges mapping to be described in the device tree.
>>>>>>>>
>>>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/mfd/syscon.yaml | 14
>>>>>>>> ++++++++++++++
>>>>>>>>  1 file changed, 14 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>>>> b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>>>> index 9c81010d5a74..cbf83a06ae25 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>>>> @@ -269,6 +269,8 @@ properties:
>>>>>>>>    resets:
>>>>>>>>      maxItems: 1
>>>>>>>>
>>>>>>>> +  ranges: true
>>>>>>>
>>>>>>> There are no children allowed, so ranges property is wrong.
>>>>>>>
>>>>>>> You are changing binding which DOES NOT allow simple-mfd or any
>>>>>>> other children. Ranges is not a problem here.
>>>>>>
>>>>>>
>>>>>> And if you tested it on your DTS, you would see this does not work...
>>>>>
>>>>> I don't see any warnings or error. I have done this change based on
>>>>> Rob's comment based on sashiko review [1].
>>>>>
>>>>> If you agree, I can drop this patch.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/20260601022619.GA3961324-robh@kernel.org
>>>>> /
>>>>
>>>> Look:
>>>> https://lore.kernel.org/all/20260524194457.479681-2-biju.das.jz@bp.re
>>>> nesas.com/
>>>> What compatibles are here?
>>>>
>>>> Now open the binding - what compatibles are allowed for renesas,r9a08g046-lvds-cmn ?
>>>
>>> OK, I am missing the fallbacks "simple-mfd", "syscon"; in the
>>> compatibles allowed for renesas,r9a08g046-lvds-cmn.
>>>
>>> OK, I will add those.
>>
>> No, maybe, dunno... How anything here could have been tested? dtbs_check clearly points errors on your
>> DTS.
> 
> I ran the below commands and none of then triggered the error/warning you are suspecting.
> Am I missing anything here?
> 
> make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=${1} CROSS_COMPILE=~/${TOOL_CHAIN}/bin/aarch64-none-linux-gnu- dt_binding_check -j32
> make ARCH=arm64 -s dtbs_check -j32
> make ARCH=arm64 DT_SCHEMA_FILES=${1} CROSS_COMPILE=~/${TOOL_CHAIN}/bin/aarch64-none-linux-gnu- -s dtbs_check -j32
> make ARCH=arm64 CROSS_COMPILE=~/${TOOL_CHAIN}/bin/aarch64-none-linux-gnu- W=1 dtbs -j32 2>&1 | tee -a arm64-dtbs.log

No, you must validate all schemas, not one file. And without DTS
obviously this will not point any error on dtbs_check.

I am reverting your commit.

Best regards,
Krzysztof

