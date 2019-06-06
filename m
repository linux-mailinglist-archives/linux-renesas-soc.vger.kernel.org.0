Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3702A374A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 14:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfFFM5p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 08:57:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33406 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfFFM5p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 08:57:45 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so1932050ljv.0;
        Thu, 06 Jun 2019 05:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JHuiuOmHwsLXePWHxJIULBPmX2SbLPdZmrPZIxex+tQ=;
        b=A56Oa9zBovdpummUNGlkFfAshOZ5OOih06uE8pRUig5BeqP06txgoX5LvC3xX6abW2
         EQcgOcKMzMWsKXa6VERP6Yums87ayiXDxmwtGxugrregewxCcR3DaoZRQm+j+7F+V2D1
         FmtZcMKDipNx35jiXMqxzsOgNfW+TAYSy7r8i5pPPWF4mIQioX5Om3MTE77qmy5d/8PB
         NVLkizuWBLcW6dMCvVCN1HVR307GtjWk0dwJqIeuGLLyMgZ2i0Sysehbd3AUzmgMGVrv
         dfvZ6URtrh7oG2eyEZ+CTMsr2QdSC7iRxfTZVX+N5j4fwpHawZx4/16PuINu2qtUqWtb
         3FPg==
X-Gm-Message-State: APjAAAUV6KWyR5zoDD83dQH1lka2FN3g0pUMoPPdLxTpgxSg1l/r9ARx
        bZezJSe1Iog9GxP5REHbP/+RmNowWcIMf2UP+0QKeg==
X-Google-Smtp-Source: APXvYqzsgFOK8beJfDTRUEcB3Q9AmEAOEMiyfCWa4DQvdplPOyupYmAHtifpofdmsIO5Ajsv0+aQJLVyPLDlVVbgxH0=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr24205526ljc.135.1559825863186;
 Thu, 06 Jun 2019 05:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com> <20190606113537.8869-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190606113537.8869-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 14:57:31 +0200
Message-ID: <CAMuHMdWe+PeOOw-PmuxLQx2gbzV-N19S4iN5T2rWctdYt39-1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M,
 and V3H
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 6, 2019 at 2:34 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Our HW engineers informed us that HS400 is not working on these SoC
> revisions.
>
> Fixes: 0f4e2054c971 ("mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.[012]")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
