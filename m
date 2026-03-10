Return-Path: <linux-renesas-soc+bounces-29130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPpWFlcosGn1ggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:19:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB1251B5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9E7F30C5718
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A34C3A6B96;
	Tue, 10 Mar 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgH5gprp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38643A75AF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148896; cv=none; b=cP40eJU8FjDPxWHor4GYCQhQvI0w71w8iFYk0fiQruhUcTXDBF2R2cYrqc3gsaXNYH2NleTPw9KLjl3g0upoJ90EZOUJcJq9G1evfYYAC67HV7xmMVFbN4qdc1VBoHWhgJANm1XhAuXvgjXWI7flcoRkCGgmLUctsJ2qXH51ujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148896; c=relaxed/simple;
	bh=+YY/g5qi0FhgJdJMriCI0m5KvACdvMSw1aJFKwiiZco=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EBY1glH0f5VoVvjiv1z8FWtvPAyR/4mRs2YHANzDoq0+GtqfLpYVzu8mrGm4WWw4iWIDXYG3N+2pcXQDIA0s9oPUfwZzd76C+Aa9wUlz+vZJg89F4bYCu/1mGH1F/KVCR2izaxtA07vAWiqeNLLLcmKSUlBjz8iWGjbt/Ladknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgH5gprp; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ca09f2170so13261791d50.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148893; x=1773753693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkZc0W99TIcJIaq65PEzokBugjmAdM8IFJxUeAlAQ+w=;
        b=CgH5gprp4oTCMJDr+ONjqtqABJvxfrACEtEpsXdNKxsxhWzy6hJfOCygfaKQOG2uR6
         U8/RoZN45ZLDdjk5kivuoUATLfNvIq86t3kwfB7jsNq7rNEqFYeOCpR9ACb9ecUth0jQ
         DYLFOaqwq1KKii5XAPEIbDvcs3nQEgRYoDM7+pVDkoU35pW6zR+zVoHhZlLxTinK7sJ4
         LMTKovvOatvfvwUa3uiKbvgZ56aVZLjSO64RcPcHWTqktbCVqvwJ/qP2cORkd/MgLJRU
         8S/2c9CgxKgK4XmjOtUHAzD95u0ALljJlfz52wYqf+9pUb9iaIuB5Q1bwubeg/HrDWFg
         CHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148893; x=1773753693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkZc0W99TIcJIaq65PEzokBugjmAdM8IFJxUeAlAQ+w=;
        b=lWKL39xZhwnIgnUHSl+GUmf903u6dr00u+eXyTMXs+uDnIzcwwhNbgmrUCn4s2zgkm
         1goRCfeJG25eozEFfO+1jWSuelVvStkxcGbc+16uFpgFXrcASi8VjJMRKOd2Kt/OuTFz
         xjuSpcKE11IWKYU58CYTvskhcZ3VLLRxyqKVjD+wm3985lmcT2Yh1JXeahD+beR9YIfr
         fZNp6M5tgweoom553lBt0ylkBW+fKL0KxwDjB411+sKsi6K8yzupb6BclSv7a/ac8t6c
         XGHnyLD7ShZr73IbpW9x1758Im0iMq9svKCyoTGMH3ZmMC5MHPAO5s2FWtzPN1dQG4JD
         F6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfo9AjYyiOq8Hp+PIU215fB5fAVFmAJxVvEV1IXUcZrT2BaQeuB0n+6ha3OJzpU8EFuH6+XtpnX0j8o8kNm5EmMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydh609V9MP06Pn3X5sPjudLk/u8LGjcbiG4egl6l6AwIuDN/aZ
	zz18yj5FEXQmmderjX3dzu6xAfzrEtHr93ePr1kHw8kE054n1bS8n3XmU2GTCT44Wus=
X-Gm-Gg: ATEYQzzosUa+YdcHet/SSu2pv1+QpcEwXbIVeL7hnrU+eSblAdUDFTiYizoMAf2bn6a
	6XvUkMPyG3WB/LN8nwH+LnfSwFq079rVao0vf/F0FAY4oZqFzIOshbDiMtfzmf6yqh4dVm1dj+D
	boarBfrwcpAITbZktNuvahwU2d2n0OomdX350nBgXfwE6vvfM40kLA4YW48c/33+UxNlUTJqsik
	59HUTx3+zchwrVNEseOnCAA3HZnYqdKosGLJV4JE27khfhddfTZ5fBg9IVARZJJtA2O5sECCwfg
	jELw9YyjnZKR+yLozvE9rcHMTls/C8aP9JUoOhNeY64/eZYHQb/UQHqI+6NbGJHSv4izeQyVHcu
	nb4cOEIqBUHxYI72EdD5jEw5W9dmYQK8R30GprWWZ0yO5wt69vcFcXuZXvQ/ZplMJnDUqBjHIZI
	Bnsque2EWnrmpwT1e1Kj4qr3SyM0uqh5X0HvZP2QFUPopDS75xeKtGpJmT76fEjMVydIjo5grjb
	HXn
X-Received: by 2002:a05:690e:1286:b0:64a:d541:bc3d with SMTP id 956f58d0204a3-64d141271f3mr13562084d50.25.1773148892559;
        Tue, 10 Mar 2026 06:21:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176e70e7sm6575823d50.20.2026.03.10.06.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:21:32 -0700 (PDT)
Message-ID: <68b001cf-7e49-4ebc-b325-21620579cd00@linaro.org>
Date: Tue, 10 Mar 2026 14:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: samsung,s6d7aa0: Document port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Artur Weber <aweber.kernel@gmail.com>, Jessica Zhang
 <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dzmitry Sankouski
 <dsankouski@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
 <20260306-dt-bindings-display-panel-clean-v1-1-3086eda1efaf@oss.qualcomm.com>
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
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-1-3086eda1efaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 78BB1251B5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-29130-lists,linux-renesas-soc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 13:02, Krzysztof Kozlowski wrote:
> This MIPI-DSI LCD panel must be connected to something, thus add missing
> port property, already used in DTS.  Reported by dtbs_check:
> 
>    qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/display/panel/samsung,s6d7aa0.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> index 939da65114bf..1f753b706911 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -44,6 +44,8 @@ properties:
>     vmipi-supply:
>       description: VMIPI supply, usually 1.8v.
>   
> +  port: true
> +
>   required:
>     - compatible
>     - reg
> @@ -65,6 +67,12 @@ examples:
>               power-supply = <&display_3v3_supply>;
>               reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
>               backlight = <&backlight>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&mdss_dsi0_out>;
> +                };
> +            };
>           };
>       };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

