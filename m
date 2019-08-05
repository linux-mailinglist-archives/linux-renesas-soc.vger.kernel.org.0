Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B769C8208A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfHEPmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39522 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so31722020wrt.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=99EgQi0zZaOBFAUbUdmUq5t25cjQ6kTbM9mxbRj6mCo=;
        b=nekG1X0jsrBhR6tWnH+M24HWzDe6YEuWy4cIe7IRw8DBuLpsVBwRxxyJ9rb2JoJtGa
         ECKnDrcsM3LoQ/mm497MkoNTCaLOpreI37DQGn/Hu7iGzk33w8gCESTFBYK96oURTEeH
         3dnqwtwe45+2oparQKmWHZNho+OSXZo4y2Dy7TO/Gn/FwZovy69rOPykISgRRORPrNQP
         +9a/lY1zFXGlSHeSH5livo97il46DbrPXVrNGg8WT77n0EtxTvQj3N9HllZa8YD/+I/I
         Iyn9SMsylD35a9xnoozGujdqpf9NNccacl1WCyJzJnWbwMCUwXPpWD/oV0s2e/r6B6Hc
         UZww==
X-Gm-Message-State: APjAAAX0gB/uUBSNHumxi1u9A0dXlz5TrCBQg9WqFfhn9jFRaTxJuFw9
        dxojUSn/OBI+U7fsNu5/fRv8T4LWxjxI1MlLKaU=
X-Google-Smtp-Source: APXvYqy7XWh90fknvunI1t1TvAKGXPAagsRrJPDK9HkOrjusVdFZePVVSekfmXhozR2e9ErhG8cYabW5wXO/V8H2xGg=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr7935087wro.213.1565019725153;
 Mon, 05 Aug 2019 08:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <1564669313-22427-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669313-22427-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:41:53 +0200
Message-ID: <CAMuHMdWTAk13Heq_0OQkkxnoPFEoWUpzXbyTDawGbXDixg5brA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970-eagle: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 1, 2019 at 4:22 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
