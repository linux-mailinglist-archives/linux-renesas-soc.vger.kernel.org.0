Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030A27BBB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 10:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfGaIc5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 04:32:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38971 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfGaIc5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 04:32:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so48634888wmc.4;
        Wed, 31 Jul 2019 01:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vv7QJlhqsQ8aHiLfsYKcKvtxePDzn2Rbc7z1MBOOQ9Y=;
        b=axSdODjw3jXgx4S9R8vd6L6ENp4zPspBhge4toszOo07c2BEDbGgYx+A+/yS+581Ab
         PwGjp0Cptxh7qa+bMuJKiry4d1iajGrmWNaUdd4zxKPWrWJgV4EIvq0gfnDsGt/el3v9
         R6b/orCu50jz41TgCJV/AAGJTMdQ8qjUoT4fKbcyXV7h83w2RDhlfYsWMJX+cZbP2gdi
         mvaNB8hg2aZi8NHURzoeZEFIc0RiA0w1lXvy36Z5jG4Gk6D0PkLhG48u70e3rkCd4Wje
         NGZAQAqiAV8ntnXKhFj0yZhflEnMXkVAdmEir9SrD2JnA9OxJh9JFTq81XIdTC92jof0
         MB6g==
X-Gm-Message-State: APjAAAWMkchdNPyfckyYQt/87riETBdQttvBP90XfuQXMs2DSWX5Kknb
        EYyljy+SxXO8Ny6Zw4KK5BvpFUeQrWc1JRVsitw=
X-Google-Smtp-Source: APXvYqya/XfPxO65m02NWkmZ45+9x/Fzz1kXR3vOrCtLpHfH6e9/DbeCK8UArUmFGOkuZI9NP57/KPuy1ff+LkPKIHM=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr102178270wma.171.1564561975116;
 Wed, 31 Jul 2019 01:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be> <20190731081209.GA5080@pendragon.ideasonboard.com>
In-Reply-To: <20190731081209.GA5080@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 10:32:42 +0200
Message-ID: <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jul 31, 2019 at 10:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> > Currently there are two nodes named "regulator1" in the Draak DTS: a
> > 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> > for the backlight.  This causes the former to be overwritten by the
> > latter.
> >
> > Fix this by renaming all regulators with numerical suffixes to use named
> > suffixes, which are less likely to conflict.
>
> Aren't DT node names supposed to describe the device type, not a
> particular instance of the device ? This is something that has bothered
> me too, but I believe the naming scheme should be decided globally, not
> per board. Is there precedent for using this scheme that has been
> explicitly approved by the DT maintainers ?

The example in Documentation/devicetree/bindings/regulator/regulator.yaml
uses "regulator@0", which of course works only if #address-cells = 1, which
is usually not the case for discrete regulators.
BTW, the example lacks a "reg" property...

So some other suffix has to be added to distinguish individual "regulator"
nodes.

The example in Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
uses "regulator-1v8" since commit b735f41dcb06ae06 ("dt-bindings: regulator:
update fixed-regulator example"), which received a Reviewed-by from Rob
after it was committed.
https://lore.kernel.org/lkml/CAL_Jsq+rRYazOqtjNms0cTK0HpkxCkmZ4JXoLM7ZaPivATEO8A@mail.gmail.com/

Looks good enough to me ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
