Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0134C256A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 19:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfEUR0y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 13:26:54 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41884 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEUR0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 13:26:54 -0400
Received: by mail-ua1-f68.google.com with SMTP id l14so2166219uah.8;
        Tue, 21 May 2019 10:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j/D4S8gscS9O5c3uaJM3GMPcWAFs73eJxSabr8rEv64=;
        b=QT0j3j29qWa/x0m2K93TDsoDCfrlPgImAbQ2q5dBX6rPvWp8EFPEqYjoKfr347do/d
         yIqwoCf/x39uxSYppepW13s8wJCBNNPeUuj5iKEK6LkhUIWUCuxq1f/J8ES1imNRdlQT
         KO3o09T8BsY+YrdVy/1HHz1z59soHt5BHRtbFnmS0kzLv1rAlcVFD6/kU4CHpR98G4qz
         sExWWjL/DNTTRY0CHODsLsUohm4xXr2Si2SzbkAip6NqM9WBFCaMHs2Ay2d+PEwSEnK/
         yKUfJZaQqN+0Xf0M7i1r3AbkfJzhAyWyIbJqyHgaC26X+1rAJezJirhUVubXLalpAJ8R
         yD9g==
X-Gm-Message-State: APjAAAWsCmY84ko4VA6VDEHBtGm/0vugyB2k9Ld4uGa+mx+ZdUnP9fUU
        lecde47DuyQ3eyHkAJ1IrZUkJ3l3RpEG+j6hmek=
X-Google-Smtp-Source: APXvYqysyxm55xleL0rx9VDMV6dsPqbittwUJtB8QdH4/nvrqrBzTnE59SW4g42cc//Ox7iDuuIHLNPdPK69/1OXvZU=
X-Received: by 2002:ab0:3119:: with SMTP id e25mr1726168ual.96.1558459613075;
 Tue, 21 May 2019 10:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
In-Reply-To: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 May 2019 19:26:41 +0200
Message-ID: <CAMuHMdWLwN1mGq5TFgdPYDcJFd8_0YvmoO_tmUf7hF791CAq1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Clean up CPU compatibles
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 21, 2019 at 6:44 PM Robin Murphy <robin.murphy@arm.com> wrote:
> Apparently this DTS crossed over with commit 31af04cd60d3 ("arm64: dts:
> Remove inconsistent use of 'arm,armv8' compatible string") and missed
> out on the cleanup, so put it right.
>
> CC: Simon Horman <horms@verge.net.au>
> CC: Magnus Damm <magnus.damm@gmail.com>
> CC: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
