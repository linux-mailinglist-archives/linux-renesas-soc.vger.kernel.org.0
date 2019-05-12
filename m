Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DDF1AB5A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 10:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfELIze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 04:55:34 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35391 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfELIzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 04:55:33 -0400
Received: by mail-vs1-f65.google.com with SMTP id q13so1345696vso.2;
        Sun, 12 May 2019 01:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ow848t2u3LpAUpqXAKwtt4Cf+vUELYwh7/Zxrs8pkng=;
        b=o/NKuRAQEXAG+HEwIZTmTiIkquSncUYJgF/8eN5T/q4uUSdF0cAhOKLKHshzcP8U+s
         Rhs0Ds09ytbOP5Nl0pD10RbjG5m5QwEM0443VWnmUtIJpgKDSlrl+6jarLj3hdPor1tv
         uPZC6t46CfzAICIGzeoIm7F7H2VATHmboM55xBy676gzXwyRO30y9mYW97oKDw6SVqd8
         qlVMWPYR8idn0LYO2MrNczlarJXrHgfLxCWfo3yCoZBHloVVPnMX2myqHh1Jsd+kwJ8l
         ee2E4FOMdz9de+usYI3+UZJad3qZZZE3eFYdk976Q6gFU69svUjj8+OG/VuBh/C9G4tF
         9RWA==
X-Gm-Message-State: APjAAAV/KGUpiZTykmLExLZ6uLPe9TiSif5klurIUASZjej+L56HDq8W
        0Cx5t3fXKkNVZo7aY6guSdYsNFFTsUDoXxh8kwU=
X-Google-Smtp-Source: APXvYqx8fhpnx1jG+o7RUM+RTlx+K0ybPOaIQnf4viZNAVVaLQuRbMeV3I8lNMmlRdaz08KipNvdU5CIqkDnaX3zHLQ=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr7036223vsq.63.1557651332429;
 Sun, 12 May 2019 01:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 12 May 2019 10:55:20 +0200
Message-ID: <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car DU: LVDS dual-link mode support
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, May 11, 2019 at 11:07 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
> LVDS inputs and two parallel outputs. It can operate in four different
> modes:
>
> - Single-in, single-out: The first LVDS input receives the video stream,
>   and the bridge outputs it on the first parallel output. The second
>   LVDS input and the second parallel output are not used.
>
> - Single-in, dual-out: The first LVDS input receives the video stream,
>   and the bridge splits even- and odd-numbered pixels and outputs them
>   on the first and second parallel outputs. The second LVDS input is not
>   used.
>
> - Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge combines the even- and odd-numbered pixels and outputs
>   them on the first parallel output. The second parallel output is not
>   used.
>
> - Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge outputs the even- and odd-numbered pixels on the first
>   parallel output.

and the second?

> The operating mode is selected by two input pins of the bridge, which
> are connected to DIP switches on the development boards I use. The mode
> is thus fixed from a Linux point of view.

Can the state of these switches be read from software?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
