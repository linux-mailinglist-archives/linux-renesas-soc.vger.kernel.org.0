Return-Path: <linux-renesas-soc+bounces-32270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FEGG+sF/WkaWwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:36:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AB4EF612
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2882C301EB6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 21:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D118434CFDA;
	Thu,  7 May 2026 21:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hid+k1D5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DHVO4ux1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E112F1FC9;
	Thu,  7 May 2026 21:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778189793; cv=none; b=g1OSlTEzTFXtesEO2SJg5r16cjNyPteWywwOxkJ2Pe2wkpF0QfiZcRyZrV9adGWxvXPNZptcEk2gLWum0I9NUXK97mO+bC3phE98uwwxtRxFjXuVNpFhVb6An509qz5vDvgP1Th9baESmwYNUGAlynykRnL2TmCHzkTabUMRM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778189793; c=relaxed/simple;
	bh=p8BgNvjIw9XM568/P9xc8rYhcRi/3guX3yg9ZaYeUGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWwRj2GKavHFj0eM5w+rxdrfKSL6Dzmh2Vnz2dwiU8pSjINrUF/Dm28w6Pe5QfpD0+4+yIAYDCUFA/bMLDyCWoFfW/fNBxh260uQubRYI0CRgRh2YsJDb0G/T5XV2GzD4MwYhTHGDaevXuwipJtl57oROEmStQqUFxsVB4Zwt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hid+k1D5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DHVO4ux1; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gBQYR6z4vz9vHM;
	Thu,  7 May 2026 23:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778189788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aN/MoGo/0OBj5lX14oDE14F1c1D7CB1rzMZQxCCROZQ=;
	b=hid+k1D5ogrx5G1lWd7pUQ9CoVlwl9a/2OZM8TPGYYY64ydMa9M+cAHol5Vq69qSY1wD+w
	c3OAPMLqyGmMPyPaDWwjVQHxfyfrcof9UdlEiKt6pQzfnI7grBUM6NQO6VooYzKrHhMV96
	zoHb/KRQ44q8MEKR9XMkWRyHcGJRqfuoWyxLIq2/bYM9VeOHNLkK7BzxqL0Zi3ATWfy90O
	KH2bp7vOzWUHfEaE+caQun7dox5w3HvaVjaHVm31R4oP/LyBgg13gYNlkRuC405HG0/STE
	U6v54wENsDBgOwzNkT4dAjaTFanls6nJ46k1Yp5ruhNpN9Y3VvUGcNO8aA/+dA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DHVO4ux1;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778189786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aN/MoGo/0OBj5lX14oDE14F1c1D7CB1rzMZQxCCROZQ=;
	b=DHVO4ux1H/KOBsyRCO1LJQTL1AsPUk6OH15mgKVB2SR719sbrwLhBqkf0pJwNw2F/u1RCY
	Xh1DXe05bHIeDCthuo/tmzyeZJtI0jKnm+R5/Shf7GM1aYMEdaOVfuFuScpklPu/EERepj
	WEeEsEZSS5pAUtOnT0ZsMV0HHcOMRPseJ0+gxoKKrlx/0cgy5HwKejkeo2dHciYNIzAMtL
	cTPHYXxVywmd6sldoy8hVdioPDpoqEbYQwLRSTBb44R31vSLBkcInog6QLffxaDN1cK24L
	LRq2M1TQQWvGGxiol6tiquQp8uS+EokFt+VaF15ueTD/H8i6t7cxAoubvrvsBQ==
Date: Thu, 7 May 2026 23:36:17 +0200
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
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
 <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zpfhg6i8eyntcpfuwy38ym1zyrgr17gc
X-MBO-RS-ID: 45b055b3220d0470145
X-Rspamd-Queue-Id: D36AB4EF612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32270-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	GREYLIST(0.00)[pass,meta];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.051];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,c0710000:email]
X-Rspamd-Action: no action

On 5/7/26 9:37 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
>>> +  '#power-domain-cells':
>>> +    description: |
>>> +      - The first power domain specifier cell must be either the Module
>>> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
>>> +        datasheet,
>>
>> I agree with this part.
>>
>>> or a Power Domain number, as defined in
>>> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>>
>> I do not understand this part, please see end of this email ...
>>
>>> +      - The second power domain specifier cell must be the module number
>>> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
>>> +        in the high nibble, and the Module Reset Destination bitfield index in
>>> +        the low nibble.
>>> +    const: 2
>>
>> I am unsure about this part.
>>
>> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
>> block contains multiple Module Power Domain Gating registers (MPDGn) and
>> multiple Module System RESet register (MSRES) .
>>
>> I do understand and agree that the first power-domains-cells cell must
>> be the identifier of power domain within the MDLC block.
>>
>> However, I do not understand the second cell. The MDLC bindings already
>> contain reset-cells, which should be used to refer to a reset within the
>> MDLC block. Resets within the MDLC block are operated using the MSRES
>> registers. Why are resets conflated into power-domain-cells ?
> 
> The Module Reset Destination bitfields in the MSRES registers are
> 2-bit wide, and control both Reset and Module Standby.  Hence the
> same register bitfields are referred to in the power-domains and
> resets properties, through the module number.
> 
> Module Standby controls the clock(s) going into the module,
> and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
> firmware. This is very similar to how MSTP (Module Stop) clocks are
> handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
> clocks have a zero rate :-(.
> 
> Summarized, the first cell is the power domain part, and the second
> cell is the clock domain part.

Thank you for the clarification.

Since there are up to 32 MPDG registers, and 256 resets, can we encode 
both into a single cell ?

(mpdg_register_offset << 16) | (reset_bit_offset << 0)

I cannot tell whether this is much better, but it at least ties the PD 
components (power domain and clock domain) into a single value, which 
matches reality a bit better. The current split power domain and clock 
domain description in two cells gives me the illusion that it is 
possible to mix and match power domains and clock domains in DT 
description, but in fact the two cells are strongly tied together.

If we cannot encode the two into a single cell, maybe we can at least 
have some sort of macro for this, e.g. this (0xff as no MPDG register 
bits for this block):
#define R8A78000_MDLC_PD_HSCIF0 (0xff << 16) ((0x5 << 4) | (0x3 << 0))

What do you think ?

> So perhaps I will clarify like this:
> 
>        - The first power domain specifier cell is the power domain part, and
>          must be either the Module Power Domain Gating (MPDG) register index

... for power domains which are backed by MDPG bits, and which can be 
controlled in that manner ...

>          (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
>          <dt-bindings/power/renesas,r8a78000-mdlc.h>,

... for power domains which are always on, and for which there are no 
MPDG bits which can be used to control them ...

>        - The second power domain specifier cell is the clock domain part, and
>          must be the module number (0x00-0xff), composed of the Module System
>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.

I can understand this.

>>> +  '#reset-cells':
>>> +    description:
>>> +      The single reset specifier cell must be the module number (0x00-0xff).
>>> +    const: 1
>>
>> [...]
>>
>>> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
>>> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
>>> +
>>> +/* R-Car X5H MDLC Power Domains */
>>> +
>>> +#define R8A78000_MDLC_PD_AON                 0x40
>>> +#define R8A78000_MDLC_PD_SCP                 0x41
>>> +#define R8A78000_MDLC_PD_APL                 0x42
>>> +#define R8A78000_MDLC_PD_CMN                 0x43
>>> +#define R8A78000_MDLC_PD_ACL                 0x44
>> ... what do these numbers represent ? Shouldn't those be register
>> offsets from MDLC MPDG00 according to power-domain-cells ?
> 
> These are Power Domains that are not backed by any of the 64 Module
> Power Domain Gating (MPDG) registers in MDLC blocks.

I suspect that might not be entirely correct for all of them, please 
read on and see CMN below.

> It is not clear to me if they can be controlled manually, probably
> they are just always sequenced automatically on power-up.  As the
> documentation does treat them as separate domains (see e.g. Table 14.1
> Power Supply Voltage Monitor Functions), I figured they would better be
> exposed as separate domains, instead of as a single always-on domain,
> like on earlier R-Car SoCs (cfr. R8A779*_PD_ALWAYS_ON domains number
> 32 or 64).
> 
> See also the X5H_Power_domain_structure.xlsx attachment in the R-Car
> X5H documentation.

This is indeed helpful piece of documentation, together with X5H_MS, but 
I think the later is still being updated.

Let's take PD_AC00 , AP core 0 , as a domain of interest. My 
understanding is, that the domain structure for PD_AC00 looks as follows:

PD_AON {
   PD_SCP { };
   PD_APL {
     hierarchy is SYSSS
     always-power-on
     PD_CMN {
       hierarchy is CMNN
       power-gating-bit is MDLC_CMNN 20
       PD_APU0 {
         hierarchy is SYSSS
         power-gating is done by APMU
         PD_ACL0 {
           hierarchy is CMNN
           power-gating-bit is MDLC_CMNN 16
           PD_AC00 {
             hierarchy is CMNN
             power-gating-bit is MDLC_CMNN 0
           };
           ...
         };
         ...
       };
       ...
     };
     ...
     PD_HSCIF0 {
       hierarchy is PERW
       power-gating-bit is MDLC_PERW 23
     };
   };
   ...
};

With this in mind, I think CPU 0 DT node should refer to the PD_AC00 
power domain this way:

cpu@0 {
   ...
   power-domains = <&mdlc_cmnn R8A78000_MDLC_PD_AC00>;
   ...
};

The MDLC driver would pass the PD_AC00 domain ID to matching SCMI power 
domain management protocol call, or, for bare-metal MDLC driver, would 
have to internally encode PD hierarchy, walk it, and apply PD operations 
in each step.

I think even for SCIF/HSCIF, the power domain reference should be 
something along the lines of the following description. The MDLC driver 
should internally encode that R8A78000_MLDC_PD_HSCIF0 is a sub-domain of 
R8A78000_MDLC_PD_APL .

serial@c0710000 {
   ...
   power-domains = <&mdlc_perw R8A78000_MDLC_PD_HSCIF0>;
   ...
};

>> If those are power domain IDs, then I am unsure why e.g. for SCIF the
>> domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts:
>> renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?
> 
> See the "Module Standby" attachment X5H_MS.xlsx in the R-Car X5H
> documentation. The "PERW" tab shows that all PERW devices are located
> in the PD_APL power domain, which is always-on.
> This is different from e.g. the UFS controllers: they are located in
> their own PD_UFS0 and PD_UFS1 power domains, which are controlled
> through the Module Power Domain Gating registers (MPDGn) (cfr. the
> "PERE" tab).
Thank you for this clarification !

