Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8ED4590BEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Aug 2022 08:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbiHLGXV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Aug 2022 02:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237095AbiHLGXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 02:23:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D31A50F4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 23:23:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z6so50300lfu.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ln6uw5ECmV28MFsRRMGsJGz2XJAnhGBl8re7vmnEV8c=;
        b=MnAnni1V95VJawZPTkqbeLMdNF/YKCDZcS2uW/XjWF4HSyfJiiAfJIWg/oNpEFwpKH
         hWBASb0RPRXLE+colDEWxscBM7uzEP8PJexmdvUtNeg0EiXqgQa+YMZpf8TGzkAN6WDQ
         Mq6opWU7BEzmHw2eYm4OZl05q6OQPlXoHG5J7OsMVYlL/ACcnklJfUpJh6XuBLAnsksf
         FP0QfhyCbWLhoj4ddbNcYhkCXDm2wnU8IHla6im5noKuHMc6ji7+ua+mdcs16unB5P2z
         LRFMpwA6hAyOH3oIaIFOBJA3zylvYxZMOC8PqeacxC+5YmlGqs7rlmZs0Ge9I6c0Zc26
         5nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ln6uw5ECmV28MFsRRMGsJGz2XJAnhGBl8re7vmnEV8c=;
        b=mQ/pQMMPX9aI3X1JBg92zRzjwIUuv2UMgOOlsWkmZW3zqSI8khe3mL67+1yfNJnkbn
         085hP8wYZVcZoMkS42wR5F0DSNfI0CZPSw/suEV+6cFLcvH0FkHlaQg1eGrPoV0hBtnU
         xEMvcc9A3ZIV41I5dUFr7Gh4++tUTrR2SivhTY6+gG3yavwsGuzD4PMCE+ARu/rv6R1m
         9AtOTm4gLtt97IqtpOf1BgUFTklf1mn4dZtm0/6g4Nl5BbeojCHIpXZ1Gd/pxIv+HfW3
         /zBUcSusETLIDSE9QMTTjqAfwOUVAFLO5+zcMNPDFl/w13nNud1jjXrCCWWh2M3ITKW6
         /amw==
X-Gm-Message-State: ACgBeo1UhYHfnnFZc32wL4yJqgG4ltGq6MNBoTrm1uyQWu5sHL4DX/To
        0u/l/KbmmWPGyL9pygQAktRhqoH2uUmScrR1
X-Google-Smtp-Source: AA6agR7W63XlCIJIdN24LYjn/IGHmyDjWxE/5M6IHSTSJK/mD87XUhFWMBUAXQaLEajW0bxFJGvCYA==
X-Received: by 2002:a05:6512:3d10:b0:48b:223d:da9b with SMTP id d16-20020a0565123d1000b0048b223dda9bmr791528lfv.332.1660285395758;
        Thu, 11 Aug 2022 23:23:15 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id d5-20020a056512368500b00485caa0f5dfsm104504lfs.44.2022.08.11.23.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 23:23:15 -0700 (PDT)
Message-ID: <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
Date:   Fri, 12 Aug 2022 09:23:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup@brainfault.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
 <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
 <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/08/2022 18:42, Geert Uytterhoeven wrote:
> At the DT validation level, I think the proper solution is to
> merge Documentation/devicetree/bindings/arm/renesas.yaml and
> Documentation/devicetree/bindings/riscv/renesas.yaml into a single
> file under Documentation/devicetree/bindings/soc/renesas/.
> 
> What do other people think?

I am ok with it.

Best regards,
Krzysztof
