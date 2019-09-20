Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984A8B93F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 17:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403870AbfITP3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 11:29:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42385 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403864AbfITP3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 11:29:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id i185so2075466oif.9;
        Fri, 20 Sep 2019 08:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jmj2KmkeqZHY14e8aj4j1MYgM+D0yE3jNPssOYmrPsU=;
        b=ImMZdDrqUwl3A+Wt/5BpECXgNyZZbq5HzYy4bKepmGxGpbowmyLptvnH2haSdAUDAs
         /wWGI2zs/FyaT8oYnZdRWFZohKZupoGMbTacByOwcrYvdHVx7j6Q8qi3SZdbMz2WMhup
         ZmDvMQBdtK8SRejVwM5m3fQZgU9GxWc2Gi3D06uwqBo5xSSI+nEYcZWiiYECBumQboih
         M3Z7lqN+AzGbEsff2x3FAS94Y8+gLALykN/5FdbhAUOhirFkcq5AmVGz3FZay+mfYTrP
         KZT3Kk73jYXdODqu9OsJaGGSOU7uvvlluwBlZiOcaKByWfIhuKRBNWsezxpTNS/Hd7OC
         XIAQ==
X-Gm-Message-State: APjAAAXBRSteIKlVtbvUUrlVsbKuzw7qxT3Sj0jAMJQQ514Ovz5JgMtX
        0Z3e2gl80mZ4/p4yrMHTHdyePkHJeogbsbkKtHxATg==
X-Google-Smtp-Source: APXvYqzW1S5QjTIZY3mpo1WLtk2oYySFqS77BEpCo7TGf10lHk5fW6L429XmmrLHN2kw/cTxD3ktLD4ZMCZjbnAg3Ho=
X-Received: by 2002:aca:f305:: with SMTP id r5mr3280529oih.131.1568993388655;
 Fri, 20 Sep 2019 08:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:29:37 +0200
Message-ID: <CAMuHMdWKXePEM7UHXpk5q7HLRfmObt-85H5yT_NZpZb=k4jVMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: reset: rcar-rst: Document r8a774b1
 reset module
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document bindings for the RZ/G2N (R8A774B1) reset module.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
