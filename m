Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEF7D77EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 16:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732428AbfJOODQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 10:03:16 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42585 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732170AbfJOODQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 10:03:16 -0400
Received: by mail-oi1-f196.google.com with SMTP id i185so16845042oif.9;
        Tue, 15 Oct 2019 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lOjJLF7sukvj2eKb65vV1HI25D8NmeruWTF/C6krm1Q=;
        b=bjxevdDoTVfJ4gqJeH+FKT9XM3NZqH/LwPfYRFhcWwHSxLfriO01Jtn3V3Mpqczqkb
         LHlhvvYXAC1asDG8OYBRWESpcyepJzeITzH8wJF1aGOnpzjo4HZa2/fmeB7duk4iK60D
         6cmKCskWo6zDJqebLvmK+nGDo3p3sac6VRDBgSOZDIvXh+k0o+Q7NuIazdB12u4/5J2o
         p4iYV5VEOBGkXcgsmvMlFfz8q03YTtll/OWlaRSRQeFx9lKyu/CWptHZiq/VLSQpIt57
         T+vjBMCm5WZ7YkYVSFolmAqB4fDIrw86s7eYFt/xCnN61SEYJZu1YMvGJ+ijCEvOC2n/
         GrHQ==
X-Gm-Message-State: APjAAAXrZWDPydm8xYtfDoRmP0OQfVER1D/MsaTCIKJDeVDUy8LTkV4u
        0TrAcL1KCCdnhN5HoPz69/CYpjC9ihAw13LzsVI=
X-Google-Smtp-Source: APXvYqyr2Z8Smipppw7iBN2DU7emj0QxlbQzT35YfXNX6ZmXYwoICBBJd/mbfEEWv1S0yH9hYhQVJ4X3dWgp6QTqlV4=
X-Received: by 2002:aca:882:: with SMTP id 124mr29310652oii.54.1571148195408;
 Tue, 15 Oct 2019 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org> <20191015104621.62514-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20191015104621.62514-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Oct 2019 16:03:04 +0200
Message-ID: <CAMuHMdVr=eVJWMC=oHsfUE8=ODj8aMw2Wq1nr0Cd+ngxW7nuMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        Sean Paul <seanpaul@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, Oct 15, 2019 at 12:44 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
>
> CMM is the image enhancement module available on each R-Car DU video
> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).

V2H is excluded, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
