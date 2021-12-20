Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3D747AA8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 14:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhLTNpg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 08:45:36 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:34349 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhLTNpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 08:45:36 -0500
Received: by mail-ua1-f53.google.com with SMTP id u40so17766351uad.1;
        Mon, 20 Dec 2021 05:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJw3cyJ8k/4YHSGpDPD9Z0mavKv58iiY4K5hLsqozzY=;
        b=qmJ9GMQBoXYRy2aGC2vgTmB/CStWwVd0u07IB4/Eq1Rw7ul4e9LdBlPs9KwnzVbKbB
         VbvRFCq74H+hcu6G6t5jCfEiaXmHvrMkJUDJ3kclKzTdlEsagpC9nZcXUcs2loeGpe+x
         yCJXwhZB3cczjCJYVnalGKcpKFsRaAbeIyjRllGRHz//ojR0ddAAa8p0Xm0D5otamsWp
         71S2dLqzCCWk+6k1iK9rFrKP0xHeA6CrsXo2U4uEsww1EEHruuuRPBQUi9SIZXVbWzcm
         GPTkqOAbBpo7QZc1Vc+G3ej2bZcLWkkhvxUJ475Y9TRnI2GmTLOY8/OM3dMhvazkBJ45
         wZLw==
X-Gm-Message-State: AOAM531iY/z6r+c00ZAdVjJAUd3ISlMUViW0MhQ3sEdKTBQPVNwc0fT8
        jITWTikbP/0Khgd/Ui1QWWmnXFdmz9DpIQ==
X-Google-Smtp-Source: ABdhPJzGE+oupSInNZhK3RhiY+NCnI4mrbtc/KH0zXD6uRs5rP1tRzu8v2h6xFrBzCvWe0NJwrYYyQ==
X-Received: by 2002:ab0:784e:: with SMTP id y14mr5138977uaq.43.1640007935779;
        Mon, 20 Dec 2021 05:45:35 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id f125sm2582646vkg.27.2021.12.20.05.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 05:45:35 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 70so6139561vkx.7;
        Mon, 20 Dec 2021 05:45:35 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr5441086vke.33.1640007935247;
 Mon, 20 Dec 2021 05:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20211216160721.203794-1-julien.massot@iot.bzh>
In-Reply-To: <20211216160721.203794-1-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 14:45:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-92ra6ZTqcDsY1HqaHvOwWitD0fPXDvpxkk9RFSqwWw@mail.gmail.com>
Message-ID: <CAMuHMdX-92ra6ZTqcDsY1HqaHvOwWitD0fPXDvpxkk9RFSqwWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: rcar_rproc: remove trailing semicolon
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 16, 2021 at 5:07 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Remove trailing semicolon.
>
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
