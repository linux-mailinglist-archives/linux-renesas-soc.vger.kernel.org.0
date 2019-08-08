Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB3985D96
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2019 10:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbfHHI64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Aug 2019 04:58:56 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35713 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHI6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Aug 2019 04:58:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id j19so38988470otq.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Aug 2019 01:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hLriwBTV6yTq3YyLAWnHvmU14I/gHdIzmwDnVv1gMYk=;
        b=FAmkGlrqeivykafV/GkBf65LUcBxEvdaWuv7/ZLo6eNErbFfE5u5Oh5VzD5YmniTjr
         x/lUg1HI8slbGaVmu7Rz63TVAtz4OZd3KgsvWBpMcLhiVNAPU3J6JL9TBAsd78rCl6FM
         2k/OG5XaARK6k0lIe1Wu62cPl80Af9KLUwrR/6/m3f3+w7tvtw5GsvLmnoAbSnhh3TWp
         7cOPFY/pPZo3iyObuLQpgOdCrUQT5BkiBBTVdM1dOrPFfowjJ9NsyPOO6ry0zeo1G7Sl
         4e0k203ScUit6mnF0ofjdFMHh3WhNRR6rgSsrd6QOj02CZcJJahnUyvox++BQFEGfTEs
         c7WQ==
X-Gm-Message-State: APjAAAVJsaxpvzJk0HpVGYxMpOrmSsZ6ewMft//gNwGFkv27fIrKXMg1
        +OUUcSLIxfvZDncjy0U9niBU9FC2YFi+i8Oqm74=
X-Google-Smtp-Source: APXvYqxRLSh0JS5A9PkpfjEAOKau9ju1AU4v7Tx/uyXuGXcfd0DZoQbvP+vYEqjMbAoPUd4xlKvRkPsuW8gHwlBeB0M=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr1892545oie.102.1565254734766;
 Thu, 08 Aug 2019 01:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084106.484-1-horms+renesas@verge.net.au>
 <CAMuHMdXMbLzL7X5uUp0g5Q-_YiXiyTW+tALzS=kHBOS3JNbRUQ@mail.gmail.com> <20190716112619.ielypcsnclg6sa27@verge.net.au>
In-Reply-To: <20190716112619.ielypcsnclg6sa27@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:58:43 +0200
Message-ID: <CAMuHMdVpq-3cJpTbgO2Ky4Z+Dc6ePGLcYW568+yCj3PARm3e1w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Rename file of DT bindings for Renesas
 memory controllers
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Tue, Jul 16, 2019 at 1:26 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jul 03, 2019 at 11:33:36AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jul 3, 2019 at 10:41 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > For consistency with the naming of (most) other documentation files for DT
> > > bindings for Renesas IP blocks rename the Renesas R-Mobile and SH-Mobile
> > > memory controllers documentation file from renesas-memory-controllers.txt
> > > to renesas,dbsc.txt.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Hi Geert,
>
> are you planing to take this through renesas-devel?

Thanks, queued in renesas-devel/renesas-dt-bindings-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
