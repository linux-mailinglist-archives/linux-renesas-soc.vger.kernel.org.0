Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C351D45C914
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345498AbhKXPql (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:46:41 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:45002 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345467AbhKXPqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:46:38 -0500
Received: by mail-ua1-f50.google.com with SMTP id p2so5929018uad.11;
        Wed, 24 Nov 2021 07:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeCELLhZddPbGo/98TVOrh1kr1uHyaU/l/9VlHXOcLQ=;
        b=OInSiMMrugvMzT2J4aAIagsfPfn+GAFNHPp0va8d2YCk1+NTgwDslZCADZphgMtMie
         YbsP9BJFY/AJCMb1kNq0iAtJ+olOHp4NlZt2bhhg63adXr1NJZdpUVbvk8iVe0Oav5X7
         bBRi3twDFLohU+wQ93UbMfZyizdT433kiMgwDSAlWOi+ASms3d2tDsjIlZwKWzu9ovIb
         cBpdH/A2GILlYYux9qr/r6ipxxVMu4ETGl1ypQQUxYmPDpY0HqjwrPcdISiMKYYqBgy2
         VOroPPYqo9gV+y78on4118RbgdkSTChSVAcUozpAm+V0MXryCglggLhUFI1OkKQdB4Gr
         3nQQ==
X-Gm-Message-State: AOAM531UO6SUQ93R3icVCDANdpFg3bPMxRC3nFd1PyvqkIqsHk37Xuaj
        yQ+CVsZjtnqWGHxRM4+9j+PRl7WA1ItbZQ==
X-Google-Smtp-Source: ABdhPJzfhuznJoFqsd0KjsZEmynczAwpVdXMwNqgMFkXsTI+khCAWXqi/Eh9Bi0KliId80znVyiicQ==
X-Received: by 2002:a05:6102:3ece:: with SMTP id n14mr25502776vsv.55.1637768607609;
        Wed, 24 Nov 2021 07:43:27 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id r20sm57503vkq.15.2021.11.24.07.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:43:27 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id q21so1813867vkn.2;
        Wed, 24 Nov 2021 07:43:27 -0800 (PST)
X-Received: by 2002:a1f:fe0b:: with SMTP id l11mr1251215vki.34.1637768606934;
 Wed, 24 Nov 2021 07:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20211117103850.28397-1-wsa+renesas@sang-engineering.com> <CAPDyKFp=hMOY==VXhOh_KssKE5wWe6AnsNcJ2VdP+GVa-m5LGw@mail.gmail.com>
In-Reply-To: <CAPDyKFp=hMOY==VXhOh_KssKE5wWe6AnsNcJ2VdP+GVa-m5LGw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 16:43:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+qp=yMHQ--phfRVt3vaLcwEzcA1+BUfgc67sRuTxUVw@mail.gmail.com>
Message-ID: <CAMuHMdV+qp=yMHQ--phfRVt3vaLcwEzcA1+BUfgc67sRuTxUVw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify an expression
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 22, 2021 at 12:38 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Wed, 17 Nov 2021 at 11:38, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > We already have 'quirks', no need to go via 'priv'.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks, will queue in renesas-clk-for-v5.17 with the other MMC patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
