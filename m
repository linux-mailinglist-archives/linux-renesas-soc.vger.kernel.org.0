Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385DD173BB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 16:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgB1PlM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 10:41:12 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45855 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgB1PlL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 10:41:11 -0500
Received: by mail-oi1-f193.google.com with SMTP id v19so3195428oic.12;
        Fri, 28 Feb 2020 07:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4/JAtn+UTsI+2S074Z6xFbXKYmPlXjdTPXfzvqHY7xI=;
        b=eB8nBG5PyeAsTGpMLQBYdmdZsqVgMz9wPgbuPTAsqzQ/Nt8LSAbGWF99S3b6Wibku5
         zdZD7RMkjIq/2pMrA3lhI+JPuOMHkz8dnnv0TcaCnUsbvdch/upW+ce4791YHRKBVzAa
         KX10+9X281+CIx9aAxqKXJw9vbqzaD4lkcCy/Cn6daxo/Bq5Qr6/rVW/cgGfP+jfendN
         163YqWaQryuq/mukHONcuhXD5XMquDBzRpIi5TN3z74S0exsa5N9IMoHsB/BQNmMOolf
         mJh7kRvQEAjrakpdOVgYjYWoAIqcTOLCD2tiZ+inbnMrlaJ3T0w5sQ2ptrL2+a07Hbhy
         1rnA==
X-Gm-Message-State: APjAAAWJlT66ZykVSDhcrFGIui0xURn7wXTU4OAuODG/ihtS7CeFd387
        gG6zM/tMlu3m+Tyik3xiTA==
X-Google-Smtp-Source: APXvYqxF3F/urS9cFErgWlAj1b8mQcdz5L0K0QWfH045jBVNyO+Yba7Q7RIjug7BY7/qyg+gnKWk5Q==
X-Received: by 2002:a05:6808:64d:: with SMTP id z13mr3636909oih.104.1582904470822;
        Fri, 28 Feb 2020 07:41:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t193sm379380oif.34.2020.02.28.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:41:10 -0800 (PST)
Received: (nullmailer pid 10757 invoked by uid 1000);
        Fri, 28 Feb 2020 15:41:09 -0000
Date:   Fri, 28 Feb 2020 09:41:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: reset: rcar-rst: Convert to json-schema
Message-ID: <20200228154109.GA9873@bogus>
References: <20200224135129.31870-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224135129.31870-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 24, 2020 at 02:51:29PM +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Reset Controller Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> v2:
>   - Add Reviewed-by,
>   - Drop "DT bindings for the" from title.
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
> index 0000000000000000..f329d3e0ce8825dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas R-Car and RZ/G Reset Controller
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

Added 'additionalProperties: false' and applied.

Rob
