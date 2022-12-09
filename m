Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F245648A2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 22:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiLIVnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 16:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiLIVnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 16:43:19 -0500
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C789831213;
        Fri,  9 Dec 2022 13:43:18 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id f7-20020a4a8907000000b004a0cb08d0afso879443ooi.8;
        Fri, 09 Dec 2022 13:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcwPwwT4uOET7S7UyGjYY8jwl7HxkSdLZ6MiIT3csy4=;
        b=jEnkbPpGhK6qtEfFm/Gxa08G/NojJxCsbZSvE7CDlMlWL9qFxHnjXpRSkEhkPMyBxF
         ImigC16WDJx/E7OeDVg5Gv56n7DyeEvVyXNbRpOi/WDDas6CtgerKPrOHissnqeFo5Eh
         xCve7BdfgWfvzvqtKRU3HIugcHw5cv5kbe2qHQGxBjSI/UFWKBfJ1zpM56m1slDNFuiC
         QRJFV4UMyyvh00Gh8ZrT/VLcXGzMcn8rZKRMH+nrXMAoT0YvPsnHjEJTeTZEAAqhUjDV
         CFEy4oQC3KVMeyKuIQ9EcYdueMp14Rvi35GRQGOOAv2iRL/i9DvMwL7OdQXYBYSKhxz3
         58GQ==
X-Gm-Message-State: ANoB5pluWVi0iKm/ejCFLAk9NVOu58qB6Kqqy3+GZk/mLDqreXGN5EpQ
        Oq9LykENVL/ecwIke+J8/ha2pMV7mw==
X-Google-Smtp-Source: AA0mqf7FjIzB7VG1PlEjiZGjxQayCZIq6PYEal9ex3kYJMkNZa3DWssAfZogZl7tePz/3AY23YLCVw==
X-Received: by 2002:a4a:aec6:0:b0:49f:96f:e6c0 with SMTP id v6-20020a4aaec6000000b0049f096fe6c0mr4371754oon.8.1670622198074;
        Fri, 09 Dec 2022 13:43:18 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g6-20020a4ab806000000b0049ef7f3b2c8sm805751oop.48.2022.12.09.13.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:43:17 -0800 (PST)
Received: (nullmailer pid 3897505 invoked by uid 1000);
        Fri, 09 Dec 2022 21:43:17 -0000
Date:   Fri, 9 Dec 2022 15:43:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Update interrupt
 property as optional
Message-ID: <167062219642.3897453.9937218430747422219.robh@kernel.org>
References: <20221209171836.71610-1-biju.das.jz@bp.renesas.com>
 <20221209171836.71610-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209171836.71610-2-biju.das.jz@bp.renesas.com>
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


On Fri, 09 Dec 2022 17:18:35 +0000, Biju Das wrote:
> On some platforms(for eg: RZ/V2M EVK), interrupt is not populated. Update
> the binding to make interrupt property as optional.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * updated the typo in commit description.
> ---
>  Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
