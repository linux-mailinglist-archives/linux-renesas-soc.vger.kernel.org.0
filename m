Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF982512CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 09:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgHYHNu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 03:13:50 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41961 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729194AbgHYHNt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 03:13:49 -0400
Received: by mail-oi1-f194.google.com with SMTP id 2so5227214ois.8;
        Tue, 25 Aug 2020 00:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEm1P38xCylCBB9bnM3qGxp+JWCXA+1Kg/EWbIL2N1w=;
        b=ZqVwctJUwmj/eeyLLEdLWag1SkN9eieP/CVPGemce5cHqKOOP3rkfmB23ddtUl97Bt
         eAl7jELYbbqr//Wy2CqMhZPDhTlfHEHfgNR8ZlsrKdjP1pRyvZ4aHq/Jre1UQclsOeNb
         3sh3CAWmObBdxLMthjiSENReRsOKedcRsudRHe2Man5kkgH8o5L8xtkIUCVXiuuUCRG9
         kA7PR9XhMPfGLES18Xvc6HLlVK9iNqkh9FtAKndFujHO4I+BgmK7rh23n9akaGVzaodr
         jetdPwjuPSwYQWwt15/LsxwIXoEbRC51LN0s/N+qpnjRK1pFcEbS/Mzz7Piqu/PCVyp4
         1IXQ==
X-Gm-Message-State: AOAM531qGp5gkxBAwWb6g36wD75lpafskmWXO+LdSH+o5UpfeTKHkjKg
        RHhedLkx0Q/0xm2dU6vb6LUt/+KmvaR5xjDzA58=
X-Google-Smtp-Source: ABdhPJyxAbcnJS0QJpZY9jKSLmbiV06mLMpJtqu/EKEEd/HBfraBWMnQvv61vMSFNkbco12yPsCsDiURmq4Idvf7Bkg=
X-Received: by 2002:aca:b742:: with SMTP id h63mr270221oif.148.1598339628739;
 Tue, 25 Aug 2020 00:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-3-biju.das.jz@bp.renesas.com> <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TYBPR01MB53094D6F8B941E2D94198A3486560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692F94908BF9CD36A629110D8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F94908BF9CD36A629110D8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Aug 2020 09:13:37 +0200
Message-ID: <CAMuHMdXGWmODV_bpg1jP3C-3NDk31CncLJMOkCxExnzY7__qVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 24, 2020 at 2:08 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Biju Das, Sent: Monday, August 24, 2020 8:55 PM
> > > > --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > > <snip>
> > > > @@ -79,9 +92,20 @@ examples:
> > > >          companion = <&xhci0>;
> > > >          usb-role-switch;
> > > >
> > > > -        port {
> > > > -            usb3_role_switch: endpoint {
> > > > -                remote-endpoint = <&hd3ss3220_ep>;
> > > > -            };
> > > > -        };
> > > > +         ports {
> > >
> > > I think we should use spaces instead of tab here and below.
> >
> > I have ran dt_binding_check on this file and it did n't complain.
> >
> > First 5 character must be space, after that if you use tab, it won't complain.
> > I am not sure is it the correct way or not?
> >
> > Geert/Shimoda-San can you please comment.
> > Based on your input, if needed I will send v3 with only spaces.
>
> I don't know why dt_binding_check didn't complain though,
> according to writing_schema.rst:
> ---
> examples
>   Optional. A list of one or more DTS hunks implementing the
>   binding. Note: YAML doesn't allow leading tabs, so spaces must be used instead.
> ---
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/writing-schema.rst?h=v5.9-rc2#n71

Indeed. Hence my .vimrc has:

    autocmd FileType yaml setlocal expandtab sw=2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
