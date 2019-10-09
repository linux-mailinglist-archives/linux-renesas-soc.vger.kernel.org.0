Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76222D0E70
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfJIMMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:12:32 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35049 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729575AbfJIMMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:12:31 -0400
Received: by mail-ot1-f65.google.com with SMTP id z6so1513906otb.2;
        Wed, 09 Oct 2019 05:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLTdLv74z7n0WfP1qWsaQTH75YWa6v89HfTqpzcJOyk=;
        b=VpcNHLxdVhy/nGrJmQB3uCmQgp7ApwyepcrJ33VUvWPXAVEhJkmylju5Gjo8VFjX75
         JUTY5/SQ7lEtAw+vLiBT0E+oWtwAc6GaS3CLMGGYUBO0ZEcbnoagm8q9yBoaZ6qWkuqW
         17ZS8vlS7wzK1OLMY20RMsx5DhyyLL0LxZqndW3oyL7n8VIZ63g4WMbKNmTnexcZitZS
         aUY3f2TcXGGCj0l51S3ML1zmjwCkU2b+PauZMG1/dDXli+pM6qx1b3RhD5C/JfkE2AlV
         zopbPn/PiYYJQxEGZg5cTxhELtFsfu0zecTiYq0aycdNx9yVQBFJXtu1BP3/RMbxGsjY
         l57w==
X-Gm-Message-State: APjAAAUZCFf+tVeczTcKGLb/lqjy53/RSyc89Y92uxwzqi0ozPy2Ru4W
        2yxBldc7dnir0GV+Eyz6fhBJAbgQ+W+296pZ91A=
X-Google-Smtp-Source: APXvYqzRxKol2X2my+G+va0HXOBiEafa4qCHBesegxU+VPsF2+KElhJJjnsxc58cN7t/a+uOVvqrO+1n3AbSH2qFyLY=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr2399023otj.107.1570623149369;
 Wed, 09 Oct 2019 05:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:12:18 +0200
Message-ID: <CAMuHMdXmEhtMPEHD=aFNjzzMZReYrpy1w=9R=D2ytGPUz5KjFQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a774b1: Add I2C and IIC-DVFS support
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

On Tue, Sep 24, 2019 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the I2C[0-6] and IIC Bus Interface for DVFS (IIC for DVFS)
> devices nodes to the r8a774b1 device tree.
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
