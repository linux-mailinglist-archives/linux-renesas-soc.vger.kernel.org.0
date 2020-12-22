Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF92E07E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 10:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLVJUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 04:20:09 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:41002 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgLVJUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:20:09 -0500
Received: by mail-ot1-f43.google.com with SMTP id x13so11329579oto.8;
        Tue, 22 Dec 2020 01:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mxwn2Agou6lH+fUWJGcqINIEsyD2up/ENnjUiiqe800=;
        b=g8wbWo5P2VSSkcvEeOPAbvYXkfdo9MLu+TPcdfbmeLb+h9UciAOopLixDZVXFj/SjH
         D7epcPTTSanC3t5XiOLm6kKKX9VcdypqvZZzoN7V59SKnaSO2LG03n5jQ7eXCm2uRP7d
         /tPn8B1USs97D9Db/wB9YPLJsOHnSUl09q7+0JLzBxZCBcCa+qXOlUpFlNibegcWife0
         hEGLqoWHgupQfrzCQ5OeWOZTNHlyArMXckCopnjBYE9Zh8GEbp3gOhpEZiQslNM0p4vF
         JSAU8NFr53dFgdzxnEZPXr+w099cOTJuXAawT+FTtNMXGJv/p9FerM8Ez/om1fwIIC0H
         wBqQ==
X-Gm-Message-State: AOAM532YWCjPqawpMNqMXYYlSUJdcbD/d3E2zXmV7bwK9KWZWyCLH7Na
        ih+NEubbDO9dAVsU1ehnJIrTUGw+4ZFGRnlf5To=
X-Google-Smtp-Source: ABdhPJxxmbMZoNPeTcZSdx1SrDUa4POWByqH41lrI4CXav+9KusIXnJuTgDSpAcVsH68+VVStRN0Zdj9jCz0ekfTgTc=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr494554otr.107.1608628768585;
 Tue, 22 Dec 2020 01:19:28 -0800 (PST)
MIME-Version: 1.0
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com> <20201218173731.12839-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201218173731.12839-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:19:17 +0100
Message-ID: <CAMuHMdX7NpVxYv1xGb1uaotLnUSEuU5_DQTSRMaGKXeQOeoW2A@mail.gmail.com>
Subject: Re: [PATCH 5/5] WIP soc: v3u: allow WDT reset
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 18, 2020 at 6:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Other Gen3 SoCs do this in the bootloader. Maybe V3U will also later?
> For now, add it so we can properly reboot via remote.
>
> Not to be applied yet, just for demonstration.

Agreed.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
