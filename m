Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4569B36EEC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 19:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbhD2RXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 13:23:32 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:36561 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbhD2RXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 13:23:32 -0400
Received: by mail-vs1-f49.google.com with SMTP id k124so34148262vsk.3;
        Thu, 29 Apr 2021 10:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IipN+JHy/GHloboiBlg+J8C/w+MqkgnZBETYvu9afi8=;
        b=rke32GBk6TkFq+48hVdARfaNBx9Uo/jcxhwMOQAmLPbE0wNBBalhVxVqWYlUtwqHWq
         +gV3L+R5qZNiQanLxhZPRUsxwJ6WW/6D+39jcHrUSGx4/2/Y9wYYq7i8009nZdD3wHFx
         GRuRrLR3KEL570Zi5buT6F4Lycq5/zTs3AOUSBxB5n7Rt9iPRBFaRxbnkbVngXUBzUhM
         0ZLAjtIOK3zLpaeQKNJmyFo6R3y5z9mxJs08NwotcwUQdD1hcfs7wS3wbZ7+Ut9/3GwA
         2Ffg169cDt4Im5aoH8kb3ClT0vltOQCgQafgsZSQV9JsMmWSN4gtP3EkIjglv6EC+oHm
         AYYw==
X-Gm-Message-State: AOAM531RnSlKRjesse6qwik2ecQTcVS5oO5zoS3u9bJ1TtFkAiDERdT1
        4bTJW9YQebVf3/OLoyG+K7F706UZ6xI/6ug3/uY=
X-Google-Smtp-Source: ABdhPJwntEMdXe4iH454WyGzfl3NxgkqigXREwYM2E5ls823gHlXZ8uCvDYYfvETE8D1NZwkQY/9uYdAvPkQ3+7ShVU=
X-Received: by 2002:a67:f614:: with SMTP id k20mr1510686vso.42.1619716965113;
 Thu, 29 Apr 2021 10:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
 <YIrXxWbJ2LmcoQn1@pendragon.ideasonboard.com>
In-Reply-To: <YIrXxWbJ2LmcoQn1@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Apr 2021 19:22:33 +0200
Message-ID: <CAMuHMdUe0wA-BXXiJKuSjCrPFwbs3V4x6O=OAvTsmgYKt8bMHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Add missing
 power-domains property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Apr 29, 2021 at 5:59 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Apr 29, 2021 at 02:47:56PM +0200, Geert Uytterhoeven wrote:
> > "make dtbs_check" complains:
> >
> >     arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77970-v3msk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77980-condor.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > Fix this by documenting the power-domains property.
> >
> > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index e955034da53b86e2..0dad87cdd8735542 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -51,6 +51,9 @@ properties:
> >    resets: true
> >    reset-names: true
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
>
> Mind if I move this just before resets: ? I can handle it when applying.

Probably you will start minding once you have read the (out-of-context)
comment above all grouped ": true" properties above....

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
