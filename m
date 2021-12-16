Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F73477376
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 14:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhLPNrK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 08:47:10 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:35580 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhLPNrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 08:47:09 -0500
Received: by mail-ua1-f53.google.com with SMTP id y22so11259692uap.2;
        Thu, 16 Dec 2021 05:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzheh/b2C4XgE1n4fabpDIDD9PrwJO02lF9Zwrd8B1s=;
        b=B3DDVdoyA0mnfpSas65IzFU15NrrEsuNnOxFB7Vgv7i0Z8nSEB8gg/83mlOyxUM8J9
         NfGmzZR3Jl1nK/0okvLcJWmDOfmXJvk4mGnzYVlDKbehej+Vxd9aCbYIcFtvhkv8Vtlz
         aeCBd+O8sadkND0JjavpdzGiEyBcXPwGHA1vA1LWRgT9Sw97udihUK0rQ93JxNN0PIbP
         1BMmLDTcwZLEBPZQBLZMT2YIZUR29WZjTda8x6/GlfoF8LYIEjrQGR88CKX99XniIYC2
         /cAii0qOuiVuqqmyIWIaLLiMVIFB0WOfYAEZG6LqDho5LxHjYWFiMqGaONIKCDHms9ds
         KnZw==
X-Gm-Message-State: AOAM532R6Y8TQRMDIEwnb01SLPZb/EPCmMOPb9viw3cgPUwa2qyyQE+I
        MTmreRXnA+HzkOgIJXKZd9AfI1BS4UB5ng==
X-Google-Smtp-Source: ABdhPJx8z4SfdVVeg1MPJiXr50CONFZxrk1g8uFvitfmrOWAsy0LJffYlwKpffqe+OUAZXFi4jT0pg==
X-Received: by 2002:ab0:164d:: with SMTP id l13mr12135591uae.34.1639662428785;
        Thu, 16 Dec 2021 05:47:08 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id x19sm356459vsh.6.2021.12.16.05.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 05:47:07 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id e27so16880749vkd.4;
        Thu, 16 Dec 2021 05:47:07 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id z15mr6137098vkn.39.1639662427136;
 Thu, 16 Dec 2021 05:47:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639660956.git.geert@linux-m68k.org> <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Dec 2021 14:46:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 16, 2021 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G2L SoC embeds Mali-G31 bifrost GPU.
> This patch series aims to add support for the same

Oops, please ignore this email. Sorry for the noise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
