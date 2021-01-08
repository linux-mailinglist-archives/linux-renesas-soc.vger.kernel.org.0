Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90FF2EF356
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbhAHNoq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:44:46 -0500
Received: from mail-qv1-f43.google.com ([209.85.219.43]:44569 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbhAHNop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:44:45 -0500
Received: by mail-qv1-f43.google.com with SMTP id d11so4255595qvo.11;
        Fri, 08 Jan 2021 05:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWb8VgSjg789dHUT08pL2udML5073CrhSVs/ZNbyo5A=;
        b=cA3muv8WUlGLH5iZAttqnr5c+TbfMvQSeQgS1BsMHMVea3nSwam9H4st2eLSCZxsTG
         g7BEQWPKEFbiJhZtVN0PgI91ji5AoLv8f7LaHaLgEdT2zcI4hS4HQyXeHoNM6L9HFm5G
         iqvjbceRo7aWuvDGsekxYilGdX4UMHkbtB1gW8DVpT/I2Toa8cmvXGABnvGzhfpxVY5C
         W34GXt+mKHPI1U3oo/Z+qL4+qTnxXmWC+/LWY5FrGEYIYjOwZgcm1eePH2OZ0Ad4Po/A
         ubMKfxCt7vxqsu3LNUTv5UqaYjoCbAk04ck87oagMyRyo6JS9O+Rgss7sUjRAHmCbFJV
         bk1Q==
X-Gm-Message-State: AOAM532siHiGOasqfswDj6Z6+nlW20jlBbnDpuI0NNsE67sIe1rw+AGc
        YcXTwJOGdyyY8knCn/sLs96IAtxcfTURKng7Sog=
X-Google-Smtp-Source: ABdhPJwAOgndNXc44qmOszAgc4b6dNYku5leE/bZhMtKXeQ6D4ksX6GvAYeO6kUnxfdoC3vvNWCVLzDgCWn2oActSD4=
X-Received: by 2002:a0c:da07:: with SMTP id x7mr6638707qvj.39.1610113444272;
 Fri, 08 Jan 2021 05:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-4-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-4-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:43:51 +0100
Message-ID: <CAMuHMdVwHyvq9yg5HVjGimZNw2HKBMegx-C+idJR8rLHDEkYHQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/9] arm64: dts: renesas: beacon: Better describe keys
To:     Adam Ford <aford173@gmail.com>
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

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> The keys on the baseboard are laid out in an diamond pattern, up, down,
> left, right and center.  Update the descriptions to make it easier to
> read.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
