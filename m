Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41F649D264
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 20:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244376AbiAZTPk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 14:15:40 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:37396 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiAZTPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 14:15:39 -0500
Received: by mail-ua1-f46.google.com with SMTP id b16so583124uaq.4;
        Wed, 26 Jan 2022 11:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5h4yPbTXU4wqsorwopOnLdw+9EDUnH78Z2/ivKl2tU=;
        b=W9FidF1wUpjspq7/hb2J8qW9le465em2245q1ZPEu58gy0D740SZK3CKcEL8552BvD
         EZpouppcl0+LMv7iSn//kR60UlAIbYNHDB3C3NHBEZk1qnujtD8JTN+PiPeu5JQ8air/
         TqdyiyskQgZz9wv9JJGOVFCS1zGtVYMI8NlSJ9G8+Szj5/HuUAj4VP65U43NMC3FAloL
         v4Ph65tu5UnXewNYzKQ6yQ+5j33gTIQa/UgP6S4Fg+IhYQaY36DSU7K+ZZdpTVDVT2Pe
         7avA4JcB8rsLz3Gcqf0oOGlxQp+abbSZgbI+DpLcIuBrdjFd3cxMHHYBj/oNQBLh/Znq
         W2TQ==
X-Gm-Message-State: AOAM531ij9Xvne48YEIAvOwANxQ1VVXrGSuzfbB3p6T8Yql8vyNUXEDA
        ScpGrt79c0yHdRRn5aLOT9S34W6xANfJ56nq
X-Google-Smtp-Source: ABdhPJwZpMLtNTxI/yqgwkT8GEEJHONo4RigTPwQDDf70Q1ZkNhoRaoswqyyu7thLoPorrfWuUF20Q==
X-Received: by 2002:ab0:7248:: with SMTP id d8mr321591uap.60.1643224538976;
        Wed, 26 Jan 2022 11:15:38 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ba16sm23326vkb.39.2022.01.26.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 11:15:38 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p7so568373uao.6;
        Wed, 26 Jan 2022 11:15:38 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr179457vsb.68.1643224538041;
 Wed, 26 Jan 2022 11:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com> <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
In-Reply-To: <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 20:15:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
Message-ID: <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jan 26, 2022 at 7:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > > boards as an optional external panel. It is described in the
> > > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > > board device trees, with other minor modifications, to enable the panel.
> > >
> > > This is however not how external components should be modelled. Instead
> > > of modifying the board device tree to enable the panel, it should be
> > > compiled as a DT overlay, to be loaded by the boot loader.
> > >
> > > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > > declaring a panel node only, without hardcoding its path. Overlay
> > > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> > >
> > > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > > is currently unused. As overlay support for this panel has only been
> > > tested with Gen3 hardware, and Gen2 support will require more
> > > development, move the file to arch/arm64/boot/dts/renesas/.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> I see you've reviewed the whole series. Can you pick it up ?

I believe it depends on the removal of the empty endpoints, for which
we're waiting for feedback from Rob, IIRC?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
