Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA2051B1FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 00:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376837AbiEDWgp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 18:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbiEDWgo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 18:36:44 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A1943AF0;
        Wed,  4 May 2022 15:33:08 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id v66so2656541oib.3;
        Wed, 04 May 2022 15:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KCLvskmQfHSLQoHJU153xgGm9qqnQf982R9B7b1MPpE=;
        b=iVxMS5+PMEbzM5EVKMhnSr6iVhmsQ9GDOwkLEf6PTSQE8WPa0d/4aET7+2ALsneQaZ
         Z5GW1uAwOFqljJ6W9UjbfQ5wO85nKtXlIxifKV/Ry7r0IY8kY1IYVbpo0j1B9keWQRBj
         CL22J2F/GHpRLIXpIKFPsYLjL4XlvwiYPq7SudDl7ZjvvAlY7y9HfK/TrRJIAEoCkAfT
         eDLzA3WXQTq9qvPFLrDOEr5gFolx1YoILPxVODUhPxMWxZCRAGs9y26+Z9jcBZNo3ogY
         3DxTpZzuhNu1YnteY/paDV1aB1uUB1cHsBW2Of2JzPB+eK6YSZx7vWf+W3DBuQyzvYh/
         zH3w==
X-Gm-Message-State: AOAM530rlIxY3cSkbr9aLfvSELp9r85FxKkuiOkYHq4/qhMKzwxRFJSa
        bhjBIav0NNaw/dIULq8bRDWDihS9Ww==
X-Google-Smtp-Source: ABdhPJzX75QPJo7huwKRdcTHPA1Mya1GI5o9IG77cAhJ532Ijr4YyWgeYwfcIaOYHc1D9ijJqxufAg==
X-Received: by 2002:a54:4398:0:b0:325:6312:1520 with SMTP id u24-20020a544398000000b0032563121520mr903959oiv.53.1651703587285;
        Wed, 04 May 2022 15:33:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b20-20020a4ae214000000b0035eb4e5a6c1sm62021oot.23.2022.05.04.15.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:33:06 -0700 (PDT)
Received: (nullmailer pid 2345673 invoked by uid 1000);
        Wed, 04 May 2022 22:33:06 -0000
Date:   Wed, 4 May 2022 17:33:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer:  Add
 optional clock and reset
Message-ID: <YnL/IbciNHLhoNOZ@robh.at.kernel.org>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com>
 <YnEqH+gzlfv96opc@lakrids>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnEqH+gzlfv96opc@lakrids>
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

On Tue, May 03, 2022 at 02:11:59PM +0100, Mark Rutland wrote:
> Hi Phil,
> 
> This is the only patch from this series that I've received, and judging
> by the CC list this hasn't gone to either LKML or LAKML, so I'm missing
> the surrounding context for this.
> 
> Looking on lore, this is part of:
> 
>   https://lore.kernel.org/linux-devicetree/20220503115557.53370-1-phil.edworthy@renesas.com/T/#t
> 
> ... which is adding support for an arm64 SoC.
> 
> On Tue, May 03, 2022 at 12:55:49PM +0100, Phil Edworthy wrote:
> > Some SoCs use a gated clock for the timer and the means to reset the timer.
> > Hence add these as optional.
> 
> The clock feeding the architected timer is supposed to be in an
> always-on clock domain, and is supopsed to be enabled before running any
> Normal World software.
> 
> The arm64 kernel *requires* that this is enabled prior to entry. If the
> kernel ever has to touch either the clock or reset, then there are
> phases where the counter will not function correctly, which is simply
> broken.
> 
> Given that, I do not think this should be in the DT, and instead the
> clock should be marked as critical in the provider node (and the reset
> should never be touched).

That is not yet an accepted DT property, but is currently on the list 
for review[1]. If that's something people need, chime in. More than 1 
person needing something is always better.

Rob

[1] https://lore.kernel.org/all/20220428110107.149524-1-marex@denx.de/
