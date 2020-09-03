Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBC825BEBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 12:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgICKAa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 06:00:30 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43686 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgICKAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 06:00:30 -0400
Received: by mail-oi1-f193.google.com with SMTP id i17so2507253oig.10;
        Thu, 03 Sep 2020 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgYaYGC3ojTelgFnOtK4v8Dyf8XahmWDS67jYiDWXRA=;
        b=sY9igRERpGTMCgiJ8HY9BFfRWxYsmXbR2ET/m8LmzWicyyhIKVkIGQLxsaJopeBMsi
         R7yqvYYTq3NTndK60hNG4momxxoPGPQwXqKyl6Roq55jUjvs/jMlX0aSm+oAPxqIuZvT
         NK+pPmVCv7HIK7fcIysbJY5LHW+uqD2BdQcGrqFcthtaIY0uVUNIyQ6FCLVL/WQjkqVl
         NQwbO+k4wsAV+8tTkKY3u7vlyeBj2qpmz8KifEXWqLMNz8PoZhkLu2ObDC4xjZg6Fmfq
         0v7vT89HvqA/D7UBpVbwmEmEu1TZM9uI+rEmO8+izELUPI/Pe8wmxCpXEi+GO7UQKPAr
         17pQ==
X-Gm-Message-State: AOAM533++g0siSJQkQ7LVmusl4Iav0PJ/PQyt5QF2lGcQXL8018a7hk8
        6SewBU1jfpsecg7kB8GdvY8J4DwMV6KiNEgpDYY=
X-Google-Smtp-Source: ABdhPJwmLdHx01AD755Jgre3UgFbpmDx/mSdwFp5oQt7G1+aRwIESCE9jmJ23xCxXt4Oet3E+o9KRL44uk3r0mmoGF0=
X-Received: by 2002:aca:3402:: with SMTP id b2mr1420509oia.153.1599127229093;
 Thu, 03 Sep 2020 03:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200825141805.27105-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825141805.27105-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 12:00:18 +0200
Message-ID: <CAMuHMdWGGZvefDMTE86Ererkxu25JkpnKTpLj53pRYfbMTU2+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7742: Add IPMMU DT nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 25, 2020 at 4:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add the five IPMMU instances found in the r8a7742 to DT with a disabled
> status.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
