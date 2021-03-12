Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A673386FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 08:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhCLH6E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 02:58:04 -0500
Received: from mail-vs1-f50.google.com ([209.85.217.50]:39131 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbhCLH5d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 02:57:33 -0500
Received: by mail-vs1-f50.google.com with SMTP id q1so9119262vsq.6;
        Thu, 11 Mar 2021 23:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8A3j4wMlqUcq/CEwnVCuJ0YLjTFZWUzyegAMYJyEawo=;
        b=UgsMyNWB++m7iw98T9j6sJnDYkML98vCD7L7YpMXPbdqU0zuEahntjVxDtYRTpZmXd
         5mymvjszT7m1Fn/Mn5O1ETFgSEmGhZj9SXhUeOwsHZf78BgCduuIOWcnzTg9jtOqPjyn
         fETyAuDWkEbfUXZPhSrOH/6tSrY8miFsk5xMnU10O03dJ/XQB6rPeHq6qsvz5hBfOU+u
         F6eyiGdZ3M0VQfMcoAUjPPc/7x0MYH9x5s9UCtImax8m7NPLJw8JHarUvnln7o0Nyv9P
         CStQEOkHNGc1diD+79S26fERGIcHSirlS0rPMzgg3TeOMTvvhkXlFeUm4K41n1Zj+3wk
         Ge1w==
X-Gm-Message-State: AOAM532L849aneH3mipLes7kXLsesH3r9LrG4yoc4dCeZMKFcc05vB/6
        963XWNAYhUy6/iFFBB1j+mYCuyfwu4WLI0EmdKM=
X-Google-Smtp-Source: ABdhPJzl1L58WFMSFshGURoPPHthD4NDEHJjRfUjh/2RoyaezekomDtZn++TYjNY7JPSXSOZ0Iek9UxuFY3WvEnxeNs=
X-Received: by 2002:a67:8883:: with SMTP id k125mr8458868vsd.18.1615535852224;
 Thu, 11 Mar 2021 23:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com> <20210312025420.529339-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210312025420.529339-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Mar 2021 08:57:20 +0100
Message-ID: <CAMuHMdW-jPRe=PBOjgk+YA6VFD_LKg5jCMtRxz4bAji88iRtJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: can: rcar_can: Document r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Mar 12, 2021 at 3:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -20,6 +20,7 @@ Required properties:
>               "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
>               "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>               "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
> +             "renesas,can-r8a77961" if CAN controller is a part of R8A77961 SoC.
>               "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
>               "renesas,can-r8a77990" if CAN controller is a part of R8A77990 SoC.
>               "renesas,can-r8a77995" if CAN controller is a part of R8A77995 SoC.

You forgot to add R8A77961 to the paragraph about required properties.
As R8A7796 is now called R8A77960, please update those references, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
