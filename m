Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF94C3FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbfJASSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:18:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37664 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731354AbfJASSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:18:06 -0400
Received: by mail-ot1-f67.google.com with SMTP id k32so12402329otc.4;
        Tue, 01 Oct 2019 11:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nncP+3PwEQmHVNy0zNk7ytOHiG8gwhc0eLKz9Wy68qI=;
        b=fD77XUNgfU2OO2AppDjR1RHUMA/95rNMgDv+Lo8sffWpjKDZGfG1etacrfVjF1gmtk
         lwYbUKQGRsacyMoJwKttr/Q2JOYquEC5EZySnvpOzMdqBBMH98yL1VYISKjymlK/HrC+
         7+yPUseabctXcGnpn/a+PqsJbzGIoqG8cAXg7GyyZuPwlUB67fQS0RE4t+g4zfSM0aQy
         0kpIJ7su039nEoTmIZbGX5dUTJbUTjnXbd4Gt7+ldfpqpSI5ui0Q+esmffdvmMEie8ux
         zaAnRfFDC+l7jW2q4MxjTuZuhj5fjpySp26ty+5ArrLN5fGw+vUR8wo7GpR6BWtUzQGO
         duSw==
X-Gm-Message-State: APjAAAWUrBZqkSsRM/qq2wMdZoiC0riD5Ls1a//oijxZi7LcnCCLxGHM
        KhPJoNK0Fhq4P9d9hsU3sF7fbkNxsu3QkJtImGY=
X-Google-Smtp-Source: APXvYqzmxZCqj8hidizJxApmYn6DSYvbBcD9dfkfnB/S4nYvKZhWoGwcg6a0BZgGjdf4BipIU2Xkt6pFnU40ipDZtps=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr18164243otk.145.1569953885311;
 Tue, 01 Oct 2019 11:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-2-git-send-email-biju.das@bp.renesas.com> <20191001181134.GC4735@pendragon.ideasonboard.com>
In-Reply-To: <20191001181134.GC4735@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Oct 2019 20:17:53 +0200
Message-ID: <CAMuHMdVHFmcC16jgnwmf2225VqqahxJ-ipwOTZoinShgVYnHyw@mail.gmail.com>
Subject: Re: [PATCH 1/8] arm64: dts: renesas: hihope-common: Move du clk
 properties out of common dtsi
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Oct 1, 2019 at 8:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Oct 01, 2019 at 01:15:17PM +0100, Biju Das wrote:
> > RZ/G2N board is pin compatible with RZ/G2M board. However on the SoC
> > side RZ/G2N uses DU3 where as RZ/G2M uses DU2 for the DPAD. In order to
> > reuse the common dtsi for both the boards, it is required to move du clock
> > properties from common dtsi to board specific dts.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>
> It would be nice if DT had a syntax that allowed extending an existing
> property. It would allow us to write
>
> &du {
>         clocks += <&versaclock5 1>,
>                   <&x302_clk>,
>                   <&versaclock5 2>;
>         clock-names += "dclkin.0", "dclkin.1", "dclkin.2";
> };
>
> in hihope-common.dtsi and be done with it.
>
> Rob, do you think that's something worth adding ?

Yeah, we already have /delete-property/, but not yet /append-property/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
