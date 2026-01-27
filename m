Return-Path: <linux-renesas-soc+bounces-27495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHWNC/YzeWmlvwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 22:53:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E39AD72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 22:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 277EC300B1B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 21:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC0C331A7E;
	Tue, 27 Jan 2026 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymLLB1PZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D1331221
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550835; cv=none; b=my8jZzGauAHL8ZIM/QkYscNYbdZnolUWegh2L11SOnSIuOcnLMb2pjoV+ycaVd7LGJZeGNMinB8fS/aDb94wDMfSXtIfMqFcZlhFS++SbQDdDdx+HY23DqPQ/I5kQJWAq+vTz7jxlcXpyX31hXCleCDF/Ej3hQquahTu2mOnSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550835; c=relaxed/simple;
	bh=0dVm4VUbznq0Tn+3bAgXEVSu5pdNdqlLlwfbGeK3pRc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fHGtZoRzv/bj737WX9nGCfrDVd3YvDmUv+2/PJf8kEqlo0N3CbRVB1zE8pQKF7RU6BCNGScvOHiuGS927eezzuGTWlXv0uR8J0Zj3rHHYUCNUBSG9knQ0rovoxh6p6x02DCS1vbrcrOxHIKDT8rSiYg6/QmpccEnnATU9dn5DMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymLLB1PZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso1073145e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769550832; x=1770155632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
        b=ymLLB1PZHVZMhBAdRPW4Cp9u6XhS8NQt+auxfDUk+cpL3v2nfZuSB5kmTmCaa7An9f
         8AcoYLGy9pw1ERSFWqw6CypNjR+XmUytE9+kyulZKl7x2CK2cNqMjo1qZnZlryShH/c4
         NxdxUZjlqbdcb5FRpwkWQ53KNx5rOJeV+369Kl5MwA3lEkBWuKK3ZvtQmuqrSQwXSvhu
         HjryP0q3Y7Jw8eHmlxGpX79VNxczrNuOyxSlgiqV3OQtGcXjLGI7EyFlfkiB4n4NbE2n
         ziAb6XVB3PGaz9eeZEeoCbpnEHxL6Mv3KoHV6rF2jcQeCKwbxNYJgYrncQ9fGHbigBot
         UdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550832; x=1770155632;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
        b=WMha4qpWOO4O2KTlY43F3sH+zUpxWa/KxByeSozXHzBhTfcgsQUg4a02kJwXijFLud
         ThOIOHNUQSsGcXuDkBV8xmhYPUG9E7jaDaMch/Z1c3UPh8F+sReuHX4kq0i4spj8plWF
         H8RIgn8ILU5vOSDwChazSgIffCtdqib/+L5Qqaf/EX2Bcc2Tkz2k+XyTVRgZP8RJ+d84
         6rBWjfjYwGvhZy4U16HhQDu5tXIhZ3gPHwcMsdN/4Sdh6Z8KWH2ofnnBEOn8r3h5T+03
         NEOva1HNBrOWfXRlabXOGNw1BJMhrTwa3vVUPY7mkFD/wrTGuYk9kP+RPpZeMBDQ9Jmk
         122g==
X-Forwarded-Encrypted: i=1; AJvYcCXTCX381fluJpTb9Qu9yuuDcaKV7dNH1X1fUQystKSt4YZ3JAWoKROUY9XsYsweGcm2XYylR9fZiAsNqvHl7qpCoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Jn2l1IuWfmtz29QSaQGbpQaHmxahK4aIPRz6HXY2WNkdwYix
	p9Xa5N2r91wiKQYjf3IifQ0863AEBQ06Z9E6TdurZtCQjqR+q8t2SjOl9QvMSEiAfNg=
X-Gm-Gg: AZuq6aIBiuLJjfwjux0rT5rmnQuNENU7hOlG/vdkzeL43ic8MJuPOdoBEGgE2v4dOF1
	C5lx+aEo6WBIU26LlfErkHLYwNWcMxG0jNXkrwvyq4DtW13RQCwRGJyuBBxttMD8cJKwrLbYWtl
	UAxmUrJ1GDrmTYPz6jUtSVkhNb4Hl/Y4SX5FaLqIIYD3cEU2EDTocexKnmg6r3oIX97VgbM3Mnd
	VY4hox2cv5G4kuXBsziWFHLsdNZh8IivVN4vDTzwkUVbUk+FUEclOXg8UIUNcxS0i07CY8H6tYW
	plQGJMX3TlQo1KDunzTh8pcoHOSzQT4XLvo9TOKrdiiBr5q91H9T/pj32DEy35WJltYaLKe5qNW
	U20q/814EniTo7ak7Vnx5e6ryNfgzsCKv8Y7PojzhW6BGd7HoPbdLj99JYXDApzSOhSzBmR2CSS
	HHNlvHdMKHed4DsT+Bjztx2jz0wFYQoeV+KQjh2YTvVvRLFeehsJid0BfFHDulsYvQSihR7CHnO
	w==
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-48069c161d3mr43220935e9.15.1769550831789;
        Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68? ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm1918002f8f.41.2026.01.27.13.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Message-ID: <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
Date: Tue, 27 Jan 2026 22:53:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27495-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: BB0E39AD72
X-Rspamd-Action: no action

On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>> power control which connects over PCIe and requires specific power supplies
>> to start up.
>>
> 
> This driver only handles the supplies. So why can't you use the existing
> pwrctrl-slot driver as a fallback?

It would fit with no change, but the name "slot" doesn't match the goal here,
it's not a slot at all, it's an actual pcie IC.

Neil

> 
> - Mani
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>>   drivers/pci/pwrctrl/Makefile                |  2 +
>>   drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
>>   3 files changed, 100 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
>> index e0f999f299bb..5a94e60d0d3e 100644
>> --- a/drivers/pci/pwrctrl/Kconfig
>> +++ b/drivers/pci/pwrctrl/Kconfig
>> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>>   	select POWER_SEQUENCING
>>   	select PCI_PWRCTRL
>>   
>> +config PCI_PWRCTRL_UPD720201
>> +	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
>> +	select PCI_PWRCTRL
>> +	help
>> +	  Say Y here to enable the PCI Power Control driver of the UPD720201
>> +	  USB3 Host Controller.
>> +
>> +	  The voltage regulators powering the rails of the PCI slots
>> +	  are expected to be defined in the devicetree node of the PCI device.
>> +
>>   config PCI_PWRCTRL_SLOT
>>   	tristate "PCI Power Control driver for PCI slots"
>>   	select PCI_PWRCTRL
>> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
>> index 13b02282106c..a99f85de8a3d 100644
>> --- a/drivers/pci/pwrctrl/Makefile
>> +++ b/drivers/pci/pwrctrl/Makefile
>> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
>>   
>>   obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>>   
>> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
>> +
>>   obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>>   pci-pwrctrl-slot-y			:= slot.o
>>   
>> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> new file mode 100644
>> index 000000000000..db96bbb69c21
>> --- /dev/null
>> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Based on upd720201.c:
>> + * Copyright (C) 2024 Linaro Ltd.
>> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/pci-pwrctrl.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +
>> +struct pci_pwrctrl_upd720201_data {
>> +	struct pci_pwrctrl ctx;
>> +	struct regulator_bulk_data *supplies;
>> +	int num_supplies;
>> +};
>> +
>> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201 = data;
>> +
>> +	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
>> +	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +}
>> +
>> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
>> +	if (!upd720201)
>> +		return -ENOMEM;
>> +
>> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>> +					&upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	upd720201->num_supplies = ret;
>> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
>> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
>> +				       upd720201);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pci_pwrctrl_init(&upd720201->ctx, dev);
>> +
>> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
>> +	{
>> +		.compatible = "pci1912,0014",
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
>> +
>> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
>> +	.driver = {
>> +		.name = "pci-pwrctrl-upd720201",
>> +		.of_match_table = pci_pwrctrl_upd720201_of_match,
>> +	},
>> +	.probe = pci_pwrctrl_upd720201_probe,
>> +};
>> +module_platform_driver(pci_pwrctrl_upd720201_driver);
>> +
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 


