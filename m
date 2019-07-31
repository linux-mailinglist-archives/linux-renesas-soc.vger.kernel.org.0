Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 168AF7C577
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 17:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388375AbfGaPDM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 11:03:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52169 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388176AbfGaPDM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 11:03:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so61194642wma.1;
        Wed, 31 Jul 2019 08:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dwIieuSjAHH84fcKyjEQyxPxQw1hDR/ozTdpigs9XQ=;
        b=QXZosgsWauPvGHkGm5oN9H4U0wsGsBRpx01TUNpqb/1efFS+FxnrvRnnZpHo14oCfH
         Ij0WS2pDHJ/AYsM6uKO3ysk3+ImpDaAO8XTnw0+YsPqiMIzJ4fG4xxFP2hsfAVkdbNYB
         H2ZqtHJEA8JuiJXPDQEqq0GcEFDOQ434FohbG4m2JP92lOkkMa+ND+R0zcLnfg3qzFqD
         hUbj8XypsMxhpRBbZNOGjZS3v/a9dGIUr1TozlV1XhnXIwCQS2e5OmS8tycJXHIv94SC
         DxvUFgOSDF7jObSFqXiKW3H9tnEp4HhWKoVqxn5UbrcDqCwMmIqmI19T80HBg2RysNKM
         o85w==
X-Gm-Message-State: APjAAAVxfkOJJtWI46TV/X1dPoYbbRWZiyyU8BAuZBFW5DlEd1UsSjiS
        fAiZMMr8CY2C8zKqkc6Ry4KynNYUi979wtuUFJ5I9rQd
X-Google-Smtp-Source: APXvYqwuTbkXe8SLDWjkWoXNqv0aIpwtTIJMaTqJzUUcrmwRKmQ24SfujhmFGIGnTX1BdhJ/CFrvxIVlMEM9VGS6F2o=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr108631287wmf.137.1564585389723;
 Wed, 31 Jul 2019 08:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190731133936.18228-1-geert+renesas@glider.be> <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 17:02:57 +0200
Message-ID: <CAMuHMdV0xc=Ygmjk74-wsfNrODFMwDuzKmrskDx8FUAzzqOFPQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Wed, Jul 31, 2019 at 4:28 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Jul 31, 2019, Geert Uytterhoeven wrote:
> > The two Ethernet ports on the RZA2MEVB development board are labeled
> > "Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.
>
> However, the channels are labeled as ETHERC0 and ETHERC1 in the hardware
> manual.
>
> So I guess my question is, in general, is the board specific Device Tree
> supposed to describe what is on the SoC? Or on the board silk screen?

AFAIK the aliases numbering is supposed to match the board or case labels.

> Maybe this is like "COM1" is labeled on PC motherboard and we expect it
> to show up as /dev/ttyS0 regardless of what physical serial port it is
> connected to.

Those pesky FORTRAN programmers, counting from 1 ;-)

On Koelsch (and Salvator-X(S)), they are called "debug0" and "debug1".

These used to be /dev/ttySC6 and /dev/ttySC7, but got renamed in
commit 1f75cdac773bc9c9 ("ARM: shmobile: koelsch: Rename SCIF[01] serial
ports to ttySC[01]").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
