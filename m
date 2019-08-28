Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE892A00F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1LsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:48:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44766 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfH1LsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:48:21 -0400
Received: by mail-oi1-f193.google.com with SMTP id k22so1808149oiw.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2019 04:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHRQfi2qrWFpXCu2royUzZugFE5+ZuB5C8J6KuQqtnM=;
        b=UCPcZc2Sk2fEGxAMnX9VNQirwyTimczSmBRJGaRIvlr4hT3FpYdNfmHGcjp9rcBq5r
         O68C0wOGETS/BDFMnsZ9yuK3SyO3nMpYvLFyH9SPtXFalT+yOMcc8EGcuVQVJmWNOVwx
         BhXI76fKlsJPPCMnGcHRdf7Th8cQxd/FHkNWjZRsHTxvjmGMRYyOwNCyE7j2D9ABMcsK
         uj2j1WQDc5ZrIIeGlShN0YWdRbmSFZOfIPQMoe2GNoPR+z1uItYtZ2AXE/gF1MYECjfU
         OErmrGxr5RZMdv9q0HjoQeHhrOj/FP9bDHfKZndc3A9UXl4bBYsZCa6xkGPFpc2yUgwx
         NUSA==
X-Gm-Message-State: APjAAAXGsfHqNBbKTUWOtVHtxKOqrvYqU6q7iAgtq/PJFCs4nhFp/V7Z
        +y6w+KOvaZ0offrq/2F+cn7JJUCUT8Q/8iOOntk=
X-Google-Smtp-Source: APXvYqyfNQBBbtMca7Qqv/S9ANud2APjn18CD7ueT8/H0R1W27Krr6Wa4L1k6rUjkbV0RnLORKiyuk7C+4sKpkRMOTk=
X-Received: by 2002:aca:3382:: with SMTP id z124mr2434756oiz.102.1566992900769;
 Wed, 28 Aug 2019 04:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu> <1547808474-19427-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808474-19427-3-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 13:48:09 +0200
Message-ID: <CAMuHMdWz=6LvLbpFZtgHQ903aHf1h5ZRB3AzYQFhse0NsSnCyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: r8a7795: Add cpuidle support for CA53 cores
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

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> Enables cpuidle (core shutdown) support for R-Car H3 CA53 cores.
>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
