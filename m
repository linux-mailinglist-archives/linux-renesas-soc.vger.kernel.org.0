Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB227CE702
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 20:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjJRSmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 14:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjJRSmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 14:42:32 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E53F7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Oct 2023 11:42:30 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7789aed0e46so15311085a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Oct 2023 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697654550; x=1698259350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=C9eS4YxqWQCULfjLOIC05dglwoz4VYxj0dpCaGCr3dgnTbfzIDZaQ+A1KUChqs7gCI
         xp6jAkP61c5HJTh+s407KFOeOTn6+nRESFs+gDCaPV1C/BCTsHe3pLgUyn3ta578m/DI
         y+78MtP5onPAHbrzILs85a9gTUobrB0hlWmYHPo+PznQRDRlIVciVJrkvlcNksJ2DNsf
         pzj4qh9cXOhDgp66oNawlM4Av6dUFiefjlmQ99wovOd5HTwZEVnLKZM2otVKFGRahk+k
         tZqkHQzYnO+T++ulAurW1G5KkTd6JlSOwpA2nOGD54UBsAu+grSQLj3Jf1IZHtvtQfq9
         kcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697654550; x=1698259350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=JDHW9fzSylDL876urL2u+u7SYJrdP+vMFIElTrdoANnADeasC5pD4AXH9lUwgnBoWf
         Hsvn8HUGC4DwXpL/6X+75c25xCQi1HuvkjrMh7wjg0RyWdICrykx3SJGZW1ylWkuPui5
         0gsWpa1PYm3XMXN1tSoIlixjJnitbmLYw9iMMNnnzH6vwJqsbbc89v9nssEt/MR04sy3
         v031hHF7b1HU8HY7rEAAUWI+soDpxfqFIsDtipicIkxW1ZjI9j47PMdPZx2a4ERUkVdq
         HoeyGwnhxMgdP3TWmykyEeZBaQD+rzWOwA5yFFItYKWZz+OcCClKMyFzzrAbLZOkc1r1
         +fNQ==
X-Gm-Message-State: AOJu0YwVaPrQXdpUtyIr58C1+DY1KdRaF6sIYsJNVSlrywVZCtACx4nv
        Kvf13E6qBl+VCSYnlEshqveI4Q==
X-Google-Smtp-Source: AGHT+IE7GOtHup87DBOstRNLEfBKDd2I9bFSv9NbERsSCQhVnQubPTor0+HCepugXoTa4Xc/jeyWaA==
X-Received: by 2002:a05:620a:4147:b0:777:2aeb:7dfa with SMTP id k7-20020a05620a414700b007772aeb7dfamr29123qko.38.1697654549991;
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:f59c:efa7:80ec:8da0? ([2600:1700:2000:b002:f59c:efa7:80ec:8da0])
        by smtp.gmail.com with ESMTPSA id qp13-20020a05620a388d00b007770d47c621sm159647qkn.66.2023.10.18.11.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Message-ID: <f5b854a2-befb-4649-a448-c1cf95e6ea2b@sifive.com>
Date:   Wed, 18 Oct 2023 13:42:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
References: <20231018052654.50074-1-hch@lst.de>
 <20231018052654.50074-3-hch@lst.de>
From:   Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231018052654.50074-3-hch@lst.de>
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

On 2023-10-18 12:26 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig        | 2 +-
>  arch/riscv/Kconfig.errata | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel.holland@sifive.com>

