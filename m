Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8259F2E85BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jan 2021 22:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbhAAVe5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jan 2021 16:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbhAAVe5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jan 2021 16:34:57 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124C8C061573;
        Fri,  1 Jan 2021 13:34:16 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id k8so20073756ilr.4;
        Fri, 01 Jan 2021 13:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSfKxk1U0ggc7PQgwCmm4q+B3pKzuI7Y6k2VoeTH3LY=;
        b=r3AbcY0tZBOJrw1qEM2Bx8V389aBL3QJiWjQoDYJHa44eznbD204NT1VC7gANxl+OX
         zP6eNlpQaEnDAQGzPN0Y6ircAJLTAmjROzwXVNJgiDzSR62szcyskCNRdPkgd6VJ6WAk
         mWGNtAhW6FrFHEuAR9sscxhEHpXyeeJUAK/lHfgVtqJe0GgBYSM1pvCZnGubbeK+5XPL
         dVQU2bs822kwzfcmXUivdeZtmrK4nGJGPaMzw2zb85sSnWAOhtY+HhO/EfrU+44KCmEC
         5rz0BJtWDmogqPU6eWyF/sG7bc8dFz8bKWSN1PrOIzWkMzB1OcKQrlZM0bSUUDZEcw9z
         dyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSfKxk1U0ggc7PQgwCmm4q+B3pKzuI7Y6k2VoeTH3LY=;
        b=Pww4O//lDcJ9bzOc+AdCsseWPGFQ1rl32v2QZS4uhtm8qvv191cQHywqxzH1/2WeS0
         gGO3AEslmcPGbxaXOJuPClTeNUc/t6jBvzbjhxZ6WOJvtpAo+Vn0ot9Q9jl3ExqMRb8H
         6flzLPaGXfX+vc4z0IqdLi5D+z0d5dfjCdiWnBcSKJnDAWj0mDxeznpGDbd+mYa6MiAL
         cbFAmwgLQ/51VIpzSnFc4OudogRnqeXWOVx7zZRN0SBj/Q1mV2y3ZbEP6gTnCPgyosSk
         nI6vdTSOAVlUuq4y+45S2k2V/MhvcJODONX5r7UW7in9tX1aMScwFLwMuRqRsrE+XLM6
         pAQg==
X-Gm-Message-State: AOAM530uOOkaUBhOFiN9ME89scZHk+HOFIJ7ho9aunTXQFv8iIPXki5d
        zse9sbXO0Tg4fHChAQW+nnbztQWVNhBd6iwaFrc=
X-Google-Smtp-Source: ABdhPJz/uUHUZX6X1kAAxk5DjYFX0qaLnMafu1AUFhKw8kKYdcrigWRIlzYM5g+517EDC4sJ22lL4UYqWr92K4rtBFg=
X-Received: by 2002:a92:d0c8:: with SMTP id y8mr59486690ila.46.1609536856001;
 Fri, 01 Jan 2021 13:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20210101113927.3252309-1-aford173@gmail.com> <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 1 Jan 2021 15:34:05 -0600
Message-ID: <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com>
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

On Fri, Jan 1, 2021 at 12:58 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Adam,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Adam Ford <aford173@gmail.com>
> > Sent: 01 January 2021 11:39
> > To: linux-renesas-soc@vger.kernel.org
> > Cc: aford@beaconembedded.com; Adam Ford <aford173@gmail.com>; Krzysztof
> > Kozlowski <krzk@kernel.org>; Rob Herring <robh+dt@kernel.org>; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> > <magnus.damm@gmail.com>; Sergei Shtylyov <sergei.shtylyov@gmail.com>;
> > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
> > RZ/G2 Series
> >
> > The RZ/G2 Series has the RPC-IF interface.
> > Update bindings to support: r8a774a1, r8a774b1, r8a774c0, and r8a774e1
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  .../bindings/memory-controllers/renesas,rpc-if.yaml           | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-
> > controllers/renesas,rpc-if.yaml
> > b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > index 6d6ba608fd22..050c66af8c2c 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-
> > if.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-
> > if.yaml
> > @@ -26,6 +26,10 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r8a774a1-rpc-if       # RZ/G2M
> > +          - renesas,r8a774b1-rpc-if       # RZ/G2N
> > +          - renesas,r8a774c0-rpc-if       # RZ/G2E
> > +          - renesas,r8a774e1-rpc-if       # RZ/G2H
> >            - renesas,r8a77970-rpc-if       # R-Car V3M
> >            - renesas,r8a77980-rpc-if       # R-Car V3H
> >            - renesas,r8a77995-rpc-if       # R-Car D3
>
> May be we need to update the below description as well to cover RZ/G2 device??
>
> - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 device

How do you want it to read?

adam
>
> Cheers,
> Biju
>
>
> > --
> > 2.25.1
>
