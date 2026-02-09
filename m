Return-Path: <linux-renesas-soc+bounces-28078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGMdE2joiWmdDwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:00:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FC10FF70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 293D430182A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9513783D3;
	Mon,  9 Feb 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkEFcOVd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B55296BD3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645605; cv=none; b=C33AbFXTsutcsIbgsRo+MoyXE3WrlN1346C9TQGpdU0NNRodr1RXuy3kEJMgekAdOuDEQsVeISMaQXN1z2mGIMqeLuGs1yxbYu28hsIcOk/t8HxQfHvNIC2iwed9ftwHFBTvfPlmUsH7VgaIa2Latch2Td60+rjAeVnDCXSFfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645605; c=relaxed/simple;
	bh=Nuf5oBBoMZpdgayRTi4P5FfCTv1xvNMcXtfo4vkmMVc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oXBrXjYt3ICzD0t5/UgiA885U54l1MWmsXL6TuAYNyJaDXMI3gJ4cpDcdDYua8nUEjdUAelEQcmLDDqaqiJP9ARIViVxjg/lQkyD8SvGb+zGkLG7BzVqMoAhpc11kgE+xLTbSBJzglmZftgg938rRfjhUEkfv3vozCGvbf8bZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkEFcOVd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43622089851so3641203f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770645604; x=1771250404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbQMmk1MO4QOzPI1aGplcQy9lMA7g33jZd4vEeQtoGs=;
        b=UkEFcOVd+/83yFqYq/bO+yFXF64O66u5xAL/THL1zfEZ0WDVJrxG1+Mvwe3+ttPPrR
         iWVvb0Sl6X0k9bBMhLLbKsPinSkxq2Pz9/iKYlrPgght6dvpVc28JjgxzBfmrcs0yRoE
         knpHpV4FjcbpFsDWrheC7OQeeX5TBxRIl5PKRqz9hoMXi0/5wDxCdEh9qah+XoyzAko+
         QAQXlh5gmD9o9TdGT0BoMe0NGudbbGJQ9VjK/yJ0YsRt+2maHO+cOj3k29aPTH9nlzD8
         rZNyvWXpAUCQbcxjpflg6kGkMOs0042G522gw99UZQOkXCFipKwsA+VDA0Ll5elJnpEz
         /zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645604; x=1771250404;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbQMmk1MO4QOzPI1aGplcQy9lMA7g33jZd4vEeQtoGs=;
        b=tcOC7vbsBqbH3pzOynYflkJQ7hxWJxzZQLHXoJqfUAZqO4Q9OiDQDK/HiKiDW4d+8D
         KmHyZh+LUks5DtYLK7Jt3bohjAEI6i27HHJhzNXQoXPOlEyLh+PKWysm6BZCUV6bvepS
         Bm209cEzFPROh6qcqZzA/y5DCrM2YTyuXWKTCuP6apdWvULqC9+0ildGvbqs4hI+ych3
         x38pq+CVzkkzCE5ribpXeqq+rAgQSQpgx51FcXnsl9c/eg37yOkV/+xeLOeU10E314EK
         6EZk2lfrOuwV7I3Qno6JavVrJF2hQoqg7L229gpB7KaG/8tTI4bSRViXnxn3IVqpoWac
         +T1w==
X-Forwarded-Encrypted: i=1; AJvYcCUDjfTpf866caP+7DvELT4OmfjGXto2oaNcujiAaCdJBbfsGW6bwXz08vasnBoxADyV77vH24MGEC+48nj68l92Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi5usgP0IlaZK/PJ7AinL1XA9OfnxA5jjvF1Zh+5WGWSPSN6vl
	MecnhibW7920qkZ2iwKXe/i8vicIf5Ujh0alPdcDKmICEeS2dnEhwJT6l+EUYMsLNyY=
X-Gm-Gg: AZuq6aL8Xk31r4n+2EmBxpr3PZZ3Xe0C9IJ/0hYzxgpj9HcCOi5xdjewd//YTo9NLjX
	wkTFa70uoklMdHEIGAxtdbX1ldx+xE8do8fFKIvRaaimVBGwjklCyH/ioEAhSACVm5UKg0XUpJG
	aQuCwxcjE+AmRb6ov6nTf2+fyWunVZxTv6yXyaDKAz8QRc9bRfwMCLsQnG1+TlV9hK85Lk4V/a6
	ioHPcBpfqUwDuvlXhOCfhJeQapbkd/RW5UyanpXcc5R3s4NsPhnMkNWH0Ss+p9MVwHGO/6hoyXp
	pP/4X0OAKwbdBViz/DydCyR1p+E5xsC8/H0n7ID3EMXa7C6R204UGg0nQ2Iv2B9CmnoT6lukPUw
	bQyPC8+59IKAEoj38IjEJ8O73rFayPCHX0sBoYWvbGbIEM8BZuZJ7T4Fi1P61HOk+JyoKg35o7t
	AhkOcbi9NW9p2JzE6uALNTAOtVakOgzdB2dp5xM/1nmufcHDuKYbzqfSHTjvsZa2k=
X-Received: by 2002:a05:6000:24c1:b0:437:712a:fab5 with SMTP id ffacd0b85a97d-437712b0c7emr3989897f8f.35.1770645603442;
        Mon, 09 Feb 2026 06:00:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:44e3:9198:bd5d:a3f? ([2a01:e0a:106d:1080:44e3:9198:bd5d:a3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297462a8sm25096267f8f.30.2026.02.09.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 06:00:02 -0800 (PST)
Message-ID: <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
Date: Mon, 9 Feb 2026 15:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
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
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
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
In-Reply-To: <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28078-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: BB6FC10FF70
X-Rspamd-Action: no action

On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
>> Enable the generic pwrctrl driver to control the power of the
>> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/generic.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
>> index 08e53243cdbd..4a57a631362f 100644
>> --- a/drivers/pci/pwrctrl/generic.c
>> +++ b/drivers/pci/pwrctrl/generic.c
>> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
>>   	{
>>   		.compatible = "pciclass,0604",
>>   	},
>> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
>> +	{
>> +		.compatible = "pci1912,0014",
> 
> No need to add the compatible to the driver. Just use the existing compatible as
> fallback in the binding/dts.

???

Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
compatible as a pciclass,0604 slot.

Technically it would work just fine, but "compatibility" has a meaning....

Neil

> 
> - Mani
> 


