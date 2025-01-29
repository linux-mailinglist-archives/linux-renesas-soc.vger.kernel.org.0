Return-Path: <linux-renesas-soc+bounces-12719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C1A223F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 19:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2256E160E07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 18:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A090190696;
	Wed, 29 Jan 2025 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3d608kD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2825A643;
	Wed, 29 Jan 2025 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175655; cv=none; b=AzlI4WLdEm0OVqCG53Ejj8pwQSXEJJAew/EtZQtNfvMhLNVK3WUovOAQ3Kk5CF3SwMHLiXnTFc6EFPphSyx0NMpjq56jaGNgzpDn1N1yfp2S6deG7y/skJr4W7v1FrwZby9jdwilEb5RTjaH9L1VaJfpjbdA64heZogvfbfmvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175655; c=relaxed/simple;
	bh=IRgP/Bzk/+KIMVYIah+4v1UbZ5cRqd5ppAMv/HkKVzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JquKGf1ou32+EXC3Ixf4gd9E8SvPOpbMf8O7Q+rhBx1zx4qCzoZJ405IiUWbuUMX1GotgDvlnxHeywO7Thum1l5N3G4gM6/Tf+SeAqiDOpNJQMP/QjeFTkYvL/pgqr4QwaBLsItnuNZpjMWbsHJl3t505k1CeIjpKjW8G5NlZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3d608kD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE15C4CED1;
	Wed, 29 Jan 2025 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738175654;
	bh=IRgP/Bzk/+KIMVYIah+4v1UbZ5cRqd5ppAMv/HkKVzM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3d608kDGTQmiBwammcy7Bxtm6LOGOrbfTb19FaNiERC2Hk2eD3jeH3NTfxk8naVE
	 HF9RvT4D7iqjqEU7vJbUNNXE8+e1b1CWkvXXqa1De2kFHLf3QbaK2EbaEWt1RKQM5W
	 Uzkv0UMas3qx2LKp5l+QRUapyBQDhFW+UKu1EDw7jNV9NmjnMLZj6XTFf1dnfgu5eS
	 SHSNW2Eb81xuTuxrL2ThCAmz9rdcdmFg3nMnk82o37er8+Bj2Ot0SHkiRV11oeU3Xn
	 QkYTc1cmcBxQPrrLUwhmbmmnWqxQPbC9faKWtO46eQTb4FG83OHN/+HWUO0PXyGXP7
	 nAGhCzUntDKsw==
Message-ID: <315ea715-41f8-4c2b-925d-a6751a425a42@kernel.org>
Date: Wed, 29 Jan 2025 19:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] dt-bindings: clock: Document cpg bindings for the
 Renesas RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-5-thierry.bultel.yh@bp.renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250129165122.2980-5-thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2025 17:37, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) CPG (Clock Pulse Generator) binding.
> Add the header file for the resets and clocks definitions.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzt2h-cpg.yaml     |  73 +++++++++
>  include/dt-bindings/clock/r9a09g077-cpg.h     | 144 ++++++++++++++++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
>  create mode 100644 include/dt-bindings/clock/r9a09g077-cpg.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
> new file mode 100644
> index 000000000000..9a3a00126d2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,rzt2h-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H(P) Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> +
> +description:
> +  On Renesas RZ/T2H SoCs, the CPG (Clock Pulse Generator) handles generation
> +  and control of clock signals for the IP modules, generation and control of resets,

Wrap at 80. See Coding style doc.

> +  and control over booting, low power consumption and power supply domains.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g077-cpg

...

> +#define R9A09G077_SHOSTIF_MASTER_RST	13
> +#define R9A09G077_SHOSTIF_SLAVE_RST	14
> +#define R9A09G077_SHOSTIF_IP_RST	15
> +#define R9A09G077_DDRSS_RST_N_RST	16
> +#define R9A09G077_DDRSS_PWROKIN_RST	17
> +#define R9A09G077_DDRSS_RST_RST		18
> +#define R9A09G077_DDRSS_AXI0_RST	19
> +#define R9A09G077_DDRSS_AXI1_RST	20
> +#define R9A09G077_DDRSS_AXI2_RST	21
> +#define R9A09G077_DDRSS_AXI3_RST	22
> +#define R9A09G077_DDRSS_AXI4_RST	23
> +#define R9A09G077_DDRSS_MC_RST		24
> +#define R9A09G077_PCIE_RST		25
> +#define R9A09G077_DDRSS_PHY_RST		26
> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
> \ No newline at end of file

Patch warning here.


Best regards,
Krzysztof

