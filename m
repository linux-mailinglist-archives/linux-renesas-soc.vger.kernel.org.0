Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A966079E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Oct 2022 16:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbiJUOuv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 10:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJUOuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 10:50:23 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C43EA6A0;
        Fri, 21 Oct 2022 07:50:09 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-132fb4fd495so3774093fac.12;
        Fri, 21 Oct 2022 07:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wnm8CTZGfD6ls1hnKruN6hj9x0O7kfsoToo4nL1JtNg=;
        b=we/Qp6FeQDgBgEqEJWVMmSonM63sW4sLHNwJbO0X7iuf1wR4v6hG5FOJlwMsadjhWI
         Q+pJKvBNqNTYOpCXXe5HlGct1HJAzSqsOgmBWfvAlQosBFiV9pbkseQM+LfE6z9Wf2aZ
         7BbL5Qy2zcsPL/7XZowVIP1j75BRlJH3X0qyyp0f589P7M4nIz20ZZl/kga8jE+yjYnp
         4Ju8Pz3zqt+7QEf5AQmBa8ywIC5RQ7jjVgYcGe/zu85RRNxE63ZzYpOApeXAmEquFWDh
         mnTYtjWkx3c/Y8qflGG7HqMpF+d7UqZlrD85g3KeL7Athrv9Wre6Cs7Sm99jfmq41Wj0
         K3UA==
X-Gm-Message-State: ACrzQf0CbEoWCv2kKLnUCF6HSCtTDxIf+gp27fWaNouiKcPCMV6S+Vj2
        NChMB7KtFVnQ0Uj7O6ir7w==
X-Google-Smtp-Source: AMsMyM6bXQm2nnbvgzyu5lgBTRIgIReCxfP3ps0Jhw/HDJ+XOqUmns6D6PYXY8dJYipwV1+ojjA7oA==
X-Received: by 2002:a05:6870:c092:b0:132:a01f:7c31 with SMTP id c18-20020a056870c09200b00132a01f7c31mr12925185oad.56.1666363808748;
        Fri, 21 Oct 2022 07:50:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t21-20020a05683014d500b00661946468c6sm1172952otq.31.2022.10.21.07.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 07:50:08 -0700 (PDT)
Received: (nullmailer pid 3719169 invoked by uid 1000);
        Fri, 21 Oct 2022 14:50:09 -0000
Date:   Fri, 21 Oct 2022 09:50:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <jroedel@suse.de>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 resend] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car
 V3U is R-Car Gen4
Message-ID: <166636380847.3719105.11808204724147299494.robh@kernel.org>
References: <c1fb71448a8400986fd30d51a1bb2704376c0306.1666361055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1fb71448a8400986fd30d51a1bb2704376c0306.1666361055.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 21 Oct 2022 16:06:02 +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v3:
> - Add Reviewed-by,
> 
> v2:
>   - Add Acked-by, Reviewed-by,
>   - Add blank lines to improve readability.
> ---
>  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Applied, thanks!
