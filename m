Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F512D89DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 09:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732181AbfJPHh0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 03:37:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42295 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfJPHhY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 03:37:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id c10so19311798otd.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 00:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgvLqvd3HqGI5kSw300TNFW7n5vex69U8QqkYqkOx30=;
        b=f3sA275OdfSamoVSaLKbUBsA9CQN0pn0lDwJ3tssKBYVHFl5fOGEqA5Svfrxqc9Qkl
         Bdzug81FA5Qskq4QMem2pfGMqYz5AV8ohojnY6JdHBWDqOmsg0NoGb7hHQvTRizcqX8C
         hQW+4GtexIR/zZZTnWvsmR/EV6Je9DMGJZL6EXfmpPy+1SGyAaVnNoQ5tZ+QGCEr+Uer
         BK0kuSkHo0b8vVO3EQVpnNPqiNxLUHFinLnwv6nOhI+l1KWYW2VqYMrETStPTQlRD/sr
         0jpbGb/HeXKLbOiQpN4qfXNibOsmGNqZ8W9tsSUwrCNCLTK2NGoVJTEkmyfldSr/l89m
         7vQw==
X-Gm-Message-State: APjAAAVCjB1Apw+J3/4f8LNEjdtUshqgNik0ptk1CpUUsIBZ4BV5Jsh+
        D4F3b1eF7Z7Bx93RqCo517vCM/LBzpVrjXErPqTDO1tK
X-Google-Smtp-Source: APXvYqylDyXm4/2DWkPaho/HBt8brkDULyUp3dfIMBVyRdnps8DOBDPCrg5aXi2G4i8hyMb6wB8HWjgez26s7NP9htI=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr22986531otk.39.1571211444117;
 Wed, 16 Oct 2019 00:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571137920-15314-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571137920-15314-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:37:13 +0200
Message-ID: <CAMuHMdW9L9Z7_avmGfEF8FbuYPkeX2UTx6Tup35bg+yb07a4vg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 15, 2019 at 2:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch uses ipmmu_features values instead of a macro to
> calculate context registers offset. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
