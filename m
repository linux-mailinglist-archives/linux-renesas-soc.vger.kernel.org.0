Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1624375B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgHMJK6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:10:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41472 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMJK5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:10:57 -0400
Received: by mail-oi1-f194.google.com with SMTP id b22so4416025oic.8;
        Thu, 13 Aug 2020 02:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPmtgk3UOLJyUFtIWjda2Ey4ufiXCs6NyJGP6KSP1T0=;
        b=GFIWfUexHdzwEh3MfHxUcaM7Cb5TnepCiz9i8WztS4rb2D7tVGMZ0X0IHrryGQrYmp
         KE7QkBssj/zxXVhfg0DDwOid0C34hE6eeb/4g8PtiyJJ0Wa0gQie7vNg5JsPniugrxQC
         mjRHc/ob52a+nNnn6PIZedbHUZ/G0ZzoPHJfe7nRWCK1vWJ8UjvUE/smzKmKxUZ2Lr6h
         q0wQ8H4VeJntcwadrti6Xumd4cb2belRYA//0MB0xPysyUU1IwJVyYliN9vwcGYZ4erL
         Cdo4WWRj2QCwCJrNNXrNzlYYJPw+ef4Z3SdKYmOfJkTLJQ3dVrwsh7G/HOfWJJG5leXP
         sTmw==
X-Gm-Message-State: AOAM530K9quSnrre8XGtPXGwhlU5m06W9snUATtV4VKs3fr8WlsorN9d
        2If3DneW8e3zTVCl4Ry1pLUGJWz4V8PWN/VKaY0=
X-Google-Smtp-Source: ABdhPJzZf6b7lgD23TEIGqf8zFMYGU1TQwhpl7558bFXmh9ftqkP75P5/VISFKwMg9x4HFnw0vv2b9onWPZyUjQE09s=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr2568681oia.54.1597309856979;
 Thu, 13 Aug 2020 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:10:45 +0200
Message-ID: <CAMuHMdXTKUSsDyfjuj5AmtoBrRsBZoXtcvgK7mCz6W6CfDTJeg@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
