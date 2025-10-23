Return-Path: <linux-renesas-soc+bounces-23550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F1C039CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2664B1A6198A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ED8231836;
	Thu, 23 Oct 2025 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1SEwrjh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1293E191F91
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761256219; cv=none; b=UGXxhh2zKsDWKKPMOkZjXjcHOf44iaK4e4anFgJmmgE8ZlO7i6sLVumYQOicxrL5sIxHXRzOMbPDJyFsgNkO0GShCvGcU4fbUggJETstsXuRbdgrwnYSnduONlaFQsucOMb0Lbm+cN/V7mcBx1cXY/JUEynOxohWdP80n6A2HuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761256219; c=relaxed/simple;
	bh=0crdkRWL2i52N8DjaLjPGWqZ+qR9vnRSb8AxmG3G5jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTl26+fF0LePIul1uVI9WAncBOQPJsOM8B8BfKMyLbcTOKcPRwv2JulI6f2vhvK+c+Pr2scsov2K/oB6rByhGQ7UNaOskSVUoPnu+Psv6c9eNL6BXyqt3dAKdXUMPhHJaK1WPzErPW+V9M81Ukhq1EE0xzsAlntuqEaXHBbQ42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1SEwrjh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so2531580a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761256216; x=1761861016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTxd0N4ykd7gve6I0VI6xvQpfS9jPjV5mFGiKktW21o=;
        b=F1SEwrjh3GuuKfLFMQdbvKrV+ETF04xlvaypgRB84tFPaVh24wshsL4yLG9sLLj1uq
         K4Ca+UWdrgvxQuLcu8SApM1nfHdHWQdUuqMiEnDKKVUf5CezdyIn75Rqb4qd3MRUBRox
         wUKLDbT8b+hxUSourq2iAL/4ergYPhH2+s9WrxRhhM3+B4UtXjdrMcoBv2EsVxgncfvV
         YXuBylJFcF7b7oti0WAGzv9UIXgp3p5jhR3hNDk4wOUJgB2eINVFvRd0jTvFbp+C/OgA
         jDIMCWVaWfVhFGtIdPK66ZzzSl6tEM0pXOLE795FW+Aava05xgsLBkEQvQHz5zwCI2Js
         ZGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761256216; x=1761861016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTxd0N4ykd7gve6I0VI6xvQpfS9jPjV5mFGiKktW21o=;
        b=PrzYEuHQJvsrUXCr2I8cock631KEm90sWWeOeX8AVvKOow45ASInPEwdpH4tNbI8WJ
         hPZ4mgGz0HcrjoBA0ILNIP7wjQ9Ll1XDLKgQbc2eeKifPwecN4AAaXhQirKiwZMhqxk1
         6/g7G6DtM0Nh8kfGYQut/3dqWd8EiCwUBA5tNeYySIypEGQqAMfhvFTz3tWSECTLC+Q8
         Pz66Iu2AkIACM/OTtdUVkJZ6ynUx3nWnaLsWTDjbslfbFIx4hKn7EUHvB1NaQw0Q3Tjk
         vJDDkpxMz8dRG6g0LKU/2ToiHClnBbHJVzrUTWTSKOb0rauvYaQJb7uyDFPA2b6SjfA6
         kp7A==
X-Forwarded-Encrypted: i=1; AJvYcCVQO7lETxYlZJXu9IAMCfc9IIcjOCCjq7E92kdv6255x0Yu7cZ2taOnpix521ueyuIFTN8TmRuNo8kNbvuy2kRZlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyznPORYu9hbW8JwKFk7MXDVk3Z0HsbjaIMfX00541EQmPdShZV
	EO3FURaELKvrfVgsb7uus4K9aB3/ByAbe/7uTTt8fRL4lqXbY+vvXX9PzPwnfEKnNR5SLXRQY2R
	0+CmkMIwaPZkCzQIXjH+OmB8lu/Zr4ag=
X-Gm-Gg: ASbGncvqZAZUnT38UvVuw+B1nlsQYM8jo1G8A7d3pfu3GlS/cRsRIIyvR58b6EoExQW
	1QFCQK8qsUmnEIY8lGxGHRyF3COKN38vFAyAM4N52Zs1PEBcSmlnjlf5HGt3IfXgilMuzkX0ssH
	H288b+yffuCWR6D56xAKnMChIpzqSCF64DFLz8jWikAcbmTE1SNI6sFLOZEqTewra2EATSi41X7
	dC6+fOymJLdKWkW46jvodh3lO/0TiV22jyZbhxpr9FQFybYV//sjRX9v/giOQ==
X-Google-Smtp-Source: AGHT+IE6DRq0G5t3WynJX8AdK871ej0FvwPBp17WZkIlAW429pCOMu5FAtpCqnXjVceYtZYEL30EdgTdYQqDcgDyYOw=
X-Received: by 2002:a05:6402:2787:b0:637:ab6d:71c0 with SMTP id
 4fb4d7f45d1cf-63c1f62af92mr23616460a12.7.1761256216068; Thu, 23 Oct 2025
 14:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com> <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
In-Reply-To: <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 23 Oct 2025 22:49:49 +0100
X-Gm-Features: AWmQ_blarlbB60Z8ciGxdUOyDe13AFqtYqI4foOh96GGz7YXVmq0KoeyJzdQ_-4
Message-ID: <CA+V-a8sCvhepEL1RnsemN_84U9gcLLoGBnOUtY0zLsZO+kcu7Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: media: Add bindings for the RZ/V2H(P)
 IVC block
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, 
	biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the patch.

On Thu, Oct 2, 2025 at 11:38=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The RZ/V2H(P) SoC has a block called the Input Video Control block which
> feeds image data into the Image Signal Processor. Add dt bindings to
> describe the IVC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
>
>         - Rename RZ/V2H to RZ/V2H(P)
>
> Changes in v3:
>
>         - Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
>         - Update clock and reset names
>
> Changes in v2:
>
>         - compatible matches filename
>         - Added power-domains
>         - Aligned clock and reset entries on opening "<"
>         - Removed status =3D "okay"; from example
> ---
>  .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-iv=
c.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8e236e46882668b2660d175e8=
b2cffe204aa781c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Input Video Control Block
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +
> +description:
> +  The IVC block is a module that takes video frames from memory and feed=
s them
> +  to the Image Signal Processor for processing.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-ivc
Nit, `const: renesas,r9a09g057-ivc # RZ/V2H(P)` as done for the rest
of the Renesas bindings.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Input Video Control block register access clock
> +      - description: Video input data AXI bus clock
> +      - description: ISP system clock
> +
> +  clock-names:
> +    items:
> +      - const: reg
> +      - const: axi
> +      - const: isp
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Input Video Control block register access reset
> +      - description: Video input data AXI bus reset
> +      - description: ISP core reset
> +
> +  reset-names:
> +    items:
> +      - const: reg
> +      - const: axi
> +      - const: isp
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    isp-input@16040000 {
> +      compatible =3D "renesas,r9a09g057-ivc";
> +      reg =3D <0x16040000 0x230>;
> +
> +      clocks =3D <&cpg CPG_MOD 0xe3>,
> +               <&cpg CPG_MOD 0xe4>,
> +               <&cpg CPG_MOD 0xe5>;
> +      clock-names =3D "reg", "axi", "isp";
> +
> +      power-domains =3D <&cpg>;
> +
> +      resets =3D <&cpg 0xd4>,
> +               <&cpg 0xd1>,
> +               <&cpg 0xd3>;
> +      reset-names =3D "reg", "axi", "isp";
> +
> +      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
I understand we split this up from ISP, there are other interrupts for
ISP for example 860 which is similar to 861 where it outputs signal on
rising instead of falling. Do you foresee this interrupt being used
for IVC?  Rest LGTM.

Cheers,
Prabhakar

> +
> +      port {
> +        ivc_out: endpoint {
> +          remote-endpoint =3D <&isp_in>;
> +        };
> +      };
> +    };
> +...
>
> --
> 2.43.0
>
>

