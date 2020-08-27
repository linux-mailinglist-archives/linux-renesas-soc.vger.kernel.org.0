Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE47254E92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Aug 2020 21:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgH0TaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 15:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgH0TaX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 15:30:23 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AD5C061232
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2020 12:30:22 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id f24so5927667edw.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2020 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V0nv7wQoHFBDfCKea743Tg8u0187UBuuLmeycLCt9IE=;
        b=FrpUZP/youjPCtKM9LqQKI6rWq/hmeX+PYpwaZCE58MOs9aULbEOUD4Iz6rJOV9v86
         kzMmDQCn52Ev45YGSetnAY0Zm7bYPpoVb1ZDDxrGQ7IVOnwAt/v/76ct3LJCAOm0LjYs
         t+lHPbwV5vlIeg3D3P29PjAeS807e1JZrOYtTkXUIScqDeAk1oZKWXnMuL9lQYTsQRg7
         Qs17+Og1AY2RfXqoDXhpDyjUr+UD5+p4KKOtLn3B9ZubRDpXluQW5i2GTfFHaCUFIV6T
         Plx3KsGr4Ctbdrr2snVE0YWdOkp0m/vKoxw1hDKbo4gpWES/+w0F4NRMcoYvSSomc6ny
         X83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0nv7wQoHFBDfCKea743Tg8u0187UBuuLmeycLCt9IE=;
        b=O+mZJWoigUQ+qrTj/toPCmK/Tc7+YogKJc/VcqRc5+tEGC8LKtCtO2sIiZunzDDyIS
         r7wzB8peiupoQnVDHZ7ssEvQFLQ88SfSstYCiZIqIQbuu5VV2JCi2Pa5EGhrhGDrlTmG
         bmKQmtGyYDLwt3gsKQueF1mFm+X5WA6imjG4lJLz+sSHq56lvC/v0C9+j38WuiQpOt2q
         Z8Mrg2EaejSWw0u3dR/wW9GhWWjq3F5J6hMY+dltep1TvFfGgULvjN53ngFOUNUAf271
         vMSzSrr/iYl6tbNBapDghmbee0I85W+ca+s9ZJJLuD9Lj9a6wm4spbVZhsMIhTj2czyB
         3xHQ==
X-Gm-Message-State: AOAM532jHdorpIIRGo+LtlF+/8KW0TSlGPgWqaTYj69ti1tsGnrlJGmP
        0296tTCBwMDBiM5QbQAd+OYBbSnlTL5Thm55yQNYvw==
X-Google-Smtp-Source: ABdhPJxrUFTaTtdB3uET/8l/a6XdYU2SNVMC86F8LwhWn6NZzuQLhDwt1HrAbXd+AGqTmGHN1IUW2aCKfRrjVA8PDWU=
X-Received: by 2002:a50:d809:: with SMTP id o9mr20639212edj.12.1598556621415;
 Thu, 27 Aug 2020 12:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8tZAp_oTpG2MsdC47TtGP7=oM6CubCnjBoR6UhV4=opNg@mail.gmail.com>
In-Reply-To: <CA+V-a8tZAp_oTpG2MsdC47TtGP7=oM6CubCnjBoR6UhV4=opNg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 27 Aug 2020 21:30:10 +0200
Message-ID: <CAMpxmJWv=hTgbMLSVFm=C_5qSpo=BvOByW=B+BEEzTPswXfZzQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: gpio: renesas,rcar-gpio: Add r8a774e1 support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine <dmaengine@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 27, 2020 at 6:40 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Linus and Bartosz,
>
> On Mon, Jul 13, 2020 at 10:35 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
> > relevant dt-bindings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Gentle ping.
>
> Cheers,
> Prabhakar

This doesn't apply on top of v5.9-rc1.

Bart
