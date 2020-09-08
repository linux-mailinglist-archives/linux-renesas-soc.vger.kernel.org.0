Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3765C261B06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 20:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731354AbgIHSvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 14:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731340AbgIHSvQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 14:51:16 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34B672145D;
        Tue,  8 Sep 2020 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599591076;
        bh=rvDSCZvFRJ66ihgClWK76JHomlIvsS1g+T/SMib0umM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yWhrHS3OaHQKIXLtXl/3PqXpcHs1osUNt7jXkd8Xn2GhWTEoDbR1haU7D8WFUom9x
         Ohgi+U2+srPsDvjwhloOatHxq/YfBtA7jcTnL1T16ztSmpFsE/YpwjVRwnSeA9QgBS
         sVLvXC7AWIWKSDnvmIZixB75xvPYx7qL9Pq0Peu4=
Received: by mail-ot1-f52.google.com with SMTP id 60so118643otw.3;
        Tue, 08 Sep 2020 11:51:16 -0700 (PDT)
X-Gm-Message-State: AOAM5320l/bjzJCYxBzRhZNmJ3Uake7u79QarAnlrFQ+2Qzs7vR9Q6yL
        L//8okSUm75sVbtIbXDTivKdwgBu8qvJjFV66w==
X-Google-Smtp-Source: ABdhPJzzsAvOaaljadNcHpgbxTqCs+adpWfZ02pFKHSsMEMcvlU/v9W9Zbxnn3nCzVOy+k0EXol3VOtmmA9i/wf9ekc=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr331886otp.129.1599591075501;
 Tue, 08 Sep 2020 11:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com> <20200824230458.GA3489164@bogus>
 <20200901102714.GC5821@pendragon.ideasonboard.com>
In-Reply-To: <20200901102714.GC5821@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 8 Sep 2020 12:51:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJtPMah6WskUc08JAhGskSM+cFJa4pRJKAyuqqBOKPhxQ@mail.gmail.com>
Message-ID: <CAL_JsqJtPMah6WskUc08JAhGskSM+cFJa4pRJKAyuqqBOKPhxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec: Document
 vcc-supply property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 1, 2020 at 4:27 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Mon, Aug 24, 2020 at 05:04:58PM -0600, Rob Herring wrote:
> > On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > > Document optional vcc-supply property that may be used as VCC source.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > > ---
> > >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > index 68951d56ebba..3248be31eceb 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -79,6 +79,9 @@ properties:
> > >        The GPIO used to control the power down line of this device.
> > >      maxItems: 1
> > >
> > > +  vcc-supply:
> > > +    maxItems: 1
> >
> > Probably should be 'power-supply' to align with the 'simple' panels.
> > That's also to signify there's only 1 supply. Using 'vcc' would
> > encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll
> > NAK because at that point it's not a simple bridge with no configuration
> > (it's arguably already there).
>
> Fully agreed.
>
> Do I get your Ab or Rb line with s/vcc/power/ and the commit message
> updated to
>
>     dt-bindings: display: bridge: lvds-codec: Document power-supply property
>
>     Document optional power-supply property that may be used to specify the
>     regulator powering up the device.
>
> ?

Yes, if not too late.

Reviewed-by: Rob Herring <robh@kernel.org>
