Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826CCF997
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfD3NLT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:11:19 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33312 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NLS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:11:18 -0400
Received: by mail-vs1-f65.google.com with SMTP id s11so7963869vsn.0;
        Tue, 30 Apr 2019 06:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9YsNJppqtMDT4XWRsgonXu8BU8QdntrTpZKHe7t7IM=;
        b=NutGINbwzERHRRgdedxXv6/mzcpXqCkh8oeukd2iiH3I4uD0kfvV3yAU6ybDK2+z5p
         425uwXotfDxzyxiDfK9/uxppbCafiInBLqdH5uDzGq9LRfAZSQ7EWUxwMc+hPA+rr3pf
         f8WQJqqIwwurYeamVEy5DqDD351XxGm4BajtMDvMk9vVuhyaxGOjHm4Yzx/ZSclgTSnr
         Tok3AnJyvH2vEhlA0RKeD2LyuDjw2Kw+lXYJsvaUY8UhTMCqaP0gqu/Mv2TW3IoM4v3D
         RRyZuYA0bNbJweju5OUWrv2NbYS3OiXV6ZSnZO5B73IQpuafP4D9kxtj2DsQfAvwbfuW
         MqDw==
X-Gm-Message-State: APjAAAXTjANlovJFdYmVbZEjSG5KzhxcGyJgErtpZOsawGTXSkA6+3FT
        akcJcTvIiFnnyNZOGInLzjIPM6tx1/pYs2Cdk+s=
X-Google-Smtp-Source: APXvYqxkZzbDooR+xrYTWOUXaOBfYgk6GAArvBRuu4emVk5FYBNI8gWjZc+dBGxVsuXMfn9DbKzVnAqNxHSJf9nMXAw=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr6773594vsd.63.1556629877516;
 Tue, 30 Apr 2019 06:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:11:06 +0200
Message-ID: <CAMuHMdVostrVZA-_g1Kpxn4hRrJL73eh7TCjmgKm3ju2v6WaJw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Hook up r8a774a1 Audio-DMAC nodes to the IPMMU-MP.
>
> Based on work for the r8a7795 by Magnus Damm.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
