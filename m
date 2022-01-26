Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9921649C97D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 13:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiAZMUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 07:20:23 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:36664 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241194AbiAZMUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 07:20:22 -0500
Received: by mail-ua1-f44.google.com with SMTP id u76so825531uau.3;
        Wed, 26 Jan 2022 04:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48aCASNRZJ7Sm683A67OkQDnZScwmmBQEZD+GUf6zRw=;
        b=3bWfge+sWD8QMyE8qC9siIboTzsifd9lKJ2IF1x15v8iy+xtaknbmklp0uye0blD/a
         upyEa8BisiF/KMxHhd4J0WyANWgqQnxjQaNfChTdKNLaCle6zpLnd8FbY/k35H2zyNXB
         smO42CNvfQae4D98xTg6zEOHCUKmHZZptkhxTvA+55yRwXDZSrxnrwOK/q9LfyotGU1x
         HCl+vkpFms0+X88uUF4i83hI4FSFTCrGa7xiwIQJ2r4vcjAOhS48XNaNySAAnwWMW7BS
         Fswy2lJ7Bca3JYt6qpqzD862M08ToLo4awqrft7l/T0xaQdt9zHN2EJVgFanXLvUZgiK
         8r1g==
X-Gm-Message-State: AOAM532NJyiW4hCNvLUoUGaG8nNjjqeOiN3vP4JuYLdLXMuwnr0iuQke
        NsmWw93DzsLx1h3WMWFPMzWGDCsWLI81sQ==
X-Google-Smtp-Source: ABdhPJwJ+HZKWK6o4UK0IYEOCcEXgKdAk5KGCGNTk4GcQh6d9eGJ9UYimFiSO7soyEITkKq9ok60mA==
X-Received: by 2002:a67:b003:: with SMTP id z3mr9552380vse.64.1643199621989;
        Wed, 26 Jan 2022 04:20:21 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id bc28sm3573081vkb.13.2022.01.26.04.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 04:20:21 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id w206so14259705vkd.10;
        Wed, 26 Jan 2022 04:20:21 -0800 (PST)
X-Received: by 2002:a1f:1b46:: with SMTP id b67mr6720547vkb.20.1643199621058;
 Wed, 26 Jan 2022 04:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211229193135.28767-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 13:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcs6Aha5CUUv_8ROxiwyJkqcNaXmMbd7gDp7EqpLCjww@mail.gmail.com>
Message-ID: <CAMuHMdWcs6Aha5CUUv_8ROxiwyJkqcNaXmMbd7gDp7EqpLCjww@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add panel overlay for Draak
 and Ebisu boards
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Draak and Ebisu boards support an optional LVDS panel. One
> compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
