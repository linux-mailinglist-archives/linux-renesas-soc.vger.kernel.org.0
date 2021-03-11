Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F89336EBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhCKJX3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:23:29 -0500
Received: from mail-vs1-f44.google.com ([209.85.217.44]:38856 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhCKJX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:23:27 -0500
Received: by mail-vs1-f44.google.com with SMTP id e21so8332809vsh.5;
        Thu, 11 Mar 2021 01:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SNJVqKR0vBMbNZlXFpBSrtzy35CKdcLAn+6qaYBCnOE=;
        b=pdeWrJ83dZIgnLuo+a42r67p1J0iKqDCl2Q705tp8yrIJsyuTpU8KqckJC6DjQIgLc
         8X7JB7qolEQnnMLynyZHxI7AaNAYkJGGabCyqOkUjws/P4iqL+BUkkwhL7gHN8CRw3+K
         cHMm/FSP2rGj7bUxetsP8RaztwH+lhYrI/XhqECs9iGnbjjviw7zgOeFlXW1HhAWbA4M
         Y9fvnyId6I+xhH0MtiEMnENbI+yYcCXqJmpNg7jcUD3sXHm/MrT7RE/i9vvoV3CcLfNQ
         hhjRKsPsGd4WHP7yzcK7AnCyfpmeW7U9IM/N/0E+bvgg1mDOG8cnXzR6htGFEDdjCXva
         bM3g==
X-Gm-Message-State: AOAM533Wl1P/jAVKFukPpeOGWpYBCX1Do4/5JFQZVMjPsnPPxhj6IGC2
        8nIQ63aY+Ozlv/MtB9O6F86zNu7oRq11bD7vrPLQS7XW
X-Google-Smtp-Source: ABdhPJzIX7Fz1hqWP3FDCxQHPordmndItXLeFDaiXXelJtKl+B6hhb16yrA6fRktlzl/Osx3yDjJxYVxmri+Lu/7KDI=
X-Received: by 2002:a67:8883:: with SMTP id k125mr4898621vsd.18.1615454606792;
 Thu, 11 Mar 2021 01:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Mar 2021 10:23:15 +0100
Message-ID: <CAMuHMdXrD-Bi9Tc5dWnE7hU48zdfuGkpGMksfMuEPbyktDz3pA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 11, 2021 at 10:09 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
