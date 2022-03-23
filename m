Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A418C4E5893
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 19:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343835AbiCWSnO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 14:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240166AbiCWSnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 14:43:14 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC5289306;
        Wed, 23 Mar 2022 11:41:44 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so2609217fac.7;
        Wed, 23 Mar 2022 11:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QO/s30AeDsz4+7g7RPmSLLhafA+HggffAhCY8fOimp4=;
        b=3bE7S3UYKrpZE0EiinDTtwb0iK1PYTHHVBi33ItjLkf7Z8MQSdXeCB6EOMfw8dzjH3
         nf29ot7iUZoShxI8jwvtqCCTrzMt/5fw85tp3mYYDqwyw/rIZN3Xrycln1d+GkqMGNJ1
         d+kUCS1uK7Cgt+8xiI9sYNb4O7q17AGrxsOkR8TlXbRPGCbFh0OzwCmpKPPpwW9j9QLe
         ig3HjkIxrqYm9w9X8F9Z1Udd8eYroCilk/D9xbt0A7Zlyb2jrKfIYILVSdyKVCy1ZcNy
         6HVcVVBg80ZjXqikRLCVrnnsf6R/cKdJMQ6NVVwsl3MI+URmkKVPnb2McDTfQQpi4ggL
         WKBA==
X-Gm-Message-State: AOAM530tASDtWspFOYDqrW74+oX2efld1SQPIPunlZnIW4ACpwh177w3
        25Tq8iWIsjRQl6bkHCCCSViQl15SIw==
X-Google-Smtp-Source: ABdhPJz5YJ2IIuFHvJtu1d/UgA2ZlStrJ3l8Wbd96hiER8iVwRTTGn6pTseDKC9xwVQeMOPlRHWnDw==
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id s37-20020a056870eaa500b000da0b3f2b45mr5027313oap.228.1648060903981;
        Wed, 23 Mar 2022 11:41:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p12-20020a4a95cc000000b003246cd15eaasm361216ooi.2.2022.03.23.11.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 11:41:42 -0700 (PDT)
Received: (nullmailer pid 232472 invoked by uid 1000);
        Wed, 23 Mar 2022 18:41:42 -0000
Date:   Wed, 23 Mar 2022 13:41:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
Message-ID: <Yjtp5gTD6PaKMqCW@robh.at.kernel.org>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 15 Mar 2022 14:26:40 +0000, Biju Das wrote:
> Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
> clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
> add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
> ("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
> 0.51, Nov. 2021).
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Removed leading u/U from r9a07g043
>  * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
>  * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
>  * Prepared RZ/G2UL specific Module Clock/Reset indices.
> v1->v2:
>  * No change
> ---
>  include/dt-bindings/clock/r9a07g043-cpg.h | 190 ++++++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h
> 

Acked-by: Rob Herring <robh@kernel.org>
