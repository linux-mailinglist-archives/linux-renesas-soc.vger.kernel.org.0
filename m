Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2F82EF279
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 13:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbhAHMX6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 07:23:58 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:45197 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbhAHMX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 07:23:58 -0500
Received: by mail-oo1-f46.google.com with SMTP id o5so2325390oop.12;
        Fri, 08 Jan 2021 04:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7OdcqjyDor9BwazdtiKyf4HiIQOu+rqcNvqBVdFAhg=;
        b=AFWeSk5Bu1L4osivPOServalr1NbtZsp4EH7nySm2+ykkBe24yy0jDCFxm+KN/Xnmt
         MQ0bvCzSnyVwGPrMjfn039IJGFtt8LuYOF/25vKQ2PbRm1XuVAFwORjghe5zwbrYkpjh
         AdsCFIewRH1YN7t1+zeglJfo/rqB9FP9Xc+UpeLTXxn6bfAbCJgVHUoY1ZYc6xDORRQo
         D/KVhq9AQHseKw91Pf4DsUXTvlhjPUWF40o/yQJPCVEan5InMjJnBN+An6pZnCqwIPxF
         HP1wNYbeKMob3cY9zJFPvO0fFgvPzmeRLGs8ODdLVg6TWDqGAREQ/thzD3tjIZW9iWP5
         9FgA==
X-Gm-Message-State: AOAM532gyOcKXFbY8GBCvzg5buvxPo9xCTPEPMGl8MgTmDhSUL/ktfid
        PvKqEE+Yy5xsAN7T2ZOnQmsWBXrSPWhc6WasULQ=
X-Google-Smtp-Source: ABdhPJxHVBS7wWZhg49UPwP89juTmOHL4Bq/N7J3LK6uD41jcKLaqFfegeyewa8/SMHqw85SE8v+Pq8GvdfRJJuCijs=
X-Received: by 2002:a4a:ca14:: with SMTP id w20mr4137395ooq.11.1610108597447;
 Fri, 08 Jan 2021 04:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:23:06 +0100
Message-ID: <CAMuHMdWkk+KusB-J0qp+mh34z+sNmKPtBBgwJ-APph5_jUtHhQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: renesas,sdhi: Add r8a779a0 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 27, 2020 at 6:44 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
