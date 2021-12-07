Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D677446B4AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 08:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhLGH4b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 02:56:31 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:42650 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbhLGH4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 02:56:31 -0500
Received: by mail-ua1-f45.google.com with SMTP id t13so24779413uad.9;
        Mon, 06 Dec 2021 23:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuEyY/dSAkI+rUlZ7wtFP7g1s5RyHXXyvUCvBkTfgrk=;
        b=1hffzkKkvelwejHI9xMk/pRWy+nNOHOV1Bh1wJFLtNY/pc7Izen/PpIRQWJvXRbcip
         FbZbGDRDokaO7g/7CqnJ9Xh7iRDE2EtF/dsBoPfOeOrnnOJu6ZAUjVnsX8RXtht96tQV
         JwfhLqHEzjlLoLOTDaHxHPJkW2gvHvnyIVNWvGv1VX5MAH/iooltGh3bV+57zwFL+bwe
         Wq3VH4Rzz/VIORv78Pnt5DByE86tU0CMe+Pwu/JhGu/9LCRirt2wzis9h3U9iLkZbHa+
         t/CXQpBJ8SU3+C/2NV3CYNI1Ut7LVMzzci1SRwbj82ht+ClsWD64nLysiUA7c0YpCNUC
         XnmA==
X-Gm-Message-State: AOAM531w6EJE0MlenC+NINiERyf+/D/2uDFOKxpm03dUN0I7CQPxAWK5
        yeLOYaaz5IyNlfSUmhRpQ1IuCIb/sWyiiQ==
X-Google-Smtp-Source: ABdhPJwlri+Xx8xlzA4TUDRv4uwiD2+ysBfZI9zE7daUlKjyBQPomPq7xAqBWxS0DfTOsFrURvV1Qw==
X-Received: by 2002:a67:6f04:: with SMTP id k4mr42871849vsc.27.1638863580823;
        Mon, 06 Dec 2021 23:53:00 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id f188sm5683427vsc.16.2021.12.06.23.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 23:53:00 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id w23so24826533uao.5;
        Mon, 06 Dec 2021 23:53:00 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr43951654vsg.57.1638863580342;
 Mon, 06 Dec 2021 23:53:00 -0800 (PST)
MIME-Version: 1.0
References: <163884254093.18109.2982470198301927679.sendpatchset@octo>
In-Reply-To: <163884254093.18109.2982470198301927679.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Dec 2021 08:52:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=24aUMHjzzrYv7jqBoSDzX58ovLgFPbK3RTRbL8+ewA@mail.gmail.com>
Message-ID: <CAMuHMdW=24aUMHjzzrYv7jqBoSDzX58ovLgFPbK3RTRbL8+ewA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Remove BREAK/FRAME/PARITY/OVERRUN printouts
To:     Magnus Damm <damm@opensource.se>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 7, 2021 at 3:54 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the SCIF serial driver to remove printouts for break, frame, parity
> and overrun errors. This reduces the amount of console printouts generated
> by the defconfig kernel on R-Car Gen3 for certain use cases. To retrieve
> more information about such errors the user may inspect counters. Also these
> errors are fed into the TTY layer for further application specific handling.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
