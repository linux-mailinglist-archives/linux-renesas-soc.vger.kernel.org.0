Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103F658DFBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Aug 2022 21:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345505AbiHITEa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Aug 2022 15:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345194AbiHITD1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 15:03:27 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A77E2BB31;
        Tue,  9 Aug 2022 11:39:14 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id g15so3797491iob.0;
        Tue, 09 Aug 2022 11:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=SuWYyY6FLpLU46Wx1gcpqGvWzzlpUZIByk+F+Yykvn8=;
        b=K8Xp89EauEKiLEmH+dDDAnQ7WN7WGwybQbbOcQfnD3SY39/8xjMQ/72n8/TEVKxTEy
         TmWIkkygcUTDK/HUFLu+Kw6lvhObx/FvYd7Wt/qIvzcw8oo6fDveaTqqh47LUMNaoJAr
         Wh4l3pMCzNJ0zweukCbKuTH34sETppG8NhLnm030KOcVqxIE6Irh9A2gevndHolUqosa
         CJ+JtEZl7wALbMOYUbJDcL1bsM4qC4rXmboijQbH3xpA8bs86rpZ5FCgcbAtsdeVo2bU
         wTUi/1MtDb/nXcJ2Sh+q3vhib+rfOSoV7y0zx2ueGGgEPb6rI1/SrXyMzON6/17o0nvA
         RfpA==
X-Gm-Message-State: ACgBeo3IfPVQBJDXpHpUMFa7uGmWl0xYY/n4vSfrOT3khfhBGdf1qExc
        gsdcDBNjnvInwZSIUMxu5g==
X-Google-Smtp-Source: AA6agR4SP5urZseXrfmtmeV9TutP+v12NyiCtUMhcLLfP92o+Ux6IKkwqe0kvOx2FuhOtVw1A3Qseg==
X-Received: by 2002:a05:6638:41a9:b0:342:e3ac:b242 with SMTP id az41-20020a05663841a900b00342e3acb242mr6385591jab.295.1660070353406;
        Tue, 09 Aug 2022 11:39:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k8-20020a056e02156800b002dc100ab6fdsm1321280ilu.35.2022.08.09.11.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 11:39:13 -0700 (PDT)
Received: (nullmailer pid 2166652 invoked by uid 1000);
        Tue, 09 Aug 2022 18:39:11 -0000
Date:   Tue, 9 Aug 2022 12:39:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: renesas, usb3-peri: Document
 RZ/V2M r9a09g011 support
Message-ID: <20220809183911.GA2166589-robh@kernel.org>
References: <20220804192220.128601-1-phil.edworthy@renesas.com>
 <20220804192220.128601-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804192220.128601-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 04 Aug 2022 20:22:19 +0100, Phil Edworthy wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> A few DRD related registers and bits have moved, there is a separate
> interrupt for DRD, an additional clock for register access and reset
> lines for DRD and USBP.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Keep the existing constraints by adding an 'else' clause with
>    'maxItems: 1' for various properties.
> v2:
>  - SoCs other than rz/v2m must limit the number of clock/interrupt names
>  - Add "Battery Charging" and "Global Purpose Input" interrupts
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 99 ++++++++++++++++---
>  1 file changed, 84 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
