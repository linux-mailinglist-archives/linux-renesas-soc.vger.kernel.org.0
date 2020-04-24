Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B727B1B6F35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2020 09:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgDXHm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Apr 2020 03:42:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37118 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgDXHm5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Apr 2020 03:42:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id z17so10905599oto.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2020 00:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obtKj0OEa23dxvWhBIMhxGejeRk+xjxwHCUHKt+jHWg=;
        b=tQDXHHPsQAtjQNpypYTvCVuiFEXzr5Kc7UUIAJFWuEqGFfz25nXatspeG5+rE9rAuj
         C5hIlDDoxP+tG4Wr0JjIl5u+olQ/vyg3Aye60mqIKHyP8DYE786guS30BjipuHW9pcLt
         kWBy2Ne9tYMqPWAahDbrGWN/IIvuwpT2VjJk/LSDB9MFxgPwo2ueI/6gF8Jc6ALuDsbz
         +38zOQf9xfbVQYhU/OwLc2U6LdJzSJLsyrzxoTKppt2xyMchGwPmg5WPYDzIGb6sL8aa
         f5N+PW7gV70ZOrMuoNFYU2wyeIkJFZhsI9U8RWOHyoMo0dKBKo1kqwIaEuGfE8UJRf9S
         V/oA==
X-Gm-Message-State: AGi0PuY8PP049u9uY8b7qWVqKTwgFFIWn5iAfQeWDdIfaNzR2DImyhIF
        8MewZoQFEH9N8ZUvPEINWkhPzFvRxE+t4fG+Fv8=
X-Google-Smtp-Source: APiQypKPS66QCrZ0CdVb5cUjpBlPWjoTwTAEPZufQu5jbdsCzpeC0IuKtgYsuYF+G0PbM0BUyE/YthRaqenscdhsJWY=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr6379300otn.107.1587714175398;
 Fri, 24 Apr 2020 00:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <1587461775-13369-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587461775-13369-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Apr 2020 09:42:44 +0200
Message-ID: <CAMuHMdWNtevqhN55dZ2XLiyZ7ShucBkFx7KdTk1EQpAD6b9KPQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Fix IOMMU device node names
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 21, 2020 at 11:36 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Fix IOMMU device node names as "iommu@".
>
> Fixes: 8f507babc617 ("arm64: dts: renesas: r8a774a1: Add IPMMU device nodes")
> Fixes: 63093a8e58be ("arm64: dts: renesas: r8a774b1: Add IPMMU device nodes")
> Fixes: 6c7e02178e8f ("arm64: dts: renesas: r8a774c0: Add IPMMU device nodes")
> Fixes: 3b7e7848f0e8 ("arm64: dts: renesas: r8a7795: Add IPMMU device nodes")
> Fixes: e4b9a493df45 ("arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes")
> Fixes: 389baa409617 ("arm64: dts: renesas: r8a7796: Add IPMMU device nodes")
> Fixes: 55697cbb44e4 ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes")
> Fixes: ce3b52a1595b ("arm64: dts: renesas: r8a77970: Add IPMMU device nodes")
> Fixes: a3901e7398e1 ("arm64: dts: renesas: r8a77995: Add IPMMU device nodes")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
