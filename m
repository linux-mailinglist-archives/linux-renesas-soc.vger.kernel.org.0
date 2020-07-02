Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D795212D87
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 22:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgGBUD1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 16:03:27 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41620 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGBUD1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 16:03:27 -0400
Received: by mail-oi1-f193.google.com with SMTP id y22so12067938oie.8;
        Thu, 02 Jul 2020 13:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3U4RA7dcqNgHA66R0YTgcwzBQUYTmQgOjfHr8CRvJcs=;
        b=HMRgJBwxN9hcQJqzG9ujtv61g8M9cKGyRbtWAsNwfU7zEz6v2bWzX2CPtHEmyRcv7w
         limXbnMG3ds3e+TR/iQ9KXeqQ99AwfMxjQUCbhyAkj0FzWYP9Iw6MH/sBP3PTl2UbL9K
         1kjGQMlhbHnquL4xhpBhEhMOo+8T9XYf7DvQQUoFB+biWyk45l/N/euEmklWZOcL5UpU
         gdK4d3vFA5HUIWhZ/aDa4AAWEe0R/6rdu8udu/2UU+NKjspgvpBFn3OMCju9lcwUvVig
         Akk3C4ksK2BViWLBk5QdeTFc/jEd5vaNt0NJb8UpXTSe3t6BORHD4e/pUzkZrW7nU6GB
         Cz8Q==
X-Gm-Message-State: AOAM530HI4IU1QOOiehnpqpnhLEG4i84byExsto38dpsWr7WEef9I3vo
        zIWctjlWusACVN/XTqgXNWqMIX9+YBzjDP6ic6c=
X-Google-Smtp-Source: ABdhPJwZ47RPQpU4jV6GDqSeKdqdU8Pxt5+We3hUhYMve3UmJ669cPuHZX5QP4ueoZLuApcASZLVojFl3uvRZLqj8hs=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr5976094oie.153.1593720204895;
 Thu, 02 Jul 2020 13:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net> <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
 <20200702193553.GN53169@atomide.com>
In-Reply-To: <20200702193553.GN53169@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jul 2020 22:03:13 +0200
Message-ID: <CAMuHMdUn5MK6tTd6ohFxa=K9NNHRbDp9P7gvPD52fCp2OsLnYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] serial: core: Allow detach and attach serial
 device for console
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tony,

On Thu, Jul 2, 2020 at 9:35 PM Tony Lindgren <tony@atomide.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [200702 14:50]:
> > On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > any special reason for this change ? It is not really explained in the
> > > commit description.
> >
> > Indeed. Why this change?
>
> For a kernel console, we want it to work for important oopses
> etc without trying to enable DMA or power on regulators for example.

[...]

Thanks for the explanation about irqsafe consoles!
I think I cannot disagree with that ;-)

Sorry for being a bit unclear, but my question (and I guess Günter's
question, too) was about this particular change:

     static inline void uart_port_spin_lock_init(struct uart_port *port)
     {
    -     if (uart_console_enabled(port))
    +     if (uart_console(port))

This change seems to be completely unrelated, is not explained in the
commit description, and is the cause of the regression we're seeing.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
