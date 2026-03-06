Return-Path: <linux-renesas-soc+bounces-28924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNemBECuqmluVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:36:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56C21EDCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C92C301049C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398F533E37B;
	Fri,  6 Mar 2026 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwf72R+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07033A02B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793335; cv=none; b=c7nRw56gxXRBTmZmcG2KWoipa+aQFIRRLFKgSWvfAIDsvvt/dwmTFihL0Y3QgGB1IjKhmUxwfAld4W/N1KF+0YEin9sEbGZs1YaoUx3KAnBkztdgboTu08AziQDAP8ARnHev7GKnj44Bonfq20EGbZf4onCdMIRMn95rHfLWGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793335; c=relaxed/simple;
	bh=l3WIuwN38jbkyrw0LEjrJAMozZbWSWMPSv9HP36RruE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sl3L83SLCcPLQ9eoNB7Hz8xI8qvRxKj9KT4NK0OuSXm7v+8ODw5X326SKKVssOBeUmO4kL+CR+vNK0OqMU06mM/CeuIpjZEH0a4mb7XCng+kYFlydx3Bn4aH/OoYO/bcRtW99fcRVAPOl6wbLpX7TjGqJDcG7FshLBnWqGzVEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwf72R+w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso84429585e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793332; x=1773398132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esFAJAECIS5DMa99l6UrhVMfqbrM8y+wZ60LQuBZn4Y=;
        b=jwf72R+wfUt6yRPPlr+y41MF9PzDve0tLwYUlYK7QDto8W+uvKgl6BvLTfIPqhWo2h
         5ty08DqWbuC0dIXQf/nsmqbvwxoJO31njqPgSwRZbkOwLhBQDRQ37cWoAsGcdm+A9Gs2
         oF5tHpGwka6f1+Nhihb0mWZvO2HLri1EIqYV88WfyMWbEsNNUziQQl2zgNuE0gclEc73
         vB52CoCzt9OgSpl+xjpNqhFkbH8NPDIvaeWZpp7zefHPvxRfUhvOckaihiHevkhOejN7
         3+ZYMxKeru4AC1kN4PT9d0OtvmRgbSiqOXYPS6dOcw2vLGPL8007HKAR6jEoCEVAWu+2
         kilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793332; x=1773398132;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esFAJAECIS5DMa99l6UrhVMfqbrM8y+wZ60LQuBZn4Y=;
        b=b15+K/hDD9RnlSM6MrUAR3VeojEj9h2zU/0gbpPkaMleyLPIy0NAaeoC+7hKEqybzx
         xFDtmq5Sx53jV/DDYB9nYGFSGNbIwzqohO076Gtd3QTGQdgmFsxseHjR/xGhagslJQ2E
         C7DHgjZmQR/C66XXlyjVCAFslPe3+pNN4BZMTBvVLDD6bi0aLtmKNs89lv35BVjo1zDb
         Onc4U1EdxhVXeEaQ50dVuEZCf/vpOxkUSwr3yOpgERUC+bcIEGSfwc4WVrWZ3z7u9QtR
         mEYTCiwoe0USeIpsaxRppAbwLs3e/xGeLUoejV6c+bQLtLi8JbCSOV2EXob2jd1A+06r
         iPMw==
X-Forwarded-Encrypted: i=1; AJvYcCV2vXDj5x/y933JNY8EjDydu/DPNohLxgy3bnYORy+rLgsXWAni+212XRKiPYIAqFPdhNqTax1Wx0zthxijLcy4zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06G4Oi0cUl6sTIkVXJ40aAkltUNAuNI37VguwEQ1DA0I0933J
	tpfeBsMVRXZKaOVhiYcF3Y2B+2dfREOGDgfwfqXIWss5d1TBLJns/PQdZyU/DY8at1DvcSwBB19
	XWbCx9Hs=
X-Gm-Gg: ATEYQzybyXIIO9kqwRGl4h72rwmw+VaFFU8MIoK2StV0+VX8hCUfvvO6ltXqAhCIEBQ
	1YHNImIqsComG37J1/Fhtx9e/QrYuxTlqXRsmEU2Uzeqtr1UVXDEaMsR8GE/uXZyIEfHkbP0Vl1
	y4BNdDJamWhCz4XhnHJod/B40Y0RWMw/u6FeOgrqZIm6wpTouXxqiMF8xvwzqkzgM9fBqZP7dza
	byV+1aESLjyAsDsCk32/OxwGiZORlWe01VtpoyidRpWUEeEMdL4p76vgFpIod+yMwDAtOwlCfIx
	uuR05PXYGNqhSqDLX7NMZV2GmCVu41m7UAc0bkaUfjXM6JRk0qETIax6nVLmi2Pcf2/PQiYe6F+
	/kHa/AdHQj7PLRjPb7bFhGd0Reiq4gC0e+fBLHYGtUjFOLRU1raW2ZxvOSIeJjvIUksmlSgrQqU
	GrEnU/ctHUyIfQ7xdiKTK9E/WwjjOCBVnSV9RygZqKzOsbjCNoqwH5hxXwIfA0+6QVyDYWFWdSd
	2Tk
X-Received: by 2002:a05:600c:870b:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-48526957c7bmr24484715e9.22.1772793332295;
        Fri, 06 Mar 2026 02:35:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852470620dsm14181495e9.27.2026.03.06.02.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:35:31 -0800 (PST)
Message-ID: <95d92da9-cb70-4101-9451-ea7ad42e2169@linaro.org>
Date: Fri, 6 Mar 2026 11:35:31 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: renesas: rzg3e-usb3: Convert to FIELD_MODIFY()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinod Koul <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
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
In-Reply-To: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7F56C21EDCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28924-lists,linux-renesas-soc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/5/26 11:15, Geert Uytterhoeven wrote:
> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> No changes in generated code.
> ---
>   drivers/phy/renesas/phy-rzg3e-usb3.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
> index 6b3453ea0004cf59..7f809ef1bb5135ec 100644
> --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> @@ -78,13 +78,11 @@ static void rzg3e_phy_usb2test_phy_init(void __iomem *base)
>   	writel(val, base + USB3_TEST_UTMICTRL2);
>   
>   	val = readl(base + USB3_TEST_PRMCTRL5_R);
> -	val &= ~USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK;
> -	val |= FIELD_PREP(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, 2);
> +	FIELD_MODIFY(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, &val, 2);
>   	writel(val, base + USB3_TEST_PRMCTRL5_R);
>   
>   	val = readl(base + USB3_TEST_PRMCTRL6_R);
> -	val &= ~USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK;
> -	val |= FIELD_PREP(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, 7);
> +	FIELD_MODIFY(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, &val, 7);
>   	writel(val, base + USB3_TEST_PRMCTRL6_R);
>   
>   	val = readl(base + USB3_TEST_RESET);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

