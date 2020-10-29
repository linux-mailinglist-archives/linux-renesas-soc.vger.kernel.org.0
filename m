Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33D929ED12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 14:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgJ2NjL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 09:39:11 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34324 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJ2NjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 09:39:10 -0400
Received: by mail-ot1-f68.google.com with SMTP id k3so2276335otp.1;
        Thu, 29 Oct 2020 06:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RYf3vNl8HqQ8zBK55sLVdQ8ARXkNafJFWOB62pZROQ=;
        b=c23MYynMUbualBXAusEqai+bdUbRjEofFzc1zAFq4eVj47juMJeprZoeOpx/TGPGEB
         SrElp+kplCsfgqtaG8qcIvqesNP+PRYNFBQWryaXJQsKJP9a6jD9A1OEJbQeeu9o3GGy
         liEYIgxKpZX8PqeUDMap5z2HLyXT3iqannCe8Owts09isTbI16LFKILTvy0f/Mcp45IA
         aHEM/eJDvF6/4JUBNqS20/L/ngSguAWY8e4yRNaia+p8Aw8GzWDAl1ApJYikeZ2/d/oU
         ak6v8C6Hv9YFdVZA+ClpIZx6re7fyPVVUWeGwwBYMQ0tQMmndKfegKz3+JKwryoyhIjK
         FBbg==
X-Gm-Message-State: AOAM530ikNuKnn0vHDBMqdLgDXdTldSOeyipTJJ7KlhZB+voD8kwxW1e
        4Kzyh4dRTTHallQg6fhKuFvwBanWT38uFv835Mk=
X-Google-Smtp-Source: ABdhPJxbZM+wGTQtyzJK0pqVD5aE/ZZ1gwMp2HHcmx++gZIIHJRPZZevP5TBdrK9I5Guafho/6z87YEQKfYRBUMvoKk=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3273222otb.250.1603978748575;
 Thu, 29 Oct 2020 06:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com> <20200920134905.4370-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200920134905.4370-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 14:38:57 +0100
Message-ID: <CAMuHMdXYCFWf_pCaaHrybxWYq6LoV0QJk9ShLLUAu1Z6qgArvA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: renesas: cat874: Move connector node
 out of hd3ss3220 device
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Sep 20, 2020 at 3:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move connector node out of hd3ss3220 device in order to comply with usb
> connector bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
