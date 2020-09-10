Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD17E2640E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgIJJEx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:04:53 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35500 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgIJJEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:04:51 -0400
Received: by mail-ot1-f67.google.com with SMTP id o6so4761510ota.2;
        Thu, 10 Sep 2020 02:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GeVr52xcVYVVQYH2mCzX9kx4mcN8+pPPI08tkLGlc7k=;
        b=ZloRhBdZN0rz1EG6wa9rR44Pz00UpQT9/jikTtSb/vZ7m1Fv/yJJ8EF2SLbWE9IK1C
         tfEeIQKhd33JBdVEyDFeMnzEMGoNIwDlMR64ZAlBZJLdfmZMaVIXo31Xt9LrLH8+EwvT
         j01NN9XFH7nOYjT2GrGw3jsQsxhNx7GFZ7qzvSgf7xND5BhaYPyssQNEPnHgtQU2zV8m
         Bntd/WvC3qa1rN2okba4JJ/cMEhEzJHwHML3jPkuOKC1i6kWe5vtGut2x4I9/lOauwmP
         9z+jBtn3LwPcoBzJ8wz9n7f10hMk/zGCm9BL7/KTeKba1gcMjHqhofhtG+4honM2NnuS
         TLBA==
X-Gm-Message-State: AOAM533Z+BweCpxj41CuURytx05pWpJRqMsJ4AsNATurQGTU3QiJi6Vg
        Om3kbSKeKeKbVj+6bgs9bWPqU8N4KES6LnISM8I=
X-Google-Smtp-Source: ABdhPJxXoCrwrjpFoN4CQiWLs6WAjXs6RRX2ytCZfe2BhTqBLoPDb12+bVxvd1zFW5gLoibYUb/Si6j3YQ4rJ4mIshU=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr200413oth.145.1599728690733;
 Thu, 10 Sep 2020 02:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200907155541.2011-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200907155541.2011-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:04:39 +0200
Message-ID: <CAMuHMdWeMOi3K=QJdC6Mwi=B_L2Fiw8ebp26AqyP2bjtqF=mjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: r8a7742-iwg21d-q7: Add can1 support to
 carrier board
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 5:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch enables CAN1 interface exposed through connector J20 on the
> carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks for the update, will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
