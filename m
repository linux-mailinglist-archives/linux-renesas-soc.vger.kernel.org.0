Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193B6D0EFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbfJIMkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:40:53 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46024 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJIMkx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:40:53 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so1560788oib.12;
        Wed, 09 Oct 2019 05:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGNUV9QcRl8R9cKoyzex9OGth2VO7kN9zxVMR1Rh5qM=;
        b=t43X/HBUq1B+XyBoTQuuy7PAgPB0ePbUQIF8/FjsvQk9UTXLrAWDvzn1WPfueGMigO
         bZHY1jM0M3v7Ml+MREr6die57GvGjQiblD9e69qWzPne7opLDQj0B5XGjhWv/1ABaHXF
         efV4D6rZ6FeniariAElkvcVLgGLvXsvZXsSyFf4zYQ/Wdq4atWgZ3oxtpwmDV3ANCOYH
         zsxsBUbSChnpsaEYSMPp0k44205pqJDFrMD6xwHU0Hlu8eRluZINCOwE/hSnhrC2xY+T
         QyCV/w6PnD4wuX+A/EJFhj/7qCpWW1YprOjxTTqUG8E2n78JOXZd3ztBOUoZNNu+KJgK
         wGnw==
X-Gm-Message-State: APjAAAWKFJDk573xZzSdbwrT43UalfvJ0X5euy03UGw47lg/wc3q23F3
        IUwH7NcdDkNVtfj+KvX61XPUQoKPFJ68BY3W0Ac=
X-Google-Smtp-Source: APXvYqyA9TZ8vsTpnhgoa1tsuk2MNyyd/RXw6wB21HgS+WD9HN0HTqQqh1pC2v5j8kzoA3Oy0xIVwkK7BwpD61zAInA=
X-Received: by 2002:aca:cf58:: with SMTP id f85mr1949612oig.153.1570624852196;
 Wed, 09 Oct 2019 05:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:40:41 +0200
Message-ID: <CAMuHMdUUpbFx2d0ATiK5KkruV5RiWQk9dfmnv-TPAvNAw6Fg4A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] arm64: dts: renesas: r8a774b1: Add HDMI encoder instance
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

On Wed, Oct 2, 2019 at 5:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the HDMI encoder to the R8A774B1 DT in disabled state.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
