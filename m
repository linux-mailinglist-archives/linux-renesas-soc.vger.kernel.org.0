Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABAD203746
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 14:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgFVMvz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 08:51:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37322 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgFVMvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 08:51:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id v13so12935167otp.4;
        Mon, 22 Jun 2020 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bcnqERUuRE3U2yH/W0ufgrcsAslQTzrr4GZBgqoa+ME=;
        b=hQ83TTWOyilyrDxW71spdDBw700HMhvxve6WIlQ/7kXDnG186o/iWr+r1ix29pJUsM
         spaMyqL42VrwX7ZvLDIGebKpNP0EgfHK9fbzlIxeH8J68KvURBAP3FD1u1/lJcVzuH68
         f89weDVrcxeG67Sms42Q+b5oUB8HurFdyWStM1PyGHGIkLudLEkYwWyreWouxcWOzfC+
         Qe1ceLNrnH43jqApvpy7sb+lDe7AIMrrao7JbXikWTIJyKmigfUZYvjKaCFPNwn2ojFq
         YN0vvStWa56R7Du+4fcicOyK6EZGyejROJn3k5XGUL3ye/7UKDD2sfybfe1frKRA0nRH
         y/IA==
X-Gm-Message-State: AOAM5308uJRk+ntH8st+qa0bd1beKO0iJ/UZs8nc4faFL9m5F1WAMBrT
        2wvzat1VHiWjuUd0bDIqVx+J6jvldyK3jnc7qCDRcQ==
X-Google-Smtp-Source: ABdhPJyhnToa3B88JNuj5AYcrAJwc+DYzgpIuVGCROnvLjHakRTzvdXFk/YhdzJJTq2ylx+KVoo1XcgQRIV9Ukse2S8=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr13943928otp.250.1592830314734;
 Mon, 22 Jun 2020 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 14:51:43 +0200
Message-ID: <CAMuHMdWg8nNfcUV9Tb9Q=UJsq9Uj0-9sQ6-=R4NO0ZngmSBCgA@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0
 main board support
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

On Sun, Jun 7, 2020 at 8:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for HiHope RZ/G2N Rev.3.0/4.0 main board support based on
> r8a774b1 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
