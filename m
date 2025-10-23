Return-Path: <linux-renesas-soc+bounces-23506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B419CC01533
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E3D3AD6A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0053009C1;
	Thu, 23 Oct 2025 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MpeiHDum";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AVqusD5S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B42E5404;
	Thu, 23 Oct 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225550; cv=none; b=p18r5ENt1wB92qtTLtQZdkeUmyBRCRGemt2EQWQRWzuWfvX/9bVa9NbSgkyHRN6BIpn2TVQoE4yROMl/NhKhbRPUesijWDFC5b3w/b7Vbv5nzum+rJk46NqhFwFLqgsdKfcO+lj6gDH2eHMhtXJBkmrMMhVlO6MKd4G6J0CRUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225550; c=relaxed/simple;
	bh=/8rkPcTF7Ob5j0pA+Gxck6FNASvRBn5hwkgCdfF/uG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Os5ZyXzYVLaYXvwUkDpNer7Lt/wteGFTHCEiqPwU8T4bq1r78pWxVjFvOfbTeiwCcZqd8xCSratg185eWiVdI+bjY30JUrDo0tPSwYdWr68CXz5gIVxSlzTIzu4YAbEE4UiKWv9hEsAwJMtswDe1XWk8awHl3Foix4xIR3mg4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MpeiHDum; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AVqusD5S; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csmp30f6pz9sbX;
	Thu, 23 Oct 2025 15:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDSJ8J5S8jjS2Yt2GqRZf28Sth5mAo70w2sg+sYmBWQ=;
	b=MpeiHDumhvceLG4lgQMkfm1gG+A0xQd/ShbrURUKhbwttMzzyg4tDxJz3p439OPnaTV4yD
	FQRiIHDH6Bq9O4/hACz6Vo+hojHYS7vfWcur4tflY2qoeCBFqnGkiWVcBHMgsYLyiLI8em
	XzWDk/6+C7uHvJqetRMl6Zm/Pdl+OrZCr9FqUdczUVp4CZrAneKffhBEL8aR9YNS177sAj
	9GS/9l+C2kWlNBYi+Ogc6IRbirq2eYf/0OHCMbw4l0tBCZRfJRYp0Vwp4iF81BomvtgMTZ
	2hC7osLt+RaBdF/qLdY8ChDZ/qy7nLehm7TDuV+EGBBZMitezoI6Xr9k+kdipg==
Message-ID: <4079105a-82c7-4650-8b6d-01989b617a4f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDSJ8J5S8jjS2Yt2GqRZf28Sth5mAo70w2sg+sYmBWQ=;
	b=AVqusD5SsuPwMihcmq489DKJm/Sw2vifrBbdLUImBRMo+6Ovq7mjvhigMaEImB8U9OnKnH
	Zl7uiZE+LUHyCe2fBwFPC5GgMfg7rFeJcsdwhiOtaipkUMEP0Xpb2MdDtXVyq9gLDAB12U
	Akwlxs5eqk70QiA+c4mEla0aaH9K5kBvwasDDv46X2vM5WcGnOJr1pvgIyTlnU0Ntd9Mq+
	i468SWbnHw8EbFeS71ZvL0HmCLSg8EF8KdHLW2JZqmyJfuTO+h9g91T3fVOZcQVr+i1NSp
	hEB0pIpHfB9XQLTQRniIGSoWba5S2bMocZUABd8VtY6x8F4dl6wbgRULzJYHTg==
Date: Thu, 23 Oct 2025 15:19:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: y34odf6yf1ii6mtywukpy3eqxon5pt41
X-MBO-RS-ID: 24cb97ab0f852a5b356

On 10/23/25 3:07 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hello Geert,

> On Thu, 23 Oct 2025 at 14:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Document new property arm,poll-transport, which sets all SCMI operation into
>> poll mode. This is meant to work around uncooperative SCP implementations,
>> which do not generate completion interrupts. This applies primarily on mbox
>> based implementations, but does also cover SMC and VirtIO ones.
>>
>> With this property set, such implementations which do not generate interrupts
>> can be interacted with, until they are fixed to generate interrupts properly.
>>
>> Note that, because the original base protocol exchange also requires some
>> sort of completion mechanism, it is not possible to query SCMI itself for
>> this property and it must be described in DT. While this does look a bit
>> like policy, the SCMI provider is part of the hardware, hence DT.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -146,6 +146,13 @@ properties:
>>         this platform. If set, the value should be non-zero.
>>       minimum: 1
>>
>> +  arm,poll-transport:
>> +    type: boolean
>> +    description:
>> +      An optional property which unconditionally forces polling in all transports.
>> +      This is mainly mean to work around uncooperative SCP, which does not generate
> 
> meant
Fixed locally for potential V2, thanks.

