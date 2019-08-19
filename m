Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5D492524
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 15:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfHSNfs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 09:35:48 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35367 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbfHSNfr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 09:35:47 -0400
Received: by mail-oi1-f193.google.com with SMTP id a127so1293742oii.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 06:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k/fuThg5hEu4hmNaw8Txbmgb4RMS53eN+LaZONc5bcg=;
        b=XlgPqLgewJxLvaOnZXUw87+Q4wPuRVRz3gWQGhn0FWEABkgHAUNJi4MeLvHLJ3pAb0
         jDirWHp3HtWn/LE1cNNvLoVCSf7oy/5TdcEOCOndLsP2oBpiqRkj71RMsiN6Tgdrbm6U
         sqNOvrihcienl7e638mkl0wLG1LKeV3170xCun+3SbRl3NyU7PW+lTfvzIFx6gp9Qxym
         CeNVhhkHytuRdcrcVyJ32EiqLNiMk1HBc8nYmB7jWmFCJf/O7xLHMOfozhmkXCCa4XRy
         fUJotQ4SHWXgGffgPDm946AZtTVtQJl1vHWhuv2JoF39GJqYj/AowVgF5Bnq/WUg4OoJ
         NufA==
X-Gm-Message-State: APjAAAWIZlrq3SmfkcCpx9K4KPaz9m4Q5ZpvBFxy9pE7CXUke996EqKk
        6/qjQ6x1d62umQkKnaZo3LS4fXLb5OZ3WMca3J2/B8ll
X-Google-Smtp-Source: APXvYqybMYzKVWu8kfRt3K7leGmW0ODgvVyoUtcC/AznKkbzNeibD8zrL8AvbC6SsAKwVYvbSpAQxjou3bPYZsczUtQ=
X-Received: by 2002:a54:4618:: with SMTP id p24mr3548347oip.148.1566221746611;
 Mon, 19 Aug 2019 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190729080356.13023-1-horms+renesas@verge.net.au>
In-Reply-To: <20190729080356.13023-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Aug 2019 15:35:35 +0200
Message-ID: <CAMuHMdUmYqBmKVg=LDO8YJ6K3xeyVz5N6o01e5wCh2JrCpJUkw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to 100Mbps
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 29, 2019 at 10:04 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
>
> * TX clock internal delay mode is required for reliable 1Gbps communication
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
>
> Thus, the E3 based Ebisu and D3 based Draak boards can not reliably
> use 1Gbps and the speed should be limited to 100Mbps.
>
> Based on work by Kazuya Mizuguchi.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
