Return-Path: <linux-renesas-soc+bounces-29158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHggDnF8sGnLjgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:17:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05C25779C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C513193912
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 20:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8447B3E9290;
	Tue, 10 Mar 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfHn+2Nd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1163164DF;
	Tue, 10 Mar 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173683; cv=none; b=bnNF8TKC17jy+UOqxbqlae0ybm7Mh2G89LG+Dyq05SNbMR6DmL6WE3ppk0BTk4hQhdClBURixapqWLvAaw034okhCittMY2jQV9UwZPu/wTYIpslThqtJcroUaWMuAQO7CV33ngL/HhTikPIxvmpYAouG37LICrtHbhx4XpKUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173683; c=relaxed/simple;
	bh=a+cXUQrLuN7vTg0TXCXJzP5oovLSl9XiOXS5kzr53zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfuuY2me2EnMAuHuLO2Aip34QaMMk+1UBt2Uq7rsFuDt4Y/nJRpjOj2ZN9ZB7Mw3iWuuU0nk9h4spIknuMjTX2eIji+nJ0o5lnfeKnBYYquxlUR91feYoMAMcX0rAK0J+Hoosv0yk0iqwwUmgaRNAQZzYOO4sfBv2vhzYqdUhVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfHn+2Nd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B935C19423;
	Tue, 10 Mar 2026 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773173683;
	bh=a+cXUQrLuN7vTg0TXCXJzP5oovLSl9XiOXS5kzr53zQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bfHn+2Nd7wQ+KkWqGnDdhKHVGVUYFShv3GALdK3b3PCNejdCB4Re/wk3KKzOqMDO2
	 noKZV5VUYjet++Acp50M8Mdo0yFjNcz3OmqNfGUeg1PHvVR8NbXbCBgCkXOOtiyCwo
	 qSQ6BZySbBN1GP5YX6sE6ygyltJ4R97No0VTLuKgK57NDmKafBPEsAha7DFFbCJl9I
	 TJZjN3ZxXlRHcXpYJLgR+s5sV4Vsodmirfu3BjrCX1e+pLVk2mTBdd2GgBFuo/etSi
	 65PCP4FuxQ3TrUKqDYjy01kBH4a8+Vo6YO68hlCjcWrTH7C+u6VQuPvZkXlFJiN+6/
	 dTcPg0vLTBrfw==
Message-ID: <d237ef86-17d2-4e86-9e74-2d988714c602@kernel.org>
Date: Tue, 10 Mar 2026 21:14:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: renesas,rzn1-wdt: Document the
 reset line
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260310173249.161354-1-herve.codina@bootlin.com>
 <20260310173249.161354-4-herve.codina@bootlin.com>
 <392ededd-ee73-4afa-88b4-b15fe1dc3457@kernel.org>
 <20260310191220.52ed546c@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260310191220.52ed546c@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8D05C25779C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29158-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com,vger.kernel.org,se.com,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,2.98.121.64:email]
X-Rspamd-Action: no action

On 10/03/2026 19:12, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Tue, 10 Mar 2026 18:38:50 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 10/03/2026 18:32, Herve Codina (Schneider Electric) wrote:
>>> Watchdogs available in the RZ/N1 SoC can use their specific hardware
>>> reset line to reset the system on watchdog timeout.
>>>
>>> This line is not documented in the current binding.
>>>
>>> Fill this lack and describe this per watchdog reset line.
>>>
>>> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
>>> ---
>>>  .../bindings/watchdog/renesas,rzn1-wdt.yaml   | 22 +++++++++++++++++++
>>>  .../dt-bindings/watchdog/renesas,rzn1-wdt.h   | 16 ++++++++++++++
>>>  2 files changed, 38 insertions(+)
>>>  create mode 100644 include/dt-bindings/watchdog/renesas,rzn1-wdt.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
>>> index 7e3ee533cd56..40a9a4ebc716 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
>>> @@ -26,6 +26,26 @@ properties:
>>>  
>>>    timeout-sec: true
>>>  
>>> +  renesas,reset-line:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1]
>>> +    description: |
>>> +      The watchdog reset line (dt-bindings/watchdog/renesas,rzn1-wdt.h defines
>>> +      these values). A wachdog timeout asserts this reset line to perform a
>>> +      hardware system reset. Two watchdogs are present in the RZ/N1 SoC and
>>> +      each of them has a dedicated reset line.
>>> +
>>> +        - 0: RZN1_WDT_A7_0
>>> +          This reset line can be asserted only by the A7 0 watchdog. This
>>> +          watchdog is the one mapped at 0x40008000 on RZ/N1 SoCs.
>>> +
>>> +        - 1: RZN1_WDT_A7_1
>>> +          This reset line can be asserted only by the A7 1 watchdog. This
>>> +          watchdog is the one mapped at 0x40009000 on RZ/N1 SoCs.
>>> +
>>> +      If the renesas,reset-line property is not present, the watchdog timeout
>>> +      only triggers an interrupt.  
>>
>> I don't understand. You have two watchdogs (0x40008000 and 0x40009000)
>> so why you would tell each of them that they can reset line associated
>> with them? Can a watchdog reset other watchdog's line? No, thus code like:
>>
>> watchdog@40008000 {
>> 	renesas,reset-line = <RZN1_WDT_A7_1>;
>> };
>>
>> makes no sense and thus is pointless to specify in DT.
>>
>> What's more, if reset line is always wired (and how could it be since it
>> is fully within the soc), why would this be board-level property?
> 
> This is the exact same for interrupts and clocks.
> 
> Interrupts dedicated to IPs and hardwired, as well as clocks. Those resources
> are described in DT.
> 
> Why not this reset line?

How is it the same? clocks and interrupts represent wiring between
modules, so that other module (provider) will be properly configured. So
where is here phandle to point to the other module which you are
configuring? How single number <0, 1> can be a phandle?


> 
>>
>>
>>
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -41,10 +61,12 @@ examples:
>>>    - |
>>>      #include <dt-bindings/clock/r9a06g032-sysctrl.h>
>>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/watchdog/renesas,rzn1-wdt.h>
>>>  
>>>      watchdog@40008000 {
>>>              compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
>>>              reg = <0x40008000 0x1000>;
>>>              interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
>>>              clocks = <&sysctrl R9A06G032_CLK_WATCHDOG>;
>>> +            renesas,reset-line = <RZN1_WDT_A7_0>;
>>>      };
>>> diff --git a/include/dt-bindings/watchdog/renesas,rzn1-wdt.h b/include/dt-bindings/watchdog/renesas,rzn1-wdt.h
>>> new file mode 100644
>>> index 000000000000..fe534aff0609
>>> --- /dev/null
>>> +++ b/include/dt-bindings/watchdog/renesas,rzn1-wdt.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/*
>>> + * RZ/N1 watchdog reset lines
>>> + *
>>> + * Copyright (C) 2026 Bootlin
>>> + *
>>> + * Herve Codina <herve.codina@bootlin.com>
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_RZN1_WDT_H__
>>> +#define __DT_BINDINGS_RZN1_WDT_H__
>>> +
>>> +#define RZN1_WDT_A7_0		0
>>> +#define RZN1_WDT_A7_1		1  
>>
>> I also see little value of the binding, but probably because I don't
>> understand the point of this patch.
> 
> I mentioned 0 and 1 for those lines in the binding and referred to this
> header. What's wrong with that ?
> 
> Clocks use the same kind of description.
> A bunch of defines in header file to avoid a direct number.

So instead of answering my questions why you are doing this, why do you
need it, you use arguments "I saw some code looking like that, so I can
do that". No, you can not do that.

We don't copy blindly some code just because it looks similar. And we
avoid answering "I saw it somewhere" when someone asks you why you are
doing this.

Best regards,
Krzysztof

