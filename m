Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE63154867
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 16:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgBFPqr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 10:46:47 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38135 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgBFPqr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 10:46:47 -0500
Received: by mail-oi1-f193.google.com with SMTP id l9so5020892oii.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Feb 2020 07:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mT7ZXjCx25OYpy0IsJ+usLG0Y8UuCNaz0xZ5jg9yg/c=;
        b=dbLOQg3tNGm7CldLOfMwpA/bh5yqVBhl6hHvZkSTBbzdOA2xnbfXJ3p3YVUbpZj0bK
         C5YeZ41OrGAnDfW0kW8MFwbjG6Jzmi/J2yq47fyEgApcP16X/KZk2ZXz/3CYVSmWH7J6
         hHiSbrPjJJzEeU2xGHsAJ+JuNpgQasIpjudMECsTtwHQv69YhtdqohKUP3KwywYCoxZd
         xZPfQlK/y054qRgRW+Mq/hitgYsTuH0rxCiNVs4fxyrgtKdE5NQ2vo15LXMObXfx04zW
         S+j59f75KupvNYyTbJeEs5Hpzsg6xHpVirHNwW7ecbtXuaIR5p6r8Rt6R+rZRViENA5o
         VSVw==
X-Gm-Message-State: APjAAAXiH//RvkaGe1DEnowhBCt0FN2bRlw2yX79IqVFWVxXkv3AXt4g
        dRYYnElbSs+w2SbC5kAofvERwbYmerwyqKVXMG48haKO
X-Google-Smtp-Source: APXvYqwiwfHhx86myM9dd0g5XwNYYa+D7iK8afZeBivNqeX3r+qRHkncVKfpn6ISEnWN1NdxtLxFCIiIY9q2jToiFnA=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr7632250oia.102.1581004006410;
 Thu, 06 Feb 2020 07:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20200203072901.31548-1-dirk.behme@de.bosch.com>
In-Reply-To: <20200203072901.31548-1-dirk.behme@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Feb 2020 16:46:35 +0100
Message-ID: <CAMuHMdX1FOP8XNZjKZMcY+sTG6L8e+kHC=eoCM7xJhA9mdsDfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a7795: Add RPC clocks
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

On Mon, Feb 3, 2020 at 8:29 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the R-Car H3 (R8A7795) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Before I queue this in clk-renesas-for-v5.7: given the fuzz with the RPC
driver, has this been tested successfully?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
