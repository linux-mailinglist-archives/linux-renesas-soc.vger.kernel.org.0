Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB4382039
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfHEPaw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:30:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41051 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbfHEPaw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:30:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so81631331wrm.8;
        Mon, 05 Aug 2019 08:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBWghaTG43GrTvi4DOQaHL6LmukK4yS9st0dWQQU/Tk=;
        b=XOohFeedVBt01mHrK9SiiW3tjobHVmXalDHR006WVtBYQAW8OHLXCGXeGPrJbfH2DP
         f63xR+cjGwYUQEeIWsL7TDQUu0j46xJqB93I+3hsrGNJlYnx29teiNToCpj6JbfRkqC9
         oaRZWkk8w2/oIo21UuOs+Q+VAGeHdOxK3rJ2XuDLjeMtxfEYocH9fk+p16GIS42RQN8d
         A4RDAExFC9eCnNFeunT9xK/Hz8o64RlsOHOdPRzqehuv6hC3X24rVZdOOlpYq6FBZYvq
         U5gnqInm1hptxD94H0acNibRiYOJim0hf3J2EYbsowLwi6/iOiGsPe9K4yxQ9nQrJxMk
         T/Ow==
X-Gm-Message-State: APjAAAVKUmjKo+y4zordA8E1VqSwGs4ogcRHVR3vEaaMXm0dQwR1PUdA
        QUHcu5nDLskzpaaVJ0htrAixsNzVUeNLAlFu/xM=
X-Google-Smtp-Source: APXvYqzTBnEN9rLUBKerFP3pCuJj+DoctF4qKjenFOauTc1hdttvsUD6I/nordSwHl79YyqI5U+rOZ5KYJlidpUln8o=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr7901289wro.213.1565019051380;
 Mon, 05 Aug 2019 08:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082952.GL5008@pendragon.ideasonboard.com> <TY1PR01MB17702E7517D3EE5E48337DA8C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17702E7517D3EE5E48337DA8C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:30:38 +0200
Message-ID: <CAMuHMdX9JghQgTksYQfT=Mt5LkyR9aX3BXtZD449y3ZTQAczsg@mail.gmail.com>
Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for
 12V regulator
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Aug 5, 2019 at 11:17 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 02 August 2019 09:30
> > Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for 12V regulator
> >
> > Hi Fabrizio,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 02, 2019 at 08:34:08AM +0100, Fabrizio Castro wrote:
> > > Power rail "D12.0V" comes straight from the power barrel connector,
> > > and it's used in both main board and sub board.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > I don't plan to take this in my tree without patch 12/12, so if you
> > think the rest of the series won't be ready in time for v5.4, feel free
> > to get this patch merged through Simon or Geert already.
>
> Geert, would you be happy to take this patch?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
