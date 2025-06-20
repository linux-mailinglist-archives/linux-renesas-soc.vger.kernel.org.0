Return-Path: <linux-renesas-soc+bounces-18588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B5AE200A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 18:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CE314A604C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 16:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4457284B3B;
	Fri, 20 Jun 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DU/J5Ppt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DD21993BD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jun 2025 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750436761; cv=none; b=S8jhlW6Qa9ZqTdcYvUuxafUtdJo6YALSzeGG88Eu85th+88mi26duFVPGh0Hwo2EVIe20M0SY5uzApGENjVU4gE8l4GyK06EGo16klKTH/YZanwtCEzOxz04n9lq7mwdFtSSiLivi57RW3DuZ9ZK/Vy8Gv0DVq49mMksJeCKqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750436761; c=relaxed/simple;
	bh=2lpfuT+UJ73xh83VqKPWIoYBmbgIzKWaPVoLMY4rhrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq+oRrb4Cj5DmzXPdgW1+6ZuYCBY9/f7LGz450jelItet3EKd1bbzG/0QRl1zrpd8SUlk6JJKJdglJkfUK+pF+I1/vVx9SmwU6UGSZbscHtU+jT6K3PxPNNQUo3NTxTPVZ+jcBSxVa6uJlOWOhRmmCOcY2RvOgbqpzzZJu+oGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DU/J5Ppt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453636fa0ceso13043805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jun 2025 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750436758; x=1751041558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Alqg+WicKPYUIWXmnQXqsBN2VhHsKxxFP4ePyG0B/vk=;
        b=DU/J5PptjWdlJAqQaZD2jvC/tSBZrpcFT7r8u4oFD9vEx6UA+nZ9mVBAFRrZ20h+Bp
         O8PHKcThXHvlOqA4L8DydUqHeTTfd8qdVhFpZ9dR1a7pAJvyeD9SNfRD10xS5bRpuOLI
         WlKEE0x00EnGNzLZznjnumWgB30vM1eCm4ekg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750436758; x=1751041558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Alqg+WicKPYUIWXmnQXqsBN2VhHsKxxFP4ePyG0B/vk=;
        b=pmGtR/pwj2MeEbuw5xZ94WQBfX0iGfT3pHfI4s8V7KvOK8+gfDcoc1DHlOPmpq1iXu
         u/FGqGzhszIWnTEW92UfNfG1/sNB56QSXD0msiNIaJEwsNICvF+T5ovwaN7+ippUQR6T
         ppiMYm7h+jaaQtn1Ncl8w7Vqp3AdQ+bfkNNEJ+2GPitchvVNJuHWrEfinz6neQdbNoGU
         Vrbg1JHxTUOlY/DpAHyQvLCQ/CgbmhUIIjOSdlngMUIEUY91GpMckAFf8cIW9otQ3eTt
         iLol/LupFNYVm78WHECVOoT7vS+s8yKYAEK6UZFzYIbAqfr/hNI/qhcqbhhrbFaxlA1B
         6a5g==
X-Forwarded-Encrypted: i=1; AJvYcCX0Q5+dYKoHERwAs5jNPE8B8VpCc5RcwgRBmxN3GrWhdriGNNQJOF39H+HkRJn8itI/ui9Zy2lZDjmxUOTGWUXyeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qD2SXP8CUKOIDHJAZs0SJKZJzA8J+1D+FYsEumQy7sCpjplZ
	toUc68J18WzrdXjarHquHUTnyfM2RSTo2v+1qJpyifTepSo1pn6RjagDwTB8oZKPow==
X-Gm-Gg: ASbGncu+Zprkgz9kVW8ElsPpNvx7/7YI9nHVoCtjv7MdCRSTJvYGgQagihdLnsnrdbf
	brjMKGD1KbZzjHA/Ou+MaL1e8+4FDnhTQa3R+p4F+ayeGEbOaTm2JpAlkELKiSCgvWtv8xjA/vv
	qFXSABjTlJm2eQnlk3xn9WJkALKI0mfeHVa/DGLGGiLshWCx9YASp/sxp3iOCmxR5FwOzbXQSlb
	D03CMZcqlxJjut0/JTfK3Cl/ciap8iL3O3VqtyoNiNnnuI89d3lhsYBN2IG6+Y7FkEkLfmz1Chk
	nwirK/TbSHsbSqcU8r7b4Svrq4+T/iQcGnYL/TQHBDOwzY/jyfizGC/wKweMUiTEBrKSGNB5F2c
	evnI0fayLU4b2AoZHOoiBvbv9EBJUVh3fnPXi
X-Google-Smtp-Source: AGHT+IGRwKx0AynK+ibMBUFo43qWTcsiEdtRRQuC50E0G+K6arFeZxJbV27lEJE+xU2l8nMbP/C7jw==
X-Received: by 2002:a05:600c:4f8a:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-453659f5049mr31054025e9.33.1750436758174;
        Fri, 20 Jun 2025 09:25:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8bb6sm64450535e9.25.2025.06.20.09.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:25:57 -0700 (PDT)
Message-ID: <e683862b-3eb2-4783-aa4e-c457b7113b7d@broadcom.com>
Date: Fri, 20 Jun 2025 09:25:46 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next RFC] net: Throw ASSERT_RTNL into phy_detach
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Einon <mark.einon@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Michael Chan <michael.chan@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jijie Shao <shaojijie@huawei.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Imre Kaloz <kaloz@openwrt.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250620143341.2158655-1-kory.maincent@bootlin.com>
 <aFV2h4w3MLtjyfPb@shell.armlinux.org.uk>
Content-Language: en-US
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
In-Reply-To: <aFV2h4w3MLtjyfPb@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/25 07:56, Russell King (Oracle) wrote:
> On Fri, Jun 20, 2025 at 04:33:27PM +0200, Kory Maincent wrote:
>> phy_detach needs the rtnl lock to be held. It should have been added before
>> to avoid this massive change among lots of net drivers but there was no
>> clear evidence of such needs at that time. This imply a lock change in
>> this API. Add phy_detach_rtnl, phy_diconnect_rtnl, phylink_connect_phy_rtnl
>> and phylink_fwnode_phy_connect_rtnl helpers to take the lock before calling
>> their respective function.
> 
> Please don't increase the number of API functions for phylink for the
> long term. I'd prefer all callers of the phylink phy_connect functions
> be updated to hold the RTNL, just like phylink_disconnect() requires.
> 

Yes, I completely agree, this should also make for a smaller patch set 
to review.
-- 
Florian

