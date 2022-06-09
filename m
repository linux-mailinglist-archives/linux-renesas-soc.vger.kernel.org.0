Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C68544659
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 10:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241894AbiFIIrS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 04:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241916AbiFIIqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:46:05 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47951145586;
        Thu,  9 Jun 2022 01:44:19 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id cv1so16095947qvb.5;
        Thu, 09 Jun 2022 01:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kgfuOl15O7T9RHCgfbIYRFe22lq8CT5xow4SaejHkE=;
        b=25Dw2M/Udvo3NObQuIXOEAy6zDbHL1CSwfqUJDLeiRqv0qDmCFuF4aaiISrwwCIG6Y
         tWQFzP23X+522uOG38UdmA1zCj3EBXxCxEjdMgo1TXQJ4x1wsvm2d8mtltyMLPxPhE/o
         oZ0Wwa1Uj9VGdMGajo12tTyEOQ3iUKhNKpnzr78fGI/rYVF9/tIpRZUpnGq3hFckSlMx
         w/b1DMt8uMjS6pZ0cgpy4byOhWYEEnABkE5BmWEB+NurwX7qpQSJ+LHIjdlp9DhNjVDK
         nb/vbpbh3lBGcyTJMHSR8FvcFWUBwH9+aDrQy0ruQon2CAzvp9I2hfQ0Aei1SJkaaFiJ
         JCUw==
X-Gm-Message-State: AOAM531zEKa4fFiHF06G0SmFqvKeY6NC75wXQwApoTO5VuJQ5PYcbo+R
        VysvzwVIc642Dm4BHHAyU+WVoEYibjdXPg==
X-Google-Smtp-Source: ABdhPJxaLdvyC4HAApUZMgSwM34CuGEwT6Ve2V+ikHOxu8Ih7Bhr2aUEECFYw2Vd6jxrIZggpMq4qA==
X-Received: by 2002:a05:6214:2aac:b0:46b:b44c:8e4d with SMTP id js12-20020a0562142aac00b0046bb44c8e4dmr11174923qvb.124.1654764258055;
        Thu, 09 Jun 2022 01:44:18 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bm32-20020a05620a19a000b006a6d20386f6sm7365724qkb.42.2022.06.09.01.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:44:17 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id w2so40609923ybi.7;
        Thu, 09 Jun 2022 01:44:17 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr38963282ybb.202.1654764257410; Thu, 09
 Jun 2022 01:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220603233300.21789-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603233300.21789-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 10:44:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2pH9HE+33cqgoROneunkcdefv2ts3hkHNA54fThfzLw@mail.gmail.com>
Message-ID: <CAMuHMdV2pH9HE+33cqgoROneunkcdefv2ts3hkHNA54fThfzLw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: add R-Car Gen4 fallback compatibility string
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 6, 2022 at 7:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For now, Gen4 is treated the same as Gen3. But we still want a seperate
> fallback just in case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
