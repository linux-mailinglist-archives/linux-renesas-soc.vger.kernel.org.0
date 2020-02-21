Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89251167E66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 14:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgBUNWe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 08:22:34 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37566 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgBUNWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 08:22:34 -0500
Received: by mail-oi1-f195.google.com with SMTP id q84so1540323oic.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 05:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kOXBZUawIUtLzO+ge7wDxRnv5KsIq+pNVx1u2njBarI=;
        b=bLQXlh0ft+GPNFtQMZfn7tLJDi+E1nXliPLoIYYT3zB2jZiSlOg8YNAaWRs9V2NR0H
         GVRNxUrnc75EFqs7zCvMjIGEXjxnhRSLKR7ZNUVMtRiuI//NuU45/3hw+oqbFx/VscHG
         a7t3GkjhYa1yOmXNCIAJgt5gg4O3I7TO8fHY2/hxzNa3q+UbS+tI1iL8ZpGqNuh0H2Qi
         qX0ThggvZ2K2glofT6OruYA1UIZYrjZ851f45QHD2kaDaQjcKRlET2vkjey595rO86AD
         e+a5NHcfb/nUEhM1+9g9Ut1Krhsc/yr/slY30VRHQNz3CM/yqkT3sUVeQdsvVu94NU1N
         5E5Q==
X-Gm-Message-State: APjAAAWpdHD5Hp+tEKK3HXs2fhEDbvkoM6YnTRq9LtdCOM4MoXFDJXLu
        ddw/o7cClZ1ZtUR1b+1xof/NMt0iJiBywPDwhvFHtaBS
X-Google-Smtp-Source: APXvYqy7/GyiEE1FFCw5ndSB/mv74d9+OQLCHuSSzVgC6K1E/lOf4OJLSybMMK8iTn2U/U9LqEAi/grBGoWVXMmI1x8=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr2033497oif.54.1582291353073;
 Fri, 21 Feb 2020 05:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20200218132217.21454-1-geert+renesas@glider.be> <20200218200413.GB1016123@oden.dyn.berto.se>
In-Reply-To: <20200218200413.GB1016123@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 14:22:21 +0100
Message-ID: <CAMuHMdX1PPbuHDeBBYuy-LT57ShMwH0SO+GjkkdsOcXyVu+WYQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7745: Convert to new DU DT bindings
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Konstantin,

On Tue, Feb 18, 2020 at 9:04 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2020-02-18 14:22:17 +0100, Geert Uytterhoeven wrote:
> > The DU DT bindings have been updated to drop the reg-names property.
> > Update the r8a7745 device tree accordingly.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

"get-lore-mbox.py" no longer seems to be pick up tags with non-ASCII
characters:

get-lore-mbox.py -a -t 20200218132217.21454-1-geert+renesas@glider.be

This does work fine with an old version, before VERSION was introduced.
Even older versions picked up "S�derlund".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
