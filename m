Return-Path: <linux-renesas-soc+bounces-32311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JiBH2f1/2mQAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 05:03:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B668502553
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 05:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B03803014420
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 03:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E2523EAA0;
	Sun, 10 May 2026 03:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fdAObIBP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E935979;
	Sun, 10 May 2026 03:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778382177; cv=none; b=eJl3gHEWJRiqU43UquQziXWcydjaPOU9BIwmCCYm2WAn/r6OCDo4+YjSK/zQS3HedHZe3YWG/6q14VU2vTfKadfmflbQ90RgtmpusDbDiqiRjh4qJVnTvZGFrHTp73jci5gd1xz8/IRTYxDDAPvsPo/WDfRAgMsr1zCjPLaV9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778382177; c=relaxed/simple;
	bh=r+v71hsEte8pWEv2C7BSE3iTj76Ojm2jtEj0SA6Z1RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oChNf+lKEh4+apI8UTvjwFz9I7r+Op9gDNTg8tYkgoGsj9J5fIvLuwWMPFku+voorpqtWK2Zs8pp8W1YL+xEUj5yo99J092cBGePpoUCzF3Xb1AVUjJG5BuJUlJsZmO6U/0Vxnezc+lZ2/SCi/qbpvKTH2ZxpdLzf0XgqKiTxk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fdAObIBP; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gCnj12XFbz9ttT;
	Sun, 10 May 2026 05:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778382165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AG2mPgAOtJ8Me87PpVSnI+nay5U0EzVOgMVFYD/YiE=;
	b=fdAObIBPln9zwt+xeHEPvt1bMvDO8JRvcTJPTX2mTY2J0WgZUFLZhsPyzpYNf06biWicyw
	ptoiNBpq/YGPmw1Te1qySZ+QpzwTzoWX6WAcJfZF/deAobppogx1TrpBppUv0JhuC0I5U1
	AZFbl4R/fbiQuDK6fnkU4+SbAAWEIxh6sCPRAEokqV/28NMezlffi68DwEFhXMpBtMDiDP
	lNGhHwvkI53wWbFW8DKVlymF8MIfOIG3lJ2+SUyNSjZifsTKZ+0xa+1zg9eNGYD42AJA0u
	Bq5BTd3155LGgq6ZCnFa5fg8gBF1Hba6Ayng2cj2WBLIrXcpiwY8A/cafFQBQw==
Message-ID: <73602f40-45f0-4e4e-86cb-4a2c025f0491@mailbox.org>
Date: Sun, 10 May 2026 05:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
 <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
 <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
 <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fbwz36b893qz5jidenhstwmckkgabocb
X-MBO-RS-ID: 685120301b26aeb58c6
X-Rspamd-Queue-Id: 1B668502553
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32311-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,renesas.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,c0710000:email,mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/26 10:26 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> Since there are up to 32 MPDG registers, and 256 resets, can we encode
>> both into a single cell ?
>>
>> (mpdg_register_offset << 16) | (reset_bit_offset << 0)
> 
> We could.  I did consider it (with a shift of 8 cfr. 256 modules),
> but see below...
> 
>> I cannot tell whether this is much better, but it at least ties the PD
>> components (power domain and clock domain) into a single value, which
>> matches reality a bit better. The current split power domain and clock
>> domain description in two cells gives me the illusion that it is
>> possible to mix and match power domains and clock domains in DT
>> description, but in fact the two cells are strongly tied together.
> 
> They are only tied together in the sense that a module (hardware block)
> is part of a power domain, and has module standby (clock) control.
> Some power domains are backed by MDLC hardware registers,
> others are not, hence the need for the additional definitions in
> <dt-bindings/power/renesas,r8a78000-mdlc.h>.
> I am not aware (yet) of modules that are part of a power domain,
> but do not have module standby control. If these exist, we
> need an additional definition (R8A78000_MDLC_MODULE_NONE?) in
> <dt-bindings/power/renesas,r8a78000-mdlc.h>.

Maybe TAUJ3 in AON domain? I think HSCN also has abundance of examples.

> Due to this separation, and due to a possible future need for expansion
> (R8A78000_MDLC_MODULE_NONE, MDLCs with more than 256 modules, ...),
> I went for two cells.

I think I won't push for a single cell either, two cells are OK with me too.

>> If we cannot encode the two into a single cell, maybe we can at least
>> have some sort of macro for this, e.g. this (0xff as no MPDG register
>> bits for this block):
>> #define R8A78000_MDLC_PD_HSCIF0 (0xff << 16) ((0x5 << 4) | (0x3 << 0))
>>
>> What do you think ?
> 
> I (and I believe the DT maintainers) are not so fond of defines for
> numbers that can be (more or less) just read from the documentation.

OK

> (and 0xff should be R8A78000_MDLC_PD_APL?)

I think AON would have to be 0xff , since it is superdomain of APL ?

>>> So perhaps I will clarify like this:
>>>
>>>         - The first power domain specifier cell is the power domain part, and
>>>           must be either the Module Power Domain Gating (MPDG) register index
>>
>> ... for power domains which are backed by MDPG bits, and which can be
>> controlled in that manner ...
> 
> OK.
> 
>>>           (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
>>>           <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>>
>> ... for power domains which are always on, and for which there are no
>> MPDG bits which can be used to control them ...
> 
> OK,
> 
>>
>>>         - The second power domain specifier cell is the clock domain part, and
> 
> Upon second thought: s/clock domain/module standby/

If you could even mention that this refers to "Module STOP" column bit, 
that would even clearer.

>>>           must be the module number (0x00-0xff), composed of the Module System
>>>           Reset (MSRES) register index in the high nibble, and the Module Reset
>>>           Destination bitfield index in the low nibble.
>>
>> I can understand this.
>>
>>>>> +  '#reset-cells':
>>>>> +    description:
>>>>> +      The single reset specifier cell must be the module number (0x00-0xff).
>>>>> +    const: 1
>>>>
>>>> [...]
>>>>
>>>>> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
>>>>> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
>>>>> +
>>>>> +/* R-Car X5H MDLC Power Domains */
>>>>> +
>>>>> +#define R8A78000_MDLC_PD_AON                 0x40
>>>>> +#define R8A78000_MDLC_PD_SCP                 0x41
>>>>> +#define R8A78000_MDLC_PD_APL                 0x42
>>>>> +#define R8A78000_MDLC_PD_CMN                 0x43
>>>>> +#define R8A78000_MDLC_PD_ACL                 0x44
>>>> ... what do these numbers represent ? Shouldn't those be register
>>>> offsets from MDLC MPDG00 according to power-domain-cells ?
>>>
>>> These are Power Domains that are not backed by any of the 64 Module
>>> Power Domain Gating (MPDG) registers in MDLC blocks.
>>
>> I suspect that might not be entirely correct for all of them, please
>> read on and see CMN below.
> 
> Thanks, looks like R8A78000_MDLC_PD_CMN should be dropped.
> 
>> Let's take PD_AC00 , AP core 0 , as a domain of interest. My
>> understanding is, that the domain structure for PD_AC00 looks as follows:
>>
>> PD_AON {
>>     PD_SCP { };
>>     PD_APL {
>>       hierarchy is SYSSS
>>       always-power-on
>>       PD_CMN {
>>         hierarchy is CMNN
>>         power-gating-bit is MDLC_CMNN 20
>>         PD_APU0 {
>>           hierarchy is SYSSS
>>           power-gating is done by APMU
>>           PD_ACL0 {
>>             hierarchy is CMNN
>>             power-gating-bit is MDLC_CMNN 16
>>             PD_AC00 {
>>               hierarchy is CMNN
>>               power-gating-bit is MDLC_CMNN 0
>>             };
>>             ...
>>           };
>>           ...
>>         };
>>         ...
>>       };
>>       ...
>>       PD_HSCIF0 {
>>         hierarchy is PERW
>>         power-gating-bit is MDLC_PERW 23
>>       };
>>     };
>>     ...
>> };
>>
>> With this in mind, I think CPU 0 DT node should refer to the PD_AC00
>> power domain this way:
>>
>> cpu@0 {
>>     ...
>>     power-domains = <&mdlc_cmnn R8A78000_MDLC_PD_AC00>;
>>     ...
>> };
> 
> So we do have a few modules (I found a few more) that are part of
> power domains, but do no support module standby.  One more reason to
> decouple them in power-domains.

I think HSCN is a really good example ?

> However, CPU cores are controlled through PSCI (the slightly less evil
> brother of SCMI? ;-), so
> Documentation/devicetree/bindings/arm/psci.yaml applies, too?

We can indeed control cores purely via PSCI , yes.

(Upstream TFA needs one more platform patch to make this operable)

>> The MDLC driver would pass the PD_AC00 domain ID to matching SCMI power
>> domain management protocol call, or, for bare-metal MDLC driver, would
>> have to internally encode PD hierarchy, walk it, and apply PD operations
>> in each step.
>>
>> I think even for SCIF/HSCIF, the power domain reference should be
>> something along the lines of the following description. The MDLC driver
>> should internally encode that R8A78000_MLDC_PD_HSCIF0 is a sub-domain of
>> R8A78000_MDLC_PD_APL .
>>
>> serial@c0710000 {
>>     ...
>>     power-domains = <&mdlc_perw R8A78000_MDLC_PD_HSCIF0>;
>>     ...
>> };
> 
> R8A78000_MLDC_PD_HSCIF0 is a not a full sub-domain, but merely standby
> (clock) control inside the PD_APL clock domain?
Do you consider R8A78000_MDLC_PD_AC00 a full sub-domain ? Because that 
one looks very similar to R8A78000_MDLC_PD_HSCIF0 , except the former 
controls a core, the later an UART IP.

