Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7183F4561D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 18:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbhKRR5J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 12:57:09 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:43766 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhKRR5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:57:08 -0500
Received: by mail-ua1-f53.google.com with SMTP id j14so5729992uan.10;
        Thu, 18 Nov 2021 09:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eeSR6hQYhnDAp5L8gQBKQrxj8blan72aPxUZHPXNNXE=;
        b=j8Al71t9wNY0o/K3KLnfC+hUP9bF3JrL8kXo5w2m79/7Rh2liLhE1p76BjYkEfw21l
         Xh70/tXZtClnVYOpDGHALGVWobR1Z0LR1u3XXYJaPUB+9I2tTk0hjAphFQbaki7UswVF
         nXymA94mgcPpt3u/iVh5ET9wjCTjflFaqNXUMjPxySyhEdVaKY53KydP2BMag8T8Tx0L
         kc2xld641lc5rsOu6AA2gJXatV/fi0UFKeQEt2Gw4V94NV+AJmeHBSW40Uci5wErS5KK
         vJBnikoW1I6TSjeinNl6NsPMGXU7s5sIOqV2RLQn+NPDj9eFZtyrF1Cpk+MaTiFSFPUL
         OW3Q==
X-Gm-Message-State: AOAM530o/BZEH1BIkD2bqfxOO0VSrMjyf3dBManztTk1H9YjQiD6L8Pz
        jQnnVaXKSY2ZpW4CEdS2PAlnTaOwdttJJQ==
X-Google-Smtp-Source: ABdhPJzjEFb42SIExKfw59nFKhF7eCFivz4040MnfzwxXQy3KKaturwzqOtZBXWDTbw6a+FYtJRd7g==
X-Received: by 2002:a05:6102:5093:: with SMTP id bl19mr83419557vsb.43.1637258047783;
        Thu, 18 Nov 2021 09:54:07 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id u14sm352101vsi.2.2021.11.18.09.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 09:54:07 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id y5so15484834ual.7;
        Thu, 18 Nov 2021 09:54:07 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr83851227vst.37.1637258046974;
 Thu, 18 Nov 2021 09:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 18:53:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK5gaBh0O5kmOpB+YN6S6OsLSC_J_KmmSMxRTtu6LPNg@mail.gmail.com>
Message-ID: <CAMuHMdUK5gaBh0O5kmOpB+YN6S6OsLSC_J_KmmSMxRTtu6LPNg@mail.gmail.com>
Subject: Re: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas Spider boards
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car S4-8
> Spider CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -317,6 +317,14 @@ properties:
>
>        - description: R-Car S4-8 (R8A779F0)
>          items:
> +          - enum:
> +              - renesas,spider-cpu # Spider CPU board (RTP8A779FASKB0SC2S)
> +          - const: renesas,r8a779f0
> +
> +        items:

Missing "-" in front of "items:".

> +          - enum:
> +              - renesas,spider-breakout # Spider BreakOut board (RTP8A779F0ASKB0SB0S)
> +          - const: renesas,spider-cpu
>            - const: renesas,r8a779f0
>
>        - description: R-Car H3e (R8A779M0)

The rest LGTM.
Reading[1], I assume "RTP8A779F0ASKB0SP2S" is the part number of the
full kit?

[1] https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/rtp8a779f0askb0sp2s-r-car-s4-reference-boardspider

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
