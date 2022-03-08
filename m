Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9CB4D0D11
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 01:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243139AbiCHAzs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 19:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344128AbiCHAzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 19:55:44 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958DEFD3F;
        Mon,  7 Mar 2022 16:54:49 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id q1-20020a4a7d41000000b003211b63eb7bso1923272ooe.6;
        Mon, 07 Mar 2022 16:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eTaKQAXK4SJOVe+AIF8BxdNo3MI7UUfK+HZl3pbCzwQ=;
        b=GqJmrzc28oRN+2PMjG2iDkcHYpzFvfUn4vbewGMB72YDB4k4/OAmNFpTRh7fC2H0di
         RZrjFOI2PMfRUuvzP5pAH3mba7+lq6BfcIb8BePiWDzmTKdMdZYdLRPusG283Ma98a4O
         oVXpDE7BNd6/ibXRM/71v4SUG+5JMd8dlKoFqRKnFrUwAYXHyHA+chJeVh/vDrTvNpLg
         DenhEFCulbCnqNIP057tBhICDHmnT+hwMh874fvRCczXpXkupLj7iSmudrUyx8Khohrg
         xzThnl/3k2XwpbHwYEq6L9tAO6F51LZmFD+bTYtzy144LJSWufSs2lkK9tihWSl+6LCG
         ag/A==
X-Gm-Message-State: AOAM533UbrFpRZSVMqAUrVG5zudGZ1Kg34Gbj/gE6a/mLQnWCoO8PWis
        1citPKWp3E8IoeKbtUUIxg==
X-Google-Smtp-Source: ABdhPJyUnjX246a64CjJ263+eELoYLOJp4U+rlR34A4B3V8OW+muVT533AhVoUtEd5oqJ76UEuGScg==
X-Received: by 2002:a05:6870:32d5:b0:d2:c8c2:d8cd with SMTP id r21-20020a05687032d500b000d2c8c2d8cdmr1031965oac.86.1646700888913;
        Mon, 07 Mar 2022 16:54:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u12-20020a056808114c00b002d72b6e5676sm7731684oiu.29.2022.03.07.16.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 16:54:48 -0800 (PST)
Received: (nullmailer pid 3602187 invoked by uid 1000);
        Tue, 08 Mar 2022 00:54:47 -0000
Date:   Mon, 7 Mar 2022 18:54:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document
 RZ/G2UL SoC
Message-ID: <YiapV2cbibTUJa5Q@robh.at.kernel.org>
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
 <20220303162634.6572-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303162634.6572-2-biju.das.jz@bp.renesas.com>
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

On Thu, 03 Mar 2022 16:26:28 +0000, Biju Das wrote:
> Add DT binding documentation for SYSC controller found on RZ/G2UL SoC's.
> SYSC controller found on the RZ/G2UL SoC is almost identical to one found
> on the RZ/G2L SoC's only difference being that the RZ/G2UL has only CA55
> core0 reset vector address configuration register.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> V1->V2:
>  * No change
> ---
>  .../devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
