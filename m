Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48922F2E38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 12:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbhALLnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 06:43:20 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33617 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730081AbhALLnU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 06:43:20 -0500
Received: by mail-oi1-f169.google.com with SMTP id d203so2040613oia.0;
        Tue, 12 Jan 2021 03:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gvSXzvnGVXDaviH1zuRAMAGJuMaNfjyn5ekNZGjpQ50=;
        b=tUl+664ChepvxMaoy81l8P/DDMc8C6lg081orKo75qi9pToDOZXopVfPtIOw9ug5lJ
         2DYSN9+3whqA9WSCIBefP4I8CfZx18l4T9HU/RjOrq0kxBv2yN8TMcJBrw7l+n8tiBBU
         PT1RbagQUkSxYagicKlnqk9Im6/T3eSa2xiX3s5R/RGAMhj6hyzW6HOKap+f8F5trFOS
         tUmjVOSZ0nxOeeVs271XJNxLOpb1k1EjdQ4UIQQA5sqjY91z7W3SU6OPRgK93x/gmgFI
         xvKoftIT3hcOSP66w/gaTHSTuhxjP+zPcYDyDVSbl72vm2MTbZqRgNfhpIfeT9Y3DFO9
         4AsQ==
X-Gm-Message-State: AOAM531YoivvXOeg/CIn8NBh8O+BnDAen2TmxoQNeez+w90izg40uxi3
        AVem5Ua11qW/7W7YpFiQrymeQXScgsKepJcMKIA=
X-Google-Smtp-Source: ABdhPJzGBEZ0VKoVq2/frzInDE9dRaRt+nGC6OvXRLt05DwD5bHCz9xBQJCBK9c/MB63RSKJoCPjhtWJVNIWpP/+Trw=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2054826oia.54.1610451759483;
 Tue, 12 Jan 2021 03:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-3-wsa+renesas@sang-engineering.com> <CAMuHMdVzQVBvsUhpZF5A9qoijA=thVPq4tBiRnAVyFrX2aD+5w@mail.gmail.com>
In-Reply-To: <CAMuHMdVzQVBvsUhpZF5A9qoijA=thVPq4tBiRnAVyFrX2aD+5w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jan 2021 12:42:28 +0100
Message-ID: <CAMuHMdUg44u_Tpg-4sVwTkOXVWQWBWrm08Vg__=u8-xBFnK9-g@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: falcon: add SCIF0 nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Jan 5, 2021 at 7:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > SCIF0 has been enabled by the firmware, so it worked already. Still, add
> > the proper nodes to make it work in any case.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Upon second look, this should be added to r8a779a0-falcon-cpu.dtsi,
which already extends the scif0 node.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
