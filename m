Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD887C551
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 16:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387871AbfGaOrx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 10:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387593AbfGaOrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:47:52 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C65D4216C8;
        Wed, 31 Jul 2019 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564584471;
        bh=lInMQej1Cu+xXIvUNOMNi98n56lFRIExbteZ0drhpXo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oQeVLps0n60X4Z4fkk7FLEMT5LyfoBsonpOZSoh9YVnzNNeZNv7VK+vT3JMdLsc3M
         rMreU/1DyCCFuYYpm+UdWuyHUp61Pn4tg+R9MusvrXxMwp8Z7PEiXIWZefqb7rd4EG
         RJm6ujYVa/j8qWSusoPSsMPZx9+AljSKLTbBKJu4=
Received: by mail-qt1-f175.google.com with SMTP id h18so66840559qtm.9;
        Wed, 31 Jul 2019 07:47:51 -0700 (PDT)
X-Gm-Message-State: APjAAAWRFvAX2LqRpuPkEIvVjwSDUkzmYMnxwDPoc8br1EU6urai1pwC
        LBwvJOW/Yt3mSYa4lqPWHfA2Lva8kurz+v723g==
X-Google-Smtp-Source: APXvYqxWABAICUQylsJRPx2TocCeORlo5dBLckf02x4fHX4CWRijbYSy8OsZGfpRaqUtJ9b1j4UFuIxWR/TXoH2NlBw=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr87604517qth.136.1564584470923;
 Wed, 31 Jul 2019 07:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be> <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 31 Jul 2019 08:47:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
Message-ID: <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 2:32 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Wed, Jul 31, 2019 at 10:12 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> > > Currently there are two nodes named "regulator1" in the Draak DTS: a
> > > 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> > > for the backlight.  This causes the former to be overwritten by the
> > > latter.
> > >
> > > Fix this by renaming all regulators with numerical suffixes to use named
> > > suffixes, which are less likely to conflict.
> >
> > Aren't DT node names supposed to describe the device type, not a
> > particular instance of the device ? This is something that has bothered
> > me too, but I believe the naming scheme should be decided globally, not
> > per board. Is there precedent for using this scheme that has been
> > explicitly approved by the DT maintainers ?
>
> The example in Documentation/devicetree/bindings/regulator/regulator.yaml
> uses "regulator@0", which of course works only if #address-cells = 1, which
> is usually not the case for discrete regulators.
> BTW, the example lacks a "reg" property...

Yeah, that predates our being strict about unit-addresses.

> So some other suffix has to be added to distinguish individual "regulator"
> nodes.

<nodename>-<identifier> is basically the format we've been following
for cases without an address.

As long as we have a consistent base name that we can match schema
with, then I'm happy. But for regulators, we have a lot of node names
like 'buck1', 'LDO2', etc.

Rob
