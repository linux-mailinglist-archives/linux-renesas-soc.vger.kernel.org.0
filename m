Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33E51B1B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 00:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357346AbiEDWVC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 18:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240375AbiEDWVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 18:21:02 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2022C4CD5F;
        Wed,  4 May 2022 15:17:25 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id m11so2604750oib.11;
        Wed, 04 May 2022 15:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kD7M+8KXcS9HdKPwzwBpF1yYbVFJAgspjDqWP4VoK6Q=;
        b=dX7RrpkCArZFDnh6jmb2f2EIP9dXTl5TzDIXtgqIR/Hc9eQdOY6FRJ/btvUVcu8t/f
         1d3XCaCoKBMZB2G48Tzx8cHAWl5iI8PuOtZVotf7AhRTT1At5kH1f7CPjKBS7K+A6wK7
         lfcN7VyuMNyZvOiPfI53s1wHzLl+/wNY1VeGnEF+lk/Ipxb9MxB0oNTK4TSk83eiJ8ac
         LFiFbOVbPxH0ftAVT7hYman265ebBjr9taxu7NeLD1zo1QB/I7gJeQsFLR4FmTuEq9jv
         smXctvT7ga5ytLM/hVZPG4F5E+ZPn6qzJVYCMBDtE5FQnYJvfjBxhBS/vge/cZcB4em5
         ge0A==
X-Gm-Message-State: AOAM532mpWOVXl8rJ1fH01vDiS910kZ3C8JwsrwdFvHN0JG9MnbrkMs1
        mqrVeZR6Bym4MnZ35UDiNVRbFS+6gQ==
X-Google-Smtp-Source: ABdhPJzpzlPiIvHZkp3KOM7uuHjMlPfyn8UnrCCTbY25jOIdazXOT6jia53nwattp0HU8tkVYlLsFA==
X-Received: by 2002:a05:6808:3009:b0:2f9:6119:d676 with SMTP id ay9-20020a056808300900b002f96119d676mr874775oib.205.1651702644423;
        Wed, 04 May 2022 15:17:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e15-20020a4ada0f000000b0035eb4e5a6casm45440oou.32.2022.05.04.15.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:17:24 -0700 (PDT)
Received: (nullmailer pid 2322908 invoked by uid 1000);
        Wed, 04 May 2022 22:17:23 -0000
Date:   Wed, 4 May 2022 17:17:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
Message-ID: <YnL7c57OT8/6SKa6@robh.at.kernel.org>
References: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
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

On Sun, 01 May 2022 09:25:08 +0100, Biju Das wrote:
> Document RZ/G2UL RPC-IF bindings. RZ/G2UL RPC-IF is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-rpc-if" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
