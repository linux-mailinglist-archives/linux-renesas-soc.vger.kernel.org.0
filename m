Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE5464B8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 11:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348623AbhLAK2n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 05:28:43 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:40783 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348557AbhLAK2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 05:28:42 -0500
Received: by mail-vk1-f180.google.com with SMTP id 70so15722649vkx.7;
        Wed, 01 Dec 2021 02:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0MIL/uGlE5FPfljZP1Bvsl14N/LMmbj8yFdD3KWtcQ=;
        b=yGvhcY/wPFRVKlQu+0fSrdou3GnvtYx6AiQjhIsAO4MGzCzJcrofehrOaqa/oph8Fk
         46VyEti4J7zkao9Ty4mnyLfrxUp74CvaAn3itXAsbtzjcRjjKQLmmxnhWSMhK7rvAQ8P
         WsRCaZDJ81KSqRMXEiC3X5lIpiEwaX+g0CeRJP51vRyWxccGJfZIlJDFSKda7w7/R4OE
         gDkjycLDSIbnmbq+dXy3Noec7N4PpdAKVUKPj62DGMWozUcimjOJRIzrhA6jjzSDJdsm
         6Phd75O/Z59IBO6b6G0HVAegA9jCqAbovDxzIp2+DjN7K2uVhs+6rnmMESoSQoSBmZMi
         gtAg==
X-Gm-Message-State: AOAM531BtSKo0lu5Q6sLosJgPrAWpfQnHstjRDmViQv+SdAYP9IY81qf
        4EKZYb6+CnbDE/5nCgFwCdYdGuqcf7++4w==
X-Google-Smtp-Source: ABdhPJxjAn39xoTYMNT8KyVNUrwKzve48Ig4+e4ksgOqMH/50wzagHbI+mJBTeMBrKdJBbumAq8qIw==
X-Received: by 2002:a1f:e1c7:: with SMTP id y190mr6388260vkg.31.1638354321750;
        Wed, 01 Dec 2021 02:25:21 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id j126sm11447653vsc.17.2021.12.01.02.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 02:25:21 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id az37so47784223uab.13;
        Wed, 01 Dec 2021 02:25:21 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr5937649vst.68.1638354321508;
 Wed, 01 Dec 2021 02:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20211130132309.18246-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211130132309.18246-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Dec 2021 11:25:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoBET-UKPp3x_HZ5iMKv34D4daFFBCeMuV_WdVv5Py+Q@mail.gmail.com>
Message-ID: <CAMuHMdVoBET-UKPp3x_HZ5iMKv34D4daFFBCeMuV_WdVv5Py+Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: initialize variable properly when tuning
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 1, 2021 at 7:43 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'cmd_error' is not necessarily initialized on some error paths in
> mmc_send_tuning(). Initialize it.
>
> Fixes: 2c9017d0b5d3 ("mmc: renesas_sdhi: abort tuning when timeout detected")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
