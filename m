Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF36D0E6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbfJIMKk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:10:40 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37293 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfJIMKk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:10:40 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so1519293oie.4;
        Wed, 09 Oct 2019 05:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPQnsv8sQwjZbPG4P6FTqtKdcWAbFS3YudLvMpZP3P8=;
        b=dOms7nG3d9DGpyhaYIvJtczHRo0MhdUsLp+7W049o9tnjbq453qi397Y1tfTk2Ougn
         saXKnDNSKKFhGtI8VnhbFwHaVa0QrHLIE9SytQHnUMWlZ8DZec3jW6U5D8C8rTCebNMe
         AUriFocYZlCA3XjtVdIZVAw79Jqtb+e8p5wp5kBJBCdLqscW9chemIX6g7/wYEDnu0pO
         zmUcIFncNjXgiT87ISwoyFpM5Hlp+RIDhJZxnZb04OTNlRY5UF3m2n9ne0c+OSqvCZIG
         Aq2q6qlmVXz/Hrhu5JxlgLkUmyhlECdlRNW/PatDSaIjMzUnI92OMN4OSJZ8QTUwS/tR
         pn1A==
X-Gm-Message-State: APjAAAUCmX8onDIaHf1EgnbUA5cf+fhW6qv90yFiVTVTgOn6aMw5vYJn
        YKHMY6Z2uGKNJ3NzVDbo19oxcrzZmRlwSV1mFp4=
X-Google-Smtp-Source: APXvYqzCmCs3j4XaZFDbfZ1sQlofzrbClEtmt4FrS8R89Y5t2kvVUmapZ9cD677t/r7874VgcGFMf6WaG63pRv7tA5g=
X-Received: by 2002:aca:882:: with SMTP id 124mr2002872oii.54.1570623039734;
 Wed, 09 Oct 2019 05:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:10:28 +0200
Message-ID: <CAMuHMdVaGN5QSxQWW8h8fogr8fBjW67FZmhiKGzFCj8y3sJpKQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r8a774b1: Add SDHI support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Tue, Sep 24, 2019 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add SDHI support for the r8a774b1 SoC.
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
