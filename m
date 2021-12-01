Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC33464B65
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 11:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239169AbhLAKRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 05:17:32 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:35722 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242865AbhLAKRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 05:17:08 -0500
Received: by mail-vk1-f179.google.com with SMTP id q21so15680923vkn.2;
        Wed, 01 Dec 2021 02:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDQGCPKgNjOGlOGfr9DTBVT3/yVTaxIqaon2+L7qbgU=;
        b=BIA5zmJ1GiQNCW0cygm5dIsnvCoMQUal/YAnyweEeKSW4boykCFmW6/uIqhZsQnjWW
         dcu6Xg2uX3T9jMzivNlhI6J4vp4HH3TgpyOrJYNqR48LitUg6ZQ7+AVapbcUuNutI6si
         3jWWJDvR9GpTd7NKHL9MPsfFCvf906umCaY9qgam3MwnmyZnYbbyD4+TUaLyi/qt8CQN
         SCs11QjT5o0J6s0kdtC4UqMkTz65U/Vhjbpn6p63h1uuBeV2rHCl0GUBc30hlkp8RXZY
         /5JNRTYkVa+e3lxXG2mq336A1hNyB8TAKgapu1UHmBLLJ/CPvhOErljLgxIKnArt5qLq
         PZag==
X-Gm-Message-State: AOAM531aJmlnHPWdfhZnDhQ1hQTLcQbrobU2Hy22H2ptljAwwQvE9eGQ
        KzMgAgsirtrFhiojhtHV0t3iAu9T2C6gcw==
X-Google-Smtp-Source: ABdhPJwhgdLsIfOYy5Nk+ljgN8CrmBzlq0MewMovoeP30ra6fOnRZSWrLKnm2Em4zoV6DplsZNWDbg==
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr6649633vka.1.1638353626321;
        Wed, 01 Dec 2021 02:13:46 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id q12sm11640947vkd.1.2021.12.01.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 02:13:46 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id j14so47629401uan.10;
        Wed, 01 Dec 2021 02:13:45 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr5533316vst.5.1638353625764;
 Wed, 01 Dec 2021 02:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20211130164311.2909616-1-kieran.bingham+renesas@ideasonboard.com> <YacIBqPcq12TEDeM@pendragon.ideasonboard.com>
In-Reply-To: <YacIBqPcq12TEDeM@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Dec 2021 11:13:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbL-bhDFLxKngj-uw-ophk-d414M=fxv=i7aD=1bk5Qg@mail.gmail.com>
Message-ID: <CAMuHMdXbL-bhDFLxKngj-uw-ophk-d414M=fxv=i7aD=1bk5Qg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: renesas: r8a779a0 DU support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 1, 2021 at 6:29 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Nov 30, 2021 at 04:43:09PM +0000, Kieran Bingham wrote:
> > Provide the DT nodes for the DSI found on the r8a779a0, and extend the
> > falcon-cpu board add on with the TI SN65DSI86 bridge which is used to
> > connect the DSI output to the mini display-port connector on the Falcon
> > CPU board.
> >
> > This has been successfully tested on a Falcon-V3U with patches to the
> > rcar_du and sn65dsi86 which will be sent separately.
> >
> > Since the previous version, the core "r8a779a0: Add DU support" has
> > already been accepted into the renesas-drivers tree, and the "r8a779a0:
> > Provide default DSI data-lanes" patch has been dropped in favour of a
> > better construction in the two patches supplied here.
>
> I've reposted the DSI driver and its bindings, and unless something goes
> terribly wrong, I'll send a pull request in a couple of days.
>
> Geert, how would you like to proceed with the DT changes ?

I can take the DTS changes as soon as the DT bindings have been
accepted in linux-next.
Thanks!

> > Kieran Bingham (2):
> >   arm64: dts: renesas: r8a779a0: Add DSI encoders
> >   arm64: dts: renesas: r8a779a0: falcon-cpu: Add DSI display output
> >
> >  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 79 +++++++++++++++++++
> >  arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 60 ++++++++++++++
> >  2 files changed, 139 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
