Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F189A50B779
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 14:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447562AbiDVMjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 08:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiDVMje (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 08:39:34 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F6454BD0;
        Fri, 22 Apr 2022 05:36:40 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id ay11so5362592qtb.4;
        Fri, 22 Apr 2022 05:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHokQYBB6SCI+kKoO+fMUFkaY6B9YAlfyCGrAvKI5Eo=;
        b=Ics9q8X8GFsWrmH5m9LlJ45km8L/Se8yHco3Ob6TvtLxJBuVjQTxR/kDwUrzs3jcmY
         ZISKJC6FZlQgUMFYQcDdo1xpzF7UKvUDvkoWI9I9NYkR2CpFOVd0RTfok+E6UbhekaD1
         MA4niBavfqikWynw3WiRr86mXT+SdQbS6Rj5xLYHlLuwVCc8N+qAuHu/Rh2m+sbXOQ/7
         xMvZKPQ01LCjqtepSdjX+imPDRRLUQUp2wvfRn5Zip8mgR3hOVzGHOHekx3tRlgkvsiv
         G7FUGJm8ggjduv7bOt1Kbvf0eKXSQR6JnumGaD9hgn33LqWx2V02pjOx/VQ52dHBtefS
         JFjA==
X-Gm-Message-State: AOAM532Ca9QjeNnR5Y5mAlleaJE7zm6AG3wIEDHIrjPVuGxMQmlrNgHh
        U2oNGCMmfnJ6W10FGC6LNgscGH59+dNnGg==
X-Google-Smtp-Source: ABdhPJwwtZ3rfCjzO4PiVqGGJrerfYHUu3DQEdwiCGuRUOvAl6fXBTlyU8xoRhYphAF0oipC68I6VA==
X-Received: by 2002:ac8:4e8d:0:b0:2f3:5d11:c5d3 with SMTP id 13-20020ac84e8d000000b002f35d11c5d3mr627775qtp.213.1650630999856;
        Fri, 22 Apr 2022 05:36:39 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id i68-20020a375447000000b006809e0adfffsm863527qkb.25.2022.04.22.05.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 05:36:39 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2f7bb893309so3838187b3.12;
        Fri, 22 Apr 2022 05:36:39 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr4621902ywc.512.1650630998807; Fri, 22
 Apr 2022 05:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdUjhdvsNFqJU+9p=BEq_Jnek=MT5RKu0Dg89nMB2gpMgw@mail.gmail.com>
In-Reply-To: <CAMuHMdUjhdvsNFqJU+9p=BEq_Jnek=MT5RKu0Dg89nMB2gpMgw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 14:36:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZGhPrJuHHJVNKufRH0G_S1v_eHV8qaWqsMq_cwvtL1A@mail.gmail.com>
Message-ID: <CAMuHMdUZGhPrJuHHJVNKufRH0G_S1v_eHV8qaWqsMq_cwvtL1A@mail.gmail.com>
Subject: Re: [PATCH 08/15] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
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

Hi Shimoda-san,

On Thu, Apr 21, 2022 at 11:45 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > R-Car V4H (R8A779G0) SoC has the R-Car Gen4 compatible HSCIF ports,
> > so document the SoC specific bindings.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sorry, I spoke too soon.

"renesas,rcar-gen4-hscif" should be added to the conditional
section making "resets" a required property.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
