Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE14602F2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Oct 2022 17:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJRPKR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Oct 2022 11:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiJRPKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 11:10:15 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9589E7E038
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2022 08:10:14 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id s17so7623681qkj.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2022 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqaG5WlCKcmOhxS6tO4ajkrDthnXbYZMUrCJvPijiHw=;
        b=Q84/nXJ7hIHooTETWIBgU1ofYJMAUdhwgHN9/PSF+lm4Z2fw3Vw2OS+Fkqovw3m0YL
         RVeQJmUpYmtS4jBdy3Tv89Raa1bvZyGf5hfIo+4bxvXf68LaDoLooI1MlAqwuf56Q/db
         N08FJAaubcNoxBckMhTDQ9O9OuF8pJUMtjpyhyF6lTJHzhgyrrWWYiAKH7V13TDF6adV
         k3eDWtepjPrZniYsDxZX0GmEOPSxpBmfp2iLJ0bGpfaIbWfbS6nb2amsMwtvDYalN5j2
         d7AtTKaVw5bZr4kKrVOzGUKgKKC009Qhth8FhypMghlYHC6GxQS5tPu4xCWMtBQbDM/q
         sYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqaG5WlCKcmOhxS6tO4ajkrDthnXbYZMUrCJvPijiHw=;
        b=Qs5wyU++tIdkgSNfaaOXyXuUNUUpkKZJbb3rYPYkkPaq/Ph78pRBsQ9EWDPKHPyv38
         4F+WtI8wo+LAnAfDDWsTR44HpCfo1WrmLJ1QZ0skb/eUEX1uvuHRyGpfTQvZtTNnCbCr
         mYyEDA7O0KI/I7ltuMNta+di++bDoWvQ2GoUFRGhatt9C2D7ntx09AiJJJHJq7OQZbMd
         yf2hPMuGruZS/iDnUpQoUBaZAbCxT3QKYufA1JJh5a/n/8ZQnGIzSVfO12EnDcX+Estl
         iM9AsWvtubcaD4EnPIGDdZY10MmETZb5C7LDbH5psh8DNer/Q+Dt0yjQt1NB5nKisjYh
         gOmg==
X-Gm-Message-State: ACrzQf1eJV1khfs3KdTo+LRfrUJux+yYR4iNMqvtOVOa7vyet+iet40b
        oyige/PifYEnie/2L0tsCz/dKQ==
X-Google-Smtp-Source: AMsMyM76liOTjHM67l5LfK963+nCUekT9QJYNKdF5H0BGaJYq7gU31ZhmJaJSFpoHJyHycFKEILYPg==
X-Received: by 2002:ae9:ef81:0:b0:6ed:1614:582f with SMTP id d123-20020ae9ef81000000b006ed1614582fmr2128185qkg.403.1666105813778;
        Tue, 18 Oct 2022 08:10:13 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fx12-20020a05622a4acc00b0039cc7ebf46bsm2035297qtb.93.2022.10.18.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:10:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] memory: renesas-rpc-if: Add support for R-Car Gen4
Date:   Tue, 18 Oct 2022 11:10:08 -0400
Message-Id: <166610580691.30968.10690829746518905934.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665583089.git.geert+renesas@glider.be>
References: <cover.1665583089.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Oct 2022 16:01:50 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds support for the SPI Multi I/O Bus Controller
> (RPC-IF) in R-Car Gen4 SoCs, which is very similar to the variant found
> in R-Car Gen3 SoCs:
>   - The first patch fixes a missed initialization issue, which is at
>     least seen with the current firmware stack on R-Car V4H,
>   - The second patch adds the actual support, and takes care of the
>     increased size of the STRTIM field.
> 
> [...]

Applied, thanks!

[1/2] memory: renesas-rpc-if: Clear HS bit during hardware initialization
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d37f4c58e47f6129fbb8c52f6d1a70e71fc2c0c7
[2/2] memory: renesas-rpc-if: Add support for R-Car Gen4
      https://git.kernel.org/krzk/linux-mem-ctrl/c/455aad51434e9622702373be57973a6c47a88684

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
