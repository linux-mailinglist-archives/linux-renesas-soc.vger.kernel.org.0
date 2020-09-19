Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10445270D20
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 12:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgISKi6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 06:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgISKi6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 06:38:58 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64773C0613CE;
        Sat, 19 Sep 2020 03:38:58 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id k2so6316791ybp.7;
        Sat, 19 Sep 2020 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQTehMAmeVbciVEzKeTUyq/f7dXGsVYk34/FSnIqu60=;
        b=VVXuT0cCariAUjZksHRofuvH4rIC0pOBBLbrayPR171a/JhnC9GZx1P7VwUMbVsJ09
         /8fhRedwtH1UDfat2Tr6wXGmVrxvyNyozfb9prsTSr1q+GyzK3AZ7OrpkM9/D9bmCfMk
         j1g5085lV1EHMGUfkpf65qMVOZbjuxxRHEcqGn6PmZok5Hj7kXtONiMYiUZAQNnoIzk3
         +MUGBrERSylFoJMCqBGMLILeEgk0leZ9HLB9lei2hHiuSZumdgJApWvNpmKZQbN12UVU
         BJIdbliuFXZ2JZJGs3h9EAfHTirVfiScMYODmrv9LGnD9L9pvvqdaW2Aw6VxoYNzdxiR
         3MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQTehMAmeVbciVEzKeTUyq/f7dXGsVYk34/FSnIqu60=;
        b=rFFzxfDvtWM4yr8xL69Z8oogYGw6GthokSWCtZbT5I/pi0ExywpD7b33WUKRDmNXyw
         B1fr0VgwMKcY+YV/DROCewwbBOAprZeoWSVSLkOc15aWwVSz2tSawzTOQ0djw4sG/gl1
         v4QCM0YimaW/IP/he66N5gzInLF8TuGKzB8pY66reV5Pb0kSt19rsBUM6J9L4LKheKvQ
         IT1O3sFvqlNYAPGdNvROZNDn91MMuq47SJruZDTxLNmiBWejx+1HUkadn7XFSFhx705k
         8HyiJljyAgYwhzsIcL4AUqodTDrJoaDLtcZnBulIwg9hoqbu+EgteJ8DesfB+aKJQSXD
         3QsA==
X-Gm-Message-State: AOAM530aO/W/cSpLQiCesRNNjTF5xsHVkm7mJc+VRzmWA1otatJCLnsq
        2vwfsLX9TRELIKisIZrY73a7CQVyl6XZ21Vco3I=
X-Google-Smtp-Source: ABdhPJypbZdW9P624NDx6PMi9nsmYRFdWBRbcul0CdThm0B3v6OlS23ZAClxa9wsATg41UyMv6XDnQWhf/EqrsUL1sU=
X-Received: by 2002:a25:344c:: with SMTP id b73mr50702248yba.127.1600511937715;
 Sat, 19 Sep 2020 03:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:38:31 +0100
Message-ID: <CA+V-a8v+tGrrmpEyK=i_EjixjEydcTtyFXO90Mr4vk1SVw=_UA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: serial: renesas,hscif: Document r8a774e1 bindings
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Wed, Jul 8, 2020 at 6:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible HSCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> index 6b04c0451d41..9fb87a648c1b 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -42,6 +42,7 @@ properties:
>                - renesas,hscif-r8a774a1     # RZ/G2M
>                - renesas,hscif-r8a774b1     # RZ/G2N
>                - renesas,hscif-r8a774c0     # RZ/G2E
> +              - renesas,hscif-r8a774e1     # RZ/G2H
>                - renesas,hscif-r8a7795      # R-Car H3
>                - renesas,hscif-r8a7796      # R-Car M3-W
>                - renesas,hscif-r8a77961     # R-Car M3-W+
> --
> 2.17.1
>
