Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C565295F3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Oct 2020 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506621AbgJVNCG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Oct 2020 09:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506562AbgJVNCF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 09:02:05 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C947DC0613CE;
        Thu, 22 Oct 2020 06:02:05 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id o70so1553429ybc.1;
        Thu, 22 Oct 2020 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/54jBV1phWQ6jS7kIRo/j/AWdoELyiwUpMTHqJGjj0=;
        b=SUblLW5XiUhaz3mfErgznskkGW84ETmLQFRkPNXoTl0xTWGrITqZ/Ft99cUQzrUy82
         xRQ4O7K+kG4nuNLJS4unSAXJlE5LkAaQ5eTti+ytYqbZ6ZZu239QT2jf4/E68f3X9ELm
         suMs1XEoBDmIVDf5EITFgZYX9IxAHiMziGnCCAf/0oCwxtfD/KespCP+YJ51O83DLBEG
         Nf7xJ2kLmkZLiWSU5xfncMJS9/O0BTl7euW924uKuDv+SquIYBbUg7MawIlSUrEObcZu
         HPxxh3PqtXFBrH6G3X54ZgQpfAqFBY5Yf6fSDrHMOwwo7OhsibbftwQZC7rH2b5mWFWy
         5rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/54jBV1phWQ6jS7kIRo/j/AWdoELyiwUpMTHqJGjj0=;
        b=rQlep9u0YjTFQZIdtZrmOx16Zkc5ifS8pHKiL1ALQt6yxMy+ghvinzdm11klPvsD7p
         AfRyRVmDliDl1zxOZFsm7h9gT0LzKxZSZOZ+Y5YJYcdq/D373E7QJCVUIUkEopYBfDIs
         a2FMm8S7+fkNGAwbnIezq8nTz5SYR/uHc05JNxhWbN8fC8UHKfkRVglOesBxgBKsxcd0
         ghShFU1h6VCMZ/j+64/T0O3yjegrpvTWFIxOfi0XrrIdsKlCyCtM0dnZsv9OYzAUWH0P
         ukzWIKVvoY9RAJRAz9nFfku6Lpv/V6uB7lHUBsWWG6v2s4qsyu+i5ryIt9UEIRRWHnPH
         UM4Q==
X-Gm-Message-State: AOAM530jc49+bqXG5p6P4a/Snt3mF6shliUjVJPU9zPMSbbYk0yoOKbk
        24NQQYflmHhf4x4d5/C2N3KvSny9QdUFwi4pw0XWm8Pm4K1Ueg==
X-Google-Smtp-Source: ABdhPJxLDI4K4Nr4Ra6WzZtTgOJfK+wSXdjsblcNLNHZuJvpP24FvRsvgKnj6cUArVxJm2HOjSpuzMqDQItaQdp2lCw=
X-Received: by 2002:a25:740e:: with SMTP id p14mr2786140ybc.401.1603371724707;
 Thu, 22 Oct 2020 06:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX6g5dh2jU5DKUiOLbxXcwPodUcrYS6=mU53F=oLAw0PA@mail.gmail.com>
In-Reply-To: <CAMuHMdX6g5dh2jU5DKUiOLbxXcwPodUcrYS6=mU53F=oLAw0PA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 22 Oct 2020 14:01:38 +0100
Message-ID: <CA+V-a8vNGtC9bAhAf+xX-pYqjEmT1z8nNcChb9dSvRF9GUQqKw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Oct 22, 2020 at 12:43 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Oct 14, 2020 at 4:56 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Enable VIN instances along with OV5640 as endpoints on the adapter board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I believe the "data-shift" patches for rcar-vin haven't been accepted yet,
> and this patch depends on it, logically?
>
They have been accepted and is currently in linux-next [1] (should be
part of v5.10)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e88349437654f9d1b3c144049b9990026f911e56

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
