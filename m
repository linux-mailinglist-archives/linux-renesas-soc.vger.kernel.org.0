Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA58141E80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbfFLIBb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:01:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35905 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFLIBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:01:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so14243328ljj.3;
        Wed, 12 Jun 2019 01:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRuU18fy29kl+vkH2niVXu3pMN4N89b8HRsNgAPuaCk=;
        b=cjomx+dJzwCLfg8CX69JFz/fvFyGGZhaSXHJYzXa5sR0hfAm/S8/a5HYi/WgrLyA4q
         +PBBWOxHZcAQsvpe21fUCgIACmODd9x1ex0JpU0M+NpURe1ND2POFvelLntwZdNGoJC8
         UmYkA1m64ElLIPfN5UG84H8rTvUpm2pyb6eeq71M3BfAbi2CSQ9WmJg5Y5snwhxJQomr
         C839YGJ/pGB62TzR7ix2jmriOMt4HNy/BSruU3JvB/+TPoM74PxX2ESc2BUvOz7YftA2
         OSJiOLHN3NTi4EkGMhPF0ViCiY6EVeCK6R8ZUpLyEEWDH71hGwqudjxKl4gTRTaXYJSB
         qoHw==
X-Gm-Message-State: APjAAAVxRLdHqUm+eKlWymuCmywVAnPPOovhD9yXCqxiqvIzLYhMCd/o
        xkpbKHTRyQ6EnQNDBxqfSOtufldwrNJaA+M5hJQ=
X-Google-Smtp-Source: APXvYqyMvXlAg+MklF7sw7MsiPeXTd0X92LN0e0qVQmGN1lWhnA6qdMAstMDU1ker6fFtuEJcR6auHR0OOK9WBV4WmI=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr42225001ljc.135.1560326489311;
 Wed, 12 Jun 2019 01:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com> <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 10:01:16 +0200
Message-ID: <CAMuHMdW52aGRu92r_vFFTQUdv0rN1LEoHj6Hj5BVeBkJ-GOGaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe support
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
> This patch enables PCIEC[01] PCI express controller on the sub board.
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
