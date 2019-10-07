Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6BCDC73
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 09:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfJGHfg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 03:35:36 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43389 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfJGHfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 03:35:36 -0400
Received: by mail-oi1-f195.google.com with SMTP id t84so10781022oih.10;
        Mon, 07 Oct 2019 00:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vC7dAYfXwJKhiTI/wvNma7+9JHZprD9j7d4aco906Rg=;
        b=mKxmAdmiHzmAO+V2k0+IwDN0geaOOrgL+UnFDBSmDRmtud7svMKsL8tVUeS3mgWGZ+
         FZZVZVyLfOquZptOtKa/cMaazih4wckLlkIWHz9YjIaup/T2Lep+2NDWR1QUdSmPF5x3
         Nho8rlkF4BL0Vh5wbvUpcnlDyvlgeW8vps/Cp3/WCSHOgxXKmdW1Kemiuy5oWKDzM1g7
         ZSvY+XZbmSDKzf5Iu2YoaGnCeAkYENjxEt/KdYHGrkLpS8VltYkwl4BG4XubCCZqxDUC
         Lf8o+y8PpapoAN+n6S5HunQB6bFCrgys8z6JAIaL5M40H4uISTj9IvHFIkpRpubB3Tkl
         pZbQ==
X-Gm-Message-State: APjAAAVbya6pOmRfDh9XCQnzx8v2q8xE4rsvl2S1ceD9sGJlAd0/7271
        ngFnblbXoUZd8W8AYmrmeUuH27/ubVxlknG3KSxlFGYI
X-Google-Smtp-Source: APXvYqz2xsowCyv7BriFiCE5eWCSUyFySeTWPsmMojbahQ43q5zsM0Wz1Yn++ZwgA8+zcnB3RXHRWT0R0cHyrvakUFU=
X-Received: by 2002:aca:b654:: with SMTP id g81mr16278742oif.153.1570433735656;
 Mon, 07 Oct 2019 00:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190830062924.21714-1-hch@lst.de> <20190830062924.21714-4-hch@lst.de>
 <CAMuHMdXxWp2=9n2LQA9KVH_ArOUnY78ZoiQ7ZsDMbTOGsEz4hw@mail.gmail.com> <20191006184541.GA4110@lst.de>
In-Reply-To: <20191006184541.GA4110@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 09:35:24 +0200
Message-ID: <CAMuHMdVdw8QGet8JxVPM9JOiQ1OG3rhbB7ha=mEQ7BdYGs4+gw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dma-mapping: introduce a dma_common_find_pages helper
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-xtensa@linux-xtensa.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux MM <linux-mm@kvack.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On Sun, Oct 6, 2019 at 8:45 PM Christoph Hellwig <hch@lst.de> wrote:
> please try Linus' current tree.  It has a fix from Andrey Smirnov
> for what looks the same problem that you reported.

Thanks, confirmed fixed by commit 2cf2aa6a69db0b17 ("dma-mapping: fix
false positivse warnings in dma_common_free_remap()").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
