Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512CC476D1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 10:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhLPJNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 04:13:40 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44710 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbhLPJNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 04:13:39 -0500
Received: by mail-ua1-f53.google.com with SMTP id p2so45947948uad.11;
        Thu, 16 Dec 2021 01:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHKD8Jau3VMC0v0mHq/8AnvUbUd2JPek/udI8yP5e94=;
        b=wWRn+FX0K3cVeoz07HmnHn7JirofujHktV0NTyxGf8lvR7fN7VuLqPeDfLHZiGBqOa
         +jPfch1qZKWJbUu4PanPc29+iiAludjDQRN2E2B+ionM8t+e1/jafNYlgliUwYYKcHo8
         yKR2a+DDwRNP3hqivr5yVsMtd2zqLu4rzPNf59QXyqTIEtKs4ZZFZkMlgyQtr5ooE9gq
         6N/5wurZNhhiLCpQu7pHpkuojsn1y8zvn35xjwhZvVobW1uSHINjpCBIlk+VabnyguXH
         08tuTJDM2JHZhwVFiT+/2KDP8+3panKcqnkzH4BkaLKNA7zflbMLkiEIcR6l5tlTDigx
         6GKg==
X-Gm-Message-State: AOAM530t+SPMLf993LQZN/OH9j1EyQND7dta8cWufY2+Sujz5W8u6fun
        8N/N+DuFLhbXPK62z5FdV3cVI5lcwf48RQ==
X-Google-Smtp-Source: ABdhPJzEMwd3HH5SaGtQWRehpDwK9oTSLSVXNzedsikirOQr8FlCqwo834bE9yvctKv0PaC9DblwsA==
X-Received: by 2002:a05:6102:3a0c:: with SMTP id b12mr5059426vsu.31.1639646018579;
        Thu, 16 Dec 2021 01:13:38 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id e13sm987273vkd.21.2021.12.16.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 01:13:38 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id y23so4266937uay.7;
        Thu, 16 Dec 2021 01:13:37 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr4863423vsj.77.1639646017480;
 Thu, 16 Dec 2021 01:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20211215154619.166360-1-miquel.raynal@bootlin.com> <20211215154619.166360-5-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-5-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Dec 2021 10:13:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+a7ASjzvmFzOrAGZPcMF=muzC_b=fjddef_oMKGGrpA@mail.gmail.com>
Message-ID: <CAMuHMdX+a7ASjzvmFzOrAGZPcMF=muzC_b=fjddef_oMKGGrpA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: r9a06g032: Describe NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 15, 2021 at 4:46 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Describe the NAND controller contained in r9a06g032 SoCs.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel once the bindings have been
accepted in linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
