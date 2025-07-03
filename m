Return-Path: <linux-renesas-soc+bounces-19088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78086AF73E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 14:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 923FB1C85329
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 12:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92FD2E7F1A;
	Thu,  3 Jul 2025 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLH/Rf98"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8938384
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545191; cv=none; b=Wo/NLI7rN5oP/MlHnzBzy88mxaHUwZxnxabJg/FxsB58WTdabNEa/bdE9S84ew6xHaZjzKfg3NoyUc4toLzCybnBLZTOdhJyXXtYwte3LgaRWakdcy3Mx1Ng5P8d2Xyx0mmVEE29dAenvKLtiile7CsdvwwqnY5IeBrkLZiMgQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545191; c=relaxed/simple;
	bh=z8FZnR4Rw/qWdYY8qz/fLFF2yrmytUH3WBZHq3bugK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VH452029TfFKoknqeDqLHcorGm6XUv1t2I1stdT3a52Y+uUlxKcRIiII3n4RCVsA3hvk/2BS/QsVEz34hqXY7UItbgPVBHhFBnjOabRn3trN24zZCdmrCXLEi8Oo4MBSoVBgms7x+RuGPqOZ1vSIaYQEir8RY7E0mcfsOc6DykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLH/Rf98; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8986a25cbfso1417610276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jul 2025 05:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545189; x=1752149989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2wuby6dihOR3rr2SUBYnQ0Uq7yXMHWKxft/QT/79xE=;
        b=eLH/Rf98JC/HMuL7KJZBbT6Ya9KGteDjP9Kh4ZPe36Q88AcLivWi60GCowxr/Cg9jv
         A01pT5MtEtQAV5EzJkZP67t/lNJ58hKDUHG/bgyi/C/ysSjB6HamHtUYS0pkjDs9l4CP
         eyaAnYETJ0+8ztO1TwB644c+dSA7Os8yO7138nTREOR4e842Oh+JavV4rQlNkcPLTai/
         uWD90AxCTZPRufjnJnVQqXR5YML7gm0pY8g9svTI+N7UFDd2WDbcpboSW9V3BXLEJqRe
         zQjqL1J4UuMyv0esy4cn3XLr8cjhtdrhTKEVjm+T4k/zIRafPCKG2CYPEJ7SYF4NpPTi
         y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545189; x=1752149989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2wuby6dihOR3rr2SUBYnQ0Uq7yXMHWKxft/QT/79xE=;
        b=vSglaJcNSh5Mz2Qy73XjuHntPuSisM+JnaTRkj/VMepxrqE+C9IWXNy8zYZotId3kr
         mnqZiLJgsc2FiKhP4dnnligvcVQZEZnfUfO6FszBqhqIzNxggXtdc4MiTP7D6zEkCjwd
         tYykd4gSmntWflBdthqroZeQC39oS8aGIfGxqufFTEEFBOgPhHx3zrAektkG6bba1Fge
         FThfuty2wqWZWOrTUdJdojfukS+3pt2LdMj1EQ8lVFT/3iWupDQjJ1X7G7vDHjoNjkTE
         WeDKqFlBlfe4DPUo1bhmbe//6aOGa0rNSIjX6r3BaGGaH0VQCJC79pvSon8LzEaL9us8
         LbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg4TLvtcIwyG8M+GvFgwB2dXeMe6UOSgTZZ/SFgwRKcXzxXnE1lPQoVZRJTBjtiw5JzZOOdOGRu5Wo/PnoosuwKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fam+vksWKLjLSaXvMWQTJzbsDdK9qaY+GgYc8PSg9O50vowT
	128FQwrl5uCF1GTERp7hBpGykrVrgjnJEb3f8hG14qLgm/zsjyq8ktoal1nvKmy2s9ibFtUlYAY
	RCGu/tXyS8vXpnFF3TB1dOmr/2X9GUHLtwSfiJT+6IQ==
X-Gm-Gg: ASbGncuwjqZohVJUSbs/CB1pBeANmz56/3pYS+AtWIB3wvK68idDSCVy8dRfE0iY86g
	SK7w8bA27BdG0y6HwgsbzKbEcogvY/zsl8hM2eMm2pQoq7UqdbEhJTttfdxgH24r0vIzadRJ342
	iy1mXJtfstcjpfrLo98nDAcEs3rD8bfPHMomw/fBqPOLBY
X-Google-Smtp-Source: AGHT+IEeRTEttwsTQvILUVHrceCqzM9cMbjNTuLR5NzW92fxDyMdJhdnzbpkuw2WPjwuUny5S4J+pKNydZxICX8WeYw=
X-Received: by 2002:a05:690c:14:b0:70e:2cf0:f66a with SMTP id
 00721157ae682-71658fd7204mr50507077b3.6.1751545188852; Thu, 03 Jul 2025
 05:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:12 +0200
X-Gm-Features: Ac12FXxJYgE2tX-oOlBR7QzPvk6TF-AjaS4HJVIbxSdXpqqJydqW899apydF_zo
Message-ID: <CAPDyKFqWmqO=Lw9yfLKV+zrwegGe_oCk3h2SWxPaU+_s2XnQjg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 18:49, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback since
> the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> allowing reuse of the existing driver without modifications.
>
> Update the binding schema to reflect differences: unlike RZ/V2H(P),
> RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> two clocks instead of four.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
> - Added the high speed clock to the clocks list.
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 85 ++++++++++++-------
>  1 file changed, 53 insertions(+), 32 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 7563623876fc..ba15ccbda61a 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -72,6 +72,8 @@ properties:
>            - enum:
>                - renesas,sdhi-r9a09g047 # RZ/G3E
>                - renesas,sdhi-r9a09g056 # RZ/V2N
> +              - renesas,sdhi-r9a09g077 # RZ/T2H
> +              - renesas,sdhi-r9a09g087 # RZ/N2H
>            - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
>
>    reg:
> @@ -129,59 +131,78 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - renesas,sdhi-r9a09g057
> -              - renesas,rzg2l-sdhi
> +              - renesas,sdhi-r9a09g077
> +              - renesas,sdhi-r9a09g087
>      then:
>        properties:
> +        resets: false
>          clocks:
>            items:
> -            - description: IMCLK, SDHI channel main clock1.
> -            - description: CLK_HS, SDHI channel High speed clock which operates
> -                           4 times that of SDHI channel main clock1.
> -            - description: IMCLK2, SDHI channel main clock2. When this clock is
> -                           turned off, external SD card detection cannot be
> -                           detected.
> -            - description: ACLK, SDHI channel bus clock.
> +            - description: ACLK, IMCLK, SDHI channel bus and main clocks.
> +            - description: CLK_HS, SDHI channel High speed clock.
>          clock-names:
>            items:
> -            - const: core
> -            - const: clkh
> -            - const: cd
>              - const: aclk
> -      required:
> -        - clock-names
> -        - resets
> +            - const: clkh
>      else:
>        if:
>          properties:
>            compatible:
>              contains:
>                enum:
> -                - renesas,rcar-gen2-sdhi
> -                - renesas,rcar-gen3-sdhi
> -                - renesas,rcar-gen4-sdhi
> +                - renesas,sdhi-r9a09g057
> +                - renesas,rzg2l-sdhi
>        then:
>          properties:
>            clocks:
> -            minItems: 1
> -            maxItems: 3
> -          clock-names:
> -            minItems: 1
> -            uniqueItems: true
>              items:
> -              - const: core
> -              - enum: [ clkh, cd ]
> -              - const: cd
> -      else:
> -        properties:
> -          clocks:
> -            minItems: 1
> -            maxItems: 2
> +              - description: IMCLK, SDHI channel main clock1.
> +              - description: CLK_HS, SDHI channel High speed clock which operates
> +                             4 times that of SDHI channel main clock1.
> +              - description: IMCLK2, SDHI channel main clock2. When this clock is
> +                             turned off, external SD card detection cannot be
> +                             detected.
> +              - description: ACLK, SDHI channel bus clock.
>            clock-names:
> -            minItems: 1
>              items:
>                - const: core
> +              - const: clkh
>                - const: cd
> +              - const: aclk
> +        required:
> +          - clock-names
> +          - resets
> +      else:
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - renesas,rcar-gen2-sdhi
> +                  - renesas,rcar-gen3-sdhi
> +                  - renesas,rcar-gen4-sdhi
> +        then:
> +          properties:
> +            clocks:
> +              minItems: 1
> +              maxItems: 3
> +            clock-names:
> +              minItems: 1
> +              uniqueItems: true
> +              items:
> +                - const: core
> +                - enum: [ clkh, cd ]
> +                - const: cd
> +        else:
> +          properties:
> +            clocks:
> +              minItems: 1
> +              maxItems: 2
> +            clock-names:
> +              minItems: 1
> +              items:
> +                - const: core
> +                - const: cd
>
>    - if:
>        properties:
> --
> 2.49.0
>

