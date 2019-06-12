Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A2041E83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfFLICB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:02:01 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39886 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFLICB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:02:01 -0400
Received: by mail-lf1-f65.google.com with SMTP id p24so11325039lfo.6;
        Wed, 12 Jun 2019 01:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LosHHTjAwV+4Djrd//UJ/Q3yldXFuNnn7/cWvIsKiQ=;
        b=oujpLQJWunf9u9f5NkULtgbmW+OL87sVfU8sTaQRfHeh/no24GuKvFCDLH5jBNetQJ
         TweV+m+o5hTOQlAS12GFk/z5OzA8iw6gDozoOxeNP0TwpFeIuOAd3md3oaxzpN9uEXhr
         WOrTdQPVCH6+WQtia4knGTlBEVcSWlRzHyTPNWWsB1/tcvlMOLa2GBenNiT8cyrZAQf3
         1guGkFkPCbCvr1fGES92vmIY9znXKYldCJPECusPWc7uUQpjz4KA4gCPb1p7mYoPnSoh
         lTRJlPIucojESKuAxp+ehLdZ9zTLehjKrlSzawDIUvzGjo0pWmwFo51KyIkdG0ch2gQc
         /L5Q==
X-Gm-Message-State: APjAAAXtFUSt7PyBoyjSChzGIBkfhf1lli1phY6f5lt5XT1mEH4Vp/Ku
        JDZwppc28oObWjE+bFrE0JqLyzRybbKtCMweTmA=
X-Google-Smtp-Source: APXvYqzC8pg5oCZfcldvnzIlLitvtxhsxYALMEGRnCXjMcbv7MpzwINApI1czo3DzFKsOuQLJ8kJd8pbEWVbpt4rYMA=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr1484442lfp.90.1560326519466;
 Wed, 12 Jun 2019 01:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com> <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 10:01:45 +0200
Message-ID: <CAMuHMdUdVPm=EHYyNS-QaycrKc3f21uOA-rtmf2jb6Kf=z3vUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope-common: Declare pcie bus clock
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 7, 2019 at 9:18 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Declare pcie bus clock, since it is generated on the HiHope RZ/G2M main
> board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
