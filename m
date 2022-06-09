Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E155544C9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343510AbiFIMvm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 08:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbiFIMvi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 08:51:38 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BC253C5D;
        Thu,  9 Jun 2022 05:51:33 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id k6so14562360qkf.4;
        Thu, 09 Jun 2022 05:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PdqGVHMAVaB4sKEYumeG3hD9v+gzNrNJN60nweXGG0=;
        b=qzkcwZ2p8srFLPqM3Tm5KEewSvvKnqyXjE9ftxQ4wtBOdQ5aZxk41cfmfWKzKKse0s
         KUT3wBtN4ZcrrsCmoolaxHCMMuwNNzgbTk7uZwvkZ1n/C/tdwekc85XB7Ovt/sfFugxf
         nbvN5LrWTTSXbgiRS3bHdl/W4isJsLakdC7VGLwH2+7BzOcWCeN0w6M+ZtJZz/7QjWLD
         EnV7o6GKvuXd2S3w6OnQwBMFPBt4/EBXp3PknUAAkPsilJ0WjNSKkwNSlsvRG98E9/6m
         ps9O1xO69TFnDoLE6jjIE/vAhd6b9FU+eOAhJQQe5kFxdZabHSQ6GPZlOrJ8XxAgLNBQ
         /4vA==
X-Gm-Message-State: AOAM531P5PcB4FvX1owO9HyAYhDM5HB8lZn+TBYIW1XAhgWEjJeT779B
        Znta3V2ZqPsE2aAr1EzRtkxPRzQevxcETA==
X-Google-Smtp-Source: ABdhPJwKD8ABvqTjlS2suQJ5JrMvIs24OmH4TnXHrMENcHNsp63GGMzybrVipXIFnllWcKfbMMGDrA==
X-Received: by 2002:a05:620a:2a16:b0:6a5:9017:d781 with SMTP id o22-20020a05620a2a1600b006a59017d781mr25317322qkp.298.1654779092476;
        Thu, 09 Jun 2022 05:51:32 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id b9-20020ac87549000000b0030515120916sm345459qtr.44.2022.06.09.05.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 05:51:32 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-30fdbe7467cso204688977b3.1;
        Thu, 09 Jun 2022 05:51:32 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr44634435ywd.383.1654779091881; Thu, 09
 Jun 2022 05:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220608173025.22792-1-biju.das.jz@bp.renesas.com> <20220608173025.22792-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220608173025.22792-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 14:51:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvH6S4WTnHOiqmawR5KxqX4DHNL88TaMkuqG2fxXCahA@mail.gmail.com>
Message-ID: <CAMuHMdXvH6S4WTnHOiqmawR5KxqX4DHNL88TaMkuqG2fxXCahA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Wed, Jun 8, 2022 at 7:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable the ADC found on RZ/G2UL SMARC SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
