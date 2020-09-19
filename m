Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E946270D10
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 12:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgISKgG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 06:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgISKgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 06:36:06 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFD3C0613CE;
        Sat, 19 Sep 2020 03:36:06 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id e11so6348048ybk.1;
        Sat, 19 Sep 2020 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cM+6Iew97/QqDqeXRj5V+Is6MS5zyX9aM3BXZUUe5wE=;
        b=IXQfF2kltTHbcQb7UNIdT1TpBhi1Ed8dkT+pYOoW85J2Ll3apFkgT8ADs6BuFtjl6k
         vdq5XPcoDtJFExhARXOPhcp6WCYwS7eR3sbNnuP3RrHKs8bQAz2at+E+1Kk9lFtpZCwF
         qz7QjEKBVk0WsxkO5D9etP//3KFi+SSJ8q84+SNHwJ4SvkgCCyJ7vfGiUrmGvqihuVCs
         U3JbbtehjmNTYCrJt7fWSmTXHB9SzxvbV0xukIUcMsSSgt0HpNmGfRvm6+P04XjIKnWU
         FEdMsHDuT7N9OrvsikwsDf5f4FPZk0u77slPR069Ud6/SXaj1GqIhFe7n3/yUfu4Xu+Y
         DGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cM+6Iew97/QqDqeXRj5V+Is6MS5zyX9aM3BXZUUe5wE=;
        b=rY6NomqeXcOzsDS3oCqP1s6F0ss05CZh6oK9uHy8KoHivb6pUhaFnThEIv7TGzpRC/
         KgDeZTOwDB1L1Y5iYd7am6Nzw0xqKOxOmtBdJoWEsPHJrqiVMBoZ7qdpAB2FjDRYtdDK
         OunxwINLXt/uY/q37ZXGxSucihKhTE5twRimDLlx4xFTywetsNTJ7rrdj4PJrVISv/TW
         HIl4gOVWZvUD5CDsyzJK2WEUFSWwUCi8KbSpA5SYK6oklJOtUzPxokUma+d//M9355Hi
         KNJHdlfMDb395GDq4nvDaimzh4Z0ijj2xZQ7vmgKp9dtpVYNCN8U4oxsmyiKeeX7Wh/Y
         sDkw==
X-Gm-Message-State: AOAM5321n7wNN3OtKnEFtd/j3bVamqJWtp2Rgr6B2ISjkfmrFz+4DBkD
        PvOup+GU5yiTsqPe9J0cJZyNtl9fI2cCPmCBkTg=
X-Google-Smtp-Source: ABdhPJxUk0dSH8RxFxWJjokwPtUzMQWUJ+6RdJKvBH8RL+C+jC12QmJoiJ7lu6MnA2bxFMbjRTEOQ6vknjpBOnQ89+4=
X-Received: by 2002:a25:aba1:: with SMTP id v30mr37784618ybi.518.1600511765740;
 Sat, 19 Sep 2020 03:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:35:39 +0100
Message-ID: <CA+V-a8tTSo4bp8bdQnf1KA9z7d+AjxfC5Abk0iuV4L_r20PwPQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: serial: renesas,scif: Document r8a774e1 bindings
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible SCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> index 570b379f9f19..f589ac7577ae 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -51,6 +51,7 @@ properties:
>                - renesas,scif-r8a774a1     # RZ/G2M
>                - renesas,scif-r8a774b1     # RZ/G2N
>                - renesas,scif-r8a774c0     # RZ/G2E
> +              - renesas,scif-r8a774e1     # RZ/G2H
>                - renesas,scif-r8a7795      # R-Car H3
>                - renesas,scif-r8a7796      # R-Car M3-W
>                - renesas,scif-r8a77961     # R-Car M3-W+
> --
> 2.17.1
>
