Return-Path: <linux-renesas-soc+bounces-22566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 440ABBB3926
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 12:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A961818826ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3493F2FB0BE;
	Thu,  2 Oct 2025 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws+ShSH7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC62DCBF1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400016; cv=none; b=soToNs125nj52AI6jzJKRC8LGJFaDrdjPt90AwYAAgW5N+TIJlPv6XdetvBa4qA3nbZ2XWsRMdbETG0xfH5tizEjaG+jzS9jfoSw+d4yJS9dwsrZmr/mBMhpSqsfaV4YuXH0BvP596Q3mgF4dYJrG1DcaUqy8t59k897ib1d03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400016; c=relaxed/simple;
	bh=kTHkVX8EgYDO2X59Ce3pbQkFy7te9tyOFYwQAujfCxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rts4Bu/cPWgQAN15ORAHdAIKigIQVXL8qFA9qGF064FZPGfEqF20cXZz3qVhPqgPCfh5DLP2AsVlGG/VdtSIhTIb+Q7JPtvJdztm53Axcn0iEWGLFfAv7S5fgR+zFAAW9IOwpU5Ghd7ftcstUwATktgbhgR/UVhsjYxyHWGONYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws+ShSH7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so495122f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759400012; x=1760004812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoUZVmG+wanthu+Vrxr8Ind4+3GaVeaFdXzwUAH9pE4=;
        b=Ws+ShSH7PI7WMB+7tphBVS5YUW1flVPHruovgPH48HAuKyP88x8JJQ2ZkUNfaPB9Qx
         sJSX61qxlrpgJdFiKM9mXh5ev9TJFtJUAud+lfUO0stp6q/uXLhd5kBdes4RIeRWZ9iC
         N3npS97bzdINd9PKuekrsm6jpXCgq/zP750LIVlI0XW1niZkWaJ9soJfm6OMDPU8lBCy
         /fOkJ5EIzc9U9G67G2Gnkp9ySjqIN99cbi/7X3VlM/U9vKE3cq56C+s0zZ/xxQb+SRuf
         dDJfxPbC4bKHYeGXxO6+GfMMc7zNaO8Hcfyjhk6PCrFMN4R3272cVN6mZl6r9HM+7A8H
         pv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400012; x=1760004812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoUZVmG+wanthu+Vrxr8Ind4+3GaVeaFdXzwUAH9pE4=;
        b=CbNcMCY7wRt5uHbmVOojVkMT1nYkTnsKH2iJ++ZAF9KS5hh9g0m/Ov1biqfFndcf31
         w22BcoXF7dWfjfzU1fzIfRveYZzrSIn9HZUvyKkt2fDVUktu2UHhL8nh0o3ZKtpZQwQG
         is25oW7mU8dNTZLSl79QsJS2/X+k4vyfc5XPj7Qb4jme69I8goWPWp+CH6kVlwjNreit
         SgvVKyJwxrOxTgWotPc3zJFwFOU4RogxZai4LCeel2O/Svtu49MxeRo2DCPtd0C062Nj
         jCaUc3c4HwNTWjZ5qamGTpyPr39eG+nzO7qOP4vJNgxpb9LIfn4yJZKkVuBu0wC6RQzl
         PBxw==
X-Gm-Message-State: AOJu0Yzu3qlu18btPhBZjMhjNyF576koovJeOAkfKvFAcZFZoyn9nyr+
	/uT5iiOCy8J36vDQZZJYd+DFpS4v4I1hJhiednJOAhRDctJ2vjxNkVuhqU9NxXIcjOfV0wKRDTQ
	Kvc7EX3sFMsq4pT9nKa5bimlwbOquzsnBDdatwH4=
X-Gm-Gg: ASbGncu2Gq9b3PMycWzMbMHwhXwr8j2/ncG+st0rXXyKyxghBF9LEiFHEYU45KR+EYv
	UhppSErrAAhbJ2j3wTGh1h60TDQgVrzvemN3CiNa3pBaLS4ohhQmbaCKRP5s1j7UJ5VgsCDBJZ9
	p6L5iCC738IugD5OW68uNZZ+D2HXfbnc6TLrp4n4ItS4LyxzS+ktzagM4Z+v0QZQRnkjgIcLXm2
	Us4Iv/AfzZJcNPGyaZZM9ZY/AYiDjmWsei73qpybrHqQflLxAWTHf/JTkmFES6k
X-Google-Smtp-Source: AGHT+IE0GzPYKQ+fQSyj0QL8Rt5wckBDXV+aNww7i555ohXgN2TPamhwpxtI9xW1ZdKcsCnQ8w+9QUTKBmDlB5gjRCY=
X-Received: by 2002:a5d:64c8:0:b0:3e8:ee5d:f31e with SMTP id
 ffacd0b85a97d-425577f35c5mr5418574f8f.25.1759400012304; Thu, 02 Oct 2025
 03:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com> <20250926112218.28723-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250926112218.28723-4-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Oct 2025 11:13:06 +0100
X-Gm-Features: AS18NWDNRNrjESTbI6iot2OorbGJTsxauUcvGEKTyTEYkhoGmaaITd0BUgQ7JIw
Message-ID: <CA+V-a8vyVkGo+LhdHCzxm4JE13nO_u=9kPT5xr=YgLu0FtWtDg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the patch.

On Fri, Sep 26, 2025 at 12:22=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/G2L watchdog to make handling easier.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 ++++++++++++++++++
>  .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
>  2 files changed, 112 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rz=
g2l-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt=
.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> new file mode 100644
> index 000000000000..77d325415280
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +              - renesas,r9a07g054-wdt    # RZ/V2L
> +              - renesas,r9a08g045-wdt    # RZ/G3S
> +          - const: renesas,rzg2l-wdt
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-wdt    # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
For the RZ/V2M case we need maxItems: 1 for interrupt-names or
interrupt-names: false.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wdt0: watchdog@12800800 {
We can get rid of this label.

Rest LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> +            compatible =3D "renesas,r9a07g044-wdt",
> +                         "renesas,rzg2l-wdt";
> +            reg =3D <0x12800800 0x400>;
> +            clocks =3D <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
> +                     <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
> +            clock-names =3D "pclk", "oscclk";
> +            interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "wdt", "perrout";
> +            resets =3D <&cpg R9A07G044_WDT0_PRESETN>;
> +            power-domains =3D <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 12ba07781763..2a15c012fd67 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -13,19 +13,6 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> -              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> -              - renesas,r9a07g054-wdt    # RZ/V2L
> -              - renesas,r9a08g045-wdt    # RZ/G3S
> -          - const: renesas,rzg2l-wdt
> -
> -      - items:
> -          - enum:
> -              - renesas,r9a09g011-wdt    # RZ/V2M
> -          - const: renesas,rzv2m-wdt     # RZ/V2M
> -
>        - items:
>            - enum:
>                - renesas,r8a7742-wdt      # RZ/G1H
> @@ -83,16 +70,7 @@ properties:
>      maxItems: 2
>
>    interrupts:
> -    minItems: 1
> -    items:
> -      - description: Timeout
> -      - description: Parity error
> -
> -  interrupt-names:
> -    minItems: 1
> -    items:
> -      - const: wdt
> -      - const: perrout
> +    maxItems: 1
>
>    clocks:
>      minItems: 1
> @@ -140,8 +118,6 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a09g057-wdt
> -              - renesas,rzg2l-wdt
> -              - renesas,rzv2m-wdt
>      then:
>        properties:
>          clocks:
> @@ -155,25 +131,6 @@ allOf:
>          clocks:
>            maxItems: 1
>
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,rzg2l-wdt
> -    then:
> -      properties:
> -        interrupts:
> -          minItems: 2
> -        interrupt-names:
> -          minItems: 2
> -      required:
> -        - interrupt-names
> -    else:
> -      properties:
> -        interrupts:
> -          maxItems: 1
> -
>    - if:
>        properties:
>          compatible:
> --
> 2.47.2
>
>

