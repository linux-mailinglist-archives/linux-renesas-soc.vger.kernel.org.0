Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C521A013D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1MFM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 08:05:12 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43245 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1MFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 08:05:12 -0400
Received: by mail-oi1-f196.google.com with SMTP id y8so1847492oih.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2019 05:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vF5xXOwOe5OzZuDkvVDIRT+0FFmn19wOP7GDl42Uj0E=;
        b=FDAJ/r1AlHhbnsBSBp2GkqdgDUTsnHeEQ7qJXp11OCAUl0yEHbRX+xIYrnpJgkKJkD
         m+Z+5E6jsbqPQt7TGlr9mAnG0wLvEFyAfqwFbxG/3jm3DKtfnTH37TX3UjI3i49gIft1
         JFNaBR5NqhwyTPVJ/OOFsyNzD9ibfm5WuRWH8SyDsqrSskoVVJFWf9ylCwoR3ILEIvN5
         FWDkVyShfoSZNbfKn8gU1bGcnDslLl3XgXbBE41Ivy0yCSJXiI1OIVdV7bbE4SsSPMoM
         TMvdJqn7GHzkjwMIbf4kDR+tBlIvr+2W2O2fnc+BXMDCBM99qMDpPolXJ8ay41rXuvN6
         VzHA==
X-Gm-Message-State: APjAAAWf0sR6FN+pGgVXnNksk4hip+6aeoyagpCvzsqZ8ZqJWOXuh3/p
        u8qhqOKlDFC9pCipfZQljVN86OFfhN3d0IhmfQlYLaJw
X-Google-Smtp-Source: APXvYqxaYO737BDUqNA3yKVQvMHcDXas5j+anmc6I4lTdUYlVUISB5uta0Y/iot8h+SyZLZrTgCHfM7cPAjob0nGofw=
X-Received: by 2002:aca:b154:: with SMTP id a81mr2263281oif.148.1566993910829;
 Wed, 28 Aug 2019 05:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 14:04:59 +0200
Message-ID: <CAMuHMdVLcjujQR+QOtH0C8uZJxKC_gWZ3zupDyb=LHKc+RrhLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] H3/M3-W cpuidle support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

(Replying to an old series, now we have received more background
 information)

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This series adds CPU idle support for H3 and M3-W. It's a straight up-port
> from the BSP.  This revision removes the superfluous status properties from
> the idle states and fixes Khiem's e-mail address.

> Dien Pham (2):
>   arm64: dts: r8a7795: Add cpuidle support for CA53 cores
>   arm64: dts: r8a7796: Add cpuidle support for CA53 cores
>
> Khiem Nguyen (2):
>   arm64: dts: r8a7795: Add cpuidle support for CA57 cores
>   arm64: dts: r8a7796: Add cpuidle support for CA57 cores

Thanks for the update!

I took the liberty to create a topic branch[1] for the first 4 patches,
and include it in yesterday's renesas-drivers-2019-08-27-v5.3-rc6.

> I don't think we have any information on whether all M3ULCB boards have an
> ES1.0 SoC yet, do we?

> Takeshi Kihara (1):
>   arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores

This is just one possible mitigation for a system controller issue, to
prevent conflicts between powering off CPU cores or the 3D Graphics
Engine, and changing the state of another power domain through SYSC,
which could lead to CPG state machine lock-ups.
Other mitigations are to make use of the new System Controller External
Request Mask Register[2], present in newer SoCs and SoC revisions, or to
keep some power areas always powered.

However, we believe this issue cannot happen in the upstream kernel, as
upstream has no support for graphics acceleration yet.

Hence I think this series (modulo the last patch) is ready to be queued
in renesas-devel for v5.5.

Thanks for your comments!

[1] git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git#topic/rcar3-cpuidle-v2
[2] "[PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request conflicts"
    (https://lore.kernel.org/linux-renesas-soc/20190828113618.6672-1-geert+renesas@glider.be/)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
