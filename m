Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C290260DE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgIHIq5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:46:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38363 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730157AbgIHIqs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:46:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id y5so14206609otg.5;
        Tue, 08 Sep 2020 01:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvFiuc7GkUPN4hkRWg632wVRENRwhg76fbESE31RyCk=;
        b=UGnZCd+TkysKbAftRyWdLf0YTvzOikoCD6fhpIzk6cPl/w8EoAvrXQmCCedFLwl4WZ
         oPHoBymdzn6b+e+CYOYK6Ru+dUkr/90/EPJ7Uz5V6NduditdcDeKiCqiHoUX1Qb91ZTj
         OW0yTzEmSnFxHtOt5AG3uKEYy6DGGN0qw6CDkjdc7Kp5jQaoCIhGajwzRxAdSXch6HhL
         Om7J29FirYBCL1BQckG/Da4SbB6aRGsOQeDfgiazBOJNviJdPEw6GhmAV2sWXhdTL+pQ
         6/NX9ZELMlI1vEqagmfrQKUKhQhxp5mqo0y6KsxuygHYxYqIrL5WuW1bjJwMs1SqRCZq
         Cz1g==
X-Gm-Message-State: AOAM5325GFEgpKm/q156u5PSlqVOW8N6KSQImvexVB/NeNyGjRwFY9J8
        iKvSAczjmvx2UO38Rloq3QsSgYXb8YY7S3CoLw4=
X-Google-Smtp-Source: ABdhPJzcE7gz4BqOiVqU7IgBRGVcWC0kHXc2SC7ZZJdZv/cWI4KqBn1cMUIdMdb3xbPTrqsB2m2LKSWaNvlI/w0LpHQ=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr16796012otl.145.1599554807843;
 Tue, 08 Sep 2020 01:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 10:46:36 +0200
Message-ID: <CAMuHMdUg9tSVgbTmCGbExMn3fpSZuxitXPgP=xy7+FuJAxKqAA@mail.gmail.com>
Subject: Re: [PATCH 05/14] dt-bindings: reset: renesas,rst: Document r8a779a0
 reset module
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document bindings for the R-Car V3U (R8A779A0) reset module.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
