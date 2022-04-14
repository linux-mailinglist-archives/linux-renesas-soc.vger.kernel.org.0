Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1589A500371
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 03:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbiDNBJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 21:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239348AbiDNBJk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 21:09:40 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE7651E51;
        Wed, 13 Apr 2022 18:07:17 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id z8so3901987oix.3;
        Wed, 13 Apr 2022 18:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R82RD8v5prr4Rd3tq2uqvwCSz+WljHxj6XlBXJR4q0I=;
        b=q0sj9WYj1RcX3fH2xYq70ju0+/eZJEgNaSjDgZtDtGTSUN8gQPElAZktoKGSnY6CYA
         d6wp/pA2wMDXEC27LERtDkg5FpoBMcHKe0mL9fk3s1xXvKe8V5mKL2jeSyD+/fvAWdtt
         JA/dlMqRQxmb4frk4DRYAydQmnajSGOlfhXaXZmK/TJzJmrzMVtcfMiD7oaES14KOxBq
         fkHnATrpP51tWWIwtCJxg2xJvE9cURvCNVTCmLf9pg2Yh7x93JeRusjHgPrcRGM3zksR
         818/s9D1ieQzYoTgqneQ7xXwNcMFLdqMs0qgxFFS0r/qjGHfik3fAE2+74dhPPpMvIZL
         XtXA==
X-Gm-Message-State: AOAM533J2mE+ZqRMV302DuSRUUd2gCAlLmMSLMx47iJl0vnmuxEestdh
        lgg727erMS1cCHXikppBHhv5lZGUvA==
X-Google-Smtp-Source: ABdhPJxJC8sVa21CHJYMxU6uS+2mJLyhydv3zxPuOBKBwslWEpFW7sJZO3uLi4b1xaUDCrYgK54RBQ==
X-Received: by 2002:a05:6808:1827:b0:2da:5085:2e78 with SMTP id bh39-20020a056808182700b002da50852e78mr661056oib.172.1649898437146;
        Wed, 13 Apr 2022 18:07:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a056830448a00b005c9344dac06sm252742otv.19.2022.04.13.18.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 18:07:16 -0700 (PDT)
Received: (nullmailer pid 113330 invoked by uid 1000);
        Thu, 14 Apr 2022 01:07:15 -0000
Date:   Wed, 13 Apr 2022 20:07:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED][PATCH v2] dt-bindings:
 ata: renesas,rcar-sata: Add r8a774e1 support
Message-ID: <Yldzw63tIdKhhtA1@robh.at.kernel.org>
References: <5861565a79a2bdadc07ae84e23e6d96dbb764823.1649680949.git.geert+renesas@glider.be>
 <4716ac8b-acee-da06-5fa1-34eed07ba4d0@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4716ac8b-acee-da06-5fa1-34eed07ba4d0@opensource.wdc.com>
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

On Tue, Apr 12, 2022 at 08:05:42AM +0900, Damien Le Moal wrote:
> On 4/11/22 21:43, Geert Uytterhoeven wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Document SATA support for the RZ/G2H SoC, no driver change required.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > ---
> > v2:
> >   - Add Acked-by.
> > ---
> >  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> > index c060c7914cae6573..c4e4a9eab658056d 100644
> > --- a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> > +++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> > @@ -26,6 +26,7 @@ properties:
> >        - items:
> >            - enum:
> >                - renesas,sata-r8a774b1     # RZ/G2N
> > +              - renesas,sata-r8a774e1     # RZ/G2H
> >                - renesas,sata-r8a7795      # R-Car H3
> >                - renesas,sata-r8a77965     # R-Car M3-N
> >            - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
> 
> Rob,
> 
> Will you take this patch or do you want me to queue it ?

Please take it. If I've acked or reviewed it, I'm expecting others to 
take.

Rob
