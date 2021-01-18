Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4142FA0D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 14:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390510AbhARNLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 08:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391661AbhARNKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 08:10:21 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3A2C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 05:09:40 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id bx12so3496723edb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1AAveqTyJyo7XF8SzJyHG+QKvAwmHfyliyuUc7ZAnA=;
        b=l68X6CtsM6Skvy4gGizDCvSonOG+owbJN7TdOkzZrLvP9lhnyhqOS5uV9Fm7qeeL3S
         Ij8FFii+F+dvmzuzn6BDBr0YBsWmrXIRP+uih2bEIbpg6s1K/JLbomJ+nDWR5mQdskRb
         dXpoDQF71t8wB3VevXYfrJAIKoEso938vlYv88rWTwCZJTjm0puR9CSc3JgLHlACWrr6
         aG7mCHr1d4C2CX7OsoPHwN7Hx8NUa+bYAmAD7WE448vm9D8V/VmS/vbuHNvKkpAlGySF
         mYYcX8vBTOowRWG0JSPP6H9ELliocDrT6r4wTN4fWgL8atdJs1vgMgRdhfMfbhEi4I9U
         fZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1AAveqTyJyo7XF8SzJyHG+QKvAwmHfyliyuUc7ZAnA=;
        b=Phb1jSTYrxYwHpKNmXp3//+y5QzWsZYE3wUwweEpzxdkO9ZFeP7ZyPe5UQbSOBFCr0
         V74nNDwiiwiKchJqe1unONRW6kgG9z45bUKtjEH7JwhyMRctZ7LeoENBiCen1vtmttMO
         2uIRul8BXx2DUppUDis0yjHOs1BnOdpJILzSn+agazNVszADXpkmIU8sIHJkhYG2ys6h
         kzPvWNQW0n1yjxFRmrG+F7kVKObV8X8HFoLClTAEUiW8FV8FLKd6O6Fz1vu9Mevsqh8G
         ExGVWwiJFQcZIt+SZmtw7WEVlxndmiwp3HD0Qx41JcWlsQw3Ep2fg6zTwqDYzitSlQtI
         8hfw==
X-Gm-Message-State: AOAM532pRtNWlfijra4dXMr1OJFbhVznX41PJagl4QxEpKWxiuOnl3D7
        ac2no7lx2x7j+QCVbrWzgAqHtRplA3dL0kJopPu1yA==
X-Google-Smtp-Source: ABdhPJx7P49VEgkKm6Wu3E1/wBPsP3g0IlibgP8xzr/V3RelBVzdfxzLzDN1d2NZc2Hw19FgOMKk1QSj/fKTM7uyr8I=
X-Received: by 2002:a05:6402:c92:: with SMTP id cm18mr5108809edb.367.1610975379333;
 Mon, 18 Jan 2021 05:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20210104130111.1269694-1-geert+renesas@glider.be>
 <CACRpkdZyV-tye0b6Pxf6s_SSEy1sq=Hqr_xXUopJrCkXsu9m9g@mail.gmail.com> <CAMuHMdVK+iYu-mEPfcNK0OwpFMs8re2uC7YAYzt5_CYvo_8BQg@mail.gmail.com>
In-Reply-To: <CAMuHMdVK+iYu-mEPfcNK0OwpFMs8re2uC7YAYzt5_CYvo_8BQg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:09:28 +0100
Message-ID: <CACRpkdZiUAi+Ur=v0omivvUnUVe9p2Tntum_DtdOa-uD-sKTuQ@mail.gmail.com>
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Grant Likely <grant.likely@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 11, 2021 at 5:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > I suppose we already had a discussion of why this property
> > is undocumented? Or should we document it? Obviously
> > it is already in widespread use.
>
> This comes from commit 51975db0b7333cf3 ("of/flattree: merge
> early_init_dt_scan_memory() common code"), which combined existing
> practises on Microblaze (commit 12e8414263f47352 ("microblaze_v8: Open
> firmware files")) and PowerPC (ba7594852f4e7121 ("[PATCH] powerpc: Add
> support for "linux,usable-memory" on memory nodes")), with the former
> obviously just copying the latter.
> Unfortunately none of this is documented in The DeviceTree
> Specification, ePAPR, or P1275.
>
> Heinrich tried to document it, but his patch was ignored:
> [PATCH] Documentation: devicetree: "linux,usable-memory" property
> https://lore.kernel.org/linux-devicetree/20161223161747.9986-1-xypron.glpk@gmx.de/
> https://lkml.org/lkml/2016/12/23/175
> https://lore.kernel.org/patchwork/patch/745784/
> Note that Heinrichs address is mangled in lore (imported from gmane?,
> but lkml and patchwork have it right.

I bet it's just a mishap.
Rob, can you pick up and apply this patch?

Yours,
Linus Walleij
