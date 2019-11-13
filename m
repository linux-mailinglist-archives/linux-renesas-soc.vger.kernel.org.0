Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB2BFABD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 09:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfKMIPY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 03:15:24 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33144 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfKMIPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 03:15:24 -0500
Received: by mail-oi1-f195.google.com with SMTP id m193so1026910oig.0;
        Wed, 13 Nov 2019 00:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Whr69WnB3YGY82P+1Ky0EeEFdRsVKLIHk2RMx93/NgQ=;
        b=S8lsLluMXpoEKrsxTw1fQa75jHbUEsfD7E8XGVjgr7IdUB4hA1plKZy8kguQ842Ya9
         LB5LSJ1PNeIaFg7L/weKoJmIMmdmgWfRJ3KOMqZY4BYhuq+8PUb4tBfqdNduO5EbMIBg
         SINPDXqc5ZBjLrQoI0WnGGHZgngcnrf6wDqlIwGL5bgCBcMPhvwhZkP+bDIeovQm84Sw
         dipyjuLepuQGhCkUDn5U44cFG+RTHGxp9WMeSV/tGOipNU/OP4CXALO6MxDNZ/mPldYc
         nLUxqgQOC/Ttaqwd4yxbTcoy7wC2nPWQrZx05QbGMaQDGo6w5ts0tSt/zLtr4HEVXFNp
         X8MA==
X-Gm-Message-State: APjAAAUwr0IHFeHgtKwoYlStNKynKzM3x1Df6VQyWHgt4gOZNtM0Gl+K
        Nl4nYp39pUGBBZKrNI0VipIDtPOW0ZddJk5PIWA=
X-Google-Smtp-Source: APXvYqwGsmRX60vFrFjj0w3IbwFDreJ07/ZVB5RlYtF9WAF3z+Ln+6XWyMWXJ+W55i9W6JMRyCas0d3k2KWuMKoPROM=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr1745123oii.153.1573632921784;
 Wed, 13 Nov 2019 00:15:21 -0800 (PST)
MIME-Version: 1.0
References: <1571818808-12495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191029184822.GA5031@bogus>
In-Reply-To: <20191029184822.GA5031@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Nov 2019 09:15:10 +0100
Message-ID: <CAMuHMdWDzhwbu6_Gw6ed5DsNVkmtGuN56Bxfy3rfuQzh27PL_A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Oct 29, 2019 at 9:01 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 23, 2019 at 05:20:08PM +0900, Yoshihiro Shimoda wrote:
> > Convert Renesas USBHS (HS-USB) controller bindings documentation
> > to json-schema.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > @@ -0,0 +1,121 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas USBHS (HS-USB) controller
> > +
> > +maintainers:
> > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,usbhs-r7s72100 # RZ/A1
>
> If you don't expect new SoCs, this could be a 'const' instead.

There are others, but we don't have them enabled in upstream.
[v3 ...] Can be reverted back to enum when the need arises, though.

> > +          - const: renesas,rza1-usbhs
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,usbhs-r7s9210 # RZ/A2

Likewise, I guess.

> > +          - const: renesas,rza2-usbhs

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
