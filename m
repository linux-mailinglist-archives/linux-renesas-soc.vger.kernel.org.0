Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87BF23F3B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 22:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgHGUWt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 16:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGUWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 16:22:48 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD472C061756;
        Fri,  7 Aug 2020 13:22:48 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id e14so1647022ybf.4;
        Fri, 07 Aug 2020 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CsGAzF1cPgjR5U2chybR/34PsTJZMXTV2eRl8YfPD/g=;
        b=aTGkunXdWv1XHYI57lxGJXPFaz0e9RMIT43sZbSptStj4uUtfgtVeVKhoKm1aywWJd
         CMy9SpsonlKx9gVBxOPzrM4p5q19Pjfe08RRZPvpUTGOZ+jRzx/s53Vy9b9WMzoTWbrW
         m0DSH8NIMKZ+8++c1ih0D3/Rm0y9NJbCYoIrEjfFEriurpXmLSN3lH7FMjZAvi8xT2xf
         yc2S/EfsMvJZXcfR13n8DVj0iaBLKGpcqEB/xlZDTFgm0gTrIMRaBrVrASs3t0eiALQ1
         7YjSXltn5r+3EBQXl1n01c+hgCKmNPzaJGgh22o7VAqM9+IZ1TzqdH+3ZpwKkLb0AFt2
         8siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsGAzF1cPgjR5U2chybR/34PsTJZMXTV2eRl8YfPD/g=;
        b=huwciB9JpGIoFP6e+OQygvslC/6fURVU81VHsZ9QIhot9eI9zxXWCqrqMf/ScLjpKS
         YhfLdzDhLB3C4PDX1yR4fpHotH/Lq4jWhzaZhk0F8ZGlFbRWYj8AuY5TVyykpVAzGkbv
         H/HQXaPvj+Zso/y7Z8W0gsMZ4baGS0xesdredn+JQtXg5wtwgxI2RMJph0x7uoqXm4u6
         zWHu9oN29rwqa6bZC0ZTZUCbM6ujXn6Yn1pk2aRuyy0t1hXb4/dOa6b7IrQ02r2phThi
         DOSVDuttherfLa1Tc7eZA+peN5QiyUiJT5bE01RuZEGLMJhoDjynf7SKnJYs1+FN/lW0
         SpZA==
X-Gm-Message-State: AOAM5334kAN2mHg7GWjCe/zEbvb6kYXJqzE9OGYSqJgpP0pVmD/ZIKQ0
        /R5uHPJ4NqCSv2+ZDZSmSBMOPLUrhFhVqszTPQQ=
X-Google-Smtp-Source: ABdhPJwro+0RDRj67NhZBXu85V+P8xPYUdbMBmG8V8i6WiFWj6fPvyOCHkdl7DUTqRWkp6fxPWe3n2K+0Ky96+ge5to=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr2520053ybv.401.1596831768018;
 Fri, 07 Aug 2020 13:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
In-Reply-To: <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 7 Aug 2020 21:22:21 +0100
Message-ID: <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Sergei,

Thank you for the review.

On Fri, Aug 7, 2020 at 8:48 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> Hello!
>
> On 8/7/20 8:49 PM, Lad Prabhakar wrote:
>
> > Add du node to r8a7742 SoC DT. Boards that want to enable the DU
>
>   Both "du" and "DU" on a single line? :-)
>
Argh my bad.

Cheers,
Prabhakar

> > need to specify the output topology.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> [...]
>
> MBR, Sergei
