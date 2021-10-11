Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B30342964E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbhJKSFO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:05:14 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:39849 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:05:14 -0400
Received: by mail-ua1-f50.google.com with SMTP id f3so10837808uap.6;
        Mon, 11 Oct 2021 11:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMd2cf8usWUkZQSFbgC6um2uxVjvvQEnvufQk6FhOmU=;
        b=rNA0ALjfcvxvq/Qo9yuZaHkW9TmtA+LNcsMYhkW9k+0UL7AbujftgBZht7DndohY7r
         gdKZ9P6jZI8xfic/gql3r30Aa5xZstWI7sEZohVgYgQEJXaBwPhQGZR1w8pxMOOn4QrU
         s6Tei238U/aHY9bDly8hGSKnxVZIpkrsPLw052gpa9BLmP3nzZ6bFKR0XkzvRmxMDTna
         Br1sstjxQXzHHN7I4vqk14AgHsSxH4Oiv/xS1SKF8HQqEDaH6pH9n5zQDzPizXyZr+wv
         8wMAupuIwVhXTHn/c8OnyFamHnSAsUJiqqLqlQaX1tKk1AVH4JpqBw7jbGvNDfj61HQT
         t8SA==
X-Gm-Message-State: AOAM531GlU6ete+1K6ABwGM283HLiqOdrMlyskhZ1z7L7dXY9DUdEs00
        c0CTxrgofhwz4Y89bIkv6MbhjuaVwiGQ3IiBjEc=
X-Google-Smtp-Source: ABdhPJxGtvTTgXsfXkcqVMIVdXrYEd1/QlMobHXQvCJDgTEF97uO2DYFnXO+q1bWpRtFU3epC+QdjpPe7eW6KNcsRmc=
X-Received: by 2002:a67:d111:: with SMTP id u17mr24111759vsi.37.1633975393498;
 Mon, 11 Oct 2021 11:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:03:01 +0200
Message-ID: <CAMuHMdUz1Mu7E1rryfgy7WyDh=kNatG7OCmcxuVTqF9mfFWeZw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] clk: renesas: gen3-cpg: add dummy SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

clk: renesas: rcar-gen3: ...

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently, SDnH is handled together with SDn. This caused lots of
> problems, so we want SDnH as a seperate clock. Introduce a dummy SDnH

separate  (as checkpatch told me ;-)

> type here which creates a fixed-factor clock with factor 1. That allows
> us to convert the per-SoC CPG drivers while keeping the old behaviour
> for now. A later patch then will add the proper functionality.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
