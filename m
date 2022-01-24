Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A276C497A1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 09:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiAXITF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 03:19:05 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:44756 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbiAXITF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 03:19:05 -0500
Received: by mail-ua1-f50.google.com with SMTP id f24so29319425uab.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 00:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/c+3F2pmQ34Zp5zM0VZln6fe/9uq04UqlvKTdCwGTM=;
        b=fK92bjuWgOr+TnuCQj2kCGuXNSkezhrT76CpD2unY0KrvvqQ+DvDafJGYH5UAszWbf
         JzfygdlSSqbiCizdh3MnThVMm0v23fU3S285YPK5LmPsNedjWZY7NSlyTqRhOAezC/mY
         VBnNv4XWjyms0yaR9ZchvCoQ3euC1215ptCBk2OYD5a0d5iWSQrnvaQ3fE3krY6oMkg8
         IV3zYi8Ra6GV4o0UxRYN5NdNVyJbF6SFgZHml4Xv00HrHbGzAnU6dgqQksvkBZKgk83J
         jRcVFmDhm6UczpgBTDC1RrNaEZa/kN0b4IsW8ipOHBr8GkoTa0xQTq3gQ6xmP97fTJtj
         zMZQ==
X-Gm-Message-State: AOAM530vYS/jVDqLC4tSWgh5LpwFtdYfv2qRCVzzg36ZvqFTib9BQT4R
        Ghr7yYu1qcnP4bMIrUq4y6Nk7xUAg5OhMA==
X-Google-Smtp-Source: ABdhPJwsbeASC/9TitGssBy1258CIs5t7bDcC/KkDa/c5SibSHk1xIJIHHM+iWPtsC/84eMgYUEdHA==
X-Received: by 2002:a67:a409:: with SMTP id n9mr4879196vse.74.1643012344721;
        Mon, 24 Jan 2022 00:19:04 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id u12sm3144846vku.9.2022.01.24.00.19.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 00:19:04 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id l1so27546987uap.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 00:19:03 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id t4mr143613vsa.77.1643012343460;
 Mon, 24 Jan 2022 00:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com> <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
 <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
In-Reply-To: <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jan 2022 09:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
Message-ID: <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
Subject: Re: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible variable
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Jan 23, 2022 at 2:52 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 14, 2022 at 11:17:19AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Increase buff size for compatible variable to avoid stack corruption
> > > with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> > > more than the current allocated size.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> > >         struct device_node *lvds_node;
> > >         struct device_node *soc_node;
> > >         struct device_node *du_node;
> > > -       char compatible[22];
> > > +       char compatible[24];
> > >         const char *soc_name;
> > >         unsigned int i;
> > >         int ret;
> >
> > What about changing the code to use kasprintf() instead, to prevent
> > this from ever happening again?
>
> Or maybe it's time to drop this backward compatibility code altogether ?

The last R-Car Gen2 DTS was converted in commit edb0c3affe5214a2
("ARM: dts: r8a7793: Convert to new LVDS DT bindings") in v4.17.
The last RZ/G1 DTS was converted in commit 6a6a797625b5fe85 ("ARM:
dts: r8a7743: Convert to new LVDS DT bindings") in v5.0.

Both are older than commit 58256143cff7c2e0 ("clk: renesas: Remove
R-Car Gen2 legacy DT clock support") in v5.5, so I'd say let's get
rid of it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
