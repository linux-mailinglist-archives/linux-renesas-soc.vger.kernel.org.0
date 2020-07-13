Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E3221D5DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 14:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgGMMZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 08:25:44 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37296 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729646AbgGMMZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 08:25:44 -0400
Received: by mail-ot1-f65.google.com with SMTP id w17so9374478otl.4;
        Mon, 13 Jul 2020 05:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngQqrXWqBxko6JtBE6sOb/BLJIUDqiUQnKCnbuzn+TQ=;
        b=JmrdkBN7R6wb69xG9d7LwiOaJldc+6ACCT8EkQtjuInnYkV5+2na2UrUSZ70Njjhid
         SZ5UBT/ApOus7mObz07QpwGXokQDr/FUSNf9Djp0I2yDAW9y96R7AlvSrQE1SjudnYxk
         VsAckqUC4FQGZPadVaFYVECV2BQFUXFlJV1ZSVm4BlF+cfFSFunGxsy26SSe9zmGT7E7
         5ia1pxqjYzhgsFtDuebzikCD83RSKwpbpyH7q4CVUkGQ+8Yo5oOW1qopUo3uBz/zH2Ii
         ejQ1UA6LAcXhvdxv6OGjfyRCCTv0m6kYgwT3RenN9/l7roNdtEqi9zd4Olu4UuHC7rVW
         c0DA==
X-Gm-Message-State: AOAM5303Q8xJnky7cHB6QF56aA5aJbRG3qwdLoLFKZ5cmL1Fi5Zpfl0Z
        AmKpKdOv+dekfrRS/UKKa0xMQxmjIRveNmKO8MM=
X-Google-Smtp-Source: ABdhPJzZ7jGk83XfCIDNOcc26Jsxe8/Z0kqkWINTZY1+NJCMaRBt957GP2gBQfs3bj7Fb0KscTISiJUWI7W1/V3CD8k=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr65288809otb.107.1594643142951;
 Mon, 13 Jul 2020 05:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 14:25:32 +0200
Message-ID: <CAMuHMdXw-rgKJUCz-eoqEQJbRuwdRfyrZj+Ot=Zrg6e4_9cWLg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: Add HiHope RZ/G2H sub board support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:49 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> The HiHope RZ/G2H sub board sits below the HiHope RZ/G2H main board.
> These boards are identical with the ones for RZ/G2M[N].
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
