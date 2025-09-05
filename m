Return-Path: <linux-renesas-soc+bounces-21443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F042B45045
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0A151C82B4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCBF2ECE89;
	Fri,  5 Sep 2025 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySngPM/a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D92E8B9F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058706; cv=none; b=P1uyiozCysuM8VhGmtO7jmdIvldzL5a0WyVYKSgZyRHvYAsCfFiMyTKSDqbEr/K7uF582pCnKijlK/9OoR2qJjxmwH34MrtXcBebJnGtdg9GGFgwqJqINHVJfNtZL/zLsIWfNzno7tG9f2pUjHFTBpQiKytS0Bkm0FoUWXNJFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058706; c=relaxed/simple;
	bh=HHQKWlCq6Dv4lsBAVhaaR9oi96TGkmsPJCtNcK04Ges=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bAsS1O3UG8HxaZ0Ct1jBDpbnBwev1m3j0wFaQUx9UZd5Y5jBkND7rGfxtp+UeTlBgYk2DAYdJeOMwKQ8PJP1UPy/Iolq8qhslLgA3+/J6cvzyDGm9u25RPMeEIlBpQYt1l5i/Hk0lRnQ/DRnRhdueWbAnaBwVaoTBXdSgrFHsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySngPM/a; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aff0775410eso382919866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Sep 2025 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757058702; x=1757663502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTkMukFvFRGpUIaR3bcrLvyQUvlizTeZ6D8ftQ6ewB8=;
        b=ySngPM/aFaCg6JUoSlKF516b9KaU2rUZFNv/UL7owjuvmF0b19u0VA97Y0MQUoehSn
         hIu5HzJ1IXcZQowOrJLT+/vpvC0fKRtPyhmWi/eXWClGIH4q4z+jjRgJVS8QCNb2mWbb
         S5UFkQlkb2tLYP0pxlD/ZJBCAvdx97GxRWeYAtB5+rIRrKV46n73nAaPMDodGDfQ1Qen
         LHXLTR/W30FJSSGPP2/2yhEqLCuHWApOQdBu0t4D3yU8kD/dE+lL8gjgwRb2r61DxaCy
         kKeR8HjeDdMKRBQSdsjb3XDQfJdzRfio8ucguAKcwKEK7341uHIX0WEabBznJgKmQbRb
         /WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058702; x=1757663502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTkMukFvFRGpUIaR3bcrLvyQUvlizTeZ6D8ftQ6ewB8=;
        b=pSbXiOWOpG2svFIl1W0BTQ/lQ3PhyXQHy1HV+e4gwU61AumSbDAR0icC/MaIKyI3Rr
         SX2ZiE/ClvEIVI4vFgovkcWrtS+pUbW0BDFznjGNYmiXW1C0r/z8EfRsm4Y72lqFGLY0
         +2H4bSBSxpZNZu6KUuV2X4ze5Z1no3uU5QBVlLAgcVjxBoJAA78yf3/GKHLnhLOkOmN+
         YJBpL6UFV1hUZhdjyYJcb//v7GMYS9OFc5ER4B58kPEvOtFnN7QYOhfbqAb/ERd9Y81i
         G9/Ji05b4yn92ZdFdl30bhsNVp2Bu5hyqTeK2SZ9nq21Ao71SyyU7oEbSz7n2psPuVjx
         8jNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJV6/EaWe34d9tK2mdKbhv3SrucF+M+dqOuHdOsDmTyQr60OLG0gjw5D+MA85g7hdLhLPmV3Pz/kawckMS71buEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQsquA3LeB3Q0SrxBoR9wEHJLDH4jCdP1Y7ukTLKv59L7Itq7
	pSMjSxbUjx78GwqOVws9AbgXEsc5lmMiKjI7fcgfb7wvREbx56oyahH8uVx0CuZj7gc=
X-Gm-Gg: ASbGncuOdsK2LAhtPCZ3MK4VnODwRlOr8+lk7N7szcv6ymiLWbPpMjX0YluaDMDs7sz
	505IoWtfKYhgGIlND7stcK4rJ8Drj9+x68miuM2kiDqvab69H19tqmmJtlWvVljcdX1Va1YiJXb
	L4FgCNAwt5vP6nCMVlJE50Xjk9KHInMzJuOr+fJIEtX4wPVEBdR3g0aV+nHUhtxA+djn6IMy3dI
	oLHyE5ML0JPecJ6lUU2lUY3RwBSVX5VIN0CmZox3jzL4TpxfDqC9zeMXbckE51WyELKYJPGfMy1
	gRlzr/rK5TPQm3FK/U4gCKpji1t/b1iN5xwtKxZ6Xxtogzb2rTf8v3Rl+0aGRqjuXSjnS47LCma
	7f0upSaU9bX0Y0TLd269cb1ubbR4oyQLnqB6NjoZO0vAMCU/xqJEOxpw=
X-Google-Smtp-Source: AGHT+IE9ONGaCVuMDUsDk5AMP12J/m85KDluThMZ0nObk2fo54w+Ym2od7+l60KIMrqn55YK25utpQ==
X-Received: by 2002:a17:906:eec3:b0:b04:3cd2:265b with SMTP id a640c23a62f3a-b0493084d84mr250335766b.5.1757058701824;
        Fri, 05 Sep 2025 00:51:41 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01af44a01fsm1479647366b.23.2025.09.05.00.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:51:41 -0700 (PDT)
Message-ID: <25d043fa-a600-46df-b1e4-f24f715d9887@linaro.org>
Date: Fri, 5 Sep 2025 09:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 23:01, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop the dsi0: and dsi1: controller labels
> ---
>   .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>   1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index c167795c63f64..51d685ed82891 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -14,6 +14,9 @@ description: |
>     R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>     to four data lanes.
>   
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
>   properties:
>     compatible:
>       enum:
> @@ -80,14 +83,14 @@ required:
>     - resets
>     - ports
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |
>       #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>       #include <dt-bindings/power/r8a779a0-sysc.h>
>   
> -    dsi0: dsi-encoder@fed80000 {
> +    dsi@fed80000 {
>           compatible = "renesas,r8a779a0-dsi-csi2-tx";
>           reg = <0xfed80000 0x10000>;
>           power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> @@ -117,4 +120,50 @@ examples:
>               };
>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsi@fed80000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "renesas,r8a779g0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +        clock-names = "fck", "dsi", "pll";
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 415>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dsi0port1_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "raspberrypi,dsi-7inch";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0port1_out>;
> +                };
> +            };
> +        };
> +    };
>   ...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

