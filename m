Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40CC690C4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 15:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjBIO6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 09:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBIO6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:58:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA5218148;
        Thu,  9 Feb 2023 06:58:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03BC06195F;
        Thu,  9 Feb 2023 14:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A49C4339C;
        Thu,  9 Feb 2023 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675954711;
        bh=z55Z15V+CQEJDIFpDIm04fxW/YoatBzH7nL2KTvHqug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LYg3s2QQTC/1+6kv8dJ+hsnLh+HbA20xHdd4dQENmF0IFBqFxjihR1Qx7AUS7FLCU
         u3YIT3bNimg4HJfYkaLW56KtMeuTGgua1pfX+X44VKdmSXsR+Sr3xg77mTlc0KVR0O
         IBFdAjx6mn97e4XaN0E2mE6z4kAlXBtsd3fa0zc14OovEhVaSuvwVuqoUAkAhwNFjX
         cwX0b5iADax4Aj+NrU90hPmGl703AcKmrSnr67EHne7h2vbP63hxiL+sxkL+TCi18G
         6WdBle1tg1sD5SqcidqNhrLvnCN1lM0FEwHvP34hBWjGGDWJBqlEbs2U05a1TKSY75
         2SL7Q2l1pCtdg==
Received: by mail-vs1-f50.google.com with SMTP id g3so2361476vsr.10;
        Thu, 09 Feb 2023 06:58:31 -0800 (PST)
X-Gm-Message-State: AO0yUKXUwRyPAuwvYM9nkpRFMb8VOJZDRAOsPax4xX44KZtIeCRXO9UD
        NPypz4wLJYuXBhKY0JTWYoTk+oGgnhN1dY/axw==
X-Google-Smtp-Source: AK7set+HJeqQpQRfwEH6w65YjZaLZ7/GDWpyIiWZQnfEO/3GLEv0iy0VjpE++EwGkj1tfHqgesRjmbtufiAC/XSf4Mw=
X-Received: by 2002:a67:cc1d:0:b0:3f3:5ce0:85ab with SMTP id
 q29-20020a67cc1d000000b003f35ce085abmr3164858vsl.26.1675954710303; Thu, 09
 Feb 2023 06:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 9 Feb 2023 08:58:18 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DaUFSWd-4EEm=CJZg4-KtY8xnbmD4+0-vn6njG_yHXw@mail.gmail.com>
Message-ID: <CAL_Jsq+DaUFSWd-4EEm=CJZg4-KtY8xnbmD4+0-vn6njG_yHXw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 9, 2023 at 7:34 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
> the renesas,ipmmu-main property which sets maxItems as 1.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v2:
> https://lore.kernel.org/all/20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com/
>  - Set maxItems to renesas,ipmmu-main if R-Car Gen4.
>
> Changes from v1:
> https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/
>  - Change number of argument for R-Car Gen4 instead of "module id".
>    On the discussion, using 'minItems' is a solution. But, it causes
>    "too short" errors on dtbs_check. So, using "oneOf" instead.
>
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> index 72308a4c14e7..cc81bce44f3f 100644
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -74,11 +74,10 @@ properties:
>    renesas,ipmmu-main:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
> -      - items:
> -          - description: phandle to main IPMMU
> -          - description: the interrupt bit number associated with the particular
> -              cache IPMMU device. The interrupt bit number needs to match the main
> -              IPMMU IMSSTR register. Only used by cache IPMMU instances.
> +      - description: phandle to main IPMMU
> +      - description: the interrupt bit number associated with the particular
> +          cache IPMMU device. The interrupt bit number needs to match the main
> +          IPMMU IMSSTR register. Only used by cache IPMMU instances.

This is wrong. phandle-array is really a matrix. What you need is:

items:
  - minItems: 1
    items:
      - description: ...
      - description: ...

>      description:
>        Reference to the main IPMMU phandle plus 1 cell. The cell is
>        the interrupt bit number associated with the particular cache IPMMU
> @@ -109,6 +108,16 @@ allOf:
>        required:
>          - power-domains
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar-gen4-ipmmu-vmsa
> +    then:
> +      properties:
> +        renesas,ipmmu-main:
> +          maxItems: 1

With the above, this is then:

items:
  - maxItems: 1

Then an else with:

items:
  - minItems: 2
