Return-Path: <linux-renesas-soc+bounces-31361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I5tAL1Q4mnx4QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 17:24:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6241C939
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 17:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9405D3049734
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 15:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD7530DECC;
	Fri, 17 Apr 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="ETVGpyy/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081D30C62E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439350; cv=none; b=gYMquMueFLwxw9hlIeehTHnsUl7QpsDC1SGS8qMTHtxIV0jsIDgUsYasbULVBH2FyP7jtMNWfF9sjTcGgmFouxs4/0V/6urGAXROv7NqnZZ426YrK2em3+H9OW8Gtlw6VPE1MeDDICkdkTfipUAdd24VHfNt6Qh1H7oTukLFMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439350; c=relaxed/simple;
	bh=K2kd/re1hrM8vjf2USkWWBQah6xYlWMVfQBlT6ZdAEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sn/fSXcPvel5WUyDQX6u6Od9Mul+hmwjuiuMswZJcii4jgriUSFr0iyMMtBzUK5bUqQGrQ+2XupjhWcL1STJCkt3WlroNeZQ7h+CzsyyurLGEpt0xTkH0uNUiTlv0s0d7rkJKDMuHuQZOvvGLq4wh5kUdcjZnw9GTU2HxSD3HYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=ETVGpyy/; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 14707 invoked from network); 17 Apr 2026 17:22:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1776439341; bh=Xi8TMBxp0BSry8/JFMeye6deCm8xd1AIT0mWI9VoFQI=;
          h=Subject:To:Cc:From;
          b=ETVGpyy/h1lmQIM/LNdBK8Q7Ps0guVrRjzMDXeIlvyGYbXST1B3DJns5VQ2JGFeE0
           UIns2ErK2QLuiFaFZ6tww2i7GV4iiZcShkqQp+pVKJe7cK9VLI9vzJ+O9yjgnz4K4Y
           mNyuWTHrL6vQG332g/KynWEGPtmA7r2cRou1sNcCSwtsk/yZlcFg5rGr7YYO2+ddK+
           aVf/GY3st4ADnWKwA+ar+sgeimFCFK16o3Y8InE0DnwLzOnsxw9qLm4Xp6s/pqz9Q4
           cdnHB0DqL+ShPSQuESDxzygxrM6//c4tiK0yNma/fTXlkENXn6KeoJGov7XzipDlqS
           6tOirNuRgWwgA==
Received: from 83.24.138.154.ipv4.supernova.orange.pl (HELO [192.168.3.203]) (olek2@wp.pl@[83.24.138.154])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <miquel.raynal@bootlin.com>; 17 Apr 2026 17:22:21 +0200
Message-ID: <b41fdead-71c2-4c85-8b62-237d305a80d7@wp.pl>
Date: Fri, 17 Apr 2026 17:22:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] dt-bindings: interrupt-controller: Describe EIP-201
 AIC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>,
 "David S. Miller" <davem@davemloft.net>,
 Christian Marangi <ansuelsmth@gmail.com>, Antoine Tenart
 <atenart@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-2-5e6ff7853994@bootlin.com>
 <444b4349-3873-4da6-aadd-3605e738ad0d@wp.pl> <87tstac9fn.fsf@bootlin.com>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <87tstac9fn.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: c9eb1343a5c3b7e25f82a1734231c32a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000002 [ATFs]                               
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31361-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[wp.pl];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wp.pl:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,scribd.com:url,wp.pl:email,wp.pl:dkim,wp.pl:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52C6241C939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miquel,

On 17/04/2026 09:50, Miquel Raynal wrote:
> Hi Aleksander,
>
> On 16/04/2026 at 20:04:03 +02, Aleksander Jan Bajkowski <olek2@wp.pl> wrote:
>
>> Hi Miquel,
>>
>> On 27/03/2026 21:09, Miquel Raynal (Schneider Electric) wrote:
>>> diff --git
>>> a/include/dt-bindings/interrupt-controller/inside-secure,safexcel-eip201.h
>>> b/include/dt-bindings/interrupt-controller/inside-secure,safexcel-eip201.h
>>> new file mode 100644
>>> index 000000000000..ead73bd96296
>>> --- /dev/null
>>> +++ b/include/dt-bindings/interrupt-controller/inside-secure,safexcel-eip201.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +
>>> +#ifndef _DT_BINDINGS_IRQ_SAFEXCEL_EIP201_AIC_H
>>> +#define _DT_BINDINGS_IRQ_SAFEXCEL_EIP201_AIC_H
>>> +
>>> +#define AIC_PKA_INT0 0
>>> +#define AIC_PKA_INT1 1
>>> +#define AIC_PKA_INT2 2
>>> +#define AIC_TRNG_INT 3
>>> +#define AIC_RESERVED 4
>>> +#define AIC_SL_ERR_INT  5
>>> +#define AIC_PROTECTION_INT 6
>>> +
>>> +#endif
>> This interrupt mapping is specific to the EIP-150. The EIP-201 is also
>> integrated
>> into other accelerators, such as the EIP-97, EIP-196, and EIP-197, and the
>> interrupt mapping is likely different there. Maybe it would be better to use
>> eip150 name instead of eip201?
> Thanks a lot for the heads up, I didn't had that information, I will
> adapt the naming to make it more accurate future proof.
>
>> As for EIP-28, it is also part of EIP-94. EIP-94 is supported by the
>> amcc driver.
>> EIP-94 consists of four components:
>> * crypto accelerator (unnamed?),
>> * PRNG (EIP-73d),
>> * TRNG (unnamed?),
>> * PKA (EIP-28).
>> Only the first three components are supported by the amcc driver.
> Is this driver upstream? I didn't find it. Anyhow, thanks for the
> feedback, I will update with this knowledge in mind.

You can find the driver in the drivers/crypto/amcc directory. It contains
no references to EIP-94. It’s likely that when it was added, it wasn’t
clear that it was a generic IP core.

A while ago, I was looking for information about the PRNGs built into
Rambus crypto accelerators. I found out that all these accelerators are
made up of blocks and have some common components.

EIP-93:
* PE (various IP cores),
* PRNG (EIP-73a),
* Interrupt controller (unnamed?)
EIP-94:
* PE (various IP cores),
* PRNG (EIP-73d),
* TRNG (unnamed?),
* PKA (EIP-28),
* Interrupt Controller (unnamed?).
EIP-97:
* PE (EIP-96)
* AIC (EIP-201),
* PRNG (EIP-73d),
* HIA (EIP-202),
* PP (EIP-206).
EIP-196:
* PE (EIP-96)
* AIC (EIP-201),
* PRNG (EIP-73d),
* HIA (EIP-202),
* PP (EIP-206).
EIP-197:
* PE (EIP-96)
* AIC (EIP-201),
* PRNG (EIP-74),
* HIA (EIP-202),
* PP (EIP-206),
* ICE/OCE (EIP-207),
* Buffers (EIP-208).

You can find some documentation online:
* EIP-93: 
https://www.analog.com/media/en/dsp-documentation/processor-manuals/BF70x_BlackfinProcessorHardwareReference.pdf
* EIP-94: 
https://www.scribd.com/document/734250956/Safexcel-Ip-94-Plb-Sas-v1-5
* EIP-96: 
https://www.scribd.com/document/665924605/Security-IP-96-HW4-6-Hardware-Reference-and-Programmer-Manual-RevB
* EIP-197: 
https://www.scribd.com/document/665924595/Security-IP-197-HW3-4-Hardware-Reference-Manual-RevA

Best regards,
Aleksander


