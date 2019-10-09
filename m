Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A58D0E96
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJIMWC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:22:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32884 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfJIMWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:22:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id 60so1536657otu.0;
        Wed, 09 Oct 2019 05:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KWr6oPUwAuwrnV32eWlXtyz3eItdS6g6djRp+GIKmfA=;
        b=jpC0R0/cEHi2+kEKC7tVZZRhJRTwSJa+BcySSsblB0YID1i46vrbkUfiISu6B48Eye
         AWtwd92F3C+5p+3ASqMb+HaC17awnQddLWEVy8lIkTTBeUBy4R/KYCMRRfpRMgI8YVy4
         33QkezXNdfLD9JgwbE8kFrPdbAssOURQxBAdjGsHDEq5lhgLFLVDnrsOB4tO1pIgaIox
         9mTCwYG+uoK0PPVGIq3Cqn/gb6Drxcagd7Cj9qRT5zB0jMM4TmlQl8oTl+82+2Fikzvs
         2Jn7/P1JTiV0zxKvEDKdHJswrYBwc2n1TldQwIR5KZuey4jzfCT7SMZkzgOsI1X798Hu
         qYxA==
X-Gm-Message-State: APjAAAVdQdQcbQ50O3bGgL2KbB1wFN41Wsavy4wVPkHQHldM1EKrAXF5
        t1tsCZR02DjqaoCHlVm3T5YZCI6JGmEk1mFFaIk=
X-Google-Smtp-Source: APXvYqw6NUTcn6SeDA8o9uFTdunSYPY+GzZmW4NrM3TVgTAYIb9bHk6V0QYmS+jFyc93E3fv8PhG6MmrwqTVCTiPHPM=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr2598472otk.39.1570623720963;
 Wed, 09 Oct 2019 05:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-7-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:21:49 +0200
Message-ID: <CAMuHMdX8aTfmjOT2mn4=M++-T7hv2ck44qh8=xVEZfNC94Kwmw@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a774b1: Tie SYS-DMAC to IPMMU-DS0/1
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
> Hook up r8a774b1 DMAC nodes to the IPMMUs. In particular SYS-DMAC0
> gets tied to IPMMU-DS0, and SYS-DMAC1 and SYS-DMAC2 get tied to IPMMU-DS1.
>
> Based on work for the r8a7796 by Magnus Damm.
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
