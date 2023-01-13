Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1DE66A461
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 21:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjAMUtU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 15:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjAMUtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 15:49:09 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740A187939;
        Fri, 13 Jan 2023 12:49:08 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id d188so7482380oia.3;
        Fri, 13 Jan 2023 12:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdmVZdATpxh4uXK61/9w3d2GwDowPphGkSC6oew7CuA=;
        b=UuV0GB+MS0rg8+gS7MHQzeujqvAjPccpM1pz3xgOHd3QnmFSldxrWIcdcXOSXqLjjr
         t4PMQhLCr1lelBfEl6VIwOE6MAeC+DvthD+WjMmwiaj0+/DUqhq/LoB1XQ67RiDII9B7
         ZSUGL49/ytC0+j5sfYCCkBRG/8Rr7zMv9OLHzYKDiUTb6bKIhgWQtuvs8dlqO6kMugq8
         GjZu82S5FaV9lKyuiIzZAZaE39hbGdkZHGoOaw9nrd0wTyJ22S0yhGuKXSGim7+P6lXY
         TOlk8cDaJ38l++S6YugEeqLZYfX0J4DWZiIBNzBmIdYhpwAcpV97nDkmHYqatHTGX3oP
         swzA==
X-Gm-Message-State: AFqh2kodn+ktTwlLb+voIoNIwmHd7r7ijAFSCqYu2qtIWyJrYjdcoTfF
        15b2KcuLne4iFo5QQgr4Av14CMpB6g==
X-Google-Smtp-Source: AMrXdXuOtzlk4lCMnVxAfT79yeRvZPs6eEtrnmQY/LmDb+7Hhkm9ePOkq/mxtdI24GRnlS07l9mHYw==
X-Received: by 2002:a05:6808:f0a:b0:363:f0ed:bb60 with SMTP id m10-20020a0568080f0a00b00363f0edbb60mr18268130oiw.40.1673642947733;
        Fri, 13 Jan 2023 12:49:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z19-20020a05683020d300b006843ce07edfsm10983806otq.61.2023.01.13.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 12:49:06 -0800 (PST)
Received: (nullmailer pid 2895830 invoked by uid 1000);
        Fri, 13 Jan 2023 20:49:06 -0000
Date:   Fri, 13 Jan 2023 14:49:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: renesas,usb3-peri: Update
 reset, clock-name and interrupts properties
Message-ID: <167364294568.2895791.15384252515090224293.robh@kernel.org>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <20230112215906.494394-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112215906.494394-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Thu, 12 Jan 2023 21:58:56 +0000, Biju Das wrote:
> On RZ/V2M, USB3DRD module manages the drd_reset. Moreover, the interrupts
> drd, gpi and bc are part of USB3DRD block. This patch removes
> drd_reset and the interrupts drd, bc and gpi from usb3_peri bindings.
> After this, there is only one reset and interrupts and therefore
> removing reset-names and interrupt-names as well.
> 
> Whilst, Update the clock-name "aclk"->"axi" to make it consistent with
> DRD and host blocks.
> 
> There is any harm in making such a change as, no users of
> renesas,r9a09g011-usb3-peri yet in kernel release.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Moved DRD interrupts to DRD bindings
>  * Updated interrupts and dropped interrupt-names
>  * Renamed aclk->axi
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 39 ++-----------------
>  1 file changed, 3 insertions(+), 36 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
