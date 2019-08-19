Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F1592489
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 15:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfHSNR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 09:17:29 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42192 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727442AbfHSNR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 09:17:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so1241465oic.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 06:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SEfsBkCDTQqVLrNKinpp7lC0KN9hNy1WG84z65Qc2zQ=;
        b=HquNzIOHBCPfKGkvz3TLG+AvRpg0qofxccUdHLnv7JKUpFgr7ubuvkNSSsE78TZZid
         /lO22JfM/GHThnZ7K4HjAfRRbnoDC/Jcb+/jcky8dLEIyco9ZFnDA/7kBVwV1YXraegH
         yJgYgOe2wfb7hL64exRKDmepWMDrmR2kafJ0wYH82Sqd5oamZlNo6TCqJPFdcCwGt5uL
         c7zlVSxc/aFc8DkRKAXIwsHEqSfL7dAQfDCvMIAoxXlLZboNtwYTOF7N9xLhcgLNgBB1
         c6deNXcT8jufmXPM7CKePMPw7+W1HeJdJ+f/kD9iFRGRWM0Yqe4SWWIdDstqJY487wan
         GLeg==
X-Gm-Message-State: APjAAAVFSlbhaDwgWPkqNiQY+hXB9y0elFGxtzGDTlPFoxd8m1mst7Kl
        i4yCuPokofWr3Enstg9xtzUiYo+fsF/MdcPPCaY=
X-Google-Smtp-Source: APXvYqwPSBfbxoPAY9Fp5KuqqLJxhxlv8F7ZZr/+tSfGvsyshn+HobKF0OzY6WWUgZ5TwiTi7air6lQw7Uawki3LFPA=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr12782357oih.131.1566220648571;
 Mon, 19 Aug 2019 06:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190731133656.18037-1-geert+renesas@glider.be> <2035520176.323020.1564583679166@webmail.strato.com>
In-Reply-To: <2035520176.323020.1564583679166@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Aug 2019 15:17:16 +0200
Message-ID: <CAMuHMdV=w8yR2Z_t_-iav7fwUUtFpqHt3KCTR-6SHbRkpmZdnA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Fix IPMMU-VC0 base address
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 4:34 PM Ulrich Hecht <uli@fpond.eu> wrote:
> > On July 31, 2019 at 3:36 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> > 12, 2019, the base address of the IPMMU-VC0 block on R-Car V3H is
> > 0xfe990000.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
