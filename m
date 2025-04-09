Return-Path: <linux-renesas-soc+bounces-15671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E0A8260F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 15:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAEE53B1787
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 13:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C456B265CDA;
	Wed,  9 Apr 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4aEO6G/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78626B949
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204460; cv=none; b=qW+6ydvzbXbLobGeVlck+e2Lkx8xFio2CT2YRYEM4iHXtJPG6D0KI8/k/TLPQDtxTaygod2GzpUPQLQwdZAhsUK5w0t1VTMIYgmcPKqe6N9BERy8rvTVaVJSCHQOh+4FOiod83b7q6r5gTXx1umizoHuOUjWaWH0eCH72JjTZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204460; c=relaxed/simple;
	bh=KlRJ4h1RtUXYsvkfjbfJ1M2zEf44FH7yRM9DCeiwk0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZW+6LvYq7Vds5E2h/CvPIK80ueDj3r8gOHsWPtWsiOS4yplhqhzKdBGv2oD7NR6d/FaeKCWBuwzW+OyUQ/eCT4RmbtlM2ZxmvxALz+RWdjtE+mUtId44S7tjrfosDGV62fD4Qso5BhrEk/YWkUn1WlYOQNbSXe+Il36LOYeWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4aEO6G/; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6fedefb1c9cso56412717b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Apr 2025 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204458; x=1744809258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+6RQVAy08q5QntwZpeV68DAZSbuwCEOXS0sm5QMLNQ=;
        b=P4aEO6G/kWPRC/bXJlBqXBx0Kic8iraeXE1yxYBfiXDyIO7pNUHInGNJZYqwcLDMCW
         KWi/fPZfakaBa9KFGazb0UdDw+i/UiLBBuKUARCZO6fdteZsUlPiVMy/GF1ppCzkjOHP
         1X9ytFzvGlJ4L2nFEGQxgoCn1JEoCpLsS8O7GfiUo4rCTCXzyqtYXkD5hoArtgqFKc4z
         Z++PvcbE+QdMB29ECRvw8KcNxiQWjhbajJ076gvrW5kGNf7OEJ1hUrZbNSuzTr/V247t
         bGrdxVPPE8x2+hRaYlFZmoAZI80SmsNEu8rqPIMy/ev6236TC8CTSvWPbjPTjM3e0NX8
         lICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204458; x=1744809258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+6RQVAy08q5QntwZpeV68DAZSbuwCEOXS0sm5QMLNQ=;
        b=gkIrCVkaV2+k7Mu1VZ8QBnnGB7p4BNDZpCm5F5UlkhGVmLGg0y7quPA7Dlutlw7ICC
         ojR61MdV1mt2P+r1Oh3grb3Mi0nl6QOBwfSjzGxa1k8t7NEd3+P/HqY+PfR/SaL7azvR
         e+LhEr4pT7K9ot3PyRfPPRV+rdeDC6S6EypnriMP8rts2mmNf9GSSpAIDpd9C+kyV5c+
         9mv8UqIb/ypfy16apQHJrNGXV+hvL/b3sVtPJObv3VK7VLfmBmaE8rrCIecbvqBAp84d
         MyKzk08kUCzT7oIIfw8CoSmZGDgZVtoelBZo2yWcgUcD/Du9/XQIgw9jPjsFr1BibJEw
         Ue2w==
X-Gm-Message-State: AOJu0YxSUc55JXM/e+fgEYfF6RhacpImu9PIas2J8bmOeb1u3nIYe5v3
	ZPKWctml7Jd/j8iMYohpeSspHFeapYZU7gYtCRw5OP0DuEmv3XXPgkRpCdek4kC5d6Plr0bM812
	NLpMFAHg0VPBdfiALQUcOKAfB0yRI9wNElqPRbA==
X-Gm-Gg: ASbGnctt2m4msFy0R7hJik2gNQlYmSIHEOoGxq4Cvc8LvHkDkD0sf+I8ckY4INn6uJJ
	OMqfCvhnQ3In+FsXRisgM0zaYAqk+4SxWEKSvf9W6kbjNTrUZs3ORexoc0noqgp73NUT2bvONNA
	C3MqLMRy+Qd4vWbAe4QO/XLNU=
X-Google-Smtp-Source: AGHT+IGpCjRbWI1wcu6YLc0GOTRr2EM80/vGMdWLjTgAe2bdQKUZa1RciaEJ93Fln0HjztGJeVIK2U2xodegRz6duUQ=
X-Received: by 2002:a05:690c:9b07:b0:6fd:6589:7957 with SMTP id
 00721157ae682-7053ae8ca3bmr44770127b3.32.1744204457852; Wed, 09 Apr 2025
 06:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250405173631.13564-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250405173631.13564-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:41 +0200
X-Gm-Features: ATxdqUES50V-06ap_h6xaxSwTaW3uAFy-TvFUuqh8V_3zS_hOVhAzcuaRZvAywk
Message-ID: <CAPDyKFrXgxCpWQabv2NgRJYCYf9E38+_=b2ZhbhOK=eExaVQ-w@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 19:36, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This instance has a wakeup irq defined. It is currently not used by the
> driver.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Change since v2: - rename "wkup" to "wakeup"
>
>  .../devicetree/bindings/mmc/arasan,sdhci.yaml | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> index 9075add020bf..8e79de97b242 100644
> --- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> @@ -38,6 +38,15 @@ allOf:
>              - items:
>                  - const: clk_out_sd1
>                  - const: clk_in_sd1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzn1-sdhci
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
>
>  properties:
>    compatible:
> @@ -45,6 +54,10 @@ properties:
>        - const: arasan,sdhci-8.9a                # generic Arasan SDHCI 8.9a PHY
>        - const: arasan,sdhci-4.9a                # generic Arasan SDHCI 4.9a PHY
>        - const: arasan,sdhci-5.1                 # generic Arasan SDHCI 5.1 PHY
> +      - items:
> +          - const: renesas,r9a06g032-sdhci      # Renesas RZ/N1D SoC
> +          - const: renesas,rzn1-sdhci           # Renesas RZ/N1 family
> +          - const: arasan,sdhci-8.9a
>        - items:
>            - const: rockchip,rk3399-sdhci-5.1    # rk3399 eMMC PHY
>            - const: arasan,sdhci-5.1
> @@ -109,7 +122,14 @@ properties:
>        - const: gate
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: int
> +      - const: wakeup
>
>    phys:
>      maxItems: 1
> --
> 2.47.2
>

