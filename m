Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C825169317
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Feb 2020 03:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgBWCTs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Feb 2020 21:19:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43006 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgBWCTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Feb 2020 21:19:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id d10so6208193ljl.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Feb 2020 18:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Irx2r1P/k3fOiC744Xive5cTd/jpQZMndI6U1NS5XfM=;
        b=BGD571Vtqqt5ZcmgjFbUzmU77zsRsFzS2Yj/cxOY/dnMeCR1os4hIG60yCxZdpNPgW
         XeCqwd6AJeQcOGoDWt5KxiS9ijLDg/JdhQBn9Ml4W3Hjc+UuPpSvkOFGd7fYRfG9YKqF
         P9xS3ieuV6CLOxHiuosQGUV22ZqNlifem7wwrQO9cFlNU5G9rNO9DUI5PVzvdTBkILcY
         uWrAlDvCaPza35NEAmPXnCHWpy0r0FNTJeUqTwDLNDFnziRVyiHnfJIlM8AzmQSQ9RPS
         /v87gyzi+Hsp8WJo+YYXZRkO0Brh1PxEX1vty7w5lThAoz9og3kaUP4JYrGTBkk/MBG1
         8juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Irx2r1P/k3fOiC744Xive5cTd/jpQZMndI6U1NS5XfM=;
        b=rrnc3c9AWHZN/VB1tx/Hm3l9p+4Djua3e8Ngq2rnEoK7wNL51OnQg3aVh1Q7+JPwk6
         Nd0Ga6jlh9kCm0snq5QsnVUV3D6gy+JYcLIDdFpDNvxIpskXyWG3i4wlHPe9pOdNu4Ep
         m0sVd+wTW4yeAsS8HUW8YAsOykiZ/NU0BnjYOJevM3Uc+05VyKWU6gu04vsrMVFuPLNd
         8SHnMGxVFnPEIsL8JJFOAq2OfcpaRF0QOoO2WJuOELmAwZlRpZ39729qF76AjVYvP6FV
         AMhXDmQ0YgGKZ/FWNjjWUq5mftCjJLtXOERD1pEQdEnZH9ey4arvd3z921WGuVR0NO79
         IBgw==
X-Gm-Message-State: APjAAAWSBXGm8VpstL1oSGz82BSKNvyzJ1EeMsBfNZBiHi/BE20hNVWk
        GzXlaKzzFsllP6kwVHGoxZwEFQ==
X-Google-Smtp-Source: APXvYqxwHWl5Xl3pYUtxomwtsfwHf3xINRXEZFd5VGUDEdWF8rFnERTpSRYDnABxx5ajTDZ+r35jVg==
X-Received: by 2002:a2e:b8d0:: with SMTP id s16mr24410146ljp.32.1582424385729;
        Sat, 22 Feb 2020 18:19:45 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id w9sm3950312ljh.106.2020.02.22.18.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 18:19:45 -0800 (PST)
Date:   Sun, 23 Feb 2020 03:19:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: rcar-rst: Convert to json-schema
Message-ID: <20200223021944.GG1444588@oden.dyn.berto.se>
References: <20200221121146.31153-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221121146.31153-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-21 13:11:46 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Reset Controller Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/reset/renesas,rst.txt | 48 ---------------
>  .../bindings/reset/renesas,rst.yaml           | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> deleted file mode 100644
> index de7f06ccd003da9f..0000000000000000
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -DT bindings for the Renesas R-Car and RZ/G Reset Controllers
> -
> -The R-Car and RZ/G Reset Controllers provide reset control, and implement the
> -following functions:
> -  - Latching of the levels on mode pins when PRESET# is negated,
> -  - Mode monitoring register,
> -  - Reset control of peripheral devices (on R-Car Gen1),
> -  - Watchdog timer (on R-Car Gen1),
> -  - Register-based reset control and boot address registers for the various CPU
> -    cores (on R-Car Gen2 and Gen3, and on RZ/G).
> -
> -
> -Required properties:
> -  - compatible: Should be
> -		  - "renesas,<soctype>-reset-wdt" for R-Car Gen1,
> -		  - "renesas,<soctype>-rst" for R-Car Gen2 and Gen3, and RZ/G
> -		Examples with soctypes are:
> -		  - "renesas,r8a7743-rst" (RZ/G1M)
> -		  - "renesas,r8a7744-rst" (RZ/G1N)
> -		  - "renesas,r8a7745-rst" (RZ/G1E)
> -		  - "renesas,r8a77470-rst" (RZ/G1C)
> -		  - "renesas,r8a774a1-rst" (RZ/G2M)
> -		  - "renesas,r8a774b1-rst" (RZ/G2N)
> -		  - "renesas,r8a774c0-rst" (RZ/G2E)
> -		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
> -		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
> -		  - "renesas,r8a7790-rst" (R-Car H2)
> -		  - "renesas,r8a7791-rst" (R-Car M2-W)
> -		  - "renesas,r8a7792-rst" (R-Car V2H
> -		  - "renesas,r8a7793-rst" (R-Car M2-N)
> -		  - "renesas,r8a7794-rst" (R-Car E2)
> -		  - "renesas,r8a7795-rst" (R-Car H3)
> -		  - "renesas,r8a7796-rst" (R-Car M3-W)
> -		  - "renesas,r8a77961-rst" (R-Car M3-W+)
> -		  - "renesas,r8a77965-rst" (R-Car M3-N)
> -		  - "renesas,r8a77970-rst" (R-Car V3M)
> -		  - "renesas,r8a77980-rst" (R-Car V3H)
> -		  - "renesas,r8a77990-rst" (R-Car E3)
> -		  - "renesas,r8a77995-rst" (R-Car D3)
> -  - reg: Address start and address range for the device.
> -
> -
> -Example:
> -
> -	rst: reset-controller@e6160000 {
> -		compatible = "renesas,r8a7795-rst";
> -		reg = <0 0xe6160000 0 0x0200>;
> -	};
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> new file mode 100644
> index 0000000000000000..5819eebfca064dff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: DT bindings for the Renesas R-Car and RZ/G Reset Controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +description: |
> +  The R-Car and RZ/G Reset Controllers provide reset control, and implement the
> +  following functions:
> +    - Latching of the levels on mode pins when PRESET# is negated,
> +    - Mode monitoring register,
> +    - Reset control of peripheral devices (on R-Car Gen1),
> +    - Watchdog timer (on R-Car Gen1),
> +    - Register-based reset control and boot address registers for the various
> +      CPU cores (on R-Car Gen2 and Gen3, and on RZ/G).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7743-rst       # RZ/G1M
> +      - renesas,r8a7744-rst       # RZ/G1N
> +      - renesas,r8a7745-rst       # RZ/G1E
> +      - renesas,r8a77470-rst      # RZ/G1C
> +      - renesas,r8a774a1-rst      # RZ/G2M
> +      - renesas,r8a774b1-rst      # RZ/G2N
> +      - renesas,r8a774c0-rst      # RZ/G2E
> +      - renesas,r8a7778-reset-wdt # R-Car M1A
> +      - renesas,r8a7779-reset-wdt # R-Car H1
> +      - renesas,r8a7790-rst       # R-Car H2
> +      - renesas,r8a7791-rst       # R-Car M2-W
> +      - renesas,r8a7792-rst       # R-Car V2H
> +      - renesas,r8a7793-rst       # R-Car M2-N
> +      - renesas,r8a7794-rst       # R-Car E2
> +      - renesas,r8a7795-rst       # R-Car H3
> +      - renesas,r8a7796-rst       # R-Car M3-W
> +      - renesas,r8a77961-rst      # R-Car M3-W+
> +      - renesas,r8a77965-rst      # R-Car M3-N
> +      - renesas,r8a77970-rst      # R-Car V3M
> +      - renesas,r8a77980-rst      # R-Car V3H
> +      - renesas,r8a77990-rst      # R-Car E3
> +      - renesas,r8a77995-rst      # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    rst: reset-controller@e6160000 {
> +            compatible = "renesas,r8a7795-rst";
> +            reg = <0xe6160000 0x0200>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
