Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB16401DB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhIFPmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 11:42:22 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:44574 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhIFPmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 11:42:22 -0400
Received: by mail-vs1-f51.google.com with SMTP id n63so5884685vsc.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2QW+ZPHnGp5I6/rQKvtE/R/xg1yNk6fuEY9Md6/HKqQ=;
        b=K9D2lUsnTDLmIAqmAxCe9K8LcN9Nu+kOPGq4dppDTRld4qNRIYijP8cXQ88mwvZWZK
         5O7cELxxenl6UvgmxGZbHMWF24iuQLKZBALfSgwzXsqdRhooqvsBZtcVdOXBtF8KIUCD
         wMp60d5UpDFxy3PL9YRiu+uT7bzr4ge0vQ3zTUD0qqdUYsoTwOLcVaHOhMv5q/McyElg
         xrFeHcNAFfjJxVUDLSsKeaeWr//87dAY88wk/krgw1tEUpNrpV6Nb09EkN6VhuDoiSRK
         ZR5Ssy9gBe0wPC+R36vOeJLPmeg3T4kTRSMiaMtpQ/yfGSNdJIT0vLoNJK17dNZEmDM8
         dR5Q==
X-Gm-Message-State: AOAM533uWuupU+2bro1P+os8FqJ32/C5ZMHYxEX0YoRn5f4GKHQQlMYk
        59NDOpUsubTw3imFYheiHIo1SMgpOSArD+m55ZujDKXL
X-Google-Smtp-Source: ABdhPJxVemCL4QlDloH2ixkgSmdO+3XQ0I1AXjXNFhqYiOCX4a17xpM5WNjhU8oBIp9xQHODGTddPZyckg35679E8No=
X-Received: by 2002:a05:6102:2417:: with SMTP id j23mr6492391vsi.35.1630942877443;
 Mon, 06 Sep 2021 08:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com> <20210901111305.570206-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210901111305.570206-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 17:41:06 +0200
Message-ID: <CAMuHMdX4nWxt+Q0Q27vfmZDDusKK9h7O+S6oXdDzGXtB4anD=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 1, 2021 at 1:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a779a0. Note that this patch sets the power
> domain of IPMMU-VC0 is Always-On tentatively because the SoC doesn't
> have A3VC power domain.

The reference to the A3VC power domain in the User's Manual indeed
looks like an item that was forgotten to be updated for R-Car V3U.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
