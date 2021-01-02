Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E7F2E871B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Jan 2021 12:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbhABLcQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Jan 2021 06:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbhABLcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jan 2021 06:32:16 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403D1C061573;
        Sat,  2 Jan 2021 03:31:35 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id t8so20721614iov.8;
        Sat, 02 Jan 2021 03:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TxLZQk7Gx7NGGuktcS7xhogSAnhu+wy4fUkT+RFznDs=;
        b=TNupG2F47D6rTYNT7cdP4ltvzWdjKkcdWHlJcMNfEzNj7gHLBvckYAyBK/fZ7HAnIe
         Bn9bYsN7JkTMNs21t7V/5rFfYoEqGh/hv4nr1BMOULm9zFOtElkmeqDZ7njgMB/4DOvR
         iRCxi7SqAUudLjWzr4qFHjyxCvxMNqY03yCKaBySHq5wLoEOVpcZ3V/p3FkcLzoQocvD
         tdJnNTfd/GxkFK/OXh3wc3Bc+tP2x62tvNNhWuQu+BnFJI5eRx811/V+O7Kqi2aAbDxC
         HSotVMLkeYJhkD/ZxbeJ+b4zq7LVEu8p2hPJ8DISiQIg9WE/JrEtd4Fi2p84r2Y6tOyo
         SUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TxLZQk7Gx7NGGuktcS7xhogSAnhu+wy4fUkT+RFznDs=;
        b=rpeFS/nNJB3/23Q2qiVhBR+ZF/Z1G+K0xVngWVxls5Gkyp7kjO+r+ZqxIOaz3YIoMo
         iN05F84n+KwIFYqAJew7Gj9MMTUi8ljTO5OivYUeFwGQL7QMNQQgafd/5ZQDjEXi3f2z
         NvF8Sk8BoJEJJMC2Wm3KOBx2zPDirQjCNlo4ffVxR4qOIEeAaYvAVS2CYeerdgK71bp7
         FSI6ch8+WyEtRvHl9tFqDPBH67++km1dT88lPRbD4WYfYYnRA9tsSbu0lV0Ga7Ygnf+6
         +rl+fUT3JMbQZ62NPKERt+KXeUMG7eMxPPj22BCVRtuhWlJQp8NpRV2JMOmUqJH2pyao
         4d8A==
X-Gm-Message-State: AOAM530X0fQeZvHlXevuV7ZUJnW4Trm+BFuOGFe06gvyB/xgJ2M404Sf
        Z4gjXFxNJc4b7AS3r5yjaF32ckUHjh2sYLCqm+U=
X-Google-Smtp-Source: ABdhPJwNoQ4eUhykxp7/Bw/ODRgJKzjT907IP0l5Is4czWm1NB1Onr4S/vfiD7M4XrApfYElqTGzn+G3ug0u7XfD3FU=
X-Received: by 2002:a5d:8483:: with SMTP id t3mr53856438iom.35.1609587094399;
 Sat, 02 Jan 2021 03:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20210101113927.3252309-1-aford173@gmail.com> <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com> <TYBPR01MB5309CC39CE7896473819E7C486D40@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309CC39CE7896473819E7C486D40@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 2 Jan 2021 05:31:23 -0600
Message-ID: <CAHCN7xL96mU4rdRUaog5YaokWyYb23zbFu_9X3gfVrgf6NM4PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
 RZ/G2 Series
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "aford@beaconembedded.com" <aford@beaconembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 2, 2021 at 2:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Adam Ford <aford173@gmail.com>
> > Sent: 01 January 2021 21:34
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: linux-renesas-soc@vger.kernel.org; aford@beaconembedded.com; Krzysztof
> > Kozlowski <krzk@kernel.org>; Rob Herring <robh+dt@kernel.org>; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> > <magnus.damm@gmail.com>; Sergei Shtylyov <sergei.shtylyov@gmail.com>;
> > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support
> > for RZ/G2 Series
> >
> > On Fri, Jan 1, 2021 at 12:58 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi Adam,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Adam Ford <aford173@gmail.com>
> > > > Sent: 01 January 2021 11:39
> > > > To: linux-renesas-soc@vger.kernel.org
> > > > Cc: aford@beaconembedded.com; Adam Ford <aford173@gmail.com>;
> > > > Krzysztof Kozlowski <krzk@kernel.org>; Rob Herring
> > > > <robh+dt@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>;
> > > > Magnus Damm <magnus.damm@gmail.com>; Sergei Shtylyov
> > > > <sergei.shtylyov@gmail.com>; linux-kernel@vger.kernel.org;
> > > > devicetree@vger.kernel.org
> > > > Subject: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add
> > > > support for
> > > > RZ/G2 Series
> > > >
> > > > The RZ/G2 Series has the RPC-IF interface.
> > > > Update bindings to support: r8a774a1, r8a774b1, r8a774c0, and
> > > > r8a774e1
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >  .../bindings/memory-controllers/renesas,rpc-if.yaml           | 4
> > ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/memory-
> > > > controllers/renesas,rpc-if.yaml
> > > > b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-i
> > > > f.yaml index 6d6ba608fd22..050c66af8c2c 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-
> > > > if.yaml
> > > > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,r
> > > > +++ pc-
> > > > if.yaml
> > > > @@ -26,6 +26,10 @@ properties:
> > > >    compatible:
> > > >      items:
> > > >        - enum:
> > > > +          - renesas,r8a774a1-rpc-if       # RZ/G2M
> > > > +          - renesas,r8a774b1-rpc-if       # RZ/G2N
> > > > +          - renesas,r8a774c0-rpc-if       # RZ/G2E
> > > > +          - renesas,r8a774e1-rpc-if       # RZ/G2H
> > > >            - renesas,r8a77970-rpc-if       # R-Car V3M
> > > >            - renesas,r8a77980-rpc-if       # R-Car V3H
> > > >            - renesas,r8a77995-rpc-if       # R-Car D3
> > >
> > > May be we need to update the below description as well to cover RZ/G2
> > device??
> > >
> > > - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 device
> >
> > How do you want it to read?
>
> Since it is generic compatible string for both R-Car gen3 and RZ/G2 device, I would update the description as
>
> - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2 device
>
> Also may be we need to update the description of config RENESAS_RPCIF in drivers/memory/Kconfig to taken care of RZ/G2 devices in a separate patch.
>

Thanks for the suggestion.  I'll work on V2 where I update the
descriptions for both.

adam

> Cheers,
> Biju
