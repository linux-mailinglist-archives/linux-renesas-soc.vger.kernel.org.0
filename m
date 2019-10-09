Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFFBD0E7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbfJIMPl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:15:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45549 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbfJIMPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:15:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id o205so1497105oib.12;
        Wed, 09 Oct 2019 05:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56rMhv5Euflc7BoXbba4SkLdcy6wH5VnbhNOnz/E2CY=;
        b=EqLIusjX7Vck3+txMIkHUNMc1lKLe/HibPp2OEvAZvZ+rgkVNHjp5qwNTGYuIAcPi1
         pUn7wqtnTMMggp/vJoGN8gULbjlSk6cs7mCj/2iXs3635WKUS136ZCWSl62lQeEJmJ2h
         OdQ4f8bGvsImRd5kYJNDnYS6HlscX6A6LF8Y6BrNDJL2l4nIF3VEQRwTcCdWEq33kkar
         GYLP0zcNF9KD4tRHW3VX7rhjvGY0xSqS8JiZhDKw3p2h1vOtdS4IKpPD+ETHFhJqsVxV
         urXm8pgq+vXztdvyW7dRXpbBUnn0PKG4DMUYACeIVtkI530Xl247xNbb7w1KgK8Qg/9p
         GrTw==
X-Gm-Message-State: APjAAAUia8reSyN4QpsrtPufziRbuzjyd1UGztJz7JZViV/g0rvux93U
        s5HNRrAaDV/PuU90rNikaLjPN3PVqeEfQL0J0ww=
X-Google-Smtp-Source: APXvYqylDK1sKxUJ9Q1zI5x9p7eYwKQ3xVCCzyOglCltoSgvhGy68OYnSbxjQciP0RpUWq1eqphvjwieL1XDnUz1gQ8=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr1885352oie.131.1570623339011;
 Wed, 09 Oct 2019 05:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:15:28 +0200
Message-ID: <CAMuHMdUvDTPMa3sa9yJSdxs8jFu4O6+uXw6FzdkteTrtkY_j2Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a774b1: Add IPMMU device nodes
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
> Add RZ/G2N (R8A774B1) IPMMU nodes.
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
