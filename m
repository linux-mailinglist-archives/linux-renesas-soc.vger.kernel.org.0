Return-Path: <linux-renesas-soc+bounces-28077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO7UJ3LoiWmdDwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:00:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC410FF95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6C293035D42
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 13:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87B379998;
	Mon,  9 Feb 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYZeRuy3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198437997E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645470; cv=none; b=nZFT/AepShGtuXJuH4WI7iaRUl4rvZVHB05OiPNXazRbV7ciBwUT4v6l7LZjuuv5/dFL9u7fbN1wMOfqEmbYYuGCjzBQjQJO8ivWhA4X/u/VJbn0iytMZL9mmvjujvc0w8CQpBddNqjPpWua4cVEyBfjbvCiIKP3qa9QPtp0Rm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645470; c=relaxed/simple;
	bh=/9aq1p8UbEf2VUn1zwT4iVhjwpc7m1ndmxfHYDI2bFo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mmy3aXDrB9vq4ls7/J7wgORi/JZGHfxLAtxw7rVMLGKUc4j7cBwIA8BzoVW/an1rUhQoFVshDiFCXKJAKZxhBDAZvMg6N1FnuIdvUUbEg27RbaqAswDQX4P1qzzlAmHYi2t99OfbOmpZv1/47q9Iq3GC9/J9ImsUI16ZleED688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYZeRuy3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4377174e1ebso578885f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770645469; x=1771250269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aD232HJcM07JIzXMrc+K1B/ldfdtVNWLSvSBE7P0itI=;
        b=GYZeRuy3bs3956BZYcWWInLwX37zsf0NTTT9fCnk4qS1sra7/MLdKaLsj4QrhKU7d5
         D/BRTAaN3lJFkJmk2kg54OZnDrknvounQsMpBaGusJNtcX22yvTxrX1QjFrUbV67WqdH
         uVBOiQJ7sDxXq3NKD+VH1UvY6XrxsaWHfa2aLRd6EQIzAI10Yf2M6sAI2LwyMabxS0Pc
         KHNh6/84Hln5LHgVCj5NrjKVcedQpa6tLL28kEfngjNaH2lW2gyqUA12gcLnPf+DIiyM
         2fIoEg+b1W0zZrkYGPfOGi1RUmKP0sEnNglNsolHmvEfCfULz/tMw8ClC7pyHIgsBtFd
         RQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645469; x=1771250269;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD232HJcM07JIzXMrc+K1B/ldfdtVNWLSvSBE7P0itI=;
        b=SX1uDacmo/Je1cZSewXVjQjXyb4yoPjT2ydXVplu34QziIPMLinj54Ir3CJuKMTLgG
         lZLMrgo7vfn1rsQELdX+5TRjB0u2/eibRNBqGXUN5+mrVJqmOVi+21quzp+XKZ5LTzHy
         svTgpasWoFWGoq29KHbvCx/lLx2yk7Iukye9bfTMEszn1gbUCBuZtBlKsuofzjkV1l4a
         ObvxxncVcsWAUFmssa4wUcfsDhR5j4VU1vpZUfgs2kvOD31Y8oQAZk916Un1No9mMt0l
         PgzIFjqB43b+nVDVOvgjFVAY9cab+q+RWc/9nL4xNKvI7SjCY037Ak2ldm5in3aamCcu
         kK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKsLvWuN+V4h2uIwQH7Y/fGBqe/Eu88vqKY+KJFSDMUn1+a3fBb5D4NXTvqtTWVfXIwUS9LCOavqE5HzUzYWthUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHLPtqm2cZ1PFitJkV97muYBZ9WKepRLjerUJC0Y7ry5XDQYKl
	zjPz1hz/ZCaFdYiKS20FNmZcW1nSt8MDFPlqOot9U4EsqthvLqbj2xbo9PeZY3XMiWs=
X-Gm-Gg: AZuq6aLHre24OufvT8bsf4ieZHMMiUGg02U/IoDCpeNw+OFNdAeHxR3x4X1ISh6O7Z5
	tpoOdSvO83mmShZvFw1tuWF9B3/bw37KRc4+QgR2bMoNx339N70FYfcn/F7SxaEUb1RX3JPZWZw
	r4oa151hkmPkikc3JsXZyWYGrFe3IMQeyms/x7RMttFTsvR1NokC1uT1lRrL0AYNzkItRQrik5u
	Rz9RNDpU0vu2k2c4FKdvCAkrwzB1y0OP2keC/i8UzsgGdFz4RNTSdO/GAodnnw5y3MImlrfpwtS
	kXAvwDorJyma3Gna5KIKpaEJH4100yPAJoQX2hM5ce8Rp2UP+Pl+UqGbXWXN0sdXjHvW+stdi9J
	QGg2/9eduQiYWsiwCpKq8Rjz9dFvE/xQEcs+YPbGbKa+sdih+pT93gGXL7xvuF/ZmE6kgESjKgf
	uAXDqqz8dRLjxfqKgDA3CB/mLXl5Lh670RZ93LrQ+pU3ZWC9wQohAgd8FdHjjVHI4=
X-Received: by 2002:a05:6000:1ac7:b0:437:70d3:44ec with SMTP id ffacd0b85a97d-43770d346bfmr3864732f8f.43.1770645468533;
        Mon, 09 Feb 2026 05:57:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:44e3:9198:bd5d:a3f? ([2a01:e0a:106d:1080:44e3:9198:bd5d:a3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm10077384f8f.14.2026.02.09.05.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 05:57:48 -0800 (PST)
Message-ID: <fd446018-3006-4c59-bc92-ae3929b8d402@linaro.org>
Date: Mon, 9 Feb 2026 14:57:47 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-3-5b79c5d61a03@linaro.org>
 <ygvljxho4dh4zlkxcropjdczbyh45sexntosz2rvxdsxigmgmi@aeqhi4qit5ct>
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
In-Reply-To: <ygvljxho4dh4zlkxcropjdczbyh45sexntosz2rvxdsxigmgmi@aeqhi4qit5ct>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28077-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 09BC410FF95
X-Rspamd-Action: no action

On 2/9/26 12:33, Manivannan Sadhasivam wrote:
> On Fri, Feb 06, 2026 at 03:50:31PM +0100, Neil Armstrong wrote:
>> The driver is pretty generic and would fit for either
>> PCI Slots or PCI devices connected to PCI ports, so rename
>> the driver and module as pci-pwrctrl-generic.
>>
>> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/Kconfig               | 8 ++++----
>>   drivers/pci/pwrctrl/Makefile              | 4 ++--
>>   drivers/pci/pwrctrl/{slot.c => generic.c} | 0
> 
> I was expecting the rename inside the driver too :)

Oh yeah, will do in v4

Neil

> 
> - Mani
> 
>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
>> index e0f999f299bb..0a93ac4cd11b 100644
>> --- a/drivers/pci/pwrctrl/Kconfig
>> +++ b/drivers/pci/pwrctrl/Kconfig
>> @@ -11,12 +11,12 @@ config PCI_PWRCTRL_PWRSEQ
>>   	select POWER_SEQUENCING
>>   	select PCI_PWRCTRL
>>   
>> -config PCI_PWRCTRL_SLOT
>> -	tristate "PCI Power Control driver for PCI slots"
>> +config PCI_PWRCTRL_GENERIC
>> +	tristate "Generic PCI Power Control driver for PCI slots"
>>   	select PCI_PWRCTRL
>>   	help
>> -	  Say Y here to enable the PCI Power Control driver to control the power
>> -	  state of PCI slots.
>> +	  Say Y here to enable the generic PCI Power Control driver to control
>> +	  the power state of PCI slots.
>>   
>>   	  This is a generic driver that controls the power state of different
>>   	  PCI slots. The voltage regulators powering the rails of the PCI slots
>> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
>> index 13b02282106c..f6bb4fb9a410 100644
>> --- a/drivers/pci/pwrctrl/Makefile
>> +++ b/drivers/pci/pwrctrl/Makefile
>> @@ -5,7 +5,7 @@ pci-pwrctrl-core-y			:= core.o
>>   
>>   obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>>   
>> -obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>> -pci-pwrctrl-slot-y			:= slot.o
>> +obj-$(CONFIG_PCI_PWRCTRL_GENERIC)	+= pci-pwrctrl-generic.o
>> +pci-pwrctrl-generic-y			:= generic.o
>>   
>>   obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
>> diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/generic.c
>> similarity index 100%
>> rename from drivers/pci/pwrctrl/slot.c
>> rename to drivers/pci/pwrctrl/generic.c
>>
>> -- 
>> 2.34.1
>>
> 


