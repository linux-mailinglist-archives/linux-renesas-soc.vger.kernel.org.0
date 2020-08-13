Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB8E243947
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 13:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHMLV1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 07:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgHMLVZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 07:21:25 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44291C061383;
        Thu, 13 Aug 2020 04:21:25 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id e14so3122038ybf.4;
        Thu, 13 Aug 2020 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0SrbfwtjCL+Ch70ZV12lTDvT9PgGCIle5pOe2njGh38=;
        b=uqSSJl1QBhCjyTIGGHPmllHzdNyHwp5crRG08NLkDMIuGqMzYtAS9sZ9UmerNqbuC8
         RoVhDM8VWhxNtjfUpiP1IJs09F00r59FavT3pGpMyD0stSqPf5tuZ2Sqp55V7YMz7/k/
         fMrtqojnocJHva2BoZ/XPyQXoSI3DnuL383sQhJhO+ehsq0xQlS7ZTJIfID6quVv8KPo
         JBX+FSPxQwb1qeD0jnC1k96eXtgIGnXv4YnnYUcy48Qq64qLQedxvBaVZnBGEftXhQoj
         RmeEz+SnUkpI6Ful0FLbfd0ugGEirEBWRPIgTvV7f/0NmNLGaxjV+a/uupC9fWTwrvaJ
         0xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0SrbfwtjCL+Ch70ZV12lTDvT9PgGCIle5pOe2njGh38=;
        b=Tv78kA6FEBegQ/JtteKmLI4iZuTL+dU6laAgmx9ZNRijkzrNEOHsqkrcRQitlaf+0n
         IFGQ6pA21FP4sVzAhHWA9TlOOC/09Z1IgbPOLO5PBLGrtYZ9d0BzoljbKQ92xlidCAuO
         LlpdwZcXMrSLQpflm6lE/9g78qXtuZ9QxHroz0BjWuKqDlrJ5nx3Sve5EYaAcymJx9H7
         bHwQLJ+eKrpgVwepneYXfxdM81jzMVrW0C4npdSPUGTwhPmgegN2F771S5nToVXKFdVC
         NC921g14vhv0qvY6urskyz6TMMGaQwsRgCeZY2cPtlU4c9GeVKnaOavlOee49HqkaqBS
         LeJQ==
X-Gm-Message-State: AOAM5317o7iUJbZ/3QZfUfom0znBjxAKXvp3mulF99xl6za7Oe3+pcQ2
        PflkzKMzeYhijAqbVG9SeFDU2GKwnYmjT49/lG4=
X-Google-Smtp-Source: ABdhPJxx5+KUKPX1w0oAy96kpCKRHE3RSshStqR59IK1IKnc/G77Uin05ciyk051/7IYQ6oWt+QgwrIFPasAmhFEqe4=
X-Received: by 2002:a25:c743:: with SMTP id w64mr5638674ybe.127.1597317684356;
 Thu, 13 Aug 2020 04:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
 <20200813105910.GB6057@pendragon.ideasonboard.com> <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
 <20200813111123.GD6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813111123.GD6057@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 13 Aug 2020 12:20:58 +0100
Message-ID: <CA+V-a8toVwB+_=RmQ4DjhRaTyHoMOPHW2a42NTEUqW+FSv1tmg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1 bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Aug 13, 2020 at 12:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 13, 2020 at 12:08:58PM +0100, Lad, Prabhakar wrote:
> > On Thu, Aug 13, 2020 at 11:59 AM Laurent Pinchart wrote:
> > > On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> > >> On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> > >>> On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> > >>>> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >>>>
> > >>>> Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> > >>>>
> > >>>> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> > >>>>  1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> index 51cd4d162770..67cded5ad827 100644
> > >>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > >>>> @@ -10,6 +10,7 @@ Required Properties:
> > >>>>      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> > >>>>      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> > >>>>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > >>>> +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> > >>>>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> > >>>>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> > >>>>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > >>>> @@ -75,6 +76,7 @@ corresponding to each DU output.
> > >>>>   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>>   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > >>>> + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> > >>>
> > >>> As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> > >>> instead of port 2?
> > >>>
> > >>> I know we did it the same for R-Car M3-N and RZ/G2N.
> > >>> But my main worry is adding support for R-Car H3-N later.
> > >
> > > Why should we do so ? The port number here isn't tied to the DU channel
> > > number. It only identifies the output port. Many DUs can route DU
> > > channel outputs to different output ports.
> > >
> > The binding document (renesas,du.txt) does state that "The following
> > table lists for each supported model the port number corresponding to
> > each DU output.", hence the confusion.
>
> It can be a bit confusing indeed. "DU output" here refers to the output
> of the whoel DU, made of individual DU channels. Each DU channel is
> listed as a DU device in the datasheet, and collectively they are the DU
> device that Linux handles.
>
Thanks for the clarification, that clears up the confusion.

Cheers,
Prabhakar
