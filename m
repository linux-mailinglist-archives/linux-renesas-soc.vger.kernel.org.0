Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32435D3C20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 11:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfJKJTn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 05:19:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44156 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbfJKJTn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 05:19:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so7360520otj.11;
        Fri, 11 Oct 2019 02:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2T/zHCiz5lRoZLCCsEBaHrm43xLEtwr/JLAYUvgdwzE=;
        b=rY3Uf9LdWgDBPCwqd0My70ixRNRbWYt9jmFcAzct/2Ytmoe4DkGa8BbaoMIeGEKdFR
         t34MKotWVmuCHtD1xmOdvRmSZmqnmijOzXam6yRSRs0lskZvp4LzmRIPiQuFYbBEgRLn
         xgl/Li70P0BXy19+uRoaLjIFF+TlXeqsvOe3vxnJvPABEGeGLfgstnqKqios3zicV+Tk
         gJslr5+YODcCqUPpTLOQonRps+lQaBf1K8Yk5PatVJrdakdRrznSR0ZQ/2SzUTJRW2zU
         eUjS9wvzRAuZzwLgZ1PxfAPlnoVQNY52od7z6+azmp/ddMgX7ccZThXDPZcTRTaH724Q
         rVzw==
X-Gm-Message-State: APjAAAW9xCJNZSKIm+W1gm4Py4m2UDOXqjZxPUknVrL9cIVGBUmjMMWp
        1qeqsWxQZEYVN3QxsV9Hnt4FGjtG4OyGhOZz0SU=
X-Google-Smtp-Source: APXvYqzLdkyO6uQN8+aYqrrf0f1ZoJ5UC4uoBKWGKBUzVnWDCeCgMeWJjJBH6Q06m328j8fpzF+F7jTX6lgsPrk7ois=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr11530897otr.250.1570785582416;
 Fri, 11 Oct 2019 02:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191010123046.15291-1-geert+renesas@glider.be>
 <20191011073515.2933918c@canb.auug.org.au> <fc7ec17b-c61b-842e-13d9-1e154ce2a654@cogentembedded.com>
In-Reply-To: <fc7ec17b-c61b-842e-13d9-1e154ce2a654@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 11:19:30 +0200
Message-ID: <CAMuHMdVurk2akpKFAGKoNN2YxPMBMx2VrvUfTfCX-AiUaFAcxQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Fri, Oct 11, 2019 at 11:00 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10.10.2019 23:35, Stephen Rothwell wrote:
> >> At the end of the v5.3 upstream kernel development cycle, Simon stepped
> >> down from his role as Renesas SoC maintainer.
> >>
> >> Remove his maintainership, git repository, and branch from the
> >> MAINTAINERS file, and add an entry to the CREDITS file to honor his
> >> work.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > So, I will remove Simon's Renesas tree from linux-next and rename the
> > renesas-geert tree to be renesas, OK?
>
>     I thought Geert's new repo is called renesas-devel?

The repository is called "renesas-devel".
The branch Stephen pulls is "next" (colloquially called "renesas-next" ;-)
The linux-next-specific handle Stephen uses is called "renesas".

Cfr. "git show next-20191011:Next/Trees | grep renesas".

I hope this clears up the confusion...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
