Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA7650E1D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242031AbiDYNeW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242032AbiDYNeO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:34:14 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881802A6;
        Mon, 25 Apr 2022 06:31:06 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id y129so10723365qkb.2;
        Mon, 25 Apr 2022 06:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMWrCyXyLXwiGysVcfNBovGrw9zX+kXN/rJrng1KJKA=;
        b=iGlUi5beuJK0RrVYCx9XGXtFVhytwuknMFlIT5NQizd3+aR7M38tWzvbEo2f/UiERp
         Irh4ViTJeybEf3uCxH5nj/2QoUe3UIikk2loWASHIYpfNLx5ysUL51cS0bcAwcEC9+uH
         18bYNegxtFAWF+ReVqEJVmgKPQ5LQeEwW9jfHcfQomt51wQr9QRrMRbXVtOC00GZgqi5
         Ui0gJW46IZdF+b+8mXb836Vz+TfPPIzuhdzvEb8fHu6gWeXan3NX7hxBNBDQJnNMQ0Eh
         dD3BLb4PcfyyQu8FEeSuO8dPgCWCy9D6QtKa8tbaibk+m8YsMOPri3gG/kFe8onHsFN+
         DaBA==
X-Gm-Message-State: AOAM533KTb7MCmJTgKGv270oLtv4AcKYhGkfYB9izAPBZV0CdvFxNyJF
        n+fOTYeLVre6m+Zi75mFJgc48KwdsubSdg==
X-Google-Smtp-Source: ABdhPJy67MmErAZ+ccrL7p/sQXyQhSAEApP2zHWJp55EsYJizpKrENZ885X2XfdYlVa5TuvZ3wc3Gg==
X-Received: by 2002:a05:620a:20d2:b0:69e:93d4:214a with SMTP id f18-20020a05620a20d200b0069e93d4214amr9711209qka.40.1650893465430;
        Mon, 25 Apr 2022 06:31:05 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id s19-20020a05622a179300b002e1ceeb21d0sm6295396qtk.97.2022.04.25.06.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:31:05 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id d12so7823822ybc.4;
        Mon, 25 Apr 2022 06:31:05 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr15775427ybk.207.1650893464808; Mon, 25
 Apr 2022 06:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:30:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJBwPuJnKj92=ufVqcwZ5HN3A3WHX8v-=Vkh9F4k3f1A@mail.gmail.com>
Message-ID: <CAMuHMdWJBwPuJnKj92=ufVqcwZ5HN3A3WHX8v-=Vkh9F4k3f1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Remove empty lvds endpoints
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
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

Hi Laurent,

On Sun, Apr 24, 2022 at 6:12 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Endpoints node must have a remote-endpoint property, as endpoints only
> exist to model a link between ports. Drop the empty lvds endpoints from
> SoC dtsi files, they should be instead declared in the board dts or in
> overlays.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

Looks like we still haven't managed yet to get Rob's attention, and
extract his opinion about the general idea?

Unless someone objects, I plan to queue this and patch 2/2 in
renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
