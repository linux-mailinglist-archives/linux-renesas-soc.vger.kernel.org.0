Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF30C265387
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 23:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgIJVg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 17:36:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42101 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730918AbgIJNjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:39:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id g10so5347678otq.9;
        Thu, 10 Sep 2020 06:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iamES1ppHy5j7jxj4Vw0kHBo6BKBrYANJFt8AKHsjAc=;
        b=ouDfrbgrovu77Qt1SKQrmeqQQa4fbbzT4FhWi/kVN/dKGIxPo68jW/9+LDZPD1XLs8
         l6J1y5nhA6igmGJFbNXevpG2IQL79pl7gvRqaBxZew1uQU4erfy0hj4g5Sylrkxe3pqJ
         YzAt8o2E6Vv76e54qPhyjLsAVQ0RcxlZkHDZpKW1UPb5ep62K5hpSbHSBzNA+PvdZaGo
         6xOXUhC1j5GCKJqevT8NLz1PUCq2wCRkc+rQHEWhLnFXuUyAyYK9dE2vcyC1en9NyWBz
         4ATpzXu78/63POCxnMIzcUzeMXGvnlkLIxLvi8mUfNNpgaBw5NSbtLP+OdNs2gxjTitX
         Zg1w==
X-Gm-Message-State: AOAM533ekfp+fLGOUIxMqoyaRLHBlY02sczv0eTYrWi8eC4A74cFw+hi
        SN0kc0GdgL0b3whCT1tKzEu+EDQSWmxjus5OsNE=
X-Google-Smtp-Source: ABdhPJyvGLv3FzYf3jTwieH0bEewuvSiWUTW8kE3fjoAEFHxVNE2lmBDJ7FaPRRFvljW/xgjTaWlPPs8jEVZ5Gkl73Y=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr3676854otp.107.1599745086528;
 Thu, 10 Sep 2020 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599739372-30669-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599739372-30669-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:37:55 +0200
Message-ID: <CAMuHMdUU--_WDD_0tqJWLXw1vzW7j0aAcG=8+idqyyW-qJSr9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779A0 SoC support
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

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 2:03 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add initial support for the Renesas R8A77990 (R-Car V3U) support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
