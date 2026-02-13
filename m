Return-Path: <linux-renesas-soc+bounces-28178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHiPLEzgjmluFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 09:26:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954D13402A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 09:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC8313042445
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 08:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E9F326957;
	Fri, 13 Feb 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8oDjtp3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB29325704
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971157; cv=none; b=P0AGvfMB0EtG1jZGnBHIGkzhusXGKt/p/+cY5Zr/qj7Cw/n8HEDHnS7X+NKXacDHdKpJGbEtwMFkK6N1Q93voUMWmcF2eT8FYt7BW2j8vIcxyZgyd7NzaCr9uOG65cH8odEwlMg47dEHzTODoZvjLwl+YGwb9lgYxGJm6oDOiD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971157; c=relaxed/simple;
	bh=MmVc0VjdOTh1ZfOCYiVVtnjpAPsxgxmPLfAfCnZ99Ik=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RyKf7vC0Ym0/MnhsIZIcJv+LR3PuxzPXB67Qyrb6BkjjWKTiYjBRM/mZx6RBjLeJKfPt4jPXyjPqHG1x/wi4d1aEVqHg3P6ICVNapNozyw0VForVtbAJmgWsIyJr4764nfN1gP9BXnigEGyiMv5JHj+e+7ZNHZcL5eAsT44zPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8oDjtp3; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso5209065e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770971154; x=1771575954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy/I8SvLYv4ED/G6oTOiy6DorVU8/h1iqYBJACsgklw=;
        b=W8oDjtp35qb9aX2cbSEoqUvr3uYvPeggLGQU+lEtgHbLQ4EoKgSgnkDodDNX/PXRR6
         zR/a4R6KsE2h/QYHEs8+2ebIh7LTQgMfQmIk6WzF+3GpVbQ9YiPm8k7gums7NaXMkb0i
         3DtvEdGGOzMV7tozigMeE2O+HFXvOcoONTQ3L47nMtAQ6yzOysOUi4V8rLLBADT1cB/y
         5pmXt+e9bZJiDxsP8pebXwXSX2ICg//ZA4snQAldtVNaqFcodgetxXxN+JoYZSuIwk9c
         urwkGxc7PRV+6D5ujC0ejsgtMpAwwhBFJbx3i/uBm15PGGSfu0UAp0GpHIvzY/nSgikg
         FHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971154; x=1771575954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy/I8SvLYv4ED/G6oTOiy6DorVU8/h1iqYBJACsgklw=;
        b=rLpiX5tIu9Slu59tcd3MnkCyKFLU0CpVqF9t181oPMyPZudowzv8S4N76HGcT20xje
         +WjUWjPm+HGzxYJ85OCe7SeV9vBaEpb2PgmQGadVvY2Jlt94SqKlzkALiC6rhAqLcO/q
         uzEe+vt2nH3GZgXNB+Q8ZQlCpvAqUh3S5EMTHcjdshOSv/kye71pQWE+BjU8Lbr3Qmoq
         fpGmclOaCkx2wxIt6/qR9gA8plmohm7HTOcpxmQYL7kafedSgfDne9xX17Pho/RnDRUq
         OpT85i5LxGA/pffdD6nu4P6/G190cxRBadCC8p0y/0UzQ3PSSUdbVgNpm4dX+J5JzA8Z
         9z4g==
X-Forwarded-Encrypted: i=1; AJvYcCVnblTfYKApDKPOpeTf/G+JLOG6cRrIXOtXaOAqihPCvko2FqZTU3IXZQjcYSpvYGK8HSSGpKL5+gXaQ5d4g8z3fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kVAe/xlwK3D5ks4UtSmVEmA+QCAp+ZQiXDPO5DN0XLYgv2uC
	IeRpl4FkmKjQA76tMhD59Qu9lewfx+clTfX/jME6uWbVA7gdRKQKomo1+yysWnjfX6k=
X-Gm-Gg: AZuq6aLR6BwA6s35MVCCcq8HjEnNoIVrnB3IfwQUvx7FEMyd7x/ram+oRp5bcmq+cGq
	gj3H1nWU3xV8Sb3meNKy9caT83DLiYbJQgNt68f1KOoE4e0Hjwn7Yw8SBCUg/Icc5aCa0mJ1Kne
	8VU6fX5t0FF23aiJIyxun1I8Epb531EB5eZytL9Dz/z1KSV3BDJgYrFWSEsKODIKq6NvV+/YylK
	GMZfUqrwxz6uX31XHEe7yuHspwcKWDfDUx75/mhdViGyGzOCc/AHCBtRabtdcDUDQPhc9nCWzFI
	tm8qKQN9yBCoW9zZKeM2ZnP4DX5rytH4E9Xzs3Uf57PisFk2s0d004vUiXUvs8qrDICZo6MNCcR
	YRkMdE/DwIQFF5fPb8hoIl2uPQmqAZDs6QpBBBZU8kQe4AVazVtnxV4iZErg43sMs/N+63cbzib
	MreOvJsYJiKRwlsIyHwwEwtfhTRCg/yDG5Mp3OYT/GtPKi7rQl6ppELeNvNyr3w784JCjr0e/3T
	hedxL7nfpLR+Ykk
X-Received: by 2002:a05:600c:4f90:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-48373a6f4a7mr11677375e9.30.1770971154146;
        Fri, 13 Feb 2026 00:25:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:2dfb:a5b0:34b0:dd89? ([2a01:e0a:106d:1080:2dfb:a5b0:34b0:dd89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm148815915e9.13.2026.02.13.00.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:25:53 -0800 (PST)
Message-ID: <8da06d06-db9f-446b-b1de-c5727d354db1@linaro.org>
Date: Fri, 13 Feb 2026 09:25:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-1-5b79c5d61a03@linaro.org>
 <7kkwkjnucx3cpvegilske2qd4u24vvjkykrljosi2uyknte4bz@3xvh57q5lpcv>
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
In-Reply-To: <7kkwkjnucx3cpvegilske2qd4u24vvjkykrljosi2uyknte4bz@3xvh57q5lpcv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28178-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 2954D13402A
X-Rspamd-Action: no action

On 2/12/26 16:17, Bjorn Andersson wrote:
> On Fri, Feb 06, 2026 at 03:50:29PM +0100, Neil Armstrong wrote:
>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>> which connects over PCIe and requires specific power supplies to
>> start up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> new file mode 100644
>> index 000000000000..34acee62cdd2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>> +  The UPD720202 supports up to two downstream ports, while UPD720201
>> +  supports up to four downstream USB 3.0 rev1.0 ports.
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1912,0014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  avdd33-supply:
>> +    description: +3.3 V power supply for analog circuit
>> +
>> +  vdd10-supply:
>> +    description: +1.05 V power supply
>> +
>> +  vdd33-supply:
>> +    description: +3.3 V power supply
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - avdd33-supply
>> +  - vdd10-supply
>> +  - vdd33-supply
>> +
>> +allOf:
>> +  - $ref: usb-xhci.yaml
>> +
>> +additionalProperties: false
> 
> I'm trying to hang a onboard_hub off this controller and #address-cells,
> #size-cells, and hub@ comes back as invalid children.
> 
> I think this should be unevaluatedProperties instead.

Ack will update

Thanks,
Neil

> 
> Regards,
> Bjorn
> 
>> +
>> +examples:
>> +  - |
>> +    pcie@0 {
>> +        reg = <0x0 0x1000>;
>> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +
>> +        usb-controller@0 {
>> +            compatible = "pci1912,0014";
>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
>> +            avdd33-supply = <&avdd33_reg>;
>> +            vdd10-supply = <&vdd10_reg>;
>> +            vdd33-supply = <&vdd33_reg>;
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>


