Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C864E4E5988
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 21:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242610AbiCWUHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 16:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244359AbiCWUHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 16:07:13 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FB486E2B;
        Wed, 23 Mar 2022 13:05:43 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id z8so2796527oix.3;
        Wed, 23 Mar 2022 13:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gR3650OK4Kk4y8p0bJ8B5cWOD9FNq9cookGajVqOgH8=;
        b=eaTzxYX2tWl3IMWmKp4862ik3+IWEw24C+etcIam/bhMgiyDySD7BB6cMFa+yQ1ene
         RFfRP4ZAAcqUCWT/pbCGOd20DXl2UKfgFT4uHByZULF/6C8nI1TUDh2LhyGbzSQDovKg
         1ZgrEK6OTNG/kpKUrGgOlGFqS7nQbD5UCJBApEj7dyt54hI7lXMYAVN3rzrOOf7uCaqK
         3Hj5RlthO9j1qZMqEoRMuPg3bFpm8uT2l3HmiH/NcoTIV0iliLS8IgWM6spGfc37srz7
         weFAtXSq+UZWjm5HQNbgMWT54YVQfo8JtfWlIu6PM91QXZFdsvz6CIvQ5ocPonKOaGy0
         PwrA==
X-Gm-Message-State: AOAM531lwptYimRdYAYyXBuPXbeC3EoiHDI1qePtVPsVbGIAbNyOGG/C
        BRKNkqZR0LA51q66k6/kOw==
X-Google-Smtp-Source: ABdhPJytsw/Iu8lzVzWw09sb/tW8nq9AKE1yUUK4QZT1ga++TGAD+SxkJPnMP8020ukMFZCVHMpfrg==
X-Received: by 2002:a05:6808:c:b0:2ef:8913:354 with SMTP id u12-20020a056808000c00b002ef89130354mr3422949oic.201.1648065941050;
        Wed, 23 Mar 2022 13:05:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n128-20020a4a4086000000b0032118eda64bsm418856ooa.38.2022.03.23.13.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 13:05:40 -0700 (PDT)
Received: (nullmailer pid 361968 invoked by uid 1000);
        Wed, 23 Mar 2022 20:05:39 -0000
Date:   Wed, 23 Mar 2022 15:05:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <Yjt9kxLDLlJSB8sd@robh.at.kernel.org>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
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

On Wed, 16 Mar 2022 13:10:54 +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description.
>  * Removed LCDC references
>  * Changed clock name from du.0->aclk
>  * Changed reset name from du.0->du
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
> RFC:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
