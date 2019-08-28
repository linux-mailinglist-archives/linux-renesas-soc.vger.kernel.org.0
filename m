Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E765A00F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1Lsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:48:46 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46098 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1Lsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:48:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id z17so2389383otk.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2019 04:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blWm+1iLq2mYqLMSF3V/t4frrmrUbKWQZYAYC+1kt5g=;
        b=EH4BTd7x01GV4fmRAf+xzraOanOnoBeK9p9vOuFHMWCeyccYLYDcO3nf//lLpC3uaT
         1P+/FikAKsbs8+nQuYn1poN/+psuUD+U5N/wE2OL82+UoCJzMoofeMssG++fAGSDHiO/
         e5IIcHmhmuRUpHVu6NUus5hrM70ETkBUuW6yq9hw220SuwCbAoRmwQvKQMwXZDSY9BV/
         nSy/ZzCXO9idyW5U91vp5d2yt+YWu7YVTwlKPJI+tMn186IqG4zf093dwPbMBTGYn1Ag
         aZEZ22CTFYVbcqk2gv+AhETJjDEGUpPi6lO5ghKNtUvJpNC1jt8/81+A4A1J/kRF2QJg
         rP3w==
X-Gm-Message-State: APjAAAVUv+xWnyiPZKZZLufvEXofRR8jOATA5a5qkzhdspAaXlVRCyti
        taLLbZNdlEwhTXXnRgL7zr7l0hLJquD9J1TYw2LKkp3T
X-Google-Smtp-Source: APXvYqwjC/F3KCQpG5aXEbKQy0o1hPADAyTN7ofO5cf9PtKMT5715AXCQZD0Dg6Pl9Z6HhJZUHotqEtdF2sU+KK468k=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr2869732otn.297.1566992925690;
 Wed, 28 Aug 2019 04:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu> <1547808474-19427-4-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808474-19427-4-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 13:48:34 +0200
Message-ID: <CAMuHMdUDMHwszbQL=kkTpiiVwm7L0d93KGkaBDuw7LAQM6N2tQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: r8a7796: Add cpuidle support for CA57 cores
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
>
> Enable cpuidle (core shutdown) support for R-Car M3-W CA57 cores.
>
> Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
> help to keep the performance and reduce the power consumption.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [dien.pham.ry: Apply new cpuidle parameters]
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
