Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711A3477382
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 14:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbhLPNsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 08:48:13 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:35823 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbhLPNsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 08:48:12 -0500
Received: by mail-vk1-f177.google.com with SMTP id q21so16856324vkn.2;
        Thu, 16 Dec 2021 05:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kAMZft4AdGNLv17wUp1UcmNLs0KmYNmoKddbnianRp8=;
        b=PkHZkEY2p5ppqnyxK/qHiVHMDc4iFbXbFZhuTcv/sbjVYYvqdZv7jNuc1WWKE+XgGt
         HOlGufXY+ulGDrXf61lWSyfIJz3M8e8XuagLerOyyf6KOhOJTUoz0ilWSV5w+lKEy7yM
         izr3AYGD17EOx5WCNOCyzeOp1DC5TGI2AuMJeA0EnVY839LvByYy45QcsCQ2gP1CqE1T
         GkXL5t/jefe+6mf9397lK+RvbMrLtvjAwdOI/53ZBCze/xf5OhClSill3285pQTNaAI0
         U5spJUWd5wgADmVdKaFDUMu2wuY6RrSfbqK2PmImCsAVImT3NOQewkDWvoUOiNiQqjIQ
         KDWA==
X-Gm-Message-State: AOAM530dbNHEUZl6TXk380XPP0oP25hI2ZnoBC50cy5hP2cmh/KQ6fOx
        tBeTQxY3nn+Gbh4pm2hJdTBVO3eMAQ/BFQ==
X-Google-Smtp-Source: ABdhPJwzMHe+QViJ5k+GIwd0Oyitm+kkBRdzTKcl4w1oBYtY/qPxew0/Qtcz+shc0QXlI8Yshf2TkQ==
X-Received: by 2002:a05:6122:929:: with SMTP id j41mr6512675vka.18.1639662491910;
        Thu, 16 Dec 2021 05:48:11 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id j19sm1086361vka.4.2021.12.16.05.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 05:48:11 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id b192so16877820vkf.3;
        Thu, 16 Dec 2021 05:48:11 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr6424797vka.0.1639662490890;
 Thu, 16 Dec 2021 05:48:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639660956.git.geert@linux-m68k.org> <20211215154619.166360-1-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-1-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Dec 2021 14:47:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ-KCZfYtcXGW_t0Z5ab+wbuKxxR5zTs46zsOU5hzVDw@mail.gmail.com>
Message-ID: <CAMuHMdVJ-KCZfYtcXGW_t0Z5ab+wbuKxxR5zTs46zsOU5hzVDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 16, 2021 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Hello,
>
> Here is a short series bringing support for Renesas RZ/N1 NAND
> controller.

Oops, please ignore this email. Sorry for the noise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
