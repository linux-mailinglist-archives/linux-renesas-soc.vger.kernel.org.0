Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8E445C6E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349531AbhKXOOu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:14:50 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:45619 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356978AbhKXONv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:13:51 -0500
Received: by mail-ua1-f54.google.com with SMTP id ay21so5315509uab.12;
        Wed, 24 Nov 2021 06:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Z4696FANOux3S33iEkkxGt4+E+UAqvDnNmX/cUpi9M=;
        b=67beV9tVbV3oL7VhnkQJ1NJUWFJ4oZzYY+UGb8BftVNL+ct0UT/2a4Mcw9E79ztkpP
         yELJ0fhTIagSkCrtfoVcEdgfVtrtObXr0pgA3UqXqRvJG4bNy8IDq0lZtcFd0h8bgrbS
         WhAdMw02C6Vk0YZPlBQvdH7DRQT6HdNp5Yh2FD06ZzFGxF5WnK/2KYHoPCM29dQVI3dy
         l3UtfJOWpUWWykp5KEVzh1x70Y3SzAWFlxLjx0oWmoWYZJgGPbD3Ft87/FC6N8g37794
         /Q0ieAelLmvYnifTj1uCtQqKSLCwi05SNPWMXrNijzAp+O6Mj2vC7ciScb3zAYlK+i0o
         m7AQ==
X-Gm-Message-State: AOAM531zGvARvMx7BRrDk9Yrt8GGQlPtd96TmAwIcHTfRWlZTu50rTRA
        SmMI0bQVyG8L8OwdOPDh3xiCsZp2CvYqig==
X-Google-Smtp-Source: ABdhPJzljeyMyk7i50xC4wtA/msRvv73uH3Dt90Q07ipOHeTBCrFoC8fIF956thYmj8jTB17gqecgA==
X-Received: by 2002:a67:3382:: with SMTP id z124mr23102355vsz.57.1637763039895;
        Wed, 24 Nov 2021 06:10:39 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id l28sm8096156vkn.45.2021.11.24.06.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:10:39 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id r15so5411477uao.3;
        Wed, 24 Nov 2021 06:10:39 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr24197910vst.37.1637763039296;
 Wed, 24 Nov 2021 06:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20211123141420.23529-1-biju.das.jz@bp.renesas.com> <20211123141420.23529-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211123141420.23529-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:10:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZLd-G5+mfF76s3FdjpykDYcPssmRsNOuFpUdTwqOReQ@mail.gmail.com>
Message-ID: <CAMuHMdUZLd-G5+mfF76s3FdjpykDYcPssmRsNOuFpUdTwqOReQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add WDT nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 23, 2021 at 3:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add WDT{0, 1, 2} nodes to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
