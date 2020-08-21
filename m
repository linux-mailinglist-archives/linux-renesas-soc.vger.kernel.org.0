Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5133B24D70B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 16:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgHUOLb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 10:11:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33842 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgHUOLa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 10:11:30 -0400
Received: by mail-ot1-f68.google.com with SMTP id k12so1676975otr.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 07:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynBu6pgBJkmWTqx7Lh+qBy4dAuOR5/U0gYGyBlWp5yI=;
        b=bdiEZawRng+SmMfZtv0HRbEuc48fRNf0jGUwmN+8hn3X+slYwD/birpaRkhTDepPaV
         KLFFF+BHIpe9w/sLcqVATd0Ry5idbZfBn1c7Uqg/6AWi4R5tTygDSlMZM7jtDVRxl3En
         q5KQcd162I3oeo0lxdYIffp+zwllVBL9YmFrf1L68SFRyk6Qxp73qiJdC0/woxrABu8K
         h6ono8u9934WXe4EgYYV7xqqLIyubk7GyUMeoAUPdqzkg2XC4f34wM6P8kPjlC2DJoEp
         IXq90fSwnjHMuXjBs+Vj+NWKpZ4DGS+5fuhjgZvPkMRMkOuiXRWkThEb4NT1TMhXEQF7
         XTLQ==
X-Gm-Message-State: AOAM532Mnl45bIxoOCbNEV91wbB7Y4P9qmVucj5Dr2gIylW78jUAnHn2
        ns19d8giopHR62bhrGjYspFU4MiJRVbks703ZOg=
X-Google-Smtp-Source: ABdhPJwMb2lwvphk9R0XEkAysw+LVpK2OAsxI7VYAFrQSqhuxAi6W+4AAhzKeVBCHHF6Y2o15f8ZyLBXxPgMWV/KO+M=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr2001374otl.145.1598019090070;
 Fri, 21 Aug 2020 07:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <87lfidho8o.wl-kuninori.morimoto.gx@renesas.com> <87k0xxho7t.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k0xxho7t.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 16:11:18 +0200
Message-ID: <CAMuHMdVQwtWFs2uPW=2XxHYRk76G2R9U3T-1+R42zKQ9S2HC9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: renesas: use menu for Renesas SoC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 17, 2020 at 6:50 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas related SoC settings are located on TOP level menu,
> thus it is very verbose.
> This patch groups Renesas related settings into
> "Renesas SoC driver support" menu.
>
> And it aligns config menu names.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
