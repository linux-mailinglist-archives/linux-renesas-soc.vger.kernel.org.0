Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8975B595679
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 11:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiHPJcB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbiHPJan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 05:30:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBFC356F0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 00:52:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u1so13732825lfq.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 00:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lQtHUsLH/WWCjoSjGefd7DortRFai1vXhVwE4aiVS2E=;
        b=Gpqfoc8EPuBG/IljADnLwp/zZ7Nu6MdA2w8NhpnOCBNu9qs8xm0QIuRHmed86YGInA
         z4FqE3LGcbyeZKuqzdqYkN3c7is6lO+R1yDTrwClA4vLaTzzDnWBF3Y+txa+1VBeypwr
         SaXP//AlTJcEacqBsAGcykak0VHCzos8jgsTjyfbQylCtiWDMjOukU1f6fWR8YdymijK
         7lviToGRHXGreerj/g15B8oy2C0mBKLXa1WY5LCOq+2qX3GOrnjj6iOBcMs9pTZFdbT6
         3huQNMrBaYBMsrC6JzASl+D7SxlxSZl9GL8z8CJR6Zvlap0LH1vi0c2jCGq5oiiM3Lrq
         48qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lQtHUsLH/WWCjoSjGefd7DortRFai1vXhVwE4aiVS2E=;
        b=oj31LIq+I6tkGcAmscpNow35N2ayGpdmqCzoIrOA1REL+fzWDQfEF7ZwiRykeVpDzm
         g7/LMYgqwDa/mSMPFHqfPbINuhBX6oebsdb7ySmgyIzuL3BL6xrDLkOKnmnV9DO3Jaz1
         2tcpzvwNPVFimckL8gqX/9tNicfr7xs/7WppMcxdp+FdHSB0YIP/3eA5zzfHoLMVGmqP
         c7Qm14xLy7Po7WOZUn4q+K1Zl42kJLnFjrvvLSc2jdckXi2oYCI+5ouXsO/1wx8hDFEv
         hn/Y4lAWpz3wElH2EeD0rg0q368TG5GivHOy5WW/BvnEBM5h0Jra2FTmgvjvWGtvPYO0
         uSBg==
X-Gm-Message-State: ACgBeo0MY9FOmhh5YNDNurqUSDoJ0wWNE/7mSGUTnEvCWbe/uJfw5IW8
        xy2NQjnUYd/9eHe/x/721n06ng==
X-Google-Smtp-Source: AA6agR5VnT3udntrZZ7EpKwe70edEBA0fLvgAKcwEb7zHnAozngFaACreSwQIdagnlyVDCnpihCy4A==
X-Received: by 2002:a05:6512:ba2:b0:48b:7c:84 with SMTP id b34-20020a0565120ba200b0048b007c0084mr6544937lfv.48.1660636353707;
        Tue, 16 Aug 2022 00:52:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id s3-20020a056512314300b0048aa0ab6448sm1312234lfi.15.2022.08.16.00.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:52:33 -0700 (PDT)
Message-ID: <8b912cdd-e69d-dea0-046e-6e02a9984859@linaro.org>
Date:   Tue, 16 Aug 2022 10:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Conor Dooley <Conor.Dooley@microchip.com>,
        Anup Patel <anup@brainfault.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/08/2022 18:14, Lad Prabhakar wrote:
> Document Renesas RZ/Five (R9A07G043) SoC.
> 
> More info about RZ/Five SoC:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
