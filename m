Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B6AD0E8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfJIMSi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:18:38 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38683 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbfJIMSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:18:38 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so1516385otl.5;
        Wed, 09 Oct 2019 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsLXxSfix0HP/dyaAQqX7AkgMT1apSzRVzx3EGzJq7I=;
        b=ePXabYzpEqLQUuRn/QZhYkdHMrO3qHIsD4Z+cCAQewbsJTJVqOLEKER8Q4J38gW93g
         L5OibxZYdzRtGXW+3XhSg9OyCIwCZfuSODKk7wtdw4inyASlFBsThOf124iFHV/gNWwA
         yDIadV2jyTRB6rw1E2BCGog/CXagOkAUPfe+kOOU7ODXt+rBHmswzViQjtxPar/ZxVyC
         5B92+Ir2aNqMB3BlSs7oOrcqskmU4Nhp3NqGGmRpw9cYNZdmVXeJlSXAPUO4ciyBZmWE
         Zf6IcHGqJDKKA+pBf5jr/g55JRRHFfNxIX0o4FQebDmmBOZUw+LSHJzTB4Z9+Ir0ckyM
         Mwmw==
X-Gm-Message-State: APjAAAWgSD8mBtnlFWwF3Kx97r8bsw3C8+90EYngCyxypa1ObaG6o5ZU
        h98sbD4Zgthq87RdhiQRh5nBbITrYPAXNTVUViKbWfX0
X-Google-Smtp-Source: APXvYqyBB7eiYxs0dS+AtKqxJyC1EqqgkxEV/vpQdngDiuiEzb5CNPrJIPaKF5iRM/YWDlXKs2ku0k/4V2elp5iKdnk=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr2598896ote.145.1570623517394;
 Wed, 09 Oct 2019 05:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:18:26 +0200
Message-ID: <CAMuHMdU7NUvUs-vieBBrZqMUYsGtrtP28XachiR6X2N-B_s5HQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r8a774b1: Add FCPF and FCPV instances
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
> Add FCPF and FCPV instances to the r8a774b1 dtsi.
>
> Based on the work done for r8a77965 SoC.
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
