Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C682616BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 19:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgIHRRl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 13:17:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44153 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731796AbgIHRRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 13:17:36 -0400
Received: by mail-oi1-f195.google.com with SMTP id 185so17143917oie.11;
        Tue, 08 Sep 2020 10:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMaXdkZMBIIa97R28ums/cRnzgAhqNzURS/+cjPBc4w=;
        b=qZ2lSBbZIkeC6Wdjc89ZC/LTqtloM5jQRBY+1whRQPekay8nteN/sTzgIsHXJ4fbUv
         /hCLFIo8cemAhDYp+Mcw2l2pGbspSzC0QujdSDC6gFZj6pOYNsrJYUv0QII6+CXeo/Uz
         U1mcmn7VJ/eMZpgy+Dkx6GfeqQL++W6wqJOjataS1Eog5mZ0pRApyuFCcU4UGufT8cnM
         aOldw8i0Q8KJpiXcKSj8gXDilEzhXK56Oa/qe+jyn49oOctCzjgFP3kJLqmipN05E8Wp
         lwGBjwfxF02vwzSy8wYKk9sMewlyN3kZNh9E7zqfwyEri68OMB5O7pb+dRIvrOtrnGl5
         EjaA==
X-Gm-Message-State: AOAM533OugRtyD+KlcaTmswDEn45OLDCmSNHS8gIOlzDVQOJW8PpihlX
        eEOQINalbawbu1iv5/JzsBjWk+tTLLCiIglIF3E=
X-Google-Smtp-Source: ABdhPJwZRZiy2KvddjqTpOk8cZpBJ1snpxQFyOxOWUjTpOW/68C6SGRxIH6w/ZRMRsHo4QCGuTuigPE2kNBdlj9uDIk=
X-Received: by 2002:aca:b742:: with SMTP id h63mr117820oif.148.1599585455970;
 Tue, 08 Sep 2020 10:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-7-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdVRco32Dm+UyN5OUpbhVcJCuCm-jNF6+R5=m74vqjEEoA@mail.gmail.com>
In-Reply-To: <CAMuHMdVRco32Dm+UyN5OUpbhVcJCuCm-jNF6+R5=m74vqjEEoA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 19:17:25 +0200
Message-ID: <CAMuHMdW8FQAVspRb_0ZuONgKLgPerPHs8uKZdnWGXe-sRov_fQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] dt-bindings: clock: renesas,cpg-mssr: Document r8a779a0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 11:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Add binding documentation for the R-Car V3U (R8A779A0) Clock Pulse
> > Generator.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -47,6 +47,7 @@ properties:
> >        - renesas,r8a77980-cpg-mssr # R-Car V3H
> >        - renesas,r8a77990-cpg-mssr # R-Car E3
> >        - renesas,r8a77995-cpg-mssr # R-Car D3
> > +      - renesas,r8a779a0-cpg-mssr # R-Car V3U
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.7.4
> >
>
> FIXME check clock-names

Please ignore the FIXME (checked).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
