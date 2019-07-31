Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9687C8F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 18:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfGaQkg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 12:40:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729558AbfGaQkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 12:40:36 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 160D2217D6;
        Wed, 31 Jul 2019 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564591235;
        bh=YL6XanHOolYBcQrCgtDrnoZxKEgTNa0ScsgoNJYUcl4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vV17cvDdDvETO00aVhD1+RRzbWqVUfJpSZAbyKvzxiGWhpRx6idzA7KjVE3HSKgFJ
         yNR29JWdMJ0Ho79he6O206pMZhRdSF/wCyj36+CW/3no7oEm4X6dzIGADd3HD8yu77
         /6ZGkrZZQIbH49k0YWO7M0svFrDW+4oWHSYZ6T+g=
Received: by mail-qt1-f177.google.com with SMTP id z4so67296595qtc.3;
        Wed, 31 Jul 2019 09:40:35 -0700 (PDT)
X-Gm-Message-State: APjAAAVZykK84NHDBYYI+gnVf1l7EsSup8iOZoJjDScwlI8jMpSx+32O
        VhMuN+Lw0hVlhHvID714oH8LpGf0hovK8oZI2w==
X-Google-Smtp-Source: APXvYqxdcWD9trsaYQYOwFKEONE5H4wG9+/v4JG0/5E8QaOHAUVaeK8kQHktNxjbYmOrrMt7zJ5qZzoDHRl4gwI64GY=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr90832483qvu.138.1564591234233;
 Wed, 31 Jul 2019 09:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be> <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
 <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com> <20190731150909.GD4369@sirena.org.uk>
In-Reply-To: <20190731150909.GD4369@sirena.org.uk>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 31 Jul 2019 10:40:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qfGrrfG68WKSsHF2MoLBNi5m9w9x68dT+ZAG9fcWEjg@mail.gmail.com>
Message-ID: <CAL_Jsq+qfGrrfG68WKSsHF2MoLBNi5m9w9x68dT+ZAG9fcWEjg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
To:     Mark Brown <broonie@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 9:09 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 31, 2019 at 08:47:38AM -0600, Rob Herring wrote:
>
> > As long as we have a consistent base name that we can match schema
> > with, then I'm happy. But for regulators, we have a lot of node names
> > like 'buck1', 'LDO2', etc.
>
> Those are all types of regulator (LDOs and DCDCs are the main types of
> voltage regulator, and buck is another term for DCDC).

Yes, I know.

> I'm still not clear what meaningful effect any of this node name stuff
> has :(

It is primarily just what I said. Standard names or patterns allow for
applying schemas. Otherwise, we only have schema checks when we have a
device specific schema. Of course, we do have those too, but generic
ones are useful when we don't. If there are errors in the DT causing
the device specific schema to not match (say a typo in the compatible
string), we still have some checking.

Rob
