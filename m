Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A7741E68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfFLH4P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:56:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36423 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfFLH4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:56:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so14229504ljj.3;
        Wed, 12 Jun 2019 00:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfXoIE+jv7ZZrsp7hJcZrC1RUlw3yaEKG4qS1njVCr8=;
        b=BjwR0MAAW428e2qNR9pU7a6bfgUrOpxG7pjPez9SUsw591F7kubFnO2JDkjDY7Ognm
         TGcSuMVoz/YZdSztMsNjZxPRQ/6ewgEbLOodHgpGCeN/Kx7An1TQvNl2I4pjmLOPI4c+
         5F18yj31aB/xvRtRXM2JG68B56BmadvGLyUoQNiLLdYRM3gMfG0FcUjdrxCkQn4+GNG6
         6fYq50Xym4idr3bUarcYScntKV+XvKavw6DqKOFbGUVXlpl8qs/yGuzOrC+wsbYMGyN6
         P0F+S49Ftzfo45EBBM4H/KZCmvHG7pYVkoSZGr6MiDMIn9LUuWcBDJoSuqL8pdPCGcV/
         7F2w==
X-Gm-Message-State: APjAAAVXe9IRhEw7PRayLFIFAmmcOE30VzJeshITf4+YWOUyOjbOHYg4
        n8Uxapl2Nr3HnfIDInTVjNXHfSGDukqgASSBh/g=
X-Google-Smtp-Source: APXvYqzGZOj7PeRfAJ/xYvIYPvkN+WkYSGbmysNmM06zef/+WUeVUxDrwiNgOEHCbSps69E9ZTkHVSmvvgEZQVxuysA=
X-Received: by 2002:a2e:7f15:: with SMTP id a21mr24718379ljd.51.1560326172891;
 Wed, 12 Jun 2019 00:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com> <1559891639-62529-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559891639-62529-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:56:00 +0200
Message-ID: <CAMuHMdUReQtusF5tJCYn4QMn+kOonT6i_FRzSx4Xf32uBsFiWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add PCIe device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 7, 2019 at 9:18 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds PCIe{0,1} device nodes for R8A774A1 SoC.
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
