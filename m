Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07058F9A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfD3NNu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:13:50 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37105 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfD3NNt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:13:49 -0400
Received: by mail-vs1-f66.google.com with SMTP id w13so7947144vsc.4;
        Tue, 30 Apr 2019 06:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=er7EckL6+6bkOj0tZCrbXDBFgyjsoHetY5yTY57HWvo=;
        b=iK335Dh8eOlUS4V/ZsbxCvK+0QjxXbjZR974sTv/EY+mg1nQ6X496FZiHJHlR9i8ut
         WEhtErZpMZLNl0rSc9NjPW0lSrDy3hXAyJiUuANwkRGxULUoBYkEEzdPCowC4z/3+b9r
         8rL0D5Eg6MbB6byevYqx9+KnURXOIyNS3VKt9JQ/8nQcNt7zCiLDFTp1wam5akUNseth
         pnfQOuTViaF9+kDT0rtuKXMyyxA8AynTv7T63YsM4H0wJA5cZ+D25ujXhToEh189Idho
         1D+o3J7aIHKqf55f4oagQ/Tw8hl8DcMQCEJ4TDKvUf+X5PiaYtBx/CBnkVPvPaQOc2nJ
         9ACw==
X-Gm-Message-State: APjAAAVQTazMTAJqzQafC0CIfMsVyO49xp4iOxltcQB444HLp3yv5ilp
        djI0FHJsPOzt/S7nIdde1+t/ReAWcTzcu7pZPXg=
X-Google-Smtp-Source: APXvYqxP5htn7FvKeq/XRyaVbkzlyoHKRhw9z9bhJwCCGm/yob2SD33V4iStIkQhgFZeGiVPmpZRADUhSnHEeoF/f+g=
X-Received: by 2002:a05:6102:113:: with SMTP id z19mr5228282vsq.166.1556630028627;
 Tue, 30 Apr 2019 06:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:13:37 +0200
Message-ID: <CAMuHMdWKgLn-4DWYqkS5Go7yi_ngowi1TdjeXQA_YDxiOon3SQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a774a1: Add FDP1 instance
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
> The r8a774a1 has a single FDP1 instance similar to r8a7796.
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
