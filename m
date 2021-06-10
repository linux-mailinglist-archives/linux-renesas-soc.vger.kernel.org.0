Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC053A2E3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 16:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhFJOcv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 10:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhFJOcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 10:32:50 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274D2C061574;
        Thu, 10 Jun 2021 07:30:54 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p184so41074958yba.11;
        Thu, 10 Jun 2021 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dJ1OA90rJm1s1W8kxfE+7PZA6sYk4CmEn92VFKOIgvU=;
        b=iKjAaCBN9+DALlvzqTDuUWkJxExmM3KEIch9H3fXcTwpnj4hVSHGx/2qRwjbgB8MjR
         4hJjiLtW0oi5btaTqPd8iIl+ZFQua67260MImtPP+etO7CdYiMZ7H9P8b4NY7/d1GDDM
         Evn58J6U9xznYsOeU7Psu8sq/gVUUJcmxp1PmQPpABrh0k8O01OmkMwC+647ULEzoSPx
         X2+ymWkE7uD0c3yXXYQhZvXHvD95qsGGX9LUMloXUqMf2lDpllZWRxDJ8iO4csJbkJJq
         hre1T3lrFqUdxRBTSaXZWiJtOBpLKRo5dL2D7BqJmqOMkTwkdffTRaSHpEW9szdV8LwY
         PuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJ1OA90rJm1s1W8kxfE+7PZA6sYk4CmEn92VFKOIgvU=;
        b=pZuiSrlR9/br5BOz0YZHJJwWFVWa5FoR6ujhFZ/f8z2tn7YOf5HGz82tnnNVKmY4x9
         hin3SCBLGJuI9qShrehm35fE9u/Vy9N6yTIKrEnd8AHVCsiZx7ZNICzl2LSTyqNVvIe7
         DDaGA9jAGYS7To41mf5CTeISvvSiybWHJ0DhJnXoKdVqa8QM0xXuwlM5KC8CvvtVC6Rl
         3tV4jwt1txjLDf7vAPbB9rQtnvWJD9xXVasKeTZo7hAsTm0a+gtuSHv+Rnw3/44Fxvs/
         8UOgyN/HJ+3sRDh/eARvygqesz3nDLSSExkhB6vgiQXON/Thf5Gm3xf0EQJQLjEAQQMI
         2xdg==
X-Gm-Message-State: AOAM533fhEmmsuogHzDlk57W9bomq4u5adIVsY+zw8pdo1Km+CynuVbV
        zn9ru5jVnwgBJHNsrM4aGGED+mfzCttoYW1C6kWVHrbjxNnFWg==
X-Google-Smtp-Source: ABdhPJw8TGvrLNeVFny57fJ9t2vx73bn99q6gfBWoN3pTaeJHAzrEmjGgo0frXm9ILQHk5GK1gJOp7kA0J9C2smy9KQ=
X-Received: by 2002:a5b:54a:: with SMTP id r10mr7921829ybp.476.1623335453418;
 Thu, 10 Jun 2021 07:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210609163717.3083-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVL-6dykmxb9PozWap3iTJEwuNQBgvvJwxHNGEu=r2WOg@mail.gmail.com>
In-Reply-To: <CAMuHMdVL-6dykmxb9PozWap3iTJEwuNQBgvvJwxHNGEu=r2WOg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 10 Jun 2021 15:30:27 +0100
Message-ID: <CA+V-a8sOOs4FK5UpoqMwXTMbuVQJRG4oZvmycGzmQajjs_a=Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: renesas,rzg2l-sysc: Add DT
 binding documentation for SYSC controller
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Jun 10, 2021 at 1:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 9, 2021 at 6:37 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add DT binding documentation for SYSC controller found on
> > RZ/G2{L,LC,UL} SoC's.
> >
> > SYSC block contains the LSI_DEVID register which is used to retrieve
> > SoC product information.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/power/renesas,rzg2l-sysc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Renesas RZ/G2L System Controller (SYSC)
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description:
> > +  The RZ/G2L System Controller (SYSC) performs system control of the LSI and
> > +  supports following functions,
> > +  - External terminal state capture function
> > +  - 34-bit address space access function
> > +  - Low power consumption control
> > +  - WDT stop control
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: CA55/CM33 Sleep/Software Standby Mode request interrupt
> > +      - description: CA55 Software Standby Mode release request interrupt
> > +      - description: CM33 Software Standby Mode release request interrupt
> > +      - description: CA55 ACE Asynchronous Bridge Master/Slave interface deny request interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: sys_lpm_int
> > +      - const: sys_ca55stbydone_int
> > +      - const: sys_cm33stbyr_int
> > +      - const: sys_ca55_deny
>
> The "sys_" prefixes feel superfluous to me.
> If you don't mind, I can remove them while applying (also from example
> and .dtsi).
>
Fine with me, thank you for taking care of that.

Cheers,
Prabhakar
