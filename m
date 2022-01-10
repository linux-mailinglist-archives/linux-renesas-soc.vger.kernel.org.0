Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9464489604
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 11:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243636AbiAJKLP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 05:11:15 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:46034 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243647AbiAJKLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 05:11:12 -0500
Received: by mail-ua1-f48.google.com with SMTP id x33so21079456uad.12;
        Mon, 10 Jan 2022 02:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TXZ884Lldw/qKYIaj8IKt3purbK9BqM8cDLUEJNgwU=;
        b=Nvo7Pix1L28ptuF4jLXRHbDETpSbkFR5nJToo9CpeJUVUWvzT/hNEFt3665F7tazVT
         NjJ74UKIabAKcJhOr5URjcmeN6fywNizIC74LMulvn5cOGdM+6e2Z5IwhdimLVT1I4zT
         fGvTJOPPEKlnI6iYpwz6Twr0RouIv0vk2M/BvqfjLucK2EQPvFOo68bh4/3asqVJ/hPP
         lG8TFBps4V/hqWrSvilO9qiQnHmqoD3PWxPWxKRZQKB8UaLhTLPOkSPyFJq3B/u1TRY/
         XveqRsJUrUelFMTgxEi7oYgQOpXLzjyu3LUfDVJW/OKbsKq20O65W7QqimLVPrTW5MNm
         J6vA==
X-Gm-Message-State: AOAM531rjPYfSrHLsVIFjqyWzoDy0qEkpyT2nf4VjWVYIO4n0g8jOkVA
        zt1uSKIrqdnnMwoTbz14Cgps97KYfB7o+w==
X-Google-Smtp-Source: ABdhPJzXXDBI2iIjSjuGKUcsxzQpXtFlHyxTcfGLG4m1kvWIehGajVJ0pYyZkMZmv1S+aBahuRI2Lg==
X-Received: by 2002:a67:fe83:: with SMTP id b3mr736995vsr.68.1641809471340;
        Mon, 10 Jan 2022 02:11:11 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id t204sm3447362vkt.26.2022.01.10.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 02:11:11 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id l15so10970888uai.11;
        Mon, 10 Jan 2022 02:11:10 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr25767290vsg.57.1641809470513;
 Mon, 10 Jan 2022 02:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 11:10:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
Message-ID: <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 29, 2021 at 8:18 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Endpoints node must have a remote-endpoint property, as endpoints only
> exist to model a link between ports. Drop the empty lvds endpoints from
> SoC dtsi files, then should be instead declared in the board dts or in
> overlays.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!
I'm interested in hearing Rob's opinion about the general idea...

> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
>  11 files changed, 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 6f4fffacfca2..9a8c1bd923af 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg = <1>;
> -                                       lvds0_out: endpoint {
> -                                       };

As there are several DTS files that refer to this label, this change
will break them?

> base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c

Why does this depend on a commit in drm-next?
DTS changes are supposed to go in through renesas-devel and soc.

> prerequisite-patch-id: 98434eb22c020924bc338316e54a7b42ea339e9f
> prerequisite-patch-id: ce261c9865255051f2c2107a930b0f15ce862703
> prerequisite-patch-id: 500ab746415c5421e41128c2b0db35987d8d7a49
> prerequisite-patch-id: ad2d5ad025f9cfa0dc453d7e0b2aa96b4514afd7
> prerequisite-patch-id: ac76bcc0f7b278863e362db083a7d64bbd0bd030
> prerequisite-patch-id: c7a7c3a6b9dbbae18a768160db70d7010ea71ca5

While Google does not index by commit ID or patch ID, at least the
base-commit can be found easily in linux-next. But even with some
scripting, the prerequisites cannot.  What are these prerequisites?
Do you have lore links?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
