Return-Path: <linux-renesas-soc+bounces-31162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIvxOM0s2WlXnAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 19:01:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E63DAD4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 19:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52D5A300B617
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFB23DDDBD;
	Fri, 10 Apr 2026 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C+h9jQHc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55CF3E0C4B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840418; cv=none; b=sy59hfQK+0Qg0EVeg96bWqJX7p2XIsFGNPg7SxDXoHQAU1BIapzekevLwggnC9TEsCyy2Ls6Vo3cnl6iF8vYJ3ZeJSb9z4lj0tgrgnE7jhxxPg/IKgs7yflZeYosLeE/9IL+D5eueNshEbbci1Fsqu7waQz8g4dLnaL75LNj4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840418; c=relaxed/simple;
	bh=9/+48qVyBND72fFw8N0MzBsrHa3XLgS8ToF54lejyLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3hvgDHNWccyAjsQG5dyYd8vu49bufKNW2xYDGi/6gfxz/tGVnmxjyBwCzCOHhdcaHhwOGNDRyVqG415Ofw29HnW364oHDzJEk1h2e1bE35j1rKrerSeQtjMbhxu85qX6Yoq9CVIAyHi5nBsrseqKMJ/F1Gd1b8/ADeHIxxEM0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C+h9jQHc; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1367366241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 10:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840416; x=1776445216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4muxIAPUw94/gS1wtcjYpBOll/D/VUQFDQMiW/Xhw+g=;
        b=d2jXCEpT+DoQwcYl54ojTpOr5JzoApZVCXO4VVQ73I3JmLS/6DEd67yelRbt4vRgHM
         OEwYGkOkByK3lhjGFNpDcEVt3QkwJOSBZDlW9ZWpk4PKahuFb2U7I92b8YVXpnDMazqW
         kAL+XU/47GN/c6QhgIQTiKkyVnemxQwcOVzx+lWfRPksIQgIp5dC3a5b54j++GpgZ5Ez
         xUl5WrSB9dn0fIKEe4ABTOPldyTIobp+z52Q7QcGLakSfNXw9K5tYPqBOrVnrpjl8Uss
         j6/baaS6E0XrWE+2Lq65mCn4lPuzSEOMSadh1t8G42rC0Lo8Xz4+sGOnM1Fool72Np2Q
         gG5A==
X-Forwarded-Encrypted: i=1; AJvYcCUgO3+ViE3ZQNzKAvLrGgR7seCumCt5jr+75ShhD0d3P4k3pqtH5plAf5yfefq1icBb+V0he9jMq8nh+7iW5dE6iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRt5IllPBnMQUDpztY0R/EUkV7U9aLL4/wCNKkVYvOCR4vT8Ik
	g5HsD7OY9Ub6HjIc7SEfQkowKhrzCleKOA48nGa8xp4rgK9u+zq6DL2CguMtDCwSS89siWVz4bG
	+DljbQRTmIhBVkByN9ZQJJedfTMUXtBNWp5bm/Q3FkAkC4tYIYk8M/T48yKkRiHiIUcMGiMgTnJ
	f2Pu/qdFpvkQsfNIV6KJb8lS4T9MwQzw4+ppSKmZwoBnfSY6qmOTnL/0mi+dgCure0TSRBfqmNP
	QDmb+/nUkv16vUEq0+BdacpmtHyr/Y=
X-Gm-Gg: AeBDieux7fpRh04M+vXJyDIDzYRoBwk21pCjo48i0dMui2TFf78l/tLsT/n2RmznW9j
	d7PFboUumWOkr1V2Jy4zMeC3l6iOH0n4oJgmSfh5C0+7in/wFwwXgMc6L2e2vVloDvXUpKJnWjA
	FZfkRYsXKpAc3RsPRSjqTh3eN06DAywhD+aLNJ8s5A9Jo7sPFCg49xMcm/ao/+OrztgEDnpCEH2
	UeIWybqIXweCWr5zkMYJOsS2LNXxvA/XEgAyGlAj5aa09J+p/fBfRSIW1edvYWHMkgGCVwMnKw+
	e/NXQT+D2p76sBoPMkA3gOMlqGuBeKsgriKG5i20d7T9yuegeLMDzt/lprto6X8xZubPDohhJ5T
	AcDmUXs6P2ybgfxqcUT1ETAVRjg6uMhn+3o7KQ9qH/z8urDVl4YjAIdV40U727c00cKgBTIfLly
	5KlvRIo4kXvod+Z2cAf/0zDlLluT86LFGxOkUXadPU1XGok8GXWMainQ2k6dgoYQ==
X-Received: by 2002:a05:6102:5241:b0:5ff:f4ae:a154 with SMTP id ada2fe7eead31-609fe5841c7mr2019666137.1.1775840414849;
        Fri, 10 Apr 2026 10:00:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-954df205d99sm182278241.6.2026.04.10.10.00.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:00:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so3187731eec.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775840413; x=1776445213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4muxIAPUw94/gS1wtcjYpBOll/D/VUQFDQMiW/Xhw+g=;
        b=C+h9jQHcIhla4O9xoZGb/bacCWPs9f6CbmvhNKnqSR2aI0HKZ9sZCO3oPo+1mODA9X
         bCb0JADO8m+To+mhAovlpdNzBeZy6m9aLYSPpiwSyoE77hs82jSzeUi9i+/oQA9OquvZ
         dnJMg4rCFG/UYhF1BByN1IHKpOBRZ/aFz4sHE=
X-Forwarded-Encrypted: i=1; AJvYcCXeb7TRkFUB8z3F6dDJ82GqqbzZgcPSFoZTe4qaxgfrdyt58X0SgNg03ATdp7lz1f/Ju/YIBPDgbf2VKJDCy6wSGw==@vger.kernel.org
X-Received: by 2002:a05:7300:7313:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2d586699573mr2355093eec.3.1775840413439;
        Fri, 10 Apr 2026 10:00:13 -0700 (PDT)
X-Received: by 2002:a05:7300:7313:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2d586699573mr2355057eec.3.1775840412769;
        Fri, 10 Apr 2026 10:00:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69casm5961297eec.2.2026.04.10.10.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:00:10 -0700 (PDT)
Message-ID: <8ee8ce9f-cf85-44d4-8a8c-ea78bea6ec69@broadcom.com>
Date: Fri, 10 Apr 2026 10:00:08 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31162-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,broadcom.com:dkim,broadcom.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 693E63DAD4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 07:51, Russell King (Oracle) wrote:
> On Fri, Apr 10, 2026 at 03:29:01PM +0100, Biju wrote:
>> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>>
>> When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped, so
>> phy_init_hw(), which performs soft_reset and config_init, is not called
>> during resume.
>>
>> This is inconsistent with the non-mac_managed_pm path, where
>> mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on every
>> resume.
>>
>> To align both paths, add a phy_init_hw() call at the top of
>> __phy_resume(), before invoking the driver's resume callback. This
>> guarantees the PHY undergoes soft reset and re-initialization regardless
>> of whether PM is managed by the MAC or the MDIO bus.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> ---
>>   drivers/net/phy/phy_device.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
>> index 0edff47478c2..8255f4208d66 100644
>> --- a/drivers/net/phy/phy_device.c
>> +++ b/drivers/net/phy/phy_device.c
>> @@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
>>   	if (!phydrv || !phydrv->resume)
>>   		return 0;
>>   
>> +	ret = phy_init_hw(phydev);
>> +	if (ret)
>> +		return ret;
> 
> Do we want to do this even when phydrv->resume is NULL?

Seems to me we would want that, but this gets into the territory of 
potentially creating many soft-reset of the PHYs, something that I 
regret having introduced years ago.

> 
> Apart from that, looks fine to me - it seems some paths call
> phy_init_hw() can be called with or without phydev->lock held, and
> this one will call it with the lock held which seems to be okay.
> 

Agreed.
-- 
Florian


