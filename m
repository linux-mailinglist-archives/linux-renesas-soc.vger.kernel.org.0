Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7500447BB7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Dec 2021 09:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbhLUIKO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Dec 2021 03:10:14 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:40759 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbhLUIKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 03:10:14 -0500
Received: by mail-ua1-f53.google.com with SMTP id y23so22264844uay.7;
        Tue, 21 Dec 2021 00:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKbsUsTWg5rR37I9v1ro7oc9SV5nTeoertYyKpAWEiI=;
        b=aVloi6JHVrmKJ7rdCXH8SI0VeR57hifRtNN0/SXniBP++Z+VT43uuppBdaioAMo8L8
         wPOyu8iHSllSmpI/dKVLJ1LF7mVmCPBR835fDXseHXs+SjDSWeKMexH+XHJqka1I+iJV
         DECQFSaR8g3TYA7/6dQWxSR8D4R74ACp/8fK+NKXmycDh63NFjzNye7qz/n1Q+VZfyHu
         aPDPU/VFfL/eYUawOPzTJDMPD5gi2AUI7cMpIdtyb0xmqwpCaZ6B7qDZeTreRvQy7GKO
         iOagRRZj3TyApKQdvXxoMKGeOqZsUEuifHYj46L1wenyQiMXt2tEb4NskYGKlxoTsE7Q
         hHXg==
X-Gm-Message-State: AOAM530LqEUmpwWk1qEe0ehyS0UFvCzO7RRNbmbOEAum46lsOdtbZGmf
        uGzd5gursW8rAZRMMH5jUozUX3JW12H3OQ==
X-Google-Smtp-Source: ABdhPJyz/UDz5E1/agrjv31fPxfaJfVjXpvzLImApt4ylVnG6f5Dh27nyzAcSwzzZSelRuqV+XyKYg==
X-Received: by 2002:a05:6102:903:: with SMTP id x3mr798646vsh.41.1640074213575;
        Tue, 21 Dec 2021 00:10:13 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id p46sm3747696uad.16.2021.12.21.00.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 00:10:13 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id i6so22298698uae.6;
        Tue, 21 Dec 2021 00:10:13 -0800 (PST)
X-Received: by 2002:ab0:3b06:: with SMTP id n6mr101595uaw.14.1640074213057;
 Tue, 21 Dec 2021 00:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20211221052423.597283-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211221052423.597283-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Dec 2021 09:10:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYJ2NyZYHC-Zi=yC1dCNYiDSkqG04C=54mxKH4e14d3g@mail.gmail.com>
Message-ID: <CAMuHMdXYJ2NyZYHC-Zi=yC1dCNYiDSkqG04C=54mxKH4e14d3g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779f0: add sys-dmac clocks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 21, 2021 at 6:24 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add sys-dmac clocks on r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
