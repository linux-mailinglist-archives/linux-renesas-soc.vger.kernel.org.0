Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85CF0B35DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Sep 2019 09:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730700AbfIPHmq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Sep 2019 03:42:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40332 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIPHmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Sep 2019 03:42:46 -0400
Received: by mail-ot1-f68.google.com with SMTP id y39so34750539ota.7;
        Mon, 16 Sep 2019 00:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=elFcOh8DW0MT08V8dnw6v/zYNZgbpP/Fp7S8rovWTc8=;
        b=ah8N9hJozVMUN49qkQ0hQEYMgw2r46P2aJQFEjgAfWqRi65KUqbqd1PU9zxdJC4nE3
         OFRGgNFSJRyVn+8+RsRiEtgta2trfiNl29SbIgzKE4oHkZmE6u/hYxD9hOVdQ6POGeJ9
         wdFbW4SnOQHgFcz0jnR67uprU4dCkjhk51Mnjs4dHZXNnXjnskDMkxITUVK54DHI099F
         yk/9fGscCsQQKdQLFrlTeqiNErPDeQeWhpWpYog3c08lX15GEOdHwXC+tfD1s0oEVxQE
         FzBrn8trswBz0sftO9hGg1oq2LOMH9QmT2WkJbMnolGtnxh0CnQhtrxMmX5W322hPeMf
         AHpA==
X-Gm-Message-State: APjAAAWv0/CfXTO/habShqkI3i6/MaC95VMi4lF9kFl5UwrCECuHtWze
        MWiYXGzb9po5kBRwJkASet8HYgTES1K7xusr6fc=
X-Google-Smtp-Source: APXvYqzGhmy2Y/TVqhIkZIVmXTEt/c1C31MSkrdMsxQYv77cHmiJw5xr0wqFHpZI8WqPqNNpDhRzOQm5ZQ7BElC+haU=
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr1992031otf.297.1568619764467;
 Mon, 16 Sep 2019 00:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com> <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Sep 2019 09:42:33 +0200
Message-ID: <CAMuHMdVwv32YbNQtMOxahSYrzicHqEqtFLORuvti+Ld5NxMPGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Add dynamic power coefficient
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
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

On Fri, Sep 13, 2019 at 10:57 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Describe the dynamic power coefficient of A53 CPUs.
>
> Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.
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
