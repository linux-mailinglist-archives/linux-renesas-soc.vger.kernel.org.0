Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C104E5096
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 11:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbiCWKqc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 06:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiCWKqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 06:46:31 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4436E7A7;
        Wed, 23 Mar 2022 03:45:01 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id k10so1334364edj.2;
        Wed, 23 Mar 2022 03:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KPirtUsK9aykGIf4JFWg4x3FgkfLCBqUL0Nhw0q2gpA=;
        b=lEtInvFOKz1zHRUVtL8pZobLJ6IuBUIA6JaytnnE1DJgWH+oPqYbR700AN3oL1Ckwd
         r4ISx9+GPpfdAChaYC1sjWjaiGo6lKog0Jmco+RQWIzp/fvEP2abMMkO5lO6j7TGY6fL
         WGdShKvwSZlJlwtRQTnYrMvZHmNmpJ7WCcEHdIp/N4Pp5NlNr+4GTpjdEoaUuwSC9xPr
         lu0lx0noytET1w8EqYMzn0rQGzF10yUBTQBP98OrvxXGH7vExabYp0gleMzaaDWx40V9
         9C9xLLwBpAPTiw+6G4v5hLNDmNANF4Tfb0FXVEDRFRB5SCf0tEw5gcyAljsdy0jHqarH
         kSHA==
X-Gm-Message-State: AOAM532xAfgidfa21x3O+DBQlaO4Hi8NbJR2Bcxr9wObqYulE/ks5mCC
        3y5tzDxrFJGdI16RmyZ+pwQ=
X-Google-Smtp-Source: ABdhPJxOCDPmqdA+98YCHfYmGGJiG/+cgKj5+rA08FTVJtZ0L3s5taImhW6evHgw2dGnYUqpSeSqOQ==
X-Received: by 2002:a05:6402:1111:b0:416:2ac8:b98e with SMTP id u17-20020a056402111100b004162ac8b98emr24455313edv.236.1648032300179;
        Wed, 23 Mar 2022 03:45:00 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id z1-20020a05640235c100b004192c7266f5sm5666859edc.16.2022.03.23.03.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:44:59 -0700 (PDT)
Message-ID: <57d06e8b-a7b5-6876-bde1-59faa1739bee@kernel.org>
Date:   Wed, 23 Mar 2022 11:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/14] dt-bindings: clock: renesas,rzg2l: Document RZ/V2M
 SoC
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-6-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321154232.56315-6-phil.edworthy@renesas.com>
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
> Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml           | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
