Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F4849DFA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 11:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiA0KpZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 05:45:25 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:39624 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiA0KpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 05:45:25 -0500
Received: by mail-ua1-f47.google.com with SMTP id p7so3924293uao.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kT4G0Gjs+Er4sqyXopWSMWH5xEyOXuNPvPM1cKC0NpQ=;
        b=R9Y6lhEYuTNdLK20CbmT5ACGVNTwaRQ2p067a0JKgiLQ9cAmdQRsS81NCoegM9G5ro
         wZTpN6ygtjZ6DmMveXKpJfdaGjz/tyaHb2gJfS1J4racHBihYfg7vZ4x2JB8nYEpeAYp
         fHD30WOoZ4vlpB7VM7WdfIRIS4G6ispv3onJmScvdgfJU/5t11tCuv0XFWZqFoPeTRss
         bmA1OsgdL7rd0INJvN4p1RuIxP0QZiUUVIyRN6uWnpsUlTTSYdnXephZU5gS7rXYn+Yl
         3fS0JDbqTCNe3uyOD8Gfi9uC3v1wn+lz7LV+xSMBgtnO9945xfR+sx95ebnQWZA7qT9g
         kz3w==
X-Gm-Message-State: AOAM533zMvLjrW2QiOTUgr3RWz7nWWuklun5lKwtA9V54tj9ZhzFrDHH
        VuEVHsE4OgSjZMujaBUF8iKzT3nYsy4BHA==
X-Google-Smtp-Source: ABdhPJy51oZDwTKg3KFU/mki4zcW4yrr4c6YHrGAYbWTWC0ApE6nnqCZPr7Qhu7cz1uB8iNXldMEkg==
X-Received: by 2002:ab0:7a59:: with SMTP id a25mr1306821uat.67.1643280324575;
        Thu, 27 Jan 2022 02:45:24 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id u23sm472702vsg.25.2022.01.27.02.45.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 02:45:24 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id y4so3972918uad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:45:24 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr1155990vsb.68.1643280323799;
 Thu, 27 Jan 2022 02:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com> <20220124021142.224592-4-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20220124021142.224592-4-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jan 2022 11:45:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+vURmN32wvSzYv6SfNx-2BVGOdKgbvg2nyFAFnF6eyA@mail.gmail.com>
Message-ID: <CAMuHMdU+vURmN32wvSzYv6SfNx-2BVGOdKgbvg2nyFAFnF6eyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: renesas: defconfig: Enable Audio Graph
 Card2 driver
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 24, 2022 at 3:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit 6e5f68fe3f2d35 ("ASoC: add Audio Graph Card2 driver")
> added new Audio Graph Card2 driver which can handle
> sound card more flexibly.
> This patch enables it on defconfig.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch, which is not meant
for upstream inclusion.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
