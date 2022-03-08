Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0234D0D14
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 01:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344135AbiCHA4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 19:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233022AbiCHA4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 19:56:21 -0500
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C1FBF9;
        Mon,  7 Mar 2022 16:55:26 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id x26-20020a4a621a000000b00320d7d4af22so6907708ooc.4;
        Mon, 07 Mar 2022 16:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0y79HsrV/cQcEV63BhYFdq2yxZda7SPsjwaT5lakNbY=;
        b=EXzWj5RRXwnbJHazRtRd9X5z4j8lSIHVmtkHDxF+V7RbhKC5TJOe2U0x+0xd2zBT7Y
         Fga0nlYJq/HRU4NYBdh+yMwrnSezHHaU0009miZLxPbvQqM8oVwzJ6suhiZy7Veou+iF
         d3YAwv/ZEUl5XRT0lQyertfNaWslvnFCpbnVJmLcChP1JaQyDyhNAsamWfzQgLwIIIUs
         9DaF1fdwHJP6lbeI4jKPaQmrOzHi931USH92ZRgALxXcmFodk8wOQ4lJdxiWCBoMxu3o
         +g3MkIak7QfhZvOVG+wqQ/VIZZREm0J2B17ZI/xS0/kl2ztzFT448zSkDqwdwSBBcRQL
         /Wwg==
X-Gm-Message-State: AOAM532IQkDyScefg5MVDG3W8jg1oOOrAupPj8qPyoe2M2PyVKSD9wT4
        D9EJA5Yaaubc5MgPN84oAsQVuqxsHg==
X-Google-Smtp-Source: ABdhPJy8FFrI9eysOJJFkX3bjPTiMmIv2K2yQxiFxk6/nslmQXUfuUZFzvcBmqu55ohmUfMuFtH5+Q==
X-Received: by 2002:a05:6870:891d:b0:da:b3f:2b3f with SMTP id i29-20020a056870891d00b000da0b3f2b3fmr943332oao.222.1646700925478;
        Mon, 07 Mar 2022 16:55:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n128-20020a4a4086000000b0032118eda64bsm825770ooa.38.2022.03.07.16.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 16:55:24 -0800 (PST)
Received: (nullmailer pid 3603384 invoked by uid 1000);
        Tue, 08 Mar 2022 00:55:23 -0000
Date:   Mon, 7 Mar 2022 18:55:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2 4/7] dt-bindings: clock: renesas: Document RZ/G2UL SoC
Message-ID: <YiapeywStLiZpJxw@robh.at.kernel.org>
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
 <20220303162634.6572-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303162634.6572-5-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 03 Mar 2022 16:26:31 +0000, Biju Das wrote:
> Document the device tree binding for the Renesas RZ/G2UL Type-1
> and Type-2 SoC. RZ/G2UL Type-2 has fewer clocks than RZ/G2UL Type-1
> SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> ---
>  .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml     | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
