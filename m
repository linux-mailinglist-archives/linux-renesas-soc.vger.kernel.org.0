Return-Path: <linux-renesas-soc+bounces-3304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BC86A93B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 08:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7E51F27152
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 07:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE66625605;
	Wed, 28 Feb 2024 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPq4imta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232524B35
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709106573; cv=none; b=Z7ySItTfH/L1qiBvAMFlo/1HM7QRxe3wCVITSXYTZF6vXj9ZIWH0wDhH8NbeKWuiLvzdoKXe11mi1OO3T6wxQtR+fMnnOVUvwgiNs1mKY57KrktcJOZPcSdZsMQORA8mwOyr2gbVhVii8F3zzrWq8sTunZL2p2h8VEX3/u+oNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709106573; c=relaxed/simple;
	bh=WFN7/lUH6RwJ2+sf0RqXLI43yf9QN80xkckOnnzrQUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fheDXRaDq8ZMFn8SKKe3DjK0dIIXg4X86GS8UdNVU7Jorvs0es43jGq9n1axCN3814eOoIe3J5N6T7W6pfBKc0+Wg0KSrzM/zsS0GeOx5hUEwteBUqywb+U0xTxxXeB3HvvrPIAkMhi5a4qBnklQ6GavJJd5NYEryqCHqsnTRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UPq4imta; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3f5808b0dfso701558266b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 23:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709106569; x=1709711369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKrZx4rQx+SGL2XEt1doYPQ0dd+jwUDctUpdX2vjMY0=;
        b=UPq4imtalVFEQJI1opjqbZvm2u8jfMCAYjTtU5VUriZWzVds/j7zVFZxq5dZ2EdTXL
         iLFKlhx1/t6CXpyf7ym+6IuChtNwurm+Rfrq35T6uizIuFDEIjPgxtoTRWsiIDfX+0bL
         +VzZ7lfKvyk/QgxDZ/PJ0iRHb5AEHTLmAnw4gQlRDzJgkgtr6iMhXRJg7Ub2NCV0V6Ng
         PhTzL3nnOlj7EPy/l0/kV5PLQxVxs9UJ/vCtnNFoVOg+24Irvl28ufF6yG0Q2p37nqOm
         VVQiUpKyyCouLV3MDtRvJPx9evfjQE4MVDMg+GI5DY9zNI2PGCisx83oJBRneCuPlcLx
         Ea1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709106569; x=1709711369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKrZx4rQx+SGL2XEt1doYPQ0dd+jwUDctUpdX2vjMY0=;
        b=wpKohU1e/8eAh9pHQWgT/DNFwtB9zl9+pRO52CcL3jcLOAkf1jb/yvcYQYHFVPLuAG
         0hOmujNWQ6QwEbcNcG7DovZmNypJmh6/D9ALgAdgA500RMT6J3otyoKNChxYnOFaXOGE
         AUd17QPK9Nzta9Vy/RMFzUGJsZkeNhEu9UXh/MPvzZNpF2pyUtrCKdINl/2hw+PmUIIq
         ppuuDKoAHzAYeah0PUpClq6yFaMMlo7WYiocu2bh8Znn0e4Zb/2fbcWEGzDgJLrTUEH6
         8WFuD8JInODGAO6j8iA0QunoJOWkNJIYMfQaeufJZk70GJCXHValMCaK7CQ07fCd7Bgg
         Q8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVwPYGS1+2CAWPpAt4wHXBGVxZ1laWO8letCvgDDVG/chr2UoPqnq18OsYIqOY8cWmcDIUdU+F4XkJINxuCpEGH2CEgDWa+vtbtECf1D1r0DM0=
X-Gm-Message-State: AOJu0YwTbShYvt/BGeHHCE5KL/LzelCbtc1jsxLj9QxwShHA0ne5hOoB
	0moPOoDdYrv6RdQlyy8BMk44rG/IYX1LunYZs4bdhd4BbCGwSE4wSIN5gHAwUJs=
X-Google-Smtp-Source: AGHT+IF+fO+D2Csy1IYH5b3fkbLAf6Hb/i2uabMJZjsRLFw2gZMO/X1t8Th87KoN7a/OOV2hvc1y2w==
X-Received: by 2002:a17:906:13cd:b0:a44:fb7:d42 with SMTP id g13-20020a17090613cd00b00a440fb70d42mr217379ejc.2.1709106569506;
        Tue, 27 Feb 2024 23:49:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vg8-20020a170907d30800b00a43a4e405bbsm1493367ejc.115.2024.02.27.23.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 23:49:29 -0800 (PST)
Message-ID: <8e4e05f9-5bd1-4f31-a2ae-fc1567405c11@linaro.org>
Date: Wed, 28 Feb 2024 08:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: renesas: Document Renesas
 RZ/V2H(P) System Controller
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240227232531.218159-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240227232531.218159-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240227232531.218159-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2024 00:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add DT binding documentation for System Controller (SYS) found on
> RZ/V2H(P) ("R9A09G057") SoC's.
> 
> SYS block contains the SYS_LSI_DEVID register which can be used to
> retrieve SoC version information.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1 -> v2
> - Dropped extal_clk node from example
> - Replaced RZ/V2H{P} -> RZ/V2H(P)
> - Dropped description for clocks & resets properties
> - used <cpg 1> for clocks in example node
> ---
>  .../soc/renesas/renesas,r9a09g057-sys.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
> new file mode 100644
> index 000000000000..72bf8e733dcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas,r9a09g057-sys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) System Controller (SYS)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:

You need | to preserve formatting

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


