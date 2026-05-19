Return-Path: <linux-renesas-soc+bounces-32791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JIPMG4nDGq/XgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 11:03:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A957AD41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 11:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A0DE309018C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 08:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164613EFD15;
	Tue, 19 May 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Brbgeawi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5763E120D;
	Tue, 19 May 2026 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180953; cv=none; b=YJk9rq6KFNGtpNG4ejw5SMrPqbQ7w7HE2zMgqE2lbY7YcIX+bj3eElFyKpKrjpaTnBuIo1au+Vb82uDc4cL73jZBMeHomWK7JNEVjVVmr4pp9nek4zvs5ReysTQKxx+1wMvoIhtY26ul2CRoTB/k7/x5ClZhPJhoFVqNBRNG/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180953; c=relaxed/simple;
	bh=bnfsYmG3kzgJs/ytTQSzYEKeHfB3W4gK9H4MF7vhF4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iK3GNrwLFPOLvjY6VVFoAFFZpDNOrkiE6r056cjueXSJnaQz/UYfewRplEwiZh0dK3CD8CK5UXxxzAeVTlB8MrWjLisf6qi60jB05cmlP7SYepcYupcb56a7nPn7JkDG/AiipSLq8qyPEXZnfrd8YlJV5iS8mQDplixRICCkLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Brbgeawi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2a01:cb1d:8f2:800:77df:2bd9:9512:fa38] (unknown [IPv6:2a01:cb1d:8f2:800:77df:2bd9:9512:fa38])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57FF5ABF;
	Tue, 19 May 2026 10:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779180937;
	bh=bnfsYmG3kzgJs/ytTQSzYEKeHfB3W4gK9H4MF7vhF4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BrbgeawiKVJAtSi6hG+M5xZTvch90EVw1/E0FVikYrJ2tAyrG64SnmnknMLtdoRha
	 8ex1dAkA3qLgkEGG0ZZEVeV3si/2B0IGh5MGE1Vdjtms11eSCknY88uyO13tIzKUdn
	 W8URueTh79j229XpV0e1+9TH2NV+d+LWEPhi+Jfs=
Message-ID: <6b15d447-a01e-40f7-9874-88d6df05cd4b@ideasonboard.com>
Date: Tue, 19 May 2026 10:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
 <20251010-kakip_dts-v1-1-64f798ad43c9@ideasonboard.com>
 <CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32791-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.244.192.64:email,0.245.92.128:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 384A957AD41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert - sorry for leaving this so long to revise, I'm afraid it slipped my mind.

On 21/11/2025 11:08, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Fri, 10 Oct 2025 at 12:51, Daniel Scally <dan.scally@ideasonboard.com> wrote:
>> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
>> tree file for the RZ/V2H(P) SoC.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
>> @@ -1298,6 +1298,58 @@ queue3 {
>>                                  };
>>                          };
>>                  };
>> +
>> +               ivc: isp-input@16040000 {
>> +                       compatible = "renesas,r9a09g057-ivc";
>> +                       reg = <0 0x16040000 0 0x230>;
> 
> Size should be 0x10000, according to Table 1.8-1 ("Detailed Address Space").

Ah, thanks - the register table for the module only defines addresses up to 22C so I used that size, 
but I'll switch to the value from this table

> 
>> +
> 
> Please no empty lines between properties (everywhere)

Ack
> 
>> +                       clocks = <&cpg CPG_MOD 0xe3>,
>> +                                <&cpg CPG_MOD 0xe4>,
>> +                                <&cpg CPG_MOD 0xe5>;
> 
> Fits on two lines.

Ack
> 
>> +                       clock-names = "reg", "axi", "isp";
>> +
>> +                       power-domains = <&cpg>;
>> +
>> +                       resets = <&cpg 0xd4>,
>> +                                <&cpg 0xd1>,
>> +                                <&cpg 0xd3>;
> 
> Fits on a single line.

Ack
> 
>> +                       reset-names = "reg", "axi", "isp";
>> +
>> +                       interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       status = "disabled";
>> +
>> +                       port {
>> +                               ivc_out: endpoint {
>> +                                       remote-endpoint = <&isp_in>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               isp: isp@16080000 {
>> +                       compatible = "arm,mali-c55";
>> +                       reg = <0 0x16080000 0 0x200000>;
> 
> Size should be 0x80000, according to Table 1.8-1 ("Detailed Address Space").
> Or is GPV_VIDEO0 part of the ISP?

No I just messed it up - thanks for catching.
> 
>> +
>> +                       clocks = <&cpg CPG_MOD 0xe2>,
>> +                                <&cpg CPG_MOD 0xe4>,
>> +                                <&cpg CPG_MOD 0xe5>;
> 
> Fits on two lines.

Ack

> 
>> +                       clock-names = "vclk", "aclk", "hclk";
>> +
>> +                       resets = <&cpg 0xd2>,
>> +                                <&cpg 0xd1>,
>> +                                <&cpg 0xd3>;
> 
> Fits on a single line.

Ack

> 
>> +                       reset-names = "vresetn", "aresetn", "hresetn";
>> +
>> +                       interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
> 
> According to Table 4.6-23 ("List of Input Events"), the ISP has 6 interrupts.
> One of them is used by the ivc above.  Do you know what is the purpose
> of the four other interrupts, and if they should be listed here or elsewhere?

I believe that three of them are really intended for the IVC and three for the ISP. We didn't use 
them in the drivers, but they probably should be listed here and in the ivc node nonetheless. I'll 
add them.

Thanks very much for the review.

Dan

> 
>> +
>> +                       status = "disabled";
>> +
>> +                       port {
>> +                               isp_in: endpoint {
>> +                                       remote-endpoint = <&ivc_out>;
>> +                               };
>> +                       };
>> +               };
>>          };
>>
>>          stmmac_axi_setup: stmmac-axi-config {
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


