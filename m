Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91CA529680
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 03:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiEQBE6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 21:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiEQBE5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 21:04:57 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CE43ED09;
        Mon, 16 May 2022 18:04:57 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-f17f1acffeso9892292fac.4;
        Mon, 16 May 2022 18:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NiPZUfB1jHchcWwZqAQi4Kb97b31UZXWOC6k+8lghdE=;
        b=vM7KvSZyjNtEjV9E+iLlNeSVoFehdPqDeLRKWbJiJ9tLYtwg12/iqgRInO5R3Sgbii
         06owibbusxY+KXclY7YjZo1UP6szQkXzoZbAMJWdEunRFyrpWLPlq5PKnvUX5+v7sTZ1
         LPU24hSaGDmwtxO5WPwszrQnCpikUIoI2fMpE+538GQrJ0Hjh1vfo/mk9hhvCM8V/LsP
         ManfHUZPl4MCkeJ8Te+56yvb0qmJnDkzFlzHLQAELdwyW+yJrOji8r84ToAOon3IBR/O
         claSd3LkHQmGjisnasOUU7KN0zrkIJp8v4pdigTby64P50AFOi6PoiFFTW/RTWbTN6u0
         hv4A==
X-Gm-Message-State: AOAM5314uX6CIsnbkLTnaGBNvLRSYXfA6X+3T15G4yXTu15uEnzBIj6O
        Z6jU+wgwmTo0mOxqnW09bw==
X-Google-Smtp-Source: ABdhPJyAH/KPe88TlRB4RWqnaKvQqp6zGn2tX8q+P0sNxKmlwkUzi0K6DH+sQdQ9ig9S0DYW5jkFyw==
X-Received: by 2002:a05:6871:79b:b0:d3:4039:7e7c with SMTP id o27-20020a056871079b00b000d340397e7cmr17307138oap.121.1652749496411;
        Mon, 16 May 2022 18:04:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h11-20020a4aa9cb000000b0035eb4e5a6c1sm4848173oon.23.2022.05.16.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 18:04:55 -0700 (PDT)
Received: (nullmailer pid 3713828 invoked by uid 1000);
        Tue, 17 May 2022 01:04:54 -0000
Date:   Mon, 16 May 2022 20:04:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas: usb3-phy: Spelling
 s/funcional/functional/
Message-ID: <20220517010454.GA3713765-robh@kernel.org>
References: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
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

On Mon, 09 May 2022 14:53:34 +0200, Geert Uytterhoeven wrote:
> Fix a misspelling of the word "functional".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
