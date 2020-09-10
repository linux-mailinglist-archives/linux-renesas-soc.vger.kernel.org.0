Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D06A264311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbgIJJ7d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:59:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40772 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbgIJJ4s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:56:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so4837358otk.7;
        Thu, 10 Sep 2020 02:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+aAW8fAjI/ukWO9Up4e4Jv1cLs+aHR0l/ub6mwFsiw=;
        b=ZaRpwZctupRZNj0Z7eSEE2MWKfqFwyPB8fK3lLW/QxqyV24FNPTBk8ME/bRKvfpFQI
         VvNG8etw2CoTB8jP6DZXuzD38WDD6tjmQ1NwjKUaqt6sEnlHT4CslSzjptS+YB6MGozY
         jyp75lQIxxUeAdXbEmh9PF6yAvYmKAvjVaBVTHDDn4VC2ZxTQ0CEWupcS4g66tTUYMeg
         do3nTkbrMr9zxp7+yaBYYjT2bnbv46sBoQvZumLDROfPYex8BsBqqZS50QVqjR7NPEwd
         MoTuDJsEG+2x0V7T0qwRKe0K2yyz/CWOrlyZfABC/eSJU8WkDIlHiLssQwAQT8KmLTXI
         Hu+A==
X-Gm-Message-State: AOAM533Jd741fZXB1UG8NZHLmUd1F7xXqnDpljfqp6nVkw9BmQ9iorYF
        Np4Oe7qu2w/KKi2N+EqdcJFW6efKcE61r6lbaNY=
X-Google-Smtp-Source: ABdhPJyWBOiHLisXP2jELsYF+4g3l8T9tKP9LhlfqQ+wtDxBiKMBl57vV0R6auq3wQFduBAUJGdXG59wYf/jm+y4Nyw=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr3152888otp.107.1599731807995;
 Thu, 10 Sep 2020 02:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com> <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:56:37 +0200
Message-ID: <CAMuHMdVX=zMQ4sQ9PrzrHnt4WGAVJ_iuMURSDYaZroWj9CNo1Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Display support
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

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch enables HDMI Display on R-Car M3-W+ Salvator-XS board.
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
