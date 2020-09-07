Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C334025FCB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgIGOwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 10:52:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40349 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730051AbgIGOwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 10:52:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so12461608otk.7;
        Mon, 07 Sep 2020 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YR5nCLsMFYFwM3pRnFFBBgFgP7DthYxhn+lLufrwFRM=;
        b=FTIKcg1v+hSWb2+Lq6wXsBCI61IzXNwRvSOdYuzcOpSmZoaWoYRKF5b0vGPVrjdXwi
         ZLs8AOfQ6OXizpxxqvYJKaummgz8bTlZ64xuOtl7R8xeIyMbTfPltbzDQ4jejJoLrWJy
         w8qNEgXKjX5ECw5OsLi1NQudP95tlEwdJqp8WcG9bkHftS4lZuGJpcv4/0wI+EYOJVSg
         KZ4+d5HmT40wxEXJBi7MzOu/udAZYz+XfgdwBdslxyGMoAF6H7aLUbG+/cW69CNLbL2G
         7R9/P57BG8rVZLSODXzaNfJ2leCHHvLQk9g7g63zQIdFCNyjfmiywL2Pe5HHNcTyZOKy
         bgwA==
X-Gm-Message-State: AOAM533bAUA3YRTkKJ5z4ZV8jYsjLQTrmKZqFTYZRAjs8xT1nChNpJAL
        JTirYdY+Y17395U8FsoQP5VhQoortE4A+UPkYKZhVvGO
X-Google-Smtp-Source: ABdhPJwMUIApW9HWKDkC3PKb6cFgsiRPnCVRrqTYBPT/r/sTcW9BIcPzvjDMKs+ttWmcC5MmxT2A7Giu82Aj7PG5r3o=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr13857111otp.107.1599490349290;
 Mon, 07 Sep 2020 07:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com> <87pn6y70sp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pn6y70sp.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 16:52:18 +0200
Message-ID: <CAMuHMdWC9uQ5ekntNsMQQFBZ1tEnf01+b_-ShgpVJsxqeOjEVA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas: dw-hdmi: Add R8A77961 support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 4:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
