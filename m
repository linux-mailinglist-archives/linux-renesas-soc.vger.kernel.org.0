Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7DD1E401A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 13:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgE0Lcz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 07:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgE0Lcz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 07:32:55 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D425C061A0F;
        Wed, 27 May 2020 04:32:55 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id c187so4922858ooc.2;
        Wed, 27 May 2020 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCm08sq66Q3U++l+V74WsB7Hkmk+EFqTJfvHJknMZU4=;
        b=AN2mzep8xZkr/JRqPxTyR34FkdcROkPVXOMdrWjGCDE5MdlvyeFy/89eNu+FFYgNaJ
         0O3zZCpub0fl1Qd+fkpWx+OYeAzC4QB5c5bMJgO1L9DjxiuPVNNQW62XYsimpE6xTHxF
         XZEXc6/6+Ln/57fWjJzSyyzCWTCnZUtWCzefe6KL2fHnrp3vW8ZSJjPf7dWsUtcrA7fh
         twyibzWV/U3IcEUCkjCvINUksHSqIyZnuRLPIoiNkSouJj4DwlSDNmmbMf2G4eoOtNHs
         wRRkQZ50jLzVaxqeAL5LZC621iLjbukVTj3nSjySbtq7dLoaQ5gGIL26SU0ysfMsY3Pj
         MxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCm08sq66Q3U++l+V74WsB7Hkmk+EFqTJfvHJknMZU4=;
        b=rHHDnpnNr9P0dcKAvfqtnMQwS92i+Qd1hDoDXL5dhzOv+yIxIuimWXVRo50jksvceF
         GaN+JD735/5c6Uim/eNz4wmuDCvTCO5OWWMguCq6mN8W96gywqnO0718J5kbMY+kwkm4
         NPenya+7jG8sR6JTt3m7H3WXm5STDVmnNRFpxqMJXtyOaMoPXAUI0Q/ALNLpwSDCpMKr
         nlZINHFvtyoXhpFi2wkQ7f0jNW1+vewBXfmIvfIKMFDFLRHosuJJi1Bf0tueB9dCrU9J
         S7aBUOxO0tDiQpzB4QbNZzXMebX0pQraXcnd34sor9Ui9O762RJm11K2LSCW6m7xjIPK
         fohg==
X-Gm-Message-State: AOAM532Q0Dw99xDaR3KCrDkJFuKkJpHYzgypW+b4DUTTt070Y/fabhkk
        m9zgZRoGPoh3r9R2MfdkpN86d++uN2Z4J+6Gzhk=
X-Google-Smtp-Source: ABdhPJzjplcHCSKcgSqbLouxesEL59Ah0jAiA+aLZBUPeJrNy6hJ0Vv/xmju6otXj6ZALV+lhsBCAWTs4T/C+2XR4rU=
X-Received: by 2002:a4a:bf14:: with SMTP id r20mr2745052oop.18.1590579174656;
 Wed, 27 May 2020 04:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200527112548.GD5308@sirena.org.uk>
In-Reply-To: <20200527112548.GD5308@sirena.org.uk>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 27 May 2020 12:32:28 +0100
Message-ID: <CA+V-a8v0i71MCTNTPVD3XHuyGZiVjzuCkCUnvoUczeMr416ouQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
To:     Mark Brown <broonie@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

Thank you for the review.

On Wed, May 27, 2020 at 12:25 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 26, 2020 at 10:01:43PM +0100, Lad Prabhakar wrote:
>
> >                                 Examples with soctypes are:
> > +                                 - "renesas,rcar_sound-r8a7742" (RZ/G1H)
> >                                   - "renesas,rcar_sound-r8a7743" (RZ/G1M)
> >                                   - "renesas,rcar_sound-r8a7744" (RZ/G1N)
> >                                   - "renesas,rcar_sound-r8a7745" (RZ/G1E)
>
> I'd expect a matching patch adding this compatible to the driver.

The Renesas R-Car sound for RZ/G1H is identical to the R-Car Gen2
family. So no driver change is needed and  the fallback compatible
value "renesas,rcar_sound-gen2" will be used in the SOC DT.

Cheers,
--Prabhakar Lad
