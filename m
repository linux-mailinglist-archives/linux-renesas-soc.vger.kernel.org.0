Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D025AB93FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 17:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403919AbfITP36 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 11:29:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45407 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403864AbfITP35 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 11:29:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so6488882oti.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Sep 2019 08:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UP0oRpgLAIe+2OEutNG/3VSKgprsvt7BpvvezNipKBE=;
        b=LLtrIu8dMKvYyuO4NJ36sPEwPumuVV6TcBY6/cgxOlVGTpJMbh3jV+BGUEDP6N1Oub
         9MG0bP9byL8JFrF6+NmRqvu1DiMShBKGVYAZ9z43WPA/C7As/RGCLLL4J5rl9k6p1i26
         ZtH0xEUMOI7c8Z31C3FGVJW2peDSj85ddnwVm7EZLhsXEbP81JMPI8aq6HZyYtoJEoJa
         wzLSLuAq9U71IFV3vech0RW9ADRlG+zsClZZmBIdkZos4uXqA0OMYECp+DOVyZk5PPfS
         ImWQSsxVjRi5CN3Sqb4LJSHA65MdYhpK398iRJSs3NAbi/UgYhkbHfpMO+bMAUFwTSgi
         JaeQ==
X-Gm-Message-State: APjAAAX46LFgRd1bsUQIs6Yt5rDRWoScerG+Sf46pZXCfSZbPUyDRsCC
        iER870/IKK8QzOjtD/CtIXlqgDgKqrUYcA7OzZQ=
X-Google-Smtp-Source: APXvYqz37pllGqkopGtYOcycw1flmuxCTshmvAmWPsz6RjUHKBCvrRM0TiZr+jCVndAiYdhDIHx0Qgyy0E460z6JAv0=
X-Received: by 2002:a9d:5784:: with SMTP id q4mr11224366oth.107.1568993396755;
 Fri, 20 Sep 2019 08:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
 <1568881036-4404-3-git-send-email-biju.das@bp.renesas.com> <CAMuHMdUvVKYZuzS7Z9uiN=KmdKm6GPnGS0oZbGZKfkbaUOB+Ng@mail.gmail.com>
In-Reply-To: <CAMuHMdUvVKYZuzS7Z9uiN=KmdKm6GPnGS0oZbGZKfkbaUOB+Ng@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:29:45 +0200
Message-ID: <CAMuHMdVjycsCh87-nJF1X9Ow499F4tMBm8fMABQL6SNHKWXRQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] soc: renesas: rcar-sysc: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Sep 20, 2019 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add support for RZ/G2N (R8A774B1) SoC power areas to the R-Car SYSC
> > driver.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>

> > --- /dev/null
> > +++ b/drivers/soc/renesas/r8a774b1-sysc.c

> > +const struct rcar_sysc_info r8a774b1_sysc_info __initconst = {
> > +       .areas = r8a774b1_areas,
> > +       .num_areas = ARRAY_SIZE(r8a774b1_areas),
>
> Given the Hardware User's Manual documents the presence of the SYSCEXTMASK
> register on RZ/G2N, you want to fill in the .extmask_{offs,val} fields, too.

FTR: I'm looking at Rev. 0.80 of the manual.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
