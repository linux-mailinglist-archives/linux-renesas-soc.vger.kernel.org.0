Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431E81B9930
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 10:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgD0IA7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 04:00:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42726 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0IA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 04:00:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id m18so24651680otq.9;
        Mon, 27 Apr 2020 01:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X961gX/6KGObMSFw3QoDIqVYm3uZsNmN2X2162ARhZg=;
        b=mnQr5GM8HW9MB+AngAt96JsNUiQC62b1wrDHJQTD+PgYaf1eOH+0th3TtWNCXvGKBF
         p6/phvk5BhEI0uieIhQJgMEgb9CiWDbk3wS42hMgw0O1W3FjXYrGzoD0JCpCmVRH/Mv4
         R9jsYsE+EF7B7Ff3iKdW0Yk7ArmAdkfXtoHQsqp/lnBN1C14uoD03w1zz3D+KyR9jTAB
         4X2TlA21+dzKmU1/4oezM6/2ru5HNp9m/RId6LHt7Z1BTRdPOxEeYC0TfB5aGlGJiEeL
         rxlFKRQJJekSQ0JmTBna89Exwr1wHkcxnFzkV94+e5kuRWEj0npSpiWvE+PJEMHW4KwC
         VPWw==
X-Gm-Message-State: AGi0PuaezamjWVwe2yLDIc8fhkuDQ5omT9og/nsW1yQbuZXsUuMIQvEw
        eFNvfn6Jzx0kpiOAMSfPArd5qaYtvcfWiXKWv+E=
X-Google-Smtp-Source: APiQypJKU/j72BSTwKd4GmflG8egi0AV4Nl6yPNfO5elzqOQWxX9qJArYB8VHjspyZ9/XuD3IAIBCboIdRj5O8UEkS0=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr11394398otm.145.1587974458189;
 Mon, 27 Apr 2020 01:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <1587678050-23468-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1587678050-23468-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1587678050-23468-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Apr 2020 10:00:46 +0200
Message-ID: <CAMuHMdW2Uj4TtcBmBDo8+69e7xoYKT-Kesznrv+kpRgp1v3z6g@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: reset: rcar-rst: Document r8a7742
 reset module
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 23, 2020 at 11:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document bindings for the RZ/G1H (R8A7742) reset module.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
