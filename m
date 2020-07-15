Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F91220751
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 10:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgGOIdH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 04:33:07 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37977 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgGOIdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 04:33:07 -0400
Received: by mail-ot1-f66.google.com with SMTP id t18so849002otq.5;
        Wed, 15 Jul 2020 01:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5sAqUgn9cvxe+xg29sqCECVsVXdkGKTE+GopvFS8Qg=;
        b=C/uPXLFdBFEYtcdajfHjCu7IaWrTLH04H5KC1xTdjmDSaxkWCmz6mJO1e3qcITZPHT
         1LDmMGcNKjcHQriJnOX+uZfkDmnwLA0glozQyqmn5HOysXqDvDgBAErGmyxO5ucqmB0l
         RDKHFuU1sUIuU4cDWL+/dGeobJtkStSAxTG4eTeKvZemEFuRIJAyZFbVLUGvplT1A1hw
         UfQ+To7zesobhAE7M5RzKqCBHOUDXT0D2j1meW37KUn1PISv85IkrX8L8y3+SgJhNcfc
         sKmLEo5IT+27SewyIWoFovvJ0EFVoj+bvEMubQZ9q82cyly2xB0WW8+531jnUT/agUEi
         iPFQ==
X-Gm-Message-State: AOAM532CGm9kWqZQYZzTdh9UUTnrzo3I/oFhmRpfVg+e0rxvaJiOvNeL
        WYt4UWA2+LGpeEVWcYQpijLQlPBsxun3TnM9rdk=
X-Google-Smtp-Source: ABdhPJxRf7X46l9/RuxnR97QYrbp+tXYdwoLbtediLsDriX3jmkzvVFsmx9ys9vBTFJoKvIU4nKd978smmCpgCdrPLg=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr7340091otb.107.1594801986000;
 Wed, 15 Jul 2020 01:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200714123419.3390-1-aford173@gmail.com> <20200714123419.3390-2-aford173@gmail.com>
 <c2e52f87-b2cf-ca36-7780-5e206f065d40@cogentembedded.com>
In-Reply-To: <c2e52f87-b2cf-ca36-7780-5e206f065d40@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 10:32:54 +0200
Message-ID: <CAMuHMdUYdGD2Us8W8FvSi-2MTJbDOvW4k_eC+YrTgdmZS97LCQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: arm: renesas: Document beacon-rzg2m
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Jul 15, 2020 at 10:16 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 14.07.2020 15:34, Adam Ford wrote:
> > Beacon EmbeddedWorks in introducing a development kit based on the
> > Renesas RZ/G2M platform.  This patch adds the entry to the bindings
> > list.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>

> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -118,6 +118,7 @@ properties:
> >           items:
> >             - enum:
> >                 - hoperun,hihope-rzg2m # HopeRun HiHope RZ/G2M platform
> > +              - beacon,beacon-rzg2m # Beacon EmbeddedWorks RZ/G2M Kit
>
>     Why the vendor-prefixes.yaml file calls it Compass Electronics Group?

See commit f756619f26edf74a ("dt-bindings: vendor-prefixes: Add Beacon
vendor prefix"):

    Beacon EmebeddedWorks is the brand owned by Compass Electronics Group,
    LLC based out of the United States.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
