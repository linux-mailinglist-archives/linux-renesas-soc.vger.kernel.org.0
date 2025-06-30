Return-Path: <linux-renesas-soc+bounces-18931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD40AEE760
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 21:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4277C3B49FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 19:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB9521D3D2;
	Mon, 30 Jun 2025 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OkkpI3dZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17441A3178
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311146; cv=none; b=JeIbZERboJsSTDIb/POFty+fe96WtEzZK8/25AqprzHVt/jR8NZovaQMNeO5Lz8DIjkFrc3OCG1P4M/Fvn3VOP/fikWS4AboCwmwwDiqgS8trCh3MSzRj8+F2+d8M6xlBM0W5QoBNoIZXcSz4JLIQO9QZrYpeD/KBF3gGUV4V7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311146; c=relaxed/simple;
	bh=lgRqjNK57P/pT7MRMMd5GG7KE5rQwAii6UcuUqlhc6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t2xAHRKoHNVupMPmwz18PS6v1scpBYbhGvhdg4KeJ/sUzAHT0scE98KVk1qUBbKNFlDtfzqtQ2kTol+u45Id6tNII8pTyXXXK5DEwLT9kt72JNIb3mADEBGc+m4ihf5uGTECxxS0rOHfC9CxZJBM1/iFAnoqmBp2+spImcs3Cls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OkkpI3dZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363616a1a6so19452795ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751311144; x=1751915944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=OkkpI3dZ7fIj8eMhXHcSr7r30sJEzwHhWJe+SChpH3n4FQmKlQA+hT4k+c/CtRZ6w+
         kW1XvVfUhyzH7BNGrc3/PsAD45CpRrMHhWb9/cieZ1NMyV5MjDhyqR7tS6zzb99wiE7B
         1LEF36GSZcrmf/HBWXaAz1FrAK67R1FWESL3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311144; x=1751915944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/icnc7Os7AoQTpBWqs6e62GRa9dnHnzsYDszjaelMPM=;
        b=py7E5Ueq+FIFnb84bz/qZgQVTh1pTmktSk9Ho5dsNSBrCqEzvAu2/1Y4E0zrjx/eXE
         YddFwinc2QH+CgfoFjE0j8nYFM50CPSq3HB0jO9scKf7selFEqRnXevYr4ZxNa74yzin
         frCo3fVm4aHt8Bl5QllZHBPURHgH2jD3ad6qcuveHQgRbaVK7tREwlsPoh34FSE+bnJa
         /Oq+0GkufXJJEy/LjkZqULIvR2Mi2btMlUf/gmlJjMcoMnhCXub9YEjmZFYAInvDSOLr
         9oVX8HTVbmxS9Ej6pwpt9YiNd8nhKqGX/saedc0JSo604Vbh5PIJ9fu1Nqp9YYmdobhK
         SGpA==
X-Forwarded-Encrypted: i=1; AJvYcCXhZiwSzZl0ztyHXTuk29mLfbdbBNYXiecqWU7v3NcbJ+OXfVndMakwPuhjlYBQ7NLv2+iOeS3g9aH3FfOAca6rZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxELaj+akDeAmM+9ExWkx1FmUoK58nqvHT2nEwkDmEoo+BynR9K
	XYkq05UxK5KY0pIB8Jsri7f7BvIWAWp1XabgZDifUMMPPJtmLaXb5bQgqsXlr2sLHw==
X-Gm-Gg: ASbGncucht6latt2PUuWKc+oSoclOszBHwtPyjqO2ZwDOcF7UBULIqgSLFE7VV3m1P4
	1BfYcB7o9aTsbmpHhEh5/FPgV2g1mUmsg8WD843KKV897rLDaxqObP4nmqwMtnL/jDDXMjSvGNC
	e9p+rpPp5iCvYbYh8xaRyXruhUd6CXppDR8qYACaWehVaqIEexk2bJkB1F9O1fqDAcJn31aPh5u
	actV3u8GXUgCnwzSgYgMbu7trE9H5QBbQI2ZI7S9aqTpR7bbfCxJaA4RTmHZiNW/HgX+pg0G9hV
	bFkm/p92CYBdDKMUgTah7GE17g6LWirZiATXkyNyF+lhL5CmJwQ9KJqs/gfEvqroPGxMdYNM0a+
	RV4hZvBYt2Op940ueAo8QaQUL8Cko50zguW/m
X-Google-Smtp-Source: AGHT+IFZnVdK/8KnlCpcZUuxcIX1OYaBApEmqJrKlgZkJd+1bclQzdezQi5V42KblzuYrOOq+GiIDw==
X-Received: by 2002:a17:903:1a4e:b0:234:9cdd:ffd5 with SMTP id d9443c01a7336-23ac463472dmr213859515ad.25.1751311144113;
        Mon, 30 Jun 2025 12:19:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2569sm90757255ad.64.2025.06.30.12.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:19:03 -0700 (PDT)
Message-ID: <722214e6-db5f-4ad3-bee4-f58d3fa3c21e@broadcom.com>
Date: Mon, 30 Jun 2025 12:18:59 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] PCI: brcmstb: Switch to
 msi_create_parent_irq_domain()
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1750858083.git.namcao@linutronix.de>
 <fa72703e06c2ee2c7554082c7152913eb0dd294f.1750858083.git.namcao@linutronix.de>
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
In-Reply-To: <fa72703e06c2ee2c7554082c7152913eb0dd294f.1750858083.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 07:47, Nam Cao wrote:
> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

