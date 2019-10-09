Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 016ECD11AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 16:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbfJIOqp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 10:46:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37711 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730546AbfJIOqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 10:46:45 -0400
Received: by mail-oi1-f196.google.com with SMTP id i16so1977136oie.4;
        Wed, 09 Oct 2019 07:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQ8//cgF/MdGwkLH3S81V64s0B/McThxx1cJtyBuGXs=;
        b=BB2ePX6VHOjDs5jDdjaIqV/d20YrijMEHDK/xMyhUSW1Ejx7X3uBg6/JgXzSX6JFb1
         H68duKiO9aJAu1a6VlqbNVLXbMA/2PUzVTNKLLnHz1rfc08T1hJmqzd/uQTJlteeFmn2
         W0O85KeHLAnatETn8026eaCOcJNKc58C052HufFAGSwhy8EsmvosLVhJaNb9St7z/sIK
         L/eKDqnyAnGpLXSw1uX+MmvgJjlWG/6y0Rz1/1hzG7X4FrxIh4YQhtZV7LA8F31kYH+6
         Ed0N6O8XFofRH98hAvfwOKkxnA53G7VU+HdjSs9YeN4RBbXEXp9zujKBWEnQqQtMZH4W
         /C5g==
X-Gm-Message-State: APjAAAWLjSIJLsG/tou2+HVfEidj0Hb9wbi0Nij8SvdIUdtR8crX2wMK
        6seLhb9hWlvCKW+YwcO6c6si8ObM3oJQvaYl2Bc=
X-Google-Smtp-Source: APXvYqwbJngcF2ptkcG56glKoADjMSOQr9Zg5lgecq4L3Khi2aUy+ZLPK2S4KsBNllxCPlIcgLmGn862vtdZaRdjwac=
X-Received: by 2002:aca:882:: with SMTP id 124mr2733201oii.54.1570632404559;
 Wed, 09 Oct 2019 07:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com> <1570200761-884-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570200761-884-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 16:46:33 +0200
Message-ID: <CAMuHMdVphPX63DvdCsj1AtsnMz53THdf92LpMeKQhZPOubX5cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r8a774b1: Add Sound and Audio
 DMAC device nodes
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

On Fri, Oct 4, 2019 at 4:53 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Based on a similar patch of the R8A7796 device tree
> by Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>.
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
