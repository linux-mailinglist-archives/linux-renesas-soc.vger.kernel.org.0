Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F723A9E90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 17:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbhFPPIf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 11:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234432AbhFPPIc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 11:08:32 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A6AC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jun 2021 08:06:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id b13so3484997ybk.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jun 2021 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WnfyWeDtfp9wJ03e/Pygdz8GkYlJkHUmw4KuNZkZtsI=;
        b=p3V/tsAvBKNW1/fLQw1cxjbLxmkzY+NCFM6sFUd5MYQR/I99nfYHtTeZ6GX29HX2fP
         7B98Hz0iPFw7ln3a7oZUSV0D7wBHs3Nx8bP1yD75PLFbtaitHUMldchawAE3t6u9Gr4D
         +thcqYz5DsdBNhUKylMKadu7gU+x9Y8f2HR9pkqCG44mo9Eiw3E0Ef0UBgaALPUnEwZM
         OMSgYp3yI11h4BO8U2bJwEZbzXXy3AGA4tyIzRoWlJw5Et2h2p95BbZaXl2/0i99CK6D
         VK4iEQKVOgzlpWTXxuWr4K4Kh5NwNdhEEHtoPFEUOX+aMGa4KVLNyO/kl/oNBYMPHM53
         BQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WnfyWeDtfp9wJ03e/Pygdz8GkYlJkHUmw4KuNZkZtsI=;
        b=W5aJk5iEyJcNe9e/DJLjnvVoLuOMo1eZGiH7reRdWenYt3dmMPVzTX+k9KHlUNU5Wp
         xhFC7V2BcmZjRVKojEvM6RHOO6e8j/0A37YLIqroUx3m/nsntnqZkC3SU93OwT6KYqFL
         1X5qxVnsAZyM+/5TiHZxkw9glZpUBQAHeQ1ohLb+B4+RQcii0G2kDypJH7VbMeivQ3Rv
         yq4kLB8w3Ylnk9sOrogZ02djMh3Z+UWORtBGBMLbDKawB1fzNN/+5cwq7VLtyyl2FFHA
         Vx57Dq1aSr/MTMoaxJdefWf7IWG24CFyfdoQaGC64mI5V+lsTeSNFfd8KSZhUh0yvHtD
         41vA==
X-Gm-Message-State: AOAM531YYMBK1bup6s7V1Ca/QpO+MV9it+Y2aKdHBn7/7XSqTAEgQ9H9
        VdBvDGnGrIB1ARm4FHyyhO/YYKE44NOy9isjFMotwA==
X-Google-Smtp-Source: ABdhPJxsvfFKJlCl0Fv1Q0JQBOSrY9fTTPwXdoG5i6bwF+xZjcAotFA7K4MfWyuapR5FEhTmK4mSmAAff0KtXHI/vxk=
X-Received: by 2002:a25:8088:: with SMTP id n8mr196816ybk.375.1623855984676;
 Wed, 16 Jun 2021 08:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <b4e3ac1e393dd3ec9d6086e3d216bf9d0fdfc0e8.1623835679.git.geert+renesas@glider.be>
In-Reply-To: <b4e3ac1e393dd3ec9d6086e3d216bf9d0fdfc0e8.1623835679.git.geert+renesas@glider.be>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Wed, 16 Jun 2021 18:06:13 +0300
Message-ID: <CAOtvUMcJzide=sinBSMGocKhyErECE3e0H-KGDX9RhXHeVhK4w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: crypto: ccree: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 16, 2021 at 12:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Convert the Arm TrustZone CryptoCell cryptographic engine Device Tree
> binding documentation to json-schema.
>
> Document missing properties.
> Update the example to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use "SPDX-License-Identifier: GPL-2.0", as requested by Gilad.

Acked-by: Gilad Ben Yossef <gilad@benyossef.com>



> ---
>  .../bindings/crypto/arm,cryptocell.yaml       | 53 +++++++++++++++++++
>  .../bindings/crypto/arm-cryptocell.txt        | 25 ---------
>  2 files changed, 53 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/arm,cryptoce=
ll.yaml
>  delete mode 100644 Documentation/devicetree/bindings/crypto/arm-cryptoce=
ll.txt
>
> diff --git a/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml=
 b/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
> new file mode 100644
> index 0000000000000000..b8331863ee754988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/arm,cryptocell.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm TrustZone CryptoCell cryptographic engine
> +
> +maintainers:
> +  - Gilad Ben-Yossef <gilad@benyossef.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - arm,cryptocell-713-ree
> +      - arm,cryptocell-703-ree
> +      - arm,cryptocell-712-ree
> +      - arm,cryptocell-710-ree
> +      - arm,cryptocell-630p-ree
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    arm_cc712: crypto@80000000 {
> +            compatible =3D "arm,cryptocell-712-ree";
> +            reg =3D <0x80000000 0x10000>;
> +            interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt =
b/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> deleted file mode 100644
> index 6130e6eb4af89135..0000000000000000
> --- a/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Arm TrustZone CryptoCell cryptographic engine
> -
> -Required properties:
> -- compatible: Should be one of -
> -   "arm,cryptocell-713-ree"
> -   "arm,cryptocell-703-ree"
> -   "arm,cryptocell-712-ree"
> -   "arm,cryptocell-710-ree"
> -   "arm,cryptocell-630p-ree"
> -- reg: Base physical address of the engine and length of memory mapped r=
egion.
> -- interrupts: Interrupt number for the device.
> -
> -Optional properties:
> -- clocks: Reference to the crypto engine clock.
> -- dma-coherent: Present if dma operations are coherent.
> -
> -Examples:
> -
> -       arm_cc712: crypto@80000000 {
> -               compatible =3D "arm,cryptocell-712-ree";
> -               interrupt-parent =3D <&intc>;
> -               interrupts =3D < 0 30 4 >;
> -               reg =3D < 0x80000000 0x10000 >;
> -
> -       };
> --
> 2.25.1
>


--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
