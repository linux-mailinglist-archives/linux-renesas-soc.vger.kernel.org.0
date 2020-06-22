Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53092040E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 22:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgFVUEm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 16:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbgFVUEl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 16:04:41 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54B4C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 13:04:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id i27so20760823ljb.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GI2HHNZ9gqZ+5Dmai68yTkhXYHMNey1Kp/NbRXupY1g=;
        b=wO3cMTXCazG8NMjBFRopORQBMfk+avBjNT7LCgZPgPpbxtAX1BapllUZnzvAHuTyyo
         Elk8ZiHGQLDdBZMLiMJwEkue13hYunxtnQvyK9oZkvW+j3f6Shag1N3/jJiwIQ+zKx2+
         momEguFa3ACunAys3wEQZ3l5MkxakQe1kXr1GH/ecpfHlBn7gLM3g9IkuUbX4/qLvJs5
         k1wDvbiQ5pXb1m17VYvQhl5qdeXNrvm9WpPhws7ap+vvLQ63rJ9vKDUVwcafO9Ko3/zE
         o1yEhOuL33LgUnFNj6zby/ekkXs71TpU+5cOk9psNG9ei8P96ZokLPj+TUV2yVPwpQS4
         zKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GI2HHNZ9gqZ+5Dmai68yTkhXYHMNey1Kp/NbRXupY1g=;
        b=CrYj4L6kuG27Z2zZ5Y12hdWUYfDpB2ZGzJU8Xi59bJ0f83BcG/sweZEG78PevLzihD
         s2JnjLeC8HRI/5o37sOSkhdyseeHU6DicP2dR2317NwPvC65j1o6tCnm4ksTaze+O9VF
         WBVMf02au4xQzfLVwQ66rjqPVx4jd19R/a1gKncY8oE/y+axnw+1DQAmhMxu1MhPHheE
         JUKpHKY9TQxZbQDQ/ywOInL+SBxW6UnuE/Li58usyVYgYsNIlzMTNjq9T5fvv4iGBRS/
         4X/Ws4/4J1EZ1/g+2FL3x/LKOtW2DW8by0un4rS8A5anm/SH8nV/t/SOccgDunzgTO+5
         NEng==
X-Gm-Message-State: AOAM531jbIGnvbU/QfnrhFEm93tdD4kcilZJg7OMetpFZBoUQFTIxpTM
        sNedpDI0Dp178uL4J886WNpiJA==
X-Google-Smtp-Source: ABdhPJxaQEp4KH3s96BySjZEQ8j52vi5htdaEbU950oS/ZVIaS98tqjjk9rnuh/YtHhSe0tyXmby/Q==
X-Received: by 2002:a05:651c:3cc:: with SMTP id f12mr9199933ljp.244.1592856279008;
        Mon, 22 Jun 2020 13:04:39 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4203:64df:af75:c7a5:2eac:da37])
        by smtp.gmail.com with ESMTPSA id n10sm3651851lfb.82.2020.06.22.13.04.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 13:04:38 -0700 (PDT)
Subject: Re: [PATCH/RFC] dt-bindings: net: renesas,etheravb: Convert to
 json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200621081710.10245-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8d90ef9a-32d3-659f-f808-5d62d1d7ac6d@cogentembedded.com>
Date:   Mon, 22 Jun 2020 23:04:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200621081710.10245-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/21/2020 11:17 AM, Geert Uytterhoeven wrote:

> Convert the Renesas Ethernet AVB (EthernetAVB-IF) Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

   As I'm only seeing the formatting issues, here's my:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> new file mode 100644
> index 0000000000000000..c87d8c6389328eaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -0,0 +1,269 @@
[...]
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@gmail.com>

   Thank you! :-)

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,etheravb-r8a7742      # RZ/G1H
> +              - renesas,etheravb-r8a7743      # RZ/G1M
> +              - renesas,etheravb-r8a7744      # RZ/G1N
> +              - renesas,etheravb-r8a7745      # RZ/G1E
> +              - renesas,etheravb-r8a77470     # RZ/G1C
> +              - renesas,etheravb-r8a7790      # R-Car H2
> +              - renesas,etheravb-r8a7791      # R-Car M2-W
> +              - renesas,etheravb-r8a7792      # R-Car V2H
> +              - renesas,etheravb-r8a7793      # R-Car M2-N
> +              - renesas,etheravb-r8a7794      # R-Car E2

   Hm, overindented starting with "- items:"?

> +          - const: renesas,etheravb-rcar-gen2 # R-Car Gen2 and RZ/G1
> +
> +      - items:
> +          - enum:
> +              - renesas,etheravb-r8a774a1     # RZ/G2M
> +              - renesas,etheravb-r8a774b1     # RZ/G2N
> +              - renesas,etheravb-r8a774c0     # RZ/G2E
> +              - renesas,etheravb-r8a7795      # R-Car H3
> +              - renesas,etheravb-r8a7796      # R-Car M3-W
> +              - renesas,etheravb-r8a77961     # R-Car M3-W+
> +              - renesas,etheravb-r8a77965     # R-Car M3-N
> +              - renesas,etheravb-r8a77970     # R-Car V3M
> +              - renesas,etheravb-r8a77980     # R-Car V3H
> +              - renesas,etheravb-r8a77990     # R-Car E3
> +              - renesas,etheravb-r8a77995     # R-Car D3
> +          - const: renesas,etheravb-rcar-gen3 # R-Car Gen3 and RZ/G2

   Here as well...

[...]
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +  - if:
> +      properties:

   Overindented?

> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,etheravb-rcar-gen2
> +              - renesas,etheravb-r8a7795
> +              - renesas,etheravb-r8a7796
> +              - renesas,etheravb-r8a77961
> +              - renesas,etheravb-r8a77965
[...]
> +  - if:
> +      properties:

   Overindented?

> +  - if:
> +      properties:

   Overindented?

> +        compatible:
> +          contains:
> +            const: renesas,etheravb-r8a77995
> +    then:
> +      properties:
> +        renesas,rxc-delay-ps:
> +          const: 1800
> +
> +  - if:
> +      properties:

   Overindented?

[...]

MBR, Sergei

