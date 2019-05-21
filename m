Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F8A24AB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 10:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEUIro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 04:47:44 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39557 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfEUIro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 04:47:44 -0400
Received: by mail-vs1-f68.google.com with SMTP id m1so10642825vsr.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2019 01:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gp/uF0JZUUWVqBj25/AuHpN50zIGmiBcPeZMxX35Ka0=;
        b=Vfb8UIhiwGGJvnARVC640uvPx+OART3dt9oAPmoucwU340rM6aq/O04J0CUFfcAUIw
         o/HlJZBnRlDRpdx7I08/EmV+AsY1mUjCIImV2DTekaB3ESlavFl1RMYdAN4/BnW0ocvh
         06gncDTe28lwOvKbBWZU5cJGs7Qc/XnwZIlxc1l8nF5Dd8taT6CALSk8PSYRJ8gJV606
         AHeShZTE74yRmx7Cr1BX2hlglvPGTGijwmP2oPVTqQV+s97/GVcxZupDQeChn5zTdfGz
         M3K5zugPnkpBRKNhzpB45Qn7kBzIRq5IuIoggT4lpmGU4T58j9WOMA0ea++LPW+nsJqn
         PQNw==
X-Gm-Message-State: APjAAAWRF8enjfKQmxyXRn0dxgYhkACSk1GJ6Fav9a0Bo52c5PRHn1TD
        9f3aqpUIJ90NkI93cNmmHIllCcTkbzRVPg2NszRVcfqZ
X-Google-Smtp-Source: APXvYqxq+VVjDyNiqPWpTd2VR3Le2v74tOZLgFSpAlVj2Hvl0Y3jklX+wc+GwpNpp0D+fXRlOQAb37QKfHZVBtTT7ro=
X-Received: by 2002:a67:f589:: with SMTP id i9mr7769888vso.152.1558428462944;
 Tue, 21 May 2019 01:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-9-jacopo+renesas@jmondi.org> <20190511182150.GE13043@pendragon.ideasonboard.com>
In-Reply-To: <20190511182150.GE13043@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 May 2019 10:47:30 +0200
Message-ID: <CAMuHMdULbOUYEMeGhGkVh2wE+DdCRVxMzq-tn=iS3Ny2xT9a9A@mail.gmail.com>
Subject: Re: [RFC 8/9] clk: renesas: r8a7796: Add CMM clocks
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, May 11, 2019 at 8:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, May 08, 2019 at 07:34:27PM +0200, Jacopo Mondi wrote:
> > Add clock defintions for CMM units on Renesas R-Car Gen3 M3-W.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> We have no clear confirmation that the parent clock is S2D1, but this
> assumption makes sense given that the DU uses that clock.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to clk-renesas-for-v5.3, with the "defintions" fixed, and the context
updated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
