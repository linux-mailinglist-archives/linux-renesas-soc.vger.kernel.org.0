Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACFB509C70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387725AbiDUJka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387720AbiDUJk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:40:29 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F221F609;
        Thu, 21 Apr 2022 02:37:40 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id dw17so3262515qvb.9;
        Thu, 21 Apr 2022 02:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0T8l02AYqtmIXSc8w77zCRO2fABykyCrLg+OkY7oOro=;
        b=R2Ka+vrxyw9d/ah+qoNmCh4hkIK6iFuJQYZszLRwzgdCR8tNPZLH/3/2EfKDDQvZWi
         e40U96H/nhp6fEpgUhGUZRekRVxyhvLxoVeVZlfnR/OalAvYtetSs6LqCtDuzzgjuMv+
         juPY2YgZwKtX8xSot7w0NaWWRs3sIpHHQYBTPcbd3PLd2MT26eEUFyIUlSN6nhXOZS1K
         czlN6+2PiRYV/aKYus6SxgiJy5/b5VsxhZcQaEKRGr064rQPNee4EXJDsEa3TS9IElvv
         SiKytnZXQJUdJSDLUHkFIRuveo1cirjyEg8xq8zLMTE57X8+oojiqF0LnANdkLo1lFKN
         Db/w==
X-Gm-Message-State: AOAM532JW0B5GZNI//Faz6XQTa5hZHgtQxMqC+Nc0mQbbeEN66qDCJNf
        WfwbbeSgitl5snpTAymFKrxFSCgC2INz4nNz
X-Google-Smtp-Source: ABdhPJx4uI2JnIad+JUP5UyUNqaWwINBi72e+Y8IMqAjJmeXISDywZKh6CExr9NGQ7lzP9qG8js7Wg==
X-Received: by 2002:ad4:5ba7:0:b0:44b:7b68:b453 with SMTP id 7-20020ad45ba7000000b0044b7b68b453mr4163661qvq.44.1650533859877;
        Thu, 21 Apr 2022 02:37:39 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p5-20020a378d05000000b0069beaffd5b3sm2737958qkd.4.2022.04.21.02.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:37:39 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id x9so621741ybe.11;
        Thu, 21 Apr 2022 02:37:39 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr23866460ybq.342.1650533859228; Thu, 21
 Apr 2022 02:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:37:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUr6wN9AzBk0goDnE72ukbk8Z8XpbL_k4WNoRTpwCWTOg@mail.gmail.com>
Message-ID: <CAMuHMdUr6wN9AzBk0goDnE72ukbk8Z8XpbL_k4WNoRTpwCWTOg@mail.gmail.com>
Subject: Re: [PATCH 04/15] dt-bindings: power: renesas,rcar-sysc: Document
 r8a779g0 SYSC bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document bindings for the R-Car V4H (aka R8A779G0) SYSC block.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
