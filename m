Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD2D2DD142
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 13:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgLQMRS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 07:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgLQMRS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 07:17:18 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2591C0617B0;
        Thu, 17 Dec 2020 04:16:37 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id r17so25583117ilo.11;
        Thu, 17 Dec 2020 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+ZKQR5wKGdXSou9m5e1shyrhkTrlpP8s/1tpCetzig=;
        b=huWHNstLWuAF/ScO6U++Lzan7GLkZHdpX7ypteGKXT0fmBEVgHOu4gRRL2gCm5KK27
         WWs/mflqzH2yDuMao7OyXnR6E15MZLmDonPMOiDQXHn64HKFhuOtkozdJ2jCLboLESJB
         BRFWvYc0QTExPZTxQA3Fu/ee0vnbnTWkFi5qvt0VrvRSAuEnC1kCK5spWeOB4d7yINYW
         KkWuwUoRRrYcPuuU0eotrpPQPKLbq1OwFus/Ztt68THuWv76ipQStqopeEvBW00oQ5Cw
         3ZUDYeVr0G5UDBXVgl2CjCKpw0YK/M+tksulAKAREzU8EgPXTd+5jbtds6lOGPZAyYmL
         ErPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+ZKQR5wKGdXSou9m5e1shyrhkTrlpP8s/1tpCetzig=;
        b=qkV0GYsVcT9+lEMPRjDUPr1Q8GGsvu9tcUaZOZRxoLXiyB3F2qyli5VvRvrxKxU3Ak
         Z7skajKBzUDV8FLOEkxyVJd858Dq2MNRLuY5ZKyLd525Y1C9HzY5cc6VCYslI0bYzT/T
         2xe41c3C3uhThGq3Upu/BurA1rJjfO/gm1MGRX5FEt5okc0+VqWIlW+WiGEOCQQ+vHHs
         1qJ+Ql7XitlNSqfHOixO5/vVVS8xEdfrr1RRl9PHLWayi8hdX8jVo43zvJX+wT93n9PJ
         ZsxjukkJNMJ3sWQxs3aXoc6zPqMUlXGX3qJ9mCzM8vtAzuWpnt1IIYcIqdo6f65daFvR
         bZSA==
X-Gm-Message-State: AOAM5302qz/mhy1SKadcUHCWpeUJFNClK70r7G+F4QEUk81q1ECRP4nL
        8xZwJVaAStNVE9vgiFhlJxCeLSM3ACKRLVREUnt4ddwG44Q=
X-Google-Smtp-Source: ABdhPJxm8FwZbcyKp6tu+hSifu4JvQ46+rQLJgfedVF+3upPTA66e43YUFBG8nbd3OWy41LK0AfOpmFhi1lNB2g96PE=
X-Received: by 2002:a92:7d14:: with SMTP id y20mr6491712ilc.196.1608207396954;
 Thu, 17 Dec 2020 04:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-3-aford173@gmail.com>
 <CAMuHMdW8w-J445DRNH8Ykx7Sp2KGCCVibE5uvccmoD=iZSM-zQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW8w-J445DRNH8Ykx7Sp2KGCCVibE5uvccmoD=iZSM-zQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Dec 2020 06:16:25 -0600
Message-ID: <CAHCN7xJCxXVUJoEu4h=vBc3v=VpvXd9WnOEM5GNoCrBDeUp6aA@mail.gmail.com>
Subject: Re: [PATCH 02/18] arm64: dts: renesas: beacon kit: Fix choppy
 Bluetooth Audio
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 17, 2020 at 4:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > The Bluetooth chip is capable of operating at 4Mbps, but the
> > max-speed setting was on the UART node instead of the Bluetooth
> > node, so the chip didn't operate at the correct speed resulting
> > in choppy audio.  Fix this by setting the max-speed in the proper
> > node.
> >
> > Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.12.

Since various other patches in the series need a V2, should this be
included in the V2 as no-change, or should I skip this and others that
have been queued?  If/when they appear in your branch, I can rebase
the series against that branch and just submit V2's on what's missing.

I want to do whatever creates less work for you.

adam
>
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
