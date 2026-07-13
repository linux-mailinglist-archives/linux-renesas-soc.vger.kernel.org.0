Return-Path: <linux-renesas-soc+bounces-35129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QzpUGY/nVGqGgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:26:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63D74B8D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:26:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=pdGeRzlp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49C5A3085126
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22F0424662;
	Mon, 13 Jul 2026 13:19:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC86423A77
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:19:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948774; cv=none; b=EIsYGCPetsjiHLFcXKnQuzFMYRTz7j6lu7iQ9ULUsZei5qHc9RSqHHrsEkC2hxIRgG6KJQ51YnxgXNH+X64UAM0HmIeXF68N+fEWEqmz/aZQyowO0aLEj1vcCDfUnzqy02i0yIIShcV97ZC7P+zHb5cJteDsgDhuM3oZCWeN87w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948774; c=relaxed/simple;
	bh=3Wr4e31xsL5FxE1yKBLHPMDVMdK7LAWRj9VzDWkA7xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxlVaoBKxlqx/Zay6Z/c/mF/dO7ITbzN+3zdIES/2iEt19Azpp/o7ohQqprDljzKYybXwwHJ1tSAMRmR+Sv4pazDu2aG+F8AwSCz5pK6gIpkgM17isGg6TxkDW0S5+DH2REYH8cJ/iudroCTS9p0zIURbE3LVxYzNRfD3yWD8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pdGeRzlp; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f60208a5so27269375e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783948771; x=1784553571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=pdGeRzlpM/B4egrGVhmKf4IvfSiuuOXlaavRDiSvx8lLY/ejSsh1w7L6HdYjQsOJzl
         VzmeRGAsvirPbWz9jHTpQdEDNAKLQUdvjtgHosbwB1bhYwfdQ91p+c9BL4roSez/WPk7
         LGDh2EZg0GXZl0fqip+bdXzit978GHNaQiHpo2L6P/FSpIwbp8A7BDY+xLzxA+OwozSx
         RtPx8dzIdvGMMmkJlTw4QhxBKca+iAkI4dyJXNR63zar18A5iadQ4FitkIKR7/6ALBoS
         jo6bXDRtC65htHeNmdIKcv88HXB0xL3IEbh0rJZVU4mxeSZg1mkMS0fMq3QnmAzRfPTq
         ufMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948771; x=1784553571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=hcKMNH45E1gD6uPCUY5QCCs4+MwnckjLVBzSoq1zVWeFYH+ueWMEkooBrXYnnlwBRM
         qIXZpKbyvRfjnplAsYiBoywX1DXnlGofqRO+0SghqFcG7FQgNYKcp8eWIf/CEGCgUpGM
         tbcGp3LL16befrsTnyIkezYkxa/LzzZzcxTFFwencBAzMMKIS+eQZycAldr8u8X/BLeS
         NEGY13zlxs/nrDH5meYL0NNolVMj2ns8VSUpCOOjRpjuLxpzy0GP+QJjCOvRH++NPn5q
         /8VOE5OpPv3T7bMFDhewNGk/qtzw3X0BbjRVxnHtlcbIryAov7RKwnm2BoWNdGaWCN6Q
         aupw==
X-Gm-Message-State: AOJu0YxSHFrKzG311+g3hvFXIhWgOm5qGEsYN7pFJIFwe/J/Z6Bwsfjn
	AOq5W1A0R1j57mZDLcgpQGQDrZ+RUMj7HbgoBv0HHacWhfuXFs5hvXS68DpoRqAkgKE=
X-Gm-Gg: AfdE7cmYlU9W1yZ7EVSAgbNf0OH5DvSoa4GXAIh9M0dEg1cKYYlOjilou7zSJucAsAK
	CqCXqVFYdfbVnictl2eXmkmC9vn3nz8KKulq91q4oQkkz168ZmoMWi4y6znwCW85Lvem7/gqzSG
	FASO3da3YhI1D+0Mtirq4Lts4MmTmy7SOjbieieD4/EQT2CpSNufRR3CXjdwCf9EucXLehBCIo2
	F8KeSxFQOzkMbOnp6NroCwoCx/wTTRdmgRE2WWyq3yV3zLpJj23VytLNYLBBf6y+7Y8kphZo00i
	aMNh9r0ZExjz0qp8Po7NsZmZe1L8WO/RZlt+B9nGszyFd7vWA+ec0kPsJnYAv+PQakchfWAqD/g
	SP0yTk0AhanH2SHtr9o8PIL1kf8WJSdNiuofs5GclJlhrOZAh4TtLfy64Klnii0/biSS4Oa9GYZ
	88MbYlzpGBsT1n6O05pot/7r3ZjDXdUUaCnC1f0e140kTrkp3DJ3/Dc0He5RUBYBc=
X-Received: by 2002:a05:600c:5307:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-494033f4fd2mr26419545e9.9.1783948771139;
        Mon, 13 Jul 2026 06:19:31 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm120499685e9.2.2026.07.13.06.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:19:30 -0700 (PDT)
Message-ID: <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
Date: Mon, 13 Jul 2026 16:19:28 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:claudiu.beznea@tuxon.dev,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-35129-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,tuxon.dev,glider.be,kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:email,renesas.com:email,tuxon.dev:from_mime,tuxon.dev:mid,tuxon.dev:email,tuxon.dev:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E63D74B8D4

Hi, Biju,

On 7/12/26 17:55, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
>> Sent: 10 July 2026 12:37
>> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The pin controller provides a register
>> to select between these two options.
>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S SoC.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none
>>
>>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>>   1 file changed, 68 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> index b52a85066f63..9a0706fea220 100644
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -69,6 +69,7 @@
>>   #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>>   #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>>   #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
>> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>>
>>   #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>>   #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
>> @@ -186,6 +187,9 @@
>>   #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>>   #define PVDD_MASK		0x3
>>
>> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
>> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
>> +
>>   #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>>   #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>>   #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
>> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
>>    * @oen: OEN register offset
>>    * @qspi: QSPI register offset
>>    * @other_poc: OTHER_POC register offset
>> + * @i3c_set: I3C_SET register offset
>>    */
>>   struct rzg2l_register_offsets {
>>   	u16 pwpr;
>> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>>   	u16 oen;
>>   	u16 qspi;
>>   	u16 other_poc;
>> +	u16 i3c_set;
> 
> 
>>   };
>>
>>   /**
>> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>>    * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>>    * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>>    * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
>> + * @i3c_set_poc: I3C_SET_POC mask
>>    */
>>   struct rzg2l_register_masks {
>>   	union {
>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>>   			u8 other_poc_pvdd1833_oth_iso_poc;
>>   			u8 other_poc_wdtovf_n_poc;
>>   		};
>> +
>> +		/* RZ/G3S masks */
>> +		struct {
>> +			u8 i3c_set_poc;
> 
> How this POC is different from Ethernet, SDHI and XSPI POC?

Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.

> For consistency, can't we handle like others?
Everything is handled the same way for all functionalities in 
rzg2l_caps_to_pwr_reg() from patch 1.

Thank you,
Claudiu

