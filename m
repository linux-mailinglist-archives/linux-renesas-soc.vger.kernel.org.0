Return-Path: <linux-renesas-soc+bounces-29131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP6dFl8osGn1ggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:19:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A55251B71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F05434C1F6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852353AA507;
	Tue, 10 Mar 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTf4f/qW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B853AA4F3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148902; cv=none; b=mqLFwYNsGy6O3qVRXSCjND5Hr2GlYnurfMYX27KNBJnGtzFeL330NjwVoxtUa93cLSvT3dEKcfD6nVGeYylfy0hPk8o5uzKgcITatJqlksKubVcXEnNOa85dEpxJB5Cf1/Y9okAOSvhT6u9gJYpNUPH2q6iLcLhZojv7bOheh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148902; c=relaxed/simple;
	bh=FpPHh327W00lxLs+ig5emIIC065HDCktd6HRZa4GPFY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XclbYN2Xo0N4ZutMP47Uv2+CJtp51seTaf3dCVqb0WFBAiyhemiY81rTbxq60E8pdofMx0C67f79wCsp8876uurYepIIrn+UZ5Tb/yOhUotEWVlG8k77LHs+x0Mc/IIooLjRyS9WjcNNnB+2MCTlTieK/4RA6vMqS01Ggp44BdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTf4f/qW; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9fcc24b3so9924334d50.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148900; x=1773753700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoMDkF2JbuJFUfSjjQiLh3kSnXhGxBzPKFOz4hbX4dg=;
        b=MTf4f/qWquly2cpf/DsxERm8NZfHfmEodxwiG1EjkWO+1zHlGzxisNkw2AAKaGYUzL
         JlQrUug4RSZef4UoDyt7YMwYPQhj9EXHwxc4XEZ3ugeNtlifvS1Bn5Yg1Z1TjFqQDc08
         3h2cw/HTFsMV2yYN/Enze13iJlbOr5LXy1+woq7mgany6ndaiI6r2946dTHAGAk5ZD+w
         EsjtP9G/mcnM6GBZZi8EwoUJgRzg934B+vKw0b/jX+gFFBRr7JThUq4ZIo+KDG7GRXbo
         9oDmSCKQlf454oq6+U+SUSkr3zb30i+5pUTvcMFAmy8HYAiWtFcu+sE9/do6yUSw4c28
         0k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148900; x=1773753700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoMDkF2JbuJFUfSjjQiLh3kSnXhGxBzPKFOz4hbX4dg=;
        b=bmcPkU51j8ZTmflMguA6JOfRpdX8zQ7r7slF5hsxivOd/wkQfUk/8Vmpokg//it+U2
         ONCl7toCilRX5F5PRtTLera0A/NiSgK2HJrVIxo3wsQTEF388tdub+Rdz+icIlBoetCS
         Zw5qUc4LqB6b9XDiChyrb6aqqdIViHyqrE7Bpoo3YM52l2pZT5Y70P41EnLhN9DNX652
         KnIF8yOpSvxEb7k2L6jio/7Osp6L72rPjc5aVIz0P6IS0wpZPR7zSlDGZQNupCm9+FfY
         N34HGC6zJsqHznOoXzZ6XccMRSgZEBW/it+Vq/TQU3deM8DHwP1pj3PGlCrWBkVSqi0+
         EgAA==
X-Forwarded-Encrypted: i=1; AJvYcCUD1jG8aQZMoTxVD/Gi4kCho9eeh6RcZ+6G5ZYHwGubmO3MV7yrXQAtsCpUrQi9gKORUdBR5Ef0+2BK6jyIlCzs9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2GiE+MHu2aY3TETrTM8hS9wMXjo9bUpnfpg/fElugO8byax56
	mFj9dF8hCjP+pf494H77LiEvuGoxTNSlfwD2OSlpXnk8MyddcHjB6foaXHAIEJzTj2Y=
X-Gm-Gg: ATEYQzxKiQI2mzYIoa66jVBuKD6hTwtdeFSiJvVWlGU20XUjt/9slA+Mp1EKS5dAry7
	PRgwtGZXVMCdvK0HkdrSWWwfMfjEprsOwlpNsHetT/C5HFHhQ6Q9RZGWuXqH+c4y9pg9ggE5DPG
	4Wqhr+lm8hhxEnrU1/r1F0cBvb3NwavMq0pBeda55y82xPbKr3AxY/DScRxmA+nvNoNsGyVdGCv
	D3h+CBDlt8wp5JmHfdTtFj7QO9LAKNBqSSGQDqMhMVZoyRd1SqTYO6diMkdHjabFVBKVSqfQUpW
	HU8XZwBe3tkyArkPAKSPKtH3WOoyXGfvqT/Ghzh8GAUVP8kBkbacxY/ix4aHVKD5AM+niHibT6z
	R1XQX4xABH02/H0EDPKncIMF09hSQ6q07/XUUB4j8CVTFqvxmxEnoHKbEHdIv2JkdBZ9YueQChc
	EsiTG8GY8XRrKUmUeITnrVSpUXOsVHb1fyqzuOS1+oCCo0gsm2TyARRvPUmzXBHggFn/M0RkGB2
	ljW
X-Received: by 2002:a53:e185:0:b0:64c:975b:ecad with SMTP id 956f58d0204a3-64d141a04e7mr10566567d50.40.1773148899950;
        Tue, 10 Mar 2026 06:21:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176e70e7sm6575823d50.20.2026.03.10.06.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:21:39 -0700 (PDT)
Message-ID: <eb7b6280-de18-4761-a486-cea1074a9129@linaro.org>
Date: Tue, 10 Mar 2026 14:21:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: display: innolux,p097pfg: Document ports
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
 <20260306-dt-bindings-display-panel-clean-v1-2-3086eda1efaf@oss.qualcomm.com>
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
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-2-3086eda1efaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 63A55251B71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-29131-lists,linux-renesas-soc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.1:email,qualcomm.com:email,rock-chips.com:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 13:02, Krzysztof Kozlowski wrote:
> This MIPI-DSI LCD panel must be connected to something.  According to
> scarce web data it supports two channels and it is already used like
> this in DTS.  Reported by dtbs_check:
> 
>    rockchip/rk3399-gru-scarlet-inx.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/display/panel/innolux,p097pfg.yaml    | 26 +++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
> index 4164e3f7061d..7c75e01797f6 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
> @@ -10,7 +10,7 @@ maintainers:
>     - Lin Huang <hl@rock-chips.com>
>   
>   allOf:
> -  - $ref: panel-common.yaml#
> +  - $ref: panel-common-dual.yaml#
>   
>   properties:
>     compatible:
> @@ -28,6 +28,9 @@ properties:
>     avee-supply:
>       description: The regulator that provides negative voltage
>   
> +  port: true
> +  ports: true
> +
>   required:
>     - compatible
>     - reg
> @@ -52,6 +55,27 @@ examples:
>               avee-supply = <&avee>;
>               backlight = <&backlight>;
>               enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_in_panel: endpoint {
> +                        remote-endpoint = <&mipi_out_panel>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    mipi1_in_panel: endpoint {
> +                        remote-endpoint = <&mipi1_out_panel>;
> +                    };
> +                };
> +            };
>           };
>       };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

