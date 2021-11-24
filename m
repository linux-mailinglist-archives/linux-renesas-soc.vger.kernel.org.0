Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C7145C667
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349942AbhKXOH7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:07:59 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:40558 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354072AbhKXOF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:05:58 -0500
Received: by mail-ua1-f52.google.com with SMTP id y5so5300892ual.7;
        Wed, 24 Nov 2021 06:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XCw6XLv89zn/9TnapFRymYmBJHJwZAMSM2pMt9Z1KU=;
        b=H4hInAak//HXxqu5aNjDbml+lp6UemFxIrGlIQ3jOI7XExKB832cEOHrMSgQPcy9eN
         kaV2m7OiSd/PuQ0swi7Oo3Kv+nIpxdoSiFlzrOBJJU0+jnCdfp+/r8sF2xgQ3iDxs7hC
         rbnOZe5oBZnY9MlhKdLxaqkfZBa/KTSq35j70PIzFAyfgjQp0gzGNY/vlprSBhMeZJfh
         fuQlUVex7fa/ML9EPn0UToK006VVjpqyM/1Q0NcY1wOylOGs/IkRDOwfLRdi7gNUU6Dq
         v/PsUspKraHlhjIhB09+rkQfqyVb+jrvvO+aCfxcGaMp/v1UiE2Mq8QoAr62h/zdUX+S
         ar/w==
X-Gm-Message-State: AOAM531/Ys5uWZVh4C/I1/GssqMglq27PLtNN21W+9GQLFa9TseOhoCE
        bsP8gCTujWZDk5F/4d6ISqtAVWekr48iXA==
X-Google-Smtp-Source: ABdhPJxCu9xtg4GI0FL9Hy3bXz24cFEXP4WnxF+ZFCTCJ2oOKUDc5bl9Jj9F5L4+NnAatLR2bUj8gA==
X-Received: by 2002:a67:bb11:: with SMTP id m17mr23628144vsn.5.1637762567447;
        Wed, 24 Nov 2021 06:02:47 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id v17sm8483303uar.15.2021.11.24.06.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:02:47 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id q21so1566210vkn.2;
        Wed, 24 Nov 2021 06:02:47 -0800 (PST)
X-Received: by 2002:a05:6122:54e:: with SMTP id y14mr27706749vko.24.1637762566622;
 Wed, 24 Nov 2021 06:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-15-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-15-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:02:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiNw_Bm30QHfqoj8H3h0BP7fy8hFEsk+79x39YGWYxYg@mail.gmail.com>
Message-ID: <CAMuHMdXiNw_Bm30QHfqoj8H3h0BP7fy8hFEsk+79x39YGWYxYg@mail.gmail.com>
Subject: Re: [PATCH 14/16] arm64: dts: renesas: Add Renesas R8A779F0 SoC support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add initial support for the Renesas R8A779F0 (R-Car S4-8) support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
