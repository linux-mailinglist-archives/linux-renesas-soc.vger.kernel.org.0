Return-Path: <linux-renesas-soc+bounces-15408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2DA7C139
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36B091882FA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 16:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93641FE461;
	Fri,  4 Apr 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4IGLIDk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB58F40;
	Fri,  4 Apr 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782748; cv=none; b=r/hEWhMLgWFB+edyN3Tr0pD8JXdEZUA46w6Ip5on/ewJYyWy0DkKQIXBUh5+/I/MQoSjzWDsjak2RGvVApgaH/68COrBKCN9FiuxCl+Z7hBzalbL2bfOia5k+E2RIs9RkaJL4rFKuhinZ3fPO5eUikodS8DILdm/VyE5VYre60I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782748; c=relaxed/simple;
	bh=cfNPEGNGZFVR60pg7IZLmcGqFLirL/VHGxZTqpX4/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qdt7s/evN/Mn8uVWrIjT/0vOyFUKDOBVLA+cJyOAbG3KHzhSVCGWAw+PkqHjLektI866ecozv4fX4ubuyBJMUBuQkHz7Z2rl6HrhK+p4DUHdoJVvbQnHcSg5PXdPqe9Bl5qxqrWfS3Dw1Dmfv0no2KgZc15eVQX8NbfjPonc6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4IGLIDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B555C4CEDD;
	Fri,  4 Apr 2025 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782748;
	bh=cfNPEGNGZFVR60pg7IZLmcGqFLirL/VHGxZTqpX4/xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4IGLIDkrdsZ8BrF9UkxJLolxOK67Uku8WB2R1ybcC6quePkGmHMqwZ0VekRl4qJE
	 KP9W0muZqrSjJQT7Nx40IlgTYzAYVI3UwpqttWUleG1XnOdDoDZpbXGXagSqloyw8T
	 EzK/QE8ftDBh96+omvLrXbC5Sy/cbAOB8wkGpE8A0YIc/CFrcBNqiG7GKFaMHvWI9X
	 AOLyp+Xh6q8vkKtplFu2o37QzQPwky393AJ/Q0cADk/yNMkjNlN5oVVJyM7mB58ZYm
	 ifRAr0aQ0sSnvzop6HQVAcJVQBCAIs4P9JDuqKlJps2hSbEWkSMQtOQVh06Zs4JRBZ
	 Q9PtvrCfkdQ0g==
Date: Fri, 4 Apr 2025 11:05:47 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Message-ID: <20250404160547.GA1521768-robh@kernel.org>
References: <20250402093019.5639-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402093019.5639-2-wsa+renesas@sang-engineering.com>

On Wed, Apr 02, 2025 at 11:27:50AM +0200, Wolfram Sang wrote:
> This instance has a wakeup irq defined. It is currently not used by the
> driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * dropped superfluous 'maxItems'
> * now checked also against 'dt_binding_check'
>   (Sorry, forgot this target in my scripts)
> 
>  .../devicetree/bindings/mmc/arasan,sdhci.yaml | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> index 9075add020bf..d4605bbc7a57 100644
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
> +      - const: wkup

The standardized name is 'wakeup'.

>  
>    phys:
>      maxItems: 1
> -- 
> 2.47.2
> 

