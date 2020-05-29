Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B71E7DA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 14:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgE2MxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 08:53:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35817 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgE2MxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 08:53:14 -0400
Received: by mail-ot1-f67.google.com with SMTP id 69so1838231otv.2;
        Fri, 29 May 2020 05:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oif8L7zsW2xwsGnhOoRKiiIxDfgmHr4aS5+lzHldpuM=;
        b=TDo+QbUUkrwMh6785jUvd4O8LZeS4kKPQ49R1hiwdMPtmLNEujT+5A4WuMBdy40CHw
         CXhMaHZbKPXescCWruptPisQk2TO4Xj8qr2yJsc0KSSN3Ae/rtaJY0mdmF4ZXqWrEP5R
         6DOWPRMmYO4QT8AApemWs1iiukheMTthrLnuqJgtitsJw19DLW2WgOTn/qB7KIllg659
         qWQL5CFYwIpVGXRpjwGSjQGcF7G03lqimUQ62tJUpnSwN+df8AXQ4nNDkdsErPBOevj6
         t0FE4eWK+5hIN1FK7ShSXA292b9QPQVnNqqfgetqj9fqm6XAqElUc/68nBfXM3eLO+pA
         AVZg==
X-Gm-Message-State: AOAM5304NAsBg7k4cE52lgK3f6Em6ke2a32iF7c3vNMnu7v0LgJR4Jkr
        tFcvCbuy4ztAmKLUg1jRbjVXPupoGY3RpXkk7sk=
X-Google-Smtp-Source: ABdhPJxJrlNI+WLw2ghN8090SMI4xI8jZjPUaEf41GM/5IsnW73wJXasHoaydH+GrpgaqGXPUpC0JaugK323/HOu5ng=
X-Received: by 2002:a05:6830:1151:: with SMTP id x17mr5998521otq.250.1590756793564;
 Fri, 29 May 2020 05:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590614320-30160-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590614320-30160-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 14:53:02 +0200
Message-ID: <CAMuHMdX+m7WixJiNJyrpHxjnp5vFHi3ULuT7QgPOA93NE1XiHQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: timer: renesas,cmt: Document r8a7742 CMT support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, May 27, 2020 at 11:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document SoC specific compatible strings for r8a7742. No driver change
> is needed as the fallback strings will activate the right code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please note this DT binding is under yamlization, cfr.
"[PATCH v2] dt-bindings: timer: renesas: cmt: Convert to json-schema"
(20200505155127.4836-1-geert+renesas@glider.be).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
