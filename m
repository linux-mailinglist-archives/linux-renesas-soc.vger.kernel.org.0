Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CA81B6F1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2020 09:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgDXHjx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Apr 2020 03:39:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38066 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgDXHjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Apr 2020 03:39:53 -0400
Received: by mail-ot1-f65.google.com with SMTP id g19so10858429otk.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2020 00:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bzb0B+ptO1MMG6wHEjts+29sxi73BBb57TVw69mSg40=;
        b=DrW6SieF9RNKCVbQUgkhl5Ffe+VDliMgwpDw+znNGLg/wDgq1jdwAaNn4BbcMlQVSh
         cRaFCrwVxtuEYkoCTUpsjsG3DA7onFI3JKDmAm/GOb87IMulieE62GVt9q0GenQWa/cl
         xLVW188V+cYB6Y5xSNjMYHKfgTf7FvkBoW2GtVCNuH5YBbVp4jQeWbrM/JyJwloSRpBY
         58LyxHDwnZvW/qJ5FKFR7qeUFC8LJ+839yr7Fd1fmizJGyrxqsawhWGQgJAJoR6kOdXy
         JHSPM+wxNtk2uGkS6lAl/zDHXjNbaYCUyjwDVgCM3NIvlkZomRYIpvrKEjekfC1QHZ73
         eD+w==
X-Gm-Message-State: AGi0Pub4DrN+yVakL2HYUdTaepfPR4QLaEjlobvJ3c0/noLN5LSEmKRH
        ojuNjeC62T8IVAYjG6QfT7iOfOo5vz8S9ksOF32dnw==
X-Google-Smtp-Source: APiQypIaEfO4AfSRh+yxtWeoX2oz9Hgf0Rlbkb77irWwZ8MGcRxK+jnPS9N3nPGdsDDa0VBM4YIsKimdlvFpM/4DWOU=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr6165630oig.54.1587713992549;
 Fri, 24 Apr 2020 00:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Apr 2020 09:39:41 +0200
Message-ID: <CAMuHMdV1F_3zhp5NJn9DyhrAW8WMgCw-PDRja07ZqgLDLLDMCw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Fix IOMMU device node names
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
> Fixes: bbb44da0b595 ("ARM: dts: r8a7743: Add IPMMU DT nodes")
> Fixes: 0dcba3de5835 ("ARM: dts: r8a7745: Add IPMMU DT nodes")
> Fixes: 350ae49b97c4 ("ARM: dts: r8a7744: Add IPMMU DT nodes")
> Fixes: 70496727c082 ("ARM: shmobile: r8a7790: Add IPMMU DT nodes")
> Fixes: f1951852ed17 ("ARM: shmobile: r8a7791: Add IPMMU DT nodes")
> Fixes: 098cb3a601e6 ("ARM: shmobile: r8a7793: Add IPMMU nodes")
> Fixes: 1cb2794f6082 ("ARM: shmobile: r8a7794: Add IPMMU DT nodes")
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
