Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98817CD258
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 04:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjJRCgb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 22:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjJRCg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 22:36:29 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2500FE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 19:36:26 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4580a2ec248so950724137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 19:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697596586; x=1698201386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=FJ2edDc7ZGSf8gvxIsr3asfAfb/9r3Xb5Z4NjU2llZg2lPkj2fdQHcRzxZ9SKMzQpQ
         pwyD9eAioHbGdX0Z/iiJQZJJBOKXNkk9aR0ZxQhrP2Kw4Goc6CzEG0eEBX7V0Viv8jf7
         ThGW0GlRYlXW7prvxjmwPJLVLnFFyhIj4G3jfvtN/FVNezAuRZJZzmOB9HjBhB3A+IcM
         mf9OdyJFk83Jq5I2DqrpX7lzS5r//gi2kRfrHHR+MVD428Dpnal1bOUH5Xuc+Sn2DLeM
         dKS/YogbKRypgcCwZKc77/MePg8PEkhLHa6mwQg6MkyjG5BfuRoCLXLUedQBsrcJfHUF
         KeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697596586; x=1698201386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=r5BdE4Fu9KXak/5OVqYFqhpWybY/U2EGLsp0RJra3gtHLDDI102tVJCmfuh569kCoX
         Z1jHT03uBIEis240kkJJTtZB5NlJlcUzqJniCey/5AwF8SouGe6vu+zeuqpfS5B1Zn1t
         ymIl0dAwGIv879eZncGP/757hGSNbF2xzXRBkb8c6ppppRVgvnWfuhChARD4j6GNOYuS
         Xg4llT00gC+NhB9uDV0kIkLexfpsThwqiP1WQhTZuaQfIOVdp9fEyz/PCGakosYovo/6
         uWGPYnGFUYPx+veN0JWc+NeSgZR1427w5QOOdNeSrYfyp5O12BEVF42PWqoWhS5intNN
         6Nxw==
X-Gm-Message-State: AOJu0YzZ4WifUBBL17wcMd7V5UVnvRTHVt+OErZ5ThPLHuWXCYSrS2Uh
        oJMQCQa+QTDEPxmzJCFIHT80sU/5Z5zi2v/WLzMbgg==
X-Google-Smtp-Source: AGHT+IGB3G4DPZs6jCzWa2l4tyot1REVVzMZ1DTbbM5dTMuW4mJZGqL+sHBYO3aIbBTBJypIWm04PA==
X-Received: by 2002:a67:c10b:0:b0:452:82ff:e76 with SMTP id d11-20020a67c10b000000b0045282ff0e76mr4377909vsj.13.1697596585740;
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id t6-20020a0cf986000000b00641899958efsm1017131qvn.130.2023.10.17.19.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Message-ID: <39aef189-4eca-44aa-8877-9fcf547f3282@sifive.com>
Date:   Tue, 17 Oct 2023 21:36:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231017135926.1240101-1-hch@lst.de>
 <20231017135926.1240101-3-hch@lst.de>
From:   Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231017135926.1240101-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-10-17 8:59 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -	select DMA_DIRECT_REMAP if MMU

This breaks ERRATA_THEAD_CMO, which also needs a `select DMA_DIRECT_REMAP`:

riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L131':
direct.c:(.text+0x42a): undefined reference to `arch_dma_alloc'
riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L192':
direct.c:(.text+0x592): undefined reference to `arch_dma_free'

>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
> +	select DMA_DIRECT_REMAP
>  	help
>  	   Adds support to dynamically detect the presence of the ZICBOM
>  	   extension (Cache Block Management Operations) and enable its

