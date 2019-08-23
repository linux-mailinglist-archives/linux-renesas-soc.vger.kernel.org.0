Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE2C9A930
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 09:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389284AbfHWHyx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 03:54:53 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33173 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732838AbfHWHyx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 03:54:53 -0400
Received: by mail-oi1-f196.google.com with SMTP id l2so6404272oil.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2019 00:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jhcsuT4HWVR0ij0vDmto77Em1fMfCnOVBcbQ2h94bM=;
        b=e0+pg+JjMD65YWHFkOv87lzKpTjchNuhxD45N58yuKwRyyE4hI1tWw91abcQEhrBDN
         2SbeM5AXOKmQucMG/HoRNYmYS15xQBemcEG1EpNiROxs2hG+7dQe2KiEBZv6giOQTlr5
         zZN7X2pxA133jtwgO2MEQhShkI2tRx2qJpYbOiA2K+7RalmZ9WXIFYtI+R3f5z1XUd79
         lJ/KV9Nvd6X3jMnRfz3j/tzzQuf14+fXATG7Lx75v9fEf17WkOsVtjlIC7aI5X8Qazty
         bU09/0RcGojPg/TiJ0byKd7+kSKuPvG7tujia5PtZ+Vwht8XtqnslA0bZiCe7qYsFgk3
         bpQA==
X-Gm-Message-State: APjAAAXy8ALzq3hOQbx00wEImLbZ+cMzgGIY/PC84AfSd3tsUavjxA51
        p7taCPaBm1Lcxy+AuLmKvP8Vo7BI04Um31HWaUs=
X-Google-Smtp-Source: APXvYqxtyE/Soksl8SGHHpKI4OqogmiIX8TDEfIj7BfXYuWbgdTf+T855y0ZdbyvDBbb2UoWE1WW++NYUHvlJZ+qxaE=
X-Received: by 2002:aca:b154:: with SMTP id a81mr2127382oif.148.1566546892415;
 Fri, 23 Aug 2019 00:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190821124602.29317-1-geert+renesas@glider.be>
In-Reply-To: <20190821124602.29317-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 09:54:41 +0200
Message-ID: <CAMuHMdWj7eCa9URtztqth=fYMn2uTHWDS3WAKnRvxDfMjjBH_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: renesas: ARM errata updates
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 2:46 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series updates the handling of ARM errata for affected
> Renesas SoCs.
>
> The first patch enables the new ARM_ERRATA_814220 for Cortex-A7, using
> Kconfig logic.

Queuing the first one in renesas-devel for v5.4.

> The second patch moves enablement of ARM_ERRATA_754322 for Cortex-A9
> from shmobile_defconfig to Kconfig logic, to make sure it's always
> enabled when needed.
> The third patch disables PL310_ERRATA_588369, as it doesn't affect any
> Renesas SoCs.
>
> The last patch is marked RFC, as I don't know the revision of PL310 on
> EMMA Mobile EV2, and cannot test it on EMEV2.

The other 2 are postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
