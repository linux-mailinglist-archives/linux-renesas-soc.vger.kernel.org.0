Return-Path: <linux-renesas-soc+bounces-29129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBV/GUEksGnYgQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:01:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273A251321
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EDD234F5974
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6DA3BF67C;
	Tue, 10 Mar 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2y6R9l/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9FD3C0605
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148132; cv=none; b=Wp/TFR1eXt/Iv/ZANaZ25H61aShEY13bkEHY7o1c+TOTsB5ELgjPq9+MlFjCYnxOqaqXwoBvthMsDlpIdLZ0kIt0zwzJQprc3S+MGZHXDnDdSyY0JNrYDpFUJ+sTIzGybBr2lb+W6OkkAjormnzE8kLG9qa3tvnKhiCNCtWWVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148132; c=relaxed/simple;
	bh=rvB11H6RMQeais6nkVdvS8yMsyVqI53mLo3GtCuFQkc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BsWBzNAWYxytYQf5qO1tw0USPfCKYAnFsr1Fo1ZqZ2Uz5PkrQ3zgskAEfT1UNn3q44Wp/DzqkhmQzyUtQIRDvO530L7fO4DOTeaHVF94diPqDXIfYVw1AJ1jaMqIKnjCxB1JjW3skN9GzYD6RzoV+p+QxGtOrR637JkFwgRj6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2y6R9l/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852ff06541so31586145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148128; x=1773752928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TRBpSzG7oKf4unFVV/7GqP3xJjjnnjPULashk6tmNc=;
        b=J2y6R9l/tTku+85TWCzzLOAocgWp/84jgMEkas+XwWLARIr5zMxw15rv5pgMryWyMV
         QdOC/QMPG14BwzaXizrbMGN1ZZPEvZ9fcSFWFthGo4ndkjzkkiOFss2zjPiOKS4Ry/HU
         IDbn7IVN9t/Es9ReOEoLVFQDJkjP2iO8MMmihoI7u/g6g+oLBRFWnBt1okdeHWQbnSJt
         Cf4I2wxIAedyLcLxI8NW3Fht64NvjnIFAh1Vz/DMWRvfJe2emBZnZ5gSJyuXU7VRltqE
         zJ3XuxV0akVjpOHnnxZ2C8BDrNtPbGz3tDzh6UbkATSjwN53m72gdAkpGpHNgkmytKUM
         KJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148128; x=1773752928;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TRBpSzG7oKf4unFVV/7GqP3xJjjnnjPULashk6tmNc=;
        b=OfiSFjrVchcd3i5SpBOyLUdV3htNooFF6wYaQIcQlgVTyHTS9K8LMsuwXKFi/Gvqw5
         TFnw7LjF8iYJUS7lAIJ4mp7Kf7y5DTIRzBs2UwCwwsBmuTEjEk8itYn9i0qEzl/vGFY1
         9/CmbPQs1qCS1sh/neqQtMeDBbp3C32ObLLZvPID9bYiRlp2FOMWhjYdIkBPdefl6hUF
         5yPWLVqlcu/YY+qdpuoKqI1eIIDY5PV0WLFefa2rFIlrXOyROQNEuUHITBXLn6tdH1u2
         w/catYdX6M1vObBnsheqa7+FSB3T5AnhQOwJiM6YPpfUtqfWSYUPG6Tz8eyMWR4TIKLO
         lxCw==
X-Forwarded-Encrypted: i=1; AJvYcCVbeRsuw3zv1b9px68zOizptpiZKqbt+fOMZz8ARENElr4uYEIeF1gieRqSJbhK6UylyBAuXna7CnH0JpddOsUSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtJvYsVrl3KpmAkxBVZl7TofeJlZkhdvlg7tfM9J6zbpQGfSL
	kZ+c88V3GWa9RZKiz4i4r7IKYqXkVWER0BgG3mzxjgvgRt11iQcbaUHjKlljbi3HHRg=
X-Gm-Gg: ATEYQzyWl/uw9LN7AB4UgYcB32B7QAWEp1duv9WkhqQQZpbX1uIptJggFr+LC+bYUaE
	44dX2UuE+Bi0UMYGEDUbbljS8fEKr7ye57yL1eTm46y64vT9sqWwiQCfKz72MQMbTSh5VRuadeN
	yFxdi1CSbypQ8lrQzLdxmC+P2L2AnlAuriUr3wJ7WkDZ7DsYE3I5VAOZX3VhJl0adQs1MEMz+W1
	K8R8y82W81u/X/EDO25IqWbnSzCYh4qVl2VES5E6ZFA45Sln5yOcME7DQQ4eP3D9stTSC5Ufm+K
	9bHUHB/Y10lsY2O1ZcOJiWMBE5/3ePvU/pV5m45Jrhz21hNjcRKpePt8LwrnhpH7/9ucovOdQLy
	+9NYDafSye1FvN4fSFKP1xNv91MP8oUX7BQVoy+tDtuqOf7ROmjoqRJ2JxIEbzerdp5tZ7OTGop
	MLJgAdAHpfAJ1ZZYGkV0e8W56+MLxBp6Zy+aeExqGbKpULGLVmz8mQ4F5JmnRiTi4F3gOg4tvW1
	z17
X-Received: by 2002:a05:600c:e40b:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4853f1cd968mr77411645e9.26.1773148128029;
        Tue, 10 Mar 2026 06:08:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b8d4easm78639805e9.15.2026.03.10.06.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:08:47 -0700 (PDT)
Message-ID: <c3e57d35-06e6-4865-b206-90f2579ce70c@linaro.org>
Date: Tue, 10 Mar 2026 14:08:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: display: panel: Align style of "true"
 properties
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
 <20260306-dt-bindings-display-panel-clean-v1-5-3086eda1efaf@oss.qualcomm.com>
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
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-5-3086eda1efaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0273A251321
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29129-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 13:02, Krzysztof Kozlowski wrote:
> For code readability, several bindings which list allowed properties
> with ": true" syntax group them in one place, without line breaks
> between each.  Align a few bindings to match this style.  No functional
> impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml | 1 -
>   Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml  | 3 ---
>   .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml      | 2 --
>   .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml    | 1 +
>   .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml    | 1 +
>   .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml    | 5 ++---
>   .../devicetree/bindings/display/panel/novatek,nt35510.yaml         | 3 ++-
>   .../devicetree/bindings/display/panel/renesas,r61307.yaml          | 3 +--
>   .../devicetree/bindings/display/panel/renesas,r69328.yaml          | 1 -
>   .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml    | 5 ++---
>   .../bindings/display/panel/sony,tulip-truly-nt35521.yaml           | 2 --
>   .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml   | 7 ++-----
>   12 files changed, 11 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> index 92df69e80a82..f288fa2390c9 100644
> --- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> @@ -28,7 +28,6 @@ properties:
>   
>     port: true
>     reset-gpios: true
> -
>     backlight: true
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 182a2b825e1c..84e840e0224f 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -33,11 +33,8 @@ properties:
>       maxItems: 1
>   
>     reset-gpios: true
> -
>     backlight: true
> -
>     rotation: true
> -
>     port: true
>   
>     vcc-supply:
> diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> index 5802fb3c9ffe..2fa07ec55b08 100644
> --- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> @@ -35,9 +35,7 @@ properties:
>       description: supply regulator for VCCIO, usually 1.8V
>   
>     reset-gpios: true
> -
>     backlight: true
> -
>     port: true
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> index 5fcea62fd58f..2f49a6bbf3d7 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> @@ -25,6 +25,7 @@ properties:
>     backlight: true
>     port: true
>     reset-gpios: true
> +
>     iovcc-supply:
>       description: regulator that supplies the iovcc voltage
>     vci-supply:
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> index b0e2c82232d3..3f56047f4469 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> @@ -24,6 +24,7 @@ properties:
>     backlight: true
>     port: true
>     reset-gpios: true
> +
>     iovcc-supply:
>       description: regulator that supplies the iovcc voltage
>     vcc-supply:
> diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
> index 74ff772973d6..b8b153a6e6cc 100644
> --- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
> @@ -22,7 +22,6 @@ properties:
>         - mantix,mlaf057we51-x
>         - ys,ys57pss36bh5gq
>   
> -  port: true
>     reg:
>       maxItems: 1
>       description: DSI virtual channel
> @@ -36,13 +35,13 @@ properties:
>     vddi-supply:
>       description: 1.8V I/O voltage supply
>   
> -  reset-gpios: true
> -
>     mantix,tp-rstn-gpios:
>       maxItems: 1
>       description: second reset line that triggers DSI config load
>   
>     backlight: true
> +  port: true
> +  reset-gpios: true
>   
>   required:
>     - compatible
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> index b39fd0c5a48a..43d134daf0ac 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -28,13 +28,14 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
>     vdd-supply:
>       description: regulator that supplies the vdd voltage
>     vddi-supply:
>       description: regulator that supplies the vddi voltage
> +
>     backlight: true
>     port: true
> +  reset-gpios: true
>   
>   required:
>     - compatible
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> index 90cce221c0d1..3d7761717b74 100644
> --- a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> @@ -33,8 +33,6 @@ properties:
>     iovcc-supply:
>       description: Regulator for 1.8V IO power supply.
>   
> -  backlight: true
> -
>     renesas,gamma:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       description:
> @@ -51,6 +49,7 @@ properties:
>       type: boolean
>       description: digital contrast adjustment
>   
> +  backlight: true
>     reset-gpios: true
>     port: true
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
> index 1cd219b510ee..740185f778a1 100644
> --- a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
> @@ -33,7 +33,6 @@ properties:
>       description: Regulator for 1.8V IO power supply.
>   
>     backlight: true
> -
>     reset-gpios: true
>     port: true
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> index 4ae152cc55e0..ebfc825b8346 100644
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> @@ -33,7 +33,6 @@ properties:
>         # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
>         - xingbangda,xbd599
>   
> -  port: true
>     reg:
>       maxItems: 1
>       description: DSI virtual channel
> @@ -44,9 +43,9 @@ properties:
>     iovcc-supply:
>       description: I/O voltage supply
>   
> -  reset-gpios: true
> -
>     backlight: true
> +  port: true
> +  reset-gpios: true
>     rotation: true
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
> index a58a31349757..85c5dee65383 100644
> --- a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
> @@ -31,9 +31,7 @@ properties:
>       description: Negative 5V supply
>   
>     reset-gpios: true
> -
>     enable-gpios: true
> -
>     port: true
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> index 0819f38a9d2c..7fd9364fa385 100644
> --- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> @@ -16,8 +16,6 @@ properties:
>     compatible:
>       const: startek,kd070fhfid015
>   
> -  enable-gpios: true
> -
>     iovcc-supply:
>       description: Reference to the regulator powering the panel IO pins.
>   
> @@ -25,11 +23,10 @@ properties:
>       maxItems: 1
>       description: DSI virtual channel
>   
> -  reset-gpios: true
> -
> +  enable-gpios: true
>     port: true
> -
>     power-supply: true
> +  reset-gpios: true
>   
>   required:
>     - compatible
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

