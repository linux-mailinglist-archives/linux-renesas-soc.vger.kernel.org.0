Return-Path: <linux-renesas-soc+bounces-24087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DAC31B46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 16:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFCF04FD064
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 14:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44C732F74E;
	Tue,  4 Nov 2025 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b="nFRzSInh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="INg0Fv5F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B032E752;
	Tue,  4 Nov 2025 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268219; cv=none; b=VBLB5M7qWxASLxJovvQdcyywKsWnp6cicsGL+Muw1JbmA2tyK3y5uJ6ztg/gCV37JIcL+/lBa3XqL3FZfS24E60zoOuPLyoThma+SnPu4Eao9HbmF9y4w4pDmKjYrSnD40ZXSR1r0DPiFC5alT2+2pBOEsl3ttj8DATxVl5pIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268219; c=relaxed/simple;
	bh=eHxg8ZsRjH/BRZAiuRt7eW0oNlsFTsrzYRWmF67yJtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAHqqe+eKZginhRRhWg7hbtNOwQdOV2BqVGrELuvzSpAd+yd6AqUvgeveaFddAgupPpKdTmcW7LwzXzeqR5bWwUqI9P+xxnb4GbkmwzGVOGdrtBRxNTqCVWQQEOswyVvtEKzZAmwPlj6xFTBsdqY8VV4gFjufyboteeDWlgL160=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me; spf=pass smtp.mailfrom=beims.me; dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b=nFRzSInh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=INg0Fv5F; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beims.me
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 717C91D003C4;
	Tue,  4 Nov 2025 09:56:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 04 Nov 2025 09:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762268215;
	 x=1762354615; bh=ScOHtHoNH0OZnUklGMPQKXt2S33rJYO0/8ZwF3X5VgQ=; b=
	nFRzSInhPyp5FiUMkm4+73BQ2sx4JN7LuLUgRRwjkvS95Weh39rUIx4vJq9HaGB0
	U8wYHU+a5fMwZNQODV2786yBjdmH212vRxjDrsb2AWtbx7uT9jMkPpsf634NZJyz
	j3YaOWDS9fvR8WnDRWC8pm3xUbeFpslFPdhQbRcXyjkLqcR7Ua5ExsP0vtEyiG0d
	hIEA89qEb0EtSmqEOwnlMdKByRaaUsUoaUICPmWV1v5Xn4LqwKjS9sBsCCR2YPog
	o+BYb46beomSSQf9LlmIrPPnAzpdIm7k88XYHjWpo7P99qKmJruJaQDeERMCh+XK
	xws7uFhxcY89HIB6UcgLjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762268215; x=
	1762354615; bh=ScOHtHoNH0OZnUklGMPQKXt2S33rJYO0/8ZwF3X5VgQ=; b=I
	Ng0Fv5FLlxoLQEQbstoUPDBMUMn/02OaVxQkOTocO0uqaHHhg/sQ7KmdYi6RneyJ
	DgbWPaztGLPPw+2NKXscUsPrsMfzwirl98yYbiMTxv/3tDl5+dwXeQjjnXzuYQqO
	f5b7cLxsCUEBPPADU2OqH7qyncsnCUCmDc9+kdEz/1E75EByZjuY6ClMVvhouy3r
	w5HlKyHVbcmgQtvy8mp0X/4QlYJQNmaMArpIoT9GuRKqH0Bk0IfGEB6Xfww91m2J
	RNXvJRI8FRtp2o0maJOaDGNkA2ysNAGcKfjCXG97uQP1Ux3hylJo6Bd8iNtfIy0m
	uXr6WLJjEfKTh1PuMmXeg==
X-ME-Sender: <xms:NhQKaei8KvjT3Y_rEv1iEHiL4ImkOxHBPMR7vtyszwssp044HhGeuA>
    <xme:NhQKabZeq6Yn25HMvg7avs0djhi2UUx0Er65oRPdjvDJrjE9KIklQSofpazs6B6LV
    ENxyh0Y1bmno2kiW_o7-9rEY30ExUMJ6vV1VzUhsRJ5Yp-ICtv6LTaR>
X-ME-Received: <xmr:NhQKaahoklQacy1o6qMdXLFaHkUn8fpBWL_dZaskzZYwoQ6eisImoB8FLDorA7t34PpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedufedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeftrghfrggv
    lhcuuegvihhmshcuoehrrghfrggvlhessggvihhmshdrmhgvqeenucggtffrrghtthgvrh
    hnpedutdfgjeeitddtkedthffhvdevteefgedutdefhfelueeiledviefhffefudelffen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghfrg
    gvlhessggvihhmshdrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpth
    htohepsggvnhdrughoohhkshestghouggvthhhihhnkhdrtghordhukhdprhgtphhtthho
    pegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhriihkodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:NhQKaVaUcj4gbWGCBPLWqlGn9olVt0LpeAZZskJVgElax_sHv6pEXg>
    <xmx:NhQKaYMMHYgJgOChfgtXupkJHipD3JLfkhU5UoRoLn9Jw6Mbi0876Q>
    <xmx:NhQKaeYpx0suDXFA19CHwOWhptHG-tRrCH2QjWlGH0pKfXXQdETRuw>
    <xmx:NhQKaQWApNvYfW2j9ZGT26WLoX-WxVMFrAdbM5UFGKcrLeNyXeYctA>
    <xmx:NxQKaewaOcKDcPqsh6gftyar4iAplbMuE9EgYfyz_uuJoZJRXZ24VBn1>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 09:56:51 -0500 (EST)
Message-ID: <b7d039b1-7554-47bb-93f4-98d2b08a5882@beims.me>
Date: Tue, 4 Nov 2025 11:56:49 -0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] dt-bindings: net: micrel: Convert to json-schema
Content-Language: pt-BR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rafael Beims <rafael.beims@toradex.com>, Rob Herring <robh@kernel.org>
References: <943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776.git.geert+renesas@glider.be>
 <20241115150210.GA2680735-robh@kernel.org>
 <CAMuHMdV01hv-riCFEBD024pX6jL37C6hp7Cjjy1rtaUnrhvK3w@mail.gmail.com>
From: Rafael Beims <rafael@beims.me>
In-Reply-To: <CAMuHMdV01hv-riCFEBD024pX6jL37C6hp7Cjjy1rtaUnrhvK3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Gert,

On 11/18/24 07:39, Geert Uytterhoeven wrote:
> Hi Rob,
>
> On Fri, Nov 15, 2024 at 4:02 PM Rob Herring <robh@kernel.org> wrote:
>> On Thu, Nov 14, 2024 at 11:42:50AM +0100, Geert Uytterhoeven wrote:
>>> Convert the Micrel PHY Device Tree binding documentation to json-schema.
>>>
>>> Add a simple example.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Notes:
>>>    1. I specified Ben Dooks as the maintainer, as he wrote the original
>>>       bindings. Ben, are you OK with that?
>>>    2. This schema is never applied, as there is no compatible value or
>>>       select statement. Adding
>>>
>>>        select:
>>>          properties:
>>>            $nodename:
>>>              pattern: "^ethernet-phy(@[a-f0-9]+)?$"
>>>
>>>          required:
>>>            - $nodename
>>>
>>>       and changing
>>>
>>>        -unevaluatedProperties: false
>>>        +additionalProperties: true
>>>
>>>       would fix that, and is mostly harmless, except for possible
>>>       conflicts with other Ethernet PHYs having more than one clock, or
>>>       using different clock-names.
>>>       Documentation/devicetree/bindings/net/qca,ar803x.yaml has the same
>>>       issue.
>>>       Is there a proper way to handle this?  Are there other options than
>>>       mandating specific compatible values for Ethernet PHYs?
>> The proper way is simply, if you need to describe your phy in DT, it
>> needs a compatible string. MDIO phys are not special.
> So that's gonna be a bunch of "ethernet-phy-id0022.*" values,
> especially as the least significant nibble is the revision number...
>
>> We really need to split ethernet-phy.yaml into common properties and a
>> specific schema for the compatibles it contains so that we can change
>> 'additionalProperties: true'. That's one reason why all these properties
>> and typos didn't get flagged.
>>
>> If you don't want to retro-actively add a compatible, you can also do
>> something like this:
>>
>> select:
>>    anyOf:
>>      - required: ['micrel,led-mode']
>>      - required: ['micrel,rmii-reference-clock-select-25-mhz']
>>      - required: ['micrel,fiber-mode']
>>      - required: ['coma-mode-gpios']
>>
>> That doesn't catch every case nor if you have a typo in the property
>> names.
> Indeed.
>
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/micrel,phy.yaml
>>> +  micrel,rmii-reference-clock-select-25-mhz:
>>> +    description: |
>>> +      RMII Reference Clock Select bit selects 25 MHz mode
>>> +
>>> +      Setting the RMII Reference Clock Select bit enables 25 MHz rather
>>> +      than 50 MHz clock mode.
>>> +
>>> +      Note that this option in only needed for certain PHY revisions with a
>>> +      non-standard, inverted function of this configuration bit.
>>> +      Specifically, a clock reference ("rmii-ref" below) is always needed to
>>> +      actually select a mode.
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    const: rmii-ref
>>> +    description: |
>>> +      supported clocks:
>>> +        - KSZ8021, KSZ8031, KSZ8081, KSZ8091: "rmii-ref": The RMII reference
>>> +          input clock. Used to determine the XI input clock.
>> Don't repeat the clock name in the description.
> Actually I kept it on purpose, as the driver treats the "rmii-ref" clock
> differently than any other (unnamed) clock.  Obviously I failed to
> relay that information, so I should enhance the description ;-)
>
>>> +  coma-mode-gpios:
>>> +    description: |
>>> +      If present the given gpio will be deasserted when the PHY is probed.
>>> +
>>> +      Some PHYs have a COMA mode input pin which puts the PHY into
>>> +      isolate and power-down mode. On some boards this input is connected
>>> +      to a GPIO of the SoC.
>>> +
>>> +      Supported on the LAN8814.
>> Another reason to add compatible. You have per device properties.
> So I have to increase my datasheet library first, to discover all
> the PHY IDs.
>
> Gr{oetje,eeting}s,
>
>                          Geert

I would like to add a new property to the micrel dt-bindings. I 
understand that
the conversion to json-schema has to be finished before new properties 
are added.

You had this patch posted a while back, and reading the feedback, I'm 
not sure how to proceed.
It seems that forcing the use of compatible strings could be a bit 
risky. At least the "micrel,led-mode"
is used in many device-trees. If I understand the requirement correctly, 
it means we would have to find out
the exact PHY model that every one of these boards uses to not create a 
breaking change.
Other flags like "micrel,rmii-reference-clock-select-25-mhz" or 
"coma-mode-gpios" are more contained
and should be easier, but there would still be some risk to do this 
change without testing on actual hardware.
I couldn't find any use of the "micrel,fiber-mode"  flag in current 
device trees.

Did you find other issues that prevented you from moving forward with 
this? Is my thinking correct regarding
this, or am I missing something?

I appreciate any insight you could give me on this,

Rafael


