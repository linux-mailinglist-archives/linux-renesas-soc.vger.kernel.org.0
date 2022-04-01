Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667344EE56A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 02:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243548AbiDAAki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 20:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiDAAki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 20:40:38 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B580F55CE;
        Thu, 31 Mar 2022 17:38:50 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id e25-20020a0568301e5900b005b236d5d74fso1115504otj.0;
        Thu, 31 Mar 2022 17:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Md3cCefLMSray2j1VFcGmjcxpcWEMbLoOD2HKB0PTXI=;
        b=CTiNIIufTNEeElS7K6KRtyeJpNyaI0127t1ZEeNQJAXikeYh/cfRwFsJvLsasMk5Pn
         1xAqNEYFXZ1AxWicU/K2Ejf8zpBfGTiMUZqnd2v2jNEJpleIlCVseedHWVjnRAg3TXFD
         yxGE9UV6QSGpCj26ED0JeG4l7Y3JkFPfPiu3uuNXmvUZznaZMv8tuPLU0Rjzwko7itzj
         PdHn3+B6nJF/1K71sStcv556qrHFFMPPMBm2HlNF0LjV78jJQYW4V/aXi/bPWvMk3Pjz
         sQRc1ZJDfCr2SOUCZ1Ord9fvpmN7y+cKfbPS7p4IXGVDDOJ+z+x7GlKFfROm+arhNPIS
         w3wA==
X-Gm-Message-State: AOAM532fWJdnmIE/hblm70aiyD/EFDrmx48HumiMIdBQl2l7DbslSzB2
        mVM9mbPuyqszVcP5yZo0uA==
X-Google-Smtp-Source: ABdhPJxrSAu+8NUOgpFf3GPF5vnUKQ/glmdpSADcfPd0K+ga9g1rCslA/mzTPaQNCT8WkVeCO+SorQ==
X-Received: by 2002:a05:6830:22ea:b0:5b2:35c1:de3c with SMTP id t10-20020a05683022ea00b005b235c1de3cmr6718277otc.282.1648773529526;
        Thu, 31 Mar 2022 17:38:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h83-20020aca3a56000000b002ece47dce52sm410301oia.26.2022.03.31.17.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 17:38:48 -0700 (PDT)
Received: (nullmailer pid 1796244 invoked by uid 1000);
        Fri, 01 Apr 2022 00:38:47 -0000
Date:   Thu, 31 Mar 2022 19:38:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Message-ID: <YkZJl+z3OL32pCKU@robh.at.kernel.org>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
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

On Mon, 28 Mar 2022 07:49:30 +0100, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added full path for dsi-controller.yaml
>  * Modeled DSI + D-PHY as single block and updated reg property
>  * Fixed typo D_PHY->D-PHY
>  * Updated description
>  * Added interrupts and interrupt-names and updated the example
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
> RFC:-
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
