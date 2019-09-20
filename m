Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711BBB913E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbfITN4a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 09:56:30 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40580 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbfITN4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 09:56:30 -0400
Received: by mail-ot1-f65.google.com with SMTP id y39so6248621ota.7;
        Fri, 20 Sep 2019 06:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsBtBCrMUjpQ2w7hUfghXP4efqKXyf9GUp9LCLwvaDA=;
        b=PvyFMCXbQKy7s/QTCAdgn/gqGQxR9DN3H9VxX/ScpswfmpvXxJyweipNPTX/W+YmyE
         cY85hIqYyDNs/tHnZ439ZzkyMtIgqRTjSvQPfnyGotcK97fEcQEgMz6+l4q/4NBePhhq
         l3G3jH3lIh3asL7KQ0vvrP1iVVTxL+H095TycOEW4pvGxvF4PpGKqRJHDW6krG/n/ANy
         3sU2bMu2FJf3dzWENkQiKdVf1V03ayUN1wND691DDWgZgKqd/yO/NsGU+u7tLhOB+hFq
         9BkmBuyDNpUZ0rY8TmTDTys/MOmeSub66FPC00IgLANFygXGhIfpNiHJmG0xpNf1rPGS
         DBEw==
X-Gm-Message-State: APjAAAUVFJEGvHOQdBZJWpINJ0W1rSLm2cMzAtb9yljgUfgZVlXixNk/
        4MeLWPfpjYShaa+ATfRBU4S9pbnnEmALBOGxEyo2Hw==
X-Google-Smtp-Source: APXvYqz9A/Zl14ZKc95aoraKJWAmc4TWN3D7ub3zf0YvoLI0GrUNHy4EQHz+QcG6fR2Cbs1INPehpzTqaB0CvdaxAcQ=
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr11518577otf.297.1568987789552;
 Fri, 20 Sep 2019 06:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <1568724492-32087-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568724492-32087-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 15:56:18 +0200
Message-ID: <CAMuHMdVgZ_s15E8q1Xc2-v7kzGEnUma+6wKEm77N1QGNXDfW6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Add HopeRun RZ/G2N boards
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 2:55 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds board HiHope RZ/G2N (the main board, powered by
> the R8A774B1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2N). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
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
