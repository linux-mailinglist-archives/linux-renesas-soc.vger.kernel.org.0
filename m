Return-Path: <linux-renesas-soc+bounces-12405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBBA1A7BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45E0188C030
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD01E21128D;
	Thu, 23 Jan 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vNGhBJgq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GQ4qz3IT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE444328B6;
	Thu, 23 Jan 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649235; cv=none; b=Yi1IfIuGt50rv0PrVhuSfJV3DDnIyDWw+8cq2xKZl1mH3WfjG0dlL67iw2uq1TuDDgtDOUNcLucS+SYZ9OInzwNidU2oJusf7ZQmPwx076Fpt4uLttvtVA99pjOzXDZ22sgtoOAssQpl5nCVqwFOSUPnwYKjtA83QEL02VAZKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649235; c=relaxed/simple;
	bh=5exp0Pyr8vP2j/dXCEJf0hOs3tfQq9mySSqp+UCQ0XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGKpiDb3LvZYdFrDmZumBj8oJFvz9jLxuxb0JNWuEYnVCsagTJRWQZpjOOF3rqc+4pfDpBPsVSUKppDyitumrlyeq4OT2DyO09nwspFIIKFFO5z/Vco2tARgY3yb72AhCE2S5icmhPir9pzTsrUtCFxMaMdXb3Jqm4QdHRQ64HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vNGhBJgq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GQ4qz3IT; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Yf5lG1Vf1z9sTr;
	Thu, 23 Jan 2025 17:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737649226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY0i14sLfFp5IyMkmvL8iHgR5m2wjm7udce02oi4QPY=;
	b=vNGhBJgqDqhawuyaYJU77UH/UQKLzXCLTmcmpNV0e/zBCI+45AeCybdsWwPsPSKwu8OO8T
	Z+QxgVzJS5/Tnbe/Oo2KH49UtudPMgjrDLc7940UZhlRLkcpQf2KfHHjK7A9OCQubMOLSb
	zCwOsOONXE1BzSNJS769pmGihZTwbrsObk0+xezDzDOF1EgZJ3u9aEzeAsEafCI9WMpECX
	5viWDfN+SJCwAjnRdNaOWmRiUeWt7CibFKjCoXM2G7bmjMTxemfncFiDpxYJheOvYn1ti2
	hWi5whE8qd1m0rEMv6Mi4kzDLOQfDJ01aAuyaEY5aDgUOtMm5LQpbP5a34ow6Q==
Message-ID: <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737649224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY0i14sLfFp5IyMkmvL8iHgR5m2wjm7udce02oi4QPY=;
	b=GQ4qz3ITqeb2eOGJu6wBvp00xnlUhh1HgECUZpb+fijkHY6W1b+NMZ+89uDSETC8cLMq/Y
	ihggxl+ePG+JMOI/SUSXl95DfuvaYNmU/gNus8r4ORBqEPo/l1qpqtXfWWBdn1CaEqRWgy
	NoVnV3IETU0KMhRLihJBL6AXUJbf3ExgPr+BHCJz5rejDPDd5iepe4V1ImdgwLGo0NsDgn
	mMHWc0HdkGWfzPgILsSw0xoVWQmTcYstjIr7MqOHxXKABcFIj8qSuIYOZA2yoGDucsi5Id
	Rr9TQ08EVifIfnGRVcvFO4vNx7aVKutjo+KTjVS2l0lZ+I0/4N+xRY6LM/A0pA==
Date: Thu, 23 Jan 2025 17:20:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch
 ports
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wk9fj8ipxkp8a75zibptxawmrueq8ejz
X-MBO-RS-ID: e5c6bbcb233f01532af
X-Rspamd-Queue-Id: 4Yf5lG1Vf1z9sTr

On 1/23/25 4:25 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Jan 18, 2025 at 12:14 PM Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Introduce labels for each rswitch port in the form 'rswitchportN'.
>> Those can be used to access rswitch port nodes directly, which is
>> going to be useful in reducing DT indentation slightly as well as
>> in DT /aliases node to reference the rswitch ports as ethernetN
>> interfaces. No functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
>> @@ -974,15 +974,15 @@ ethernet-ports {
>>                                  #address-cells = <1>;
>>                                  #size-cells = <0>;
>>
>> -                               port@0 {
>> +                               rswitchport0: port@0 {
>>                                          reg = <0>;
>>                                          phys = <&eth_serdes 0>;
>>                                  };
>> -                               port@1 {
>> +                               rswitchport1: port@1 {
>>                                          reg = <1>;
>>                                          phys = <&eth_serdes 1>;
>>                                  };
>> -                               port@2 {
>> +                               rswitchport2: port@2 {
>>                                          reg = <2>;
>>                                          phys = <&eth_serdes 2>;
>>                                  };
> 
> Would you mind if I would change all rswitchportN to rswitch_portN
> while applying, for consistency with other Renesas DTS files?
Go ahead, but also keep the commit messages in sync .

I can send a V2 too ?

