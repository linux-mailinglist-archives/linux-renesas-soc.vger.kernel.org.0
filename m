Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9193A4F6803
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 19:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239361AbiDFRnK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 13:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239876AbiDFRm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 13:42:56 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5CD1ED041;
        Wed,  6 Apr 2022 09:29:07 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-deb9295679so3476612fac.6;
        Wed, 06 Apr 2022 09:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTGmartVk1PMa2yF4BMnr2sdIlBU3DeI1t1f5rwAvYw=;
        b=YoryO1y7ubXjAbZAqY+N2fD/9yxmhyqw1u2Te1x7QWm9fhp4K8Qk3YrGULMNtrdmgl
         zZfMQc86gs5T7rJC9Yb05JWY3TqTSLUj9PebHNZk1lWVZNUljbULE0sqRyh5UfirG6Og
         8m31rZcoP1H4Z1le5o7O3LDfG9dAcvGqpEGlNBigIbxXA6K3VHoNyAAIJMnfb3zEqeeG
         RC8mAVdj/8bOKejQ+8boSPDPHccsP2gV+GfmnGNtQgcus/Y+dp7o7U3tN1ce8yM1JT0F
         U+PumPQYHVoFeJGW93WNXqTd64g6IjPm+sGwJWkkrws3oogAlrmN9+w1SddQ1j47U30Z
         CZCw==
X-Gm-Message-State: AOAM530VrY/EQyzr6QLJWuL/lOEthQY6IvEGZDrGibf65k52IDtRU/Mx
        64YHms6vhWCmWCaHoEQJ98xxziF8Dw==
X-Google-Smtp-Source: ABdhPJwGihOqx+gvmspvGraEDqVLiyU+crGBlGMc30mUgoXLA6E1p8t208EuGDxytPA4pyEj2+bZEQ==
X-Received: by 2002:a05:6870:8327:b0:dd:b065:6a80 with SMTP id p39-20020a056870832700b000ddb0656a80mr4418190oae.167.1649262546154;
        Wed, 06 Apr 2022 09:29:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r19-20020a056830121300b005cdb11a7b85sm7078728otp.29.2022.04.06.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 09:29:05 -0700 (PDT)
Received: (nullmailer pid 2364676 invoked by uid 1000);
        Wed, 06 Apr 2022 16:29:04 -0000
Date:   Wed, 6 Apr 2022 11:29:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Message-ID: <Yk2/0Jf151gLuCGz@robh.at.kernel.org>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
 <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
 <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
 <a480eb35-4d27-8e40-4b34-9ed269ec6ccf@linaro.org>
 <OS0PR01MB59225118A6FC3D9C58D9A00E86E49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <b71f439a-98fd-52ba-7580-dfbb8cbffebe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b71f439a-98fd-52ba-7580-dfbb8cbffebe@linaro.org>
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

On Tue, Apr 05, 2022 at 02:05:31PM +0200, Krzysztof Kozlowski wrote:
> On 05/04/2022 13:47, Biju Das wrote:
> >> Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
> >> RZ/G2UL SMARC EVK
> >>
> 
> (...)
> 
> >>>
> >>> And what to do when adding more DT overlays for expansion boards?
> >>> This would become unmanageable soon.
> >>
> >> There are two topics here:
> >> 1. Whether we should follow DT spec. If no, why Renesas is special and for
> >> other cases we follow DT spec? "Unmanageable" is not the answer here,
> >> because other platforms will have the same problem.
> >>
> >> 2. If the answer for above is yes, we follow DT spec, then the question is
> >> how to deal with overlays. In current code - I don't know. Long term,
> >> maybe we need a way to append to existing compatible (to extend it)?
> >> Some expansion boards do not need to change top level compatible, because
> >> they only add constrained features (like Arduino shields with some
> >> regulator). You just add it to DT and presence of new compatible, e.g. of
> >> regulator, is enough. You do not need to change the top level compatible.
> >>
> > 
> > Does the rules for compatible values (most to least descriptive) 
> > also apply to the root node?
> 
> I don't see any exception in DT spec (page 26), so my answer is yes, the
> root node has same meaning of "compatible" as other nodes.

At the end of the day, what matters is can we identify what h/w we are 
running on from the value of 'compatible'. Either way I think the answer 
is yes.

The modern mixture of SoC, baseboard, SoM, expansion cards, etc. doesn't 
map perfectly to compatible's definition. If someone wants to define 
something, then that would be good. However, there's already existing 
practice to take into account.

Rob
