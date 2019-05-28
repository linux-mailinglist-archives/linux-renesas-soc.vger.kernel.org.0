Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5E82C1AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 10:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfE1IxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 04:53:19 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46598 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfE1IxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 04:53:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id l26so13904320lfh.13;
        Tue, 28 May 2019 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0E8n5i2OH1AzGj4mcYZ/Kaw4GXve04YGgwBWIaxVKw=;
        b=ZJKXR2DyRiuHq7STJfPNOAGtN736T7+wfV9beLmMEeVFh7bx7DRgWsJC43nJq+bV4g
         dcnt1r6AIpFUYccLLmOSS8NshUOBOJOJgCYgh70K3400tSO5rELm/xleqZRhj4NPjIwE
         cQhI5sgN8pXmHEPXzGIhc1Wkkc/sf/HSBhZ3ynO9iR8QZgrv2Ld8pJMWvUX46rspozdc
         Th8LhJVEN8OOhlIboT14x4nkdEw7a/TZlieJOpQFdFMVh3QJQS0iNUhlJe6mePz2s8aT
         3WV9+JM1zbZtM+aSJly8ZWoMpKEmsrjAEVWMkdJzFDUOppj1MnvImuJl22tWFa+pk2gP
         2i3Q==
X-Gm-Message-State: APjAAAXwgzn2V7ZiEv+NM8X95yiMgRLdaG5NAxKOz/leTmodvbACPv4k
        vDx437sn3HHKXqpnk3z515iS92z8Ce/d0Pz1XFg=
X-Google-Smtp-Source: APXvYqw1xvYyIomVfV5CWyMDZUs0rLKgHeDs2I1l3aU2XXFswqubhxjSsltKXArd+5qcizIuwceNgR+k9phW0RZ1GG0=
X-Received: by 2002:a19:c142:: with SMTP id r63mr3218595lff.49.1559033596202;
 Tue, 28 May 2019 01:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com> <1557997166-63351-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557997166-63351-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 10:53:04 +0200
Message-ID: <CAMuHMdUGxdfT2+X7fYXS7+Fv12J0V6UB-5NEv=o3qjG_udZhEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN support
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

On Thu, May 16, 2019 at 11:06 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables WLAN support for the CAT874 board.
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
