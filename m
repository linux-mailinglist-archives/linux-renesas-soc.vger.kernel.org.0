Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7AFC54A1A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jun 2022 23:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238671AbiFMVkH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jun 2022 17:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240467AbiFMVkG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 17:40:06 -0400
Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9852221BD;
        Mon, 13 Jun 2022 14:40:04 -0700 (PDT)
Received: from madeliefje.horms.nl (2a02-a44a-2918-403-201-8eff-fe22-8fea.fixed6.kpn.net [IPv6:2a02:a44a:2918:403:201:8eff:fe22:8fea])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by zeeaster.vergenet.net (Postfix) with ESMTPSA id 155EB20117;
        Mon, 13 Jun 2022 21:39:33 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
        id 7FFA53A3E; Mon, 13 Jun 2022 23:39:32 +0200 (CEST)
Date:   Mon, 13 Jun 2022 23:39:32 +0200
From:   Simon Horman <horms@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: renesas: Move renesas,prr from arm
 to soc
Message-ID: <YqeulPthZWqK1CKr@vergenet.net>
References: <5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be>
 <4c11e4c7-c441-7520-5fea-08a89e149ce6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c11e4c7-c441-7520-5fea-08a89e149ce6@linaro.org>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.6 at zeeaster
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 03, 2022 at 01:54:39PM +0200, Krzysztof Kozlowski wrote:
> On 02/05/2022 14:40, Geert Uytterhoeven wrote:
> > The Renesas Product Register DT binding is not a top-level DT binding,
> > hence it does not belong under Documentation/devicetree/bindings/arm/.
> > Move it to Documentation/devicetree/bindings/soc/renesas/.
> > 
> > While at it, change the license from GPL-2.0 (only) to GPL-2.0-only OR
> > BSD-2-Clause, to match comment practises.
> 
> s/practises/practices/ ?
> 
> You should get Simon's ack for this. :)=

Sorry for the delay, I hadn't noticed this until Geert pinged me about it.

Acked-by: Simon Horman <horms@verge.net.au>

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-devel for v5.19.
> > 
> >  .../devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml (85%)
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof
> 
