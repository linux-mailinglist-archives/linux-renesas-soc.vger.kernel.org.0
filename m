Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3170B112820
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfLDJpL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:45:11 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35194 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbfLDJpK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:45:10 -0500
Received: by mail-oi1-f195.google.com with SMTP id k196so6294894oib.2;
        Wed, 04 Dec 2019 01:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sn3GoKemI1El8JqS5twJQIiPYozPSCLpRDmsgWRhXeE=;
        b=QSXj24GLRgVW9wvJrrRK62IjJfxiJ0a00FubqTMRG4xSLUCO2Uot5sMeVk/uTnvNYS
         gcks9uCW2EzCR0ibuuw6wp8t5IUxca1yaw0LwqjqEjv4sPQhEv/o8SXkP/jpU98g/dmd
         7yUrwZuc2ccrBbh0PXPNsN0XNSGExB+AhJqzfMRr+qaPKuPZhar4NF9cxdmpre6L6CZi
         2EbwRWEdYm1JuqhIVE+E7vDHe/lq/Z5AsmZshfS/T2aCRfY4Q3BNEaX5s4nlpEVgGvFU
         ZmsY6sh434lBiW7UfQABDO//kz+oC5RUuhcRE7D8Uex4Hd8og/kfxpfro92OBlfyFS4i
         daMA==
X-Gm-Message-State: APjAAAXgc657NtNP3lDPYavdyiHE1vCBtrFtAIsLD/A5nn8FX+jAWYbB
        2niqM4L+c3ECHW35f+0qdulI8Mdoi7l9ZV0LMrk=
X-Google-Smtp-Source: APXvYqyFdoiX3QkSFz9a7pGlvBMc3HbT2eNIYjrYPMc28lbEuSNQAE2c130gjQNvc9b54PcXj+H0LOtgdY3vVpbi/ig=
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr113452oic.131.1575452709539;
 Wed, 04 Dec 2019 01:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com> <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:44:58 +0100
Message-ID: <CAMuHMdUnC=PM0iM7NwoeVLb2v=r4g-uUU3h4dBn9-St75fLyAw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Dec 3, 2019 at 9:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Pretty much like the BSP patch. Just some rebasing, refactorization and
> updates of the commit message. I especially changed the original
> calculation from:
>
> +               host->tap_set = (host->tap_set +
> +                                host->tap_num + 1) % host->tap_num;
>
>  to:
>
> +               host->tap_set = (host->tap_set + 1) % host->tap_num;
>
> (same for -1). Because "+ tap_num % tap_num" is a NOOP. Or did I miss
> something?

Since all variables are unsigned, this should be equivalent.
BTW, why is tap_set unsigned long instead of unsigned int?
And perhaps it should be moved from host to priv?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
