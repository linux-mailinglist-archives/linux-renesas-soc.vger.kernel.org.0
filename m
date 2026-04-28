Return-Path: <linux-renesas-soc+bounces-31714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC4/HUD/8GnubgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:41:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352D48AC5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22637301D1A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 18:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2636747B41D;
	Tue, 28 Apr 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh1ueMFE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077F47AF69
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401093; cv=none; b=tu6gS46zIYC3wmYex0m2oONb6U5j+HSGZMu/aAbSXFHh1eesXd3TSlLwQ406ImMiR4ZbRrTAG9TIby9GudKa6DQFDXIzXTIZw6sSJKlZpVqaCTVkFjvWAWu2EDDeroFoxD2VasP/4spM0oErCO7F2zHjus8LjcPqWazpLuKD590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401093; c=relaxed/simple;
	bh=iDH/c3zTEENo4u50HzLDgRW8cW3epMThsw+Rs+fOl3I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kuwzLPWvXzsQSC1rXlfxpkAM+3LSO1UtnusPdSdkTxE9ccZ+5sdKaJgtv//Hmbme5VhwuS8gA++QBz71RG18lAt0a2rwFGPvc65gAcpD9iz3GD+8FYSsGixd/wWvhdhxgv1BsTSMUO8fvKfFgd7G+vxBJSwj3lXlyvCmVNMVseg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh1ueMFE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso89532175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 11:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777401090; x=1778005890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEQVGIrIBH0Yz8YaiGUBUBvBwiXNHUR5MrPKG8s+11g=;
        b=Yh1ueMFEYx30UBHkFQXajYpM1pxFYUiP19VorNVzsO1Fl6YEpuGIymVnL7kEIQpiDC
         M0dwY2w7Zd+5jA7uUUlWW0B8FR6DI75kc83dwdZWBI1pJTFUiYoJwZiO+gcJNspU8u/Y
         o2fYuEhVXWJniNDB4wL85XcRToPiAvVGQPQODHDBZBP6mTah7vCTvf4+8e1K7V7YXPgq
         H0YGfgU2RVZD35dvjSVnTf2WrmyB+/APRyWAfxVhzk6IZW7xRHNqrH5PDNoMDOgqtXke
         cY8FKk8M93Ah8kF0Zo8Q/7DA6EgoZf74NRNH/VfxF8n0ZX0BP2KE1o4W/fPyalmAJDzg
         mn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401090; x=1778005890;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEQVGIrIBH0Yz8YaiGUBUBvBwiXNHUR5MrPKG8s+11g=;
        b=kQNMn7zuEem1VBqhs3FiGGPv/79CGXZtlp8uhGBLZIkXjQMSnf/QgFzAfwb/dYMB31
         5BSGALr7xWh+tEPZKFWlVGpEgszH/zR2oOA5jQKC1j1wTEBY9UKLLUKF0qFkB9AwpoaF
         6uosU6C3fkC3xvIfwKYpt/kq3pco8gPZCoZgCylneGQJCq2Kvt7AuLgyZLxFN0uly0bg
         /aPWQU9piooKWec8PimnWhcUIbP6SCxiBZLr4Sp7D2D91zHR1Iv8oDadscV8IBt9+DI2
         +ItYuV4RIVEWLM+i29XHknugQC9byN5qXm7hdmCHPR8U8FlvTLYYX3ZFa4Tavjqm7/Yg
         7fiw==
X-Forwarded-Encrypted: i=1; AFNElJ//LYDA1YdInpjHIWfcc1gHdry/wFdINihNAtkLdZF2expSQjCtY3tD0iq4wfMlVT7QhuCWzN6xDTo0Im68EL5ujA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeJQqgeyz0ZhbZRoV4Rs1A+TaJro0FZpe1xsxHO4Ew/0dwhly
	iHVJhn9aYtQXrpP3amTre93Sb5N6ZU51sT1RhmbJabVUDOn2pH+77CDmzZTYzbIMfHo=
X-Gm-Gg: AeBDietsjueMXzRbPO/2s3MGkVhzxy0Yvck95WS297j6AHEaWZbHAujpfTrm9YAb5+i
	OlvLbbn6MhuuEXSYdUSrGlI797v2ZXtd/cKjpJ4X4REfKvgWF9Rmy1c0IZ4RwZ+Cx53NP0vfRik
	IfqtUoAXTtFatbuiFFE5Rvzkxi/CPXG1dSq1y/WSSiG5t6snfk7Iwss1dkpOmytLrzwi8VENWDF
	1HkMH90GwtvteNAk8PoyjOFXrMPkci7TiFNfRVgvq+Svww9rWfm31QvYyR+yLTkL8ziAWP1NgVb
	1osO+2ru6qNr9PHH6pRzf52oaa0kmju9Vfh3tb/6FnvO6tBfLdDjPaVj6dHKsYvDSoIMY38bHFr
	uoVm9nyFgHMz+lZDJOKg4oKtwRUge+712/hA3wxCRsf335/zaRtOG9zbvPMAjkw2hoeF1s3cAuw
	OPaZk3djGCWpYpBmTP7y0vbZ+QVwXsDWVa1kI3JG1z5qPMU1S3KR1+Q+jVVODV99ioyjWZ5Cslp
	8r3gqJjrQ7JZFxUcw==
X-Received: by 2002:a05:600c:3541:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48a77b19c77mr68824085e9.14.1777401089712;
        Tue, 28 Apr 2026 11:31:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:48b8:3c11:f42e:f0c3? ([2a01:e0a:106d:1080:48b8:3c11:f42e:f0c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa890a6sm7481259f8f.30.2026.04.28.11.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:31:29 -0700 (PDT)
Message-ID: <efd6dd15-ab9a-45a3-8f53-2a5516284830@linaro.org>
Date: Tue, 28 Apr 2026 20:31:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: document the R63419 based
 dual-DSI video mode Display Panels
To: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org>
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
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0352D48AC5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email];
	TAGGED_FROM(0.00)[bounces-31714-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	GREYLIST(0.00)[pass,body];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_TWELVE(0.00)[15];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.710];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

On 4/28/26 16:05, Neil Armstrong wrote:
> Document the Reneasa 63419 based dual-DSI video mode Display Panels found
> in the Ayaneo gaming handled devices.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/display/panel/renesas,r63419.yaml     | 92 ++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> new file mode 100644
> index 000000000000..5777930aac78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R63419 based dual-DSI video mode Display Panel
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ayaneo,wt0600-2k
> +      - ayaneo,wt0630-2k
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vddio-supply: true
> +  vsp-supply: true
> +  vsn-supply: true
> +  vci-supply: true
> +
> +  backlight: true
> +  reset-gpios: true
> +  ports: true

Please ignore this patch, I forgot the rotation property.

Neil

> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vddio-supply
> +  - vsp-supply
> +  - vsn-supply
> +  - vci-supply
> +  - backlight
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "ayaneo,wt0600-2k";
> +            reg = <0>;
> +
> +            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply = <&vdd_3v0_lcd>;
> +            vddio-supply = <&vdd_1v8_io>;
> +            vsn-supply = <&vdd_5v0_pos>;
> +            vsp-supply = <&vdd_5v0_neg>;
> +            vci-supply = <&vdd_3v0_vci>;
> +
> +            backlight = <&backlight>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    panel_in0: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel_in1: endpoint {
> +                        remote-endpoint = <&dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 


