Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE31C4E5AD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 22:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345006AbiCWVs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 17:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiCWVs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 17:48:56 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1648E18A;
        Wed, 23 Mar 2022 14:47:26 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id r8so3053430oib.5;
        Wed, 23 Mar 2022 14:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OkkqPejIvAtlOMyVAYvOIwcHM2WzlIdgAOpzjXKoJU4=;
        b=GBv4ySwhhFjefQgVBpAab2mkEET9ddtSOgzepQ1wEogrprQM0Vqb7xbxA3JZi57s1S
         5bMoonjgTlcbuLESOho1yqSqnEETjIQYXMElb4Wh2bYtbj9D5DNVZ3/TBZssjGHdA5U6
         Rpw359ezp3sjvY56Aoo2QfLyb0ZY/bkzcw2kd7v4ohzs+VNvSnKHhfCfF27Qc+IJqCPU
         2+qN7yCr8cCeu/pXfa9tuI5a5HGGjaEqDOpinHNbiyXjCKpNNNx61xBvwPE6RNjaEFpM
         f7mPBC1lmabAMBc9ExxPuUfwAWr0B8c5LkRDJvZzlUAGhHuTx3u7nYtqcZLBm1aifnTy
         97BQ==
X-Gm-Message-State: AOAM531qofpn/el0U9Tr9SdPAIj+RqK8ydgeo3ddQFRQdAV8451CdSAq
        6sXNZTlB9ilcFioLiEbmEA==
X-Google-Smtp-Source: ABdhPJxWMtgj0H9DbEOzxF/FOzBu64GXgF8jadPVZ/QU9gzyJsiWf8KipKX16vZYBZk3dCF5pko6Yg==
X-Received: by 2002:a05:6808:146:b0:2f4:748:5588 with SMTP id h6-20020a056808014600b002f407485588mr495090oie.292.1648072045865;
        Wed, 23 Mar 2022 14:47:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q6-20020acaf206000000b002ef960f65b3sm498887oih.25.2022.03.23.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 14:47:25 -0700 (PDT)
Received: (nullmailer pid 512768 invoked by uid 1000);
        Wed, 23 Mar 2022 21:47:24 -0000
Date:   Wed, 23 Mar 2022 16:47:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Message-ID: <YjuVbBck5RE79EPl@robh.at.kernel.org>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
 <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
 <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
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

On Wed, Mar 23, 2022 at 06:26:31PM +0000, Biju Das wrote:
> Hi Rob,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> > MIPI DSI TX bindings
> > 
> > On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> > > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > > It can operate in DSI mode, with up to four data lanes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > RFC->v1:
> > >  * Added a ref to dsi-controller.yaml.
> > > RFC:-
> > >  *
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 146
> > > ++++++++++++++++++
> > >  1 file changed, 146 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > new file mode 100644
> > > index 000000000000..74bc3782d230
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > > +++ l
> > > @@ -0,0 +1,146 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Renesas RZ/G2L MIPI DSI Encoder
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> > > +  to four data lanes.
> > > +
> > > +allOf:
> > > +  - $ref: ../dsi-controller.yaml#
> > 
> > Full path preferred:
> > 
> > /schemas/display/dsi-controller.yaml#
> 
> OK. Will fix this.
> 
> > 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Link register
> > > +      - description: D-PHY register
> > 
> > D-PHY is not a separate block?
> 
> Basically D-PHY is integrated inside MIPI-DSI Tx module.
> 
> MIPI-DSI Tx module consists of MIPI DSI-2 Host controller (LINK)
> and MIPI D-PHY Tx(D-PHY).
> 
> That is the reason I have modelled like this.
> 
> Is this model ok or am I missing something here? Please let me know.

I don't know the details of the h/w so I can't say. We do see blocks 
with a phy modeled as 1 block only to need to separate them when the phy 
part changes in the next process node. I imagine we have it done both 
ways for DSI + D-PHY.

Rob
