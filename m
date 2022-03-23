Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4616C4E5050
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 11:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243513AbiCWKav (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 06:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243497AbiCWKau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 06:30:50 -0400
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063AB23149;
        Wed, 23 Mar 2022 03:29:21 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id dr20so1891055ejc.6;
        Wed, 23 Mar 2022 03:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/8V/0/Hk4FYKFRX4sGzvPPX9e0QiiDhK4X2PKUW+O8I=;
        b=HQ/zxrzpSkk7+OeXVvrwC2jnKmz3RiWZpqA2WAGAAHrsla0waIWWPNVSYAmegLJ5ab
         MidLdwzXBzJv+mwExfH/Q4Ea+ykH7Ge2RF3SG2jqegk63ooPeC2UunTVToorQ678PyCv
         3ftPD198zJYQcceO3vvz9ZSlf6Q+7YyhSnXFTO8aCtkQdMD5ucJuD6sri+6/tR+3W/77
         R+UalmzxMEKXA+KIetldy1FbvKjuEGFYTkhQjbmhC5MgXoUwr4N5tre76J6KtX3O1GXX
         vdVc/co7ut6Aj96hc2L2Xh7mibxPXgZzIGkXxfd0exfpDuq9yDVmbhdT00YLu4vKgGAe
         bUFA==
X-Gm-Message-State: AOAM533sgRZc8WxaKJzrfThutA9K9x5uUNay8rSPKbkmTXtz8vLfzyqJ
        /IDS+Z3pvDu0mAq464i6m7BI2Fvhbwn0EQ==
X-Google-Smtp-Source: ABdhPJxc0wcp0VwC4o+g6K3+nhkowdwl9cpHHvqK55qFrgzqMlaj9LdOZLL2UCkTt9eZfskgHHjcEQ==
X-Received: by 2002:a17:906:b1d0:b0:6cf:7f39:50e0 with SMTP id bv16-20020a170906b1d000b006cf7f3950e0mr31774156ejb.760.1648031359537;
        Wed, 23 Mar 2022 03:29:19 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id e22-20020a170906505600b006da7d71f25csm9683008ejk.41.2022.03.23.03.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:29:19 -0700 (PDT)
Message-ID: <adea4307-9a2a-fe0d-ffe1-6a47c546a742@kernel.org>
Date:   Wed, 23 Mar 2022 11:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 SoC and EVK board
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-2-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321154232.56315-2-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/03/2022 16:42, Phil Edworthy wrote:
> Details of the SoC can be found here:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
> 
> The RZ/V2M Evaluation Kit (V2MEVK) consists of the RZ/V2M Main Board,
> RZ/V2M Base Board, and CIS IMX415 Board (CIS).
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
