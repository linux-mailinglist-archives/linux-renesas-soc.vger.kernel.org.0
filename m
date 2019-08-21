Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF39F9745E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfHUIGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:06:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39610 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHUIGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:06:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id 16so944798oiq.6;
        Wed, 21 Aug 2019 01:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/otiMYH4DLFkxecKopzd3o3fIbf8iVIxXrmrHOhVGKQ=;
        b=VnDDgtRejtFSTVsGkH4/Vo/uAFu78dMu3bQjNbUSOn60NagoDwgj6Qyojr0sU0w1fP
         4eqQ9BkB6oXdW4v5xyxGk/6+SS16DXwhrzvnf3lJmI/vh/JcDRlxCOhd8eybQ0TJTDLo
         m/LmycfTnGfMYcEQDKkT2PpWa4JDz6F8W6Y3pfi0NAtcywmRiFcKH/3+O1HvNlVVtaTu
         fMBGzQvKTboXkaEg2qihG1+FL/r+5dqhGEkWKWsR/r5U9t6OiSdlFLkcy/h+hDDFBkUc
         qtjs+5gKfKgViq/GJI0R3F+4fmrSjGEKghT+/AtWj5BjlVX2nafj6liwEaGiQdpAiKek
         lsFw==
X-Gm-Message-State: APjAAAXCCYX5h5rZ7MOLzcOeMms5PJf6T8XotK9LSg+LE/xQUbHC/8iQ
        IQNVbHG5XkQ0ZCfjY/PjCGLOl1zLtidFDzI5xts=
X-Google-Smtp-Source: APXvYqwDMlWNcWM8ZknMEBEG7Sunts9cmK3/qbtWEgqoik57NdlgfrEmKMqju75U746CAjiG9SV88untksBrGTECXtY=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr2736500oih.131.1566374789372;
 Wed, 21 Aug 2019 01:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
 <20181119104243.csnkooxolkple2ln@verge.net.au> <499ffcf5-0617-a142-914d-afee88c2127b@gmail.com>
In-Reply-To: <499ffcf5-0617-a142-914d-afee88c2127b@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:06:18 +0200
Message-ID: <CAMuHMdUJK79r8Kn035nzVrg-DN76sYD_diijvH=q37Zbw3VBNQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 16, 2019 at 2:58 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/19/18 11:42 AM, Simon Horman wrote:
> > On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
> >> Document the support for rcar_can on R8A77990 SoC devices.
> >> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
> >> and "assigned-clock-rates" properties.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Simon Horman <horms+renesas@verge.net.au>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> ---
> >>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> This patch seems to be missing upstream ?

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
