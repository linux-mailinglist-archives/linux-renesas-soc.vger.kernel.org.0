Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9A844E62C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 13:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbhKLMQO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 07:16:14 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:41961 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhKLMQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 07:16:13 -0500
Received: by mail-vk1-f176.google.com with SMTP id a129so4961354vkb.8;
        Fri, 12 Nov 2021 04:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ReNNUDllSsuAXdyCF/ZKAOZ2INVCMECmescqfGR1HIc=;
        b=NC0e0B3v5JFSgr0d0+o22z4mF5FO05asFHqd4Sqxa6BpIG5FCuWGOlRlnlIwdQZwo5
         E7DtVzj0ObfS0VE0wHMrSn3D8VjKM8YVJZvWMxAc7iA+1+8ptFqh5lBgjmsTLjUXWaXU
         clZEUMCFyKVNriaHB8pF1q9leS78OQtru37zng2dHL3ONEj7xzZ/2ueL7FCGNmj0rqud
         eppCBTFoxN/kBe7DqWjovjnkB67KujSqjiwoXfzI+oLOkelwPH9FQJizs0Qq/Im/gpPm
         H4yLBydzWS3jgrM22ohY6JI0goChGI29U8/DbszIbTRrVYPIVUlzCKNFEzvVZTuZ6+gd
         vtpA==
X-Gm-Message-State: AOAM5334KqxsDxkvLHyaujqhRY1T4q6c+g207GJoMuJfUMo18IRWL6l+
        Z+/i/bLQZJ0iHWLoOQ8MDexFiMLt+3xh7w==
X-Google-Smtp-Source: ABdhPJyIPR2cUvj3oeP5UZZkvDGXc3t8VxzMbBwthUHRxXCxt2/MAYHSrflN+l3gKE9Mw2moy/7GUA==
X-Received: by 2002:a05:6122:2217:: with SMTP id bb23mr23002472vkb.13.1636719202189;
        Fri, 12 Nov 2021 04:13:22 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id u14sm4095769vsi.2.2021.11.12.04.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 04:13:21 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id l24so14050342uak.2;
        Fri, 12 Nov 2021 04:13:21 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr9212991vst.37.1636719201565;
 Fri, 12 Nov 2021 04:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <20211110191610.5664-8-wsa+renesas@sang-engineering.com> <CAMuHMdVTUTTPYHWfzD+CN+c9HH+iCyd3xTvLsWV1=1Bva45AfQ@mail.gmail.com>
 <YY5Wuvpo7ToqDy3e@shikoro>
In-Reply-To: <YY5Wuvpo7ToqDy3e@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 13:13:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtD3UrBWo-Fp-rpAGtoRf5P8d4Xibia85gL+opyrmMPw@mail.gmail.com>
Message-ID: <CAMuHMdUtD3UrBWo-Fp-rpAGtoRf5P8d4Xibia85gL+opyrmMPw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/21] dt-bindings: mmc: renesas,sdhi: add optional
 SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Nov 12, 2021 at 12:57 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > That can be simplified to:
> >
> >         clock-names:
> >           minItems: 1
> >           maxItems: 3
> >           uniqueItems: true
> >           items:
> >             - const: core
> >             - enum: [ clkh, cd ]
> >             - const: cd
>
> OK, nice.
>
> > But shouldn't the clkh case be restricted to "renesas,rcar-gen3-sdhi"?
>
> I don't think so because I assume all following generations will have
> clkh as well.

My issue is that the _previous_ generations (e.g. SH/R-Mobile and
RZ/A[12]) do not have it.

R-Car Gen2 has SDH clocks and the clock driver implements them,
but they are always disabled, as there are no users.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
