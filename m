Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89482370CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 11:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfFFJuW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 05:50:22 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41584 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfFFJuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 05:50:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id s21so1368925lji.8;
        Thu, 06 Jun 2019 02:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlT+OZRl/u5RNKPi8dNkZHp/9V+UR86IhXUtkw0pwO4=;
        b=SslU/4I+BNclA4QwGXsLgXQL9Q/jmKyxkkUNZ+G4y69S/l25TnKH64dXgFfyCJ4sLl
         cUAK4fJpIw2A/DNd/GcI3et6QT9IV+Cc1TCxNg3h6qwViCShCMlyvvMcwwBX/2wHVKox
         bzP6KDzZYm1L07wQHcEMhxfgrHhRKpOkc6Nv1qT4CrrGM9azylcg3k0c8vN3zyuuMIn2
         ABGvEzKoyS/MrFnl3hyEdSNFnBLr1D4uyPuC7u7/QaV3aMGHdhr9emU9La6NA6Yyrwha
         PNQocrqWB0Nd+YOdrqC1oeT8g+l36Wde7NSWc/jymJzoZ3ASBShmGNA0e6aNxrGVK5mu
         Slkg==
X-Gm-Message-State: APjAAAX1+FzBuDbehtJpgShFds2h2Ha86XvX8x40Z7roZjttBPnh4DtJ
        QNKwFDEtSfxoLvSgOlOQuSTD4KjB2ZZtEKufTDY=
X-Google-Smtp-Source: APXvYqwcMSsDaCC9OEBJ3Xw8K5dT8oEpHsRIg/lwLvtokXUMGCsjL8s+jZpsWSGJETJIdJoV9+VVxFUo703Q+71eqKE=
X-Received: by 2002:a2e:751c:: with SMTP id q28mr570757ljc.178.1559814619925;
 Thu, 06 Jun 2019 02:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com> <1559228266-16724-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559228266-16724-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 11:50:07 +0200
Message-ID: <CAMuHMdUDZbpAOCoDiGwxW=VpQRtS9u6KFV72=JrHm0HRsncpZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: Add HiHope RZ/G2M main board support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 30, 2019 at 5:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the HiHope RZ/G2M main board:
>   - Memory,
>   - Main crystal,
>   - Serial console
>
> This patch also includes a dtsi common to both HiHope RZ/G2M
> and RZ/G2N main boards.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
