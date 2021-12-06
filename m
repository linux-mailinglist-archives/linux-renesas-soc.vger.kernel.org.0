Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8CE46920B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 10:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239987AbhLFJOJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 04:14:09 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:33654 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239970AbhLFJOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 04:14:09 -0500
Received: by mail-ua1-f51.google.com with SMTP id a14so18277602uak.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 01:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1NOvpdGnyz5HaO2Ggxr9H8istJm4mrRSxgHlh+Ba04=;
        b=1HyHVGNCu47vUBq0u5ljo24EKqmOzkimya+KzZx7cLjrhLSRBcEqgTHWbVAho+N73C
         SHvFhcNpT4FXCRXDCTAfm+9TTaWleRj5J/jFiKu/w54PUxrJ1RX2h3+kodDVZiR/G6X1
         LFmEu84gCwiSRyKwvGbyiWu3abqRWWCSVMaXKNPE1/Bytu/HkjDp/bBV/73wE+YuwqtB
         JWKmhOymjLKPMo1mFH2ig57Ogm0xA7VQnTJzFvZ68e5/c8Xl1h0Siff20pGtWt5PdZ60
         AdLyGh+EUh5mozUG2K3Nawvcc4vOd2IQpXiag4eXsJ5WN2IYtELGVlec3Me4D0adGAvn
         0cbQ==
X-Gm-Message-State: AOAM532VF2ud5qK/gZEXuchxjGl8albylwxJ8nwnhmsM6GhAXaYVeagd
        wDMZNVWeKLH9zhBrGh9Upo19iPEbooSgIg==
X-Google-Smtp-Source: ABdhPJydabT2naU5Ptmj5wVQ01zpPpu5vaeLzahBOrSkAMPt+bhGnGNoD2QVzDD4Jtehkbv/+/FIvQ==
X-Received: by 2002:ab0:74c1:: with SMTP id f1mr38390273uaq.109.1638781839887;
        Mon, 06 Dec 2021 01:10:39 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a4sm3818623vkm.46.2021.12.06.01.10.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 01:10:39 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a14so18277482uak.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 01:10:39 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr34917644vsj.77.1638781839002;
 Mon, 06 Dec 2021 01:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20211126140625.351697-1-miquel.raynal@bootlin.com> <20211126140625.351697-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211126140625.351697-2-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 10:10:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcE49hCcoKYa1bAojNdQ5iXH6HOFgzSfD+Pg0SwaN1DA@mail.gmail.com>
Message-ID: <CAMuHMdVcE49hCcoKYa1bAojNdQ5iXH6HOFgzSfD+Pg0SwaN1DA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 26, 2021 at 3:06 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
>
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
