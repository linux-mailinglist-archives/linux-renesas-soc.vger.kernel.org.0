Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D00248276
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Aug 2020 12:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHRKDu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 06:03:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35347 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgHRKDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 06:03:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id 93so15832095otx.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2020 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0a3RkGZeXI4zrLgF0P5L30I2cxgivuA7R9sspZBNrA=;
        b=HAdLsGXGlu4cY9bw2rOQUR7JRhPxDo7XKsaNa9Ifnp/4XhzXRSPJF81K/Ulyup7KT8
         eJU6lXgR2eIaZeiMc415Fe5lqb+KYTC6kL2wXzaUsF7IWIae5NBx1gj71wpA7jyGnZlY
         MTHMzYiMlKh6y6jyTb8upEdLpPUVuUawvh7Yaec99WhsP5I8ck6+LZUaGagt7ApCeLvE
         UkbHnqSupNQIUR3e+/hiO4rUdzxObcf8u7BvHURwmq6JKFgNrVUvB17i7KsDvU8TTUAI
         ZhTDggjiWM9d6LneY/z1Sn+JN1bFygkL/IMvyXAmuexbxhHjVmmfvCc8Qo2xZwVHJ11j
         X24w==
X-Gm-Message-State: AOAM5318G3CVdm4lwnJYhfQIzjI/HPCCfP0RpkKuW4sZmI5U3dy1oR/u
        v8UoKWFwCn7EoOPozmvgaSPpDf2qyiFHZgHGDEz1BBG2
X-Google-Smtp-Source: ABdhPJx+ne11MAYP2Xnn/HS9Ciobv/KGJSw0mi7WuTBSCrNoR+iG6LRLAfYrUcy5a8IbEsu5dvsLfyuPnN2mXDTL43o=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr14711547otn.250.1597745027849;
 Tue, 18 Aug 2020 03:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200811140357.564-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200811140357.564-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Aug 2020 12:03:36 +0200
Message-ID: <CAMuHMdXqYH3WkXekUGFzYnLzFD2bSvA9p9M_dm6jH_mNuAAfJw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable R-Car PCIe endpoint driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Aug 11, 2020 at 4:04 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable R-Car PCIe endpoint driver on RZ/G2E board, including enabling
> endpoint configurations CONFIG_PCI_ENDPOINT, CONFIG_PCI_ENDPOINT_CONFIGFS,
> CONFIG_PCI_EPF_TEST and CONFIG_PCI_ENDPOINT_TEST required to use and test
> the driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Probably you want this in the local renesas_defconfig, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
