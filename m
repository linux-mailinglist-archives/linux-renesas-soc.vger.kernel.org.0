Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5CA1A221D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2020 14:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgDHMft (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 08:35:49 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33574 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgDHMft (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 08:35:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id m14so4551757oic.0;
        Wed, 08 Apr 2020 05:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1OxoUGQCK9UuYvdsYyBdFSy9SXk5Ue99L9/EP7Pp0Q0=;
        b=IT28SF8Xrf87aXjnT4WFz5YrTACbuztiHC8+zPgCmmnIas08kCw+mZC5vSlXZbplqU
         XVykzoqPgHveT+CS/pGCacm+LWXysUy4nIJKfURdB+AvYcER5vqKeJSImvhcc+aoc+SN
         82c0WGfwE+SA5g13RLX3psOQK5o9ykvfRJN7g8iuvWXLYd6MiHN+sYD31Scqmlc4bpUq
         K73c5YKT97Fr474CuuocL9dcXkvYznDD+uP/yqAzH8V1rPpufsbhlFtHP7m0GwZxO4/w
         ZRsoLju3DeKRAixzjix4ipzTBv/NIDNF1bB+cunp+ghTfX5zWfwYO7o9xefF/y85i8+m
         E1ZA==
X-Gm-Message-State: AGi0PubsOye2RWcf5gM16foJNPdhQSqw7V19TOhnGJSXeFGzxZ9E2OX0
        XbI1YNw7CwZdDgUUEWGmcKVctcbtrMy4ra3snpw=
X-Google-Smtp-Source: APiQypIOmNNkOVVn1En/f4z717I9GK+vYt/LMvBQpUHQmHWVUvEG38jp07Y6Sxc5vsbY9vvko7F8KpqMqfZsfOEvvzc=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2149491oig.153.1586349346677;
 Wed, 08 Apr 2020 05:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200408091451.25845-1-geert+renesas@glider.be>
In-Reply-To: <20200408091451.25845-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Apr 2020 14:35:35 +0200
Message-ID: <CAMuHMdVb===HD80r8r3Mv1b+AcKJb0CAotddVS0dmXx365yyBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 8, 2020 at 11:14 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the Renesas R-Mobile/R-Car Timer Unit (TMU) Device Tree binding
> documentation to json-schema.
>
> Document missing properties.
> Update the example to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops, I forgot the dreaded "additionalProperties: false", again.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
