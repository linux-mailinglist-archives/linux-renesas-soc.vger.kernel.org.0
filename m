Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCA4330983
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 09:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhCHIkZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 03:40:25 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:36651 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhCHIkJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 03:40:09 -0500
Received: by mail-vk1-f172.google.com with SMTP id q17so1967825vkd.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 00:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xs5Zp+KNREeXUIxq+I6QcvzeKb8gMk7vRdpyXnbi8nY=;
        b=DEAZSXFfEOT4hztKLUwlapY879mMF66lHaCPcwlKKPfZ29FJ5Ixa3YuRQgPhGn0hW7
         qDdog5ODmIqAloBuf2E0SLBjBpdKd1XQn6xvmGSqSStgjlF5F7+3EIIEjbzfOFlvyABz
         ufV7P0Qp/ZAsIKZ5E4jMfcVrVxSeeWEmnuoRTiJ+8Vz4J5QEL+KLSduPFLBDQz9JM90i
         CWV7/mncnCFbMa8rQSoUXyto1S3ddVsCrCvYRhUGuzbmxrSEQgO7RwAtcGcankQEDeKw
         AH1AwjIa+m2BUeGSJAg1FXR6Tb4ltg5InKFG+Hjhz8jAzOViIXxwCJl6wLwKmom31PjJ
         LbXg==
X-Gm-Message-State: AOAM532++zGXblmtEFBhfLR/fazcewe1IuT9SzI4EAAFERoNNVl9qMYU
        HDzrk8r8jPCJn7km8vDitbrEworqZFv24nLGjS8V9MJY
X-Google-Smtp-Source: ABdhPJw3IihGdCTYJ8EVBICd51XovzlszCR3Rvb0OkU7OKsDcd+iBZXWOiJVGoawW/UHFBKOviPESq7fT6ONBAgyerI=
X-Received: by 2002:a1f:1a51:: with SMTP id a78mr12145048vka.2.1615192808940;
 Mon, 08 Mar 2021 00:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com> <20210305143259.12622-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210305143259.12622-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Mar 2021 09:39:57 +0100
Message-ID: <CAMuHMdWobWbbxw_Y1QnhLwCZJB2VOMjEFx48jukWkYPext02zQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add TMU clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 5, 2021 at 3:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Also add CL16MCK source clock for TMU0.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
