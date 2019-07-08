Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D6C61F4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 15:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731120AbfGHNJL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 09:09:11 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40626 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731094AbfGHNJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 09:09:11 -0400
Received: by mail-ot1-f65.google.com with SMTP id e8so16100864otl.7;
        Mon, 08 Jul 2019 06:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3llEH51w8zbU0qJGyHl+uQDqzfjuclYz6ki4x0LIy0=;
        b=OTQ76iy0HXy1Biom7EcB5au+eRcOr+l9zp5JI4Tfk8yEZZuVhFmk/w/9EIywtZC8rX
         eZfwfq8z32IUdk8KXgxg/k0l9ie9kTmGt+SBeRPOml/vnOkwy0WBYJvalzt19Q0S2PaR
         eUDnQi2UTlBvKd81CvntNdsHwWv5beUDs2uU9xCLHBJmxCwZrlccG9T0aFsTLvG+Cq5a
         XQkVSJ28HmfsBkluDpC+zQs0u85D5dI5rtQn+3h0MwE+DrKBQ1kqf8ON6s+wgWEu82Ap
         tSuQz1hMxluUtDP6vXBWiybB1RNm2CI1J8va6wJfs93IAPoR3P/PKsppk9FtK0DlfcBb
         uoow==
X-Gm-Message-State: APjAAAVxBSdO0YPLteZKISdRTwvhddMtFGuEwyy/SgzSClJnT9XCuSKF
        Izsms88ZPb6FWob4xVqhxlD+GI8aZWPp/5tirjM=
X-Google-Smtp-Source: APXvYqxQa4rNUq0v7nlcagUVPWinEIJx02PSJpLTLmhuU41MA8x9I8+Lm+Ix9v/oioh1laIstCEFPEOZ8ouS1oWDbX8=
X-Received: by 2002:a9d:529:: with SMTP id 38mr14435891otw.145.1562591350607;
 Mon, 08 Jul 2019 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560513214-28031-7-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-7-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 15:08:59 +0200
Message-ID: <CAMuHMdXyzTpZWkzY-4btHxHiA+_khUmKJbOjaicsbpZkBwjdxA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: hihope-rzg2-ex: Enable CAN interfaces
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch enables both CAN0 and CAN1, both exposed via
> connectors found on the expansion board.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
