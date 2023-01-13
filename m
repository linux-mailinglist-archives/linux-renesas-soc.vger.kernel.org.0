Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7E566A467
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 21:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbjAMUtY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 15:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjAMUtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 15:49:21 -0500
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB116951C;
        Fri, 13 Jan 2023 12:49:21 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id y15-20020a4aaa4f000000b004e6b4e0acc0so5849073oom.0;
        Fri, 13 Jan 2023 12:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QUasikEs4VEyO6EKyKeCacQ/OrvU8lnGyS1lFJu6mE=;
        b=yYRaR6qctDjlmPt1QR+Q5X+7putY1oa7VtOpEZkTgQgQZlgTQ+/cyah6lSOIrSBUpa
         iUwYDMo+vPBBFgNq3oxmGF/Ullnvkxa5uz0ild6JPwg3OYPUQB8YoC6GTPUu00K0sh+b
         ilwR89nfr1BABLgHA0NMFjzuHGVpDp0Kk48SMGmPJqHjQF6w5G3fkewg0rvzb26JIEsl
         nuOVmdR0KCs5MYxaGvdQUa41sMs9ZYstEJNqoii+3/wAF5m8RcLJUMk6wiM9LXD7esSF
         WN7PC5atr2zYt1CyrUVNJ0xfh+l3WBixtTOF9D4izdQsVCvBOF4u50qKy9qf+d0A739D
         hbpQ==
X-Gm-Message-State: AFqh2kokY2EppOQ88ECd/A9c1L28Ho9kknfM+HwHPic45/kYx7dwWTrl
        lelc22J/aaZb+AvTmsgOZQL19elPiQ==
X-Google-Smtp-Source: AMrXdXsD0SCXt5ZmM1Jx8id8rqFD/tc8/DsrHjDObCHgHmy+fgUDZ4SnjQwNdM6fU2kmIztiGbjXHg==
X-Received: by 2002:a4a:1584:0:b0:4f2:88ea:54dc with SMTP id 126-20020a4a1584000000b004f288ea54dcmr2747895oon.7.1673642960408;
        Fri, 13 Jan 2023 12:49:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y139-20020a4a4591000000b004c60069d1fbsm3052598ooa.11.2023.01.13.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 12:49:20 -0800 (PST)
Received: (nullmailer pid 2896177 invoked by uid 1000);
        Fri, 13 Jan 2023 20:49:19 -0000
Date:   Fri, 13 Jan 2023 14:49:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: usb: renesas,usb3-peri: Document
 RZ/V2MA bindings
Message-ID: <167364295882.2896124.3520910461307413052.robh@kernel.org>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <20230112215906.494394-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112215906.494394-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Thu, 12 Jan 2023 21:58:57 +0000, Biju Das wrote:
> Document RZ/V2MA usb3-peri bindings. RZ/V2MA usb3-peri is identical
> to one found on the RZ/V2M SoC. No driver changes are required as
> generic compatible string "renesas,rzv2m-usb3-peri" will be used as
> a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> ---
>  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
