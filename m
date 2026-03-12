Return-Path: <linux-renesas-soc+bounces-29308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AMQJ83ysmmLRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 18:07:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2742765DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 18:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67D8130090A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790693D9DB6;
	Thu, 12 Mar 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dbf8uhn1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1C3DC4B9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335235; cv=none; b=uGRz5OKOx0umttOT5YwCO1qjePei24+YgrngvDkho5S8PivvfggFxkmyUTQvYDobI5q4s2s3mqJrCDJ9VmQfrtkKb1q6BZraWoqSfBGzio8cFp5m0L30SSdTIYbUHEJIm4okiIeYB1fop6eUj2JLBFFFZn1591Dj8p5D2zhwPck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335235; c=relaxed/simple;
	bh=4YRmuyiZ3BSKrd+XqEKuYmpqHzSqvCpxgtwy4jvlN5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZAA51WUf5IXBR+gnT0YT/Nst4OzPD3G8/kHCfl4RzjViLi8qlV2qrO4J4yB10TkekfUWg9V9Gel8kfeBxOC8+94Wrm1lhNKw//FYknjVM0XsItgZhnFGawINWDqBSIwuBFs5n4XP6T0BCNbIJE5Xt3W2VPN0q3sy03dreIMeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dbf8uhn1; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-5ffc8987050so972120137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 10:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335226; x=1773940026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5d3U58A7EbRwEFn4KrmQ5cld9P0wudWqSFmPnXCnnU=;
        b=sw1fceqTd/Yqt9etq8LmCYngrr7ENK81HwHiupwz1uxAy3Pf162G5+jDFCGW+y54ak
         N/P+5natAX6yBH7P6Ut5c6wePidQUO57PN2X/C46rqZ3ZurKuMXZHCWJeMWanjE0iYLE
         cazGJKuknC+S04Iq1V/CIa5yID31PeHZMlJX7m700QVe70zXvvZd6qrm+Q2jcvHl/niB
         7oyrjrwfoL4UGiI/nU0Pa8aqlAVF0W5D+I/bVMJtaCLudpCa9SBbMTVUBqofkXdNMvDV
         K0sgzHx/njZfrpWvSA3lUf/vw5Y4tZVGm7Q2wRV712mYp31tylPxuXg6fznf738ZMTkv
         IFCg==
X-Forwarded-Encrypted: i=1; AJvYcCX/e8w7xXcTQfWEiq5XLAqCAILMBTo3G9MFmL9hXC7FjW6JgdsXJ4TsUzDIYS1YyqlgmgItHosEa+Io/UG7+Nbrhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCEVJILebC64jnahQ0d+pKN3VyMIxX3rIlB5jEL81u/oqGuDrN
	r1qThc7F85kkdlPEoPydAwJiWTOQ7S5XfMlKUcXmXCrsQRMkMI56FsAzwJlV76bGuzORFWEQ6Vh
	to+Lm/cmf850U0qvOV5zyCHaYwjZW9/AAGkITH7bGOY08qE1kt3olkHaAbq3fGD0ddQ3xdQkZiE
	qhrwTIVMjK7BrtviKWbL47Hd1ydgQ6oCPzMl342ffFIVQaGrd4rPW6zP+7QMxpGkWKC87RsnxYx
	LRqczPKRnv+5Bq1dhatGwraaWWDh1w=
X-Gm-Gg: ATEYQzwGKy/hJdHPYQLiHpeWz1cDl8Sc7fKe1nVQg5WW/bY3FWIlqdw8R+iai5JGZ3s
	Cegpi1ST0wya6tpmyFyhVolML1QaLUc9BkBKKi5CuG0cQO2aLFjcc4dELR2o7mny1AT/dan/jMx
	TplN+YWDqZTdQc0RbUmP/VjXmzKD+ARFCerjVNB1aCWwqnXNsS5Whwgz/vctKGOQy8u1xZY/Sbm
	dSSYHpXZJg3D9FFNRF3GP4ToUpwTwa9imOX5+EEZQNdYzaKPZlz5Dm1EpfZ3iLrXUFpyNG4oGw7
	geVjRzyLlH7z4ISy4ASQbz/PLB2huLe5ksIxE/PYK+W8LBFLVMKY6gA2gvR6Xs+ifwt9zrte8Ez
	Vzx8YZY6yF4mjNE5N0fobxevxYvVCWboCYe15RHgl5zUllO1bG2MTAzdxNbLNafd74X0CuCY8bN
	Tfl1LJP3sCdOvPdJNYIIDLpRkM8QCAbJoNR9uNUzvjaysp/xL+u9DD9WFgc0jLwvpx
X-Received: by 2002:a05:6102:d8b:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-6020e164a84mr127251137.6.1773335226037;
        Thu, 12 Mar 2026 10:07:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-94ecfe045d5sm588831241.5.2026.03.12.10.07.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2026 10:07:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f671ceb2so72433386d6.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773335225; x=1773940025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r5d3U58A7EbRwEFn4KrmQ5cld9P0wudWqSFmPnXCnnU=;
        b=dbf8uhn1yqQ9cdMkVTOAE5x6DS0V3qVbFtGeBaIFfAF1uxA90q8ppuGQKFwe260pH8
         lO8ZZkIGo+uTqKLHF0+TQj1XuR+cKVhhx5hQnOAU+A6F6rAJX+elQbo4KLScXDIWSAZn
         JYUk61QzieEOC5FKLTFOb9i8P2D4qAg9dhdO8=
X-Forwarded-Encrypted: i=1; AJvYcCWoc/1Qq0xe3pR+9B99yzmJVOXIFtsARA77xl6PvBIlVtF3N1eoHobN/9fRDa9mAdAQ8uJbJWbwzjWR5Oj/oAi2RA==@vger.kernel.org
X-Received: by 2002:a05:6214:29c8:b0:89a:116b:e674 with SMTP id 6a1803df08f44-89a81d5dfcemr7819516d6.20.1773335225364;
        Thu, 12 Mar 2026 10:07:05 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:89a:116b:e674 with SMTP id 6a1803df08f44-89a81d5dfcemr7818666d6.20.1773335224670;
        Thu, 12 Mar 2026 10:07:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d17023sm38864336d6.49.2026.03.12.10.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 10:07:04 -0700 (PDT)
Message-ID: <9040aef7-1981-44c8-a25b-2179b892d37e@broadcom.com>
Date: Thu, 12 Mar 2026 10:06:59 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] PCI: controller: Validate max-link-speed
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
 jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
 jim2101024@gmail.com
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312163652.113228-1-18255117159@163.com>
 <20260312163652.113228-5-18255117159@163.com>
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
In-Reply-To: <20260312163652.113228-5-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29308-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,kernel.org,gmail.com,google.com,broadcom.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D2742765DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 09:36, Hans Zhang wrote:
> Add validation for the "max-link-speed" DT property in three more
> drivers, using the pcie_get_link_speed() helper.
> 
> - brcmstb: If the value is missing or invalid, fall back to no
>    limitation (pcie->gen = 0).  Fix the previous incorrect logic.
> - mediatek-gen3: If the value is missing or invalid, use the maximum
>    speed supported by the controller.
> - rzg3s-host: If the value is missing or invalid, fall back to Gen2.
> 
> This ensures that all users of of_pci_get_max_link_speed() are ready
> for the removal of the central range check.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/pcie-brcmstb.c       | 5 +++--

For pcie-brcmstb.c:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


