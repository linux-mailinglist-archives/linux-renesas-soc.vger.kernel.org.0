Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3DE5CC45
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 10:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfGBI5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 04:57:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42761 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGBI5v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 04:57:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id l15so16397243otn.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2019 01:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPdp31UDhXFHPHF96pwPoQJdgvKVE+Ch51jcPatIAZE=;
        b=aQtGriAGg6thGFg55QXF+XzTfWUz3+Luls6m8/c7WxlX6y9c14n+SuNXqqgVAEz1ig
         3TXZdQ4uMKdTjakUDmBY96qW2Z/CvtE6gF28JI6JzrNRzlaz6EyEI5Rf+Aqz0DrSdHbJ
         OjdZ6KGD03bpl+/PVW2MJ7H2kHRhCwk/c9OzSt1wpXYoSt+e+R16AN0QbhWgd5C+WfgN
         MplYa7FnxpymHeOMALPWvCucOJLr8uS8KhuIrgAAPKcPe/YDLBK2E/NajxqTlZTIo19R
         s0Rpa2GO5wJ1/DsqLXo2jeoCVfjdWcYz5KoLKMjYiB7PeepoTN+A+a/vzRAuB6fQ8eIv
         +i5Q==
X-Gm-Message-State: APjAAAVyf7CwEDXDuSeSn+0gNqySOLR4CTsesz/1xY+7T+ZxDSX1pZZB
        E9ccKH/mc6p4GDhQvWkSnMEbNPVvjJtHloXmNA4=
X-Google-Smtp-Source: APXvYqyUtHMNDxfrXFzOq+tZrJAEALoWsfCJ/SvSccMFZtCQWjU1KrI34Wl7Fw6scnjhNChjBk9KaqX5fS13sng+Mqw=
X-Received: by 2002:a9d:529:: with SMTP id 38mr19987430otw.145.1562057870358;
 Tue, 02 Jul 2019 01:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190624105224.23927-1-horms+renesas@verge.net.au> <20190624105224.23927-2-horms+renesas@verge.net.au>
In-Reply-To: <20190624105224.23927-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Jul 2019 10:57:39 +0200
Message-ID: <CAMuHMdX2c9QCitfzFeKG2BFoK0VEp9+KUiN=OVV51=mR=kNd9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for DU
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 24, 2019 at 12:52 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add CPG reset properties to DU node of E3 (r8a77990) SoC.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
