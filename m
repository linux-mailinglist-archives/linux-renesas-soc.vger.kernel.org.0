Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E405E24002E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 23:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIVaB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 17:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgHIVaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 17:30:01 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417A2C061756;
        Sun,  9 Aug 2020 14:30:01 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x2so4111415ybf.12;
        Sun, 09 Aug 2020 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ORAT8UucilC3IwrKP3UItEtUbW3Qy+oRV7IOUt8IGrw=;
        b=skYyeSEoTdqbH1+pnfJFV9NFJ+4eS+a2Mks1/TnaCZu4YH64WLfkTPwkE+nCEc82xO
         FRJMQN5rQHvWHAAeqA2pVaXn+UbvK13FrkBNMXADx+yoaQjvIwZxCFjTjwx4LI1WyvFH
         nYMfGKGMUvSIFdSZn7ViEsu7X/GCxA/4iFe1GUenYqCbCaufBOW8yF6nTnuqJm1Rhbq7
         iLFs+MvzRQ8Qn8wvbiSZLlZvDQcWRxaFKFp3H2bXzrLKvf6iBSjQ0Jw5rWTnNz3BTGUj
         zFIlO+sgQyLYlulJF2/xofKQjyzTBF4vQrm53HqYrX5+i1ZGhrHW9Nh89+LejHNCKMAE
         +1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ORAT8UucilC3IwrKP3UItEtUbW3Qy+oRV7IOUt8IGrw=;
        b=fPBOSDMZzsBJwsWT7Ys56Vnw1Jk2aK0RDf54FYmcPBxDMsFX/pkopGQp6FUjdoGet5
         5q8bNvv5vyum7u68mmt0f12IIY8g0jmPREdzEk3IirQgM1lKQKsIMJzZlgXDJxDc8yb9
         fcgLjlIU/cHdUo5zVz0IVCBsONUzAxqqZ/egZitemB57PsyxlQqOAH/lA3FyXaLAbJJi
         0yYxjN+FPPjq33yW5/S8ql0WuwxNv7USHBdrR178K/2nz4sZ/0mhAeGGV6wAGD3y+MNp
         MvmbIFVS2tajr7FzecdBwSCHzW4virG9D1LdLtjiVXXP9JhxJouUWglgLmKWGDU54IgG
         F3lQ==
X-Gm-Message-State: AOAM533DTvmoqNJd9G1fYT3Vem1nOV5sTa8oEx1sF4WC4MxWlQ6GlaZb
        YRDOWL7+4zZvNp9VsOpvtwcO2DSzJSGJ2tjUx30=
X-Google-Smtp-Source: ABdhPJykZDTT3kd4F6y0xhJQLQH0CY1/8xLgR6i6+pWRSXQv+cKO4hgtt71iv+8B4K1WLpq6EaUav0+9fAu/PlN+990=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr35763935ybc.76.1597008599048;
 Sun, 09 Aug 2020 14:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200808211323.GR6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808211323.GR6186@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 9 Aug 2020 22:29:32 +0100
Message-ID: <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Sat, Aug 8, 2020 at 10:13 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> > Add LVDS encoder node to r8a7742 SoC DT.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> > index a979a4b3de61..a7e66220d63a 100644
> > --- a/arch/arm/boot/dts/r8a7742.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742.dtsi
> > @@ -1534,11 +1534,65 @@
> >                               port@1 {
> >                                       reg = <1>;
> >                                       du_out_lvds0: endpoint {
> > +                                             remote-endpoint = <&lvds0_in>;
> >                                       };
> >                               };
> >                               port@2 {
> >                                       reg = <2>;
> >                                       du_out_lvds1: endpoint {
> > +                                             remote-endpoint = <&lvds1_in>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             lvds0: lvds@feb90000 {
> > +                     compatible = "renesas,r8a7742-lvds";
> > +                     reg = <0 0xfeb90000 0 0x1c>;
>
> Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
> below.
>
Agreed, 0x1c comes from Gen-3 manuals.

Cheers,
Prabhakar

> With or without this addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +                     clocks = <&cpg CPG_MOD 726>;
> > +                     power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 726>;
> > +                     status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     lvds0_in: endpoint {
> > +                                             remote-endpoint = <&du_out_lvds0>;
> > +                                     };
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     lvds0_out: endpoint {
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             lvds1: lvds@feb94000 {
> > +                     compatible = "renesas,r8a7742-lvds";
> > +                     reg = <0 0xfeb94000 0 0x1c>;
> > +                     clocks = <&cpg CPG_MOD 725>;
> > +                     power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 725>;
> > +                     status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     lvds1_in: endpoint {
> > +                                             remote-endpoint = <&du_out_lvds1>;
> > +                                     };
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     lvds1_out: endpoint {
> >                                       };
> >                               };
> >                       };
>
> --
> Regards,
>
> Laurent Pinchart
