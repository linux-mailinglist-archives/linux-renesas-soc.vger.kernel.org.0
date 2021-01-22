Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FD0300074
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbhAVKfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:35:52 -0500
Received: from mail-qv1-f52.google.com ([209.85.219.52]:45018 "EHLO
        mail-qv1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727908AbhAVKcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:32:33 -0500
Received: by mail-qv1-f52.google.com with SMTP id d11so2382409qvo.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 02:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eIVeelQ3mqNO4zm82oN04IB1+FI+GAjyZVdOckAwxYM=;
        b=Eiw7jbg+MHFamkut/bwJceUVZQtSQ2xdcjUsLSCwM1eA5/F85UYHPluplSh1nE/Pxd
         LzJ7j7Z/3hXfZXp7lPyivz1xvzrCwrlF+Z41SRvW5Nd9F5cc7o/hux5Dy/OhJTw2bp9L
         HICB8mm9sL7NtAA6nuYXYUAGbG4zLeFBPcvQCEcNS1Gh9aKgibZYc9kTajrffyIaXF8w
         OkQK4xLVJ2zRJ3/xZWr8D0DiNftXkvQ3hWGFr1TOrmu4FxFMpPEkLFLmlaf9fZGrXDTj
         QksIZvQRTrti1IXeIVA3YDyXPeRIczIXGgQCC4OJ66sh8eI0DUNIxaH/aAegW00YHgEp
         /JAQ==
X-Gm-Message-State: AOAM530gwHShaM7kOHD8OKW/+kcdxwBLmi3ek32iLDH8BGi0Ou7h8tR2
        h11a6hhMqDO0BR48xGvGbL8b61pkN/GS4AWPHHAQRIgtoJo=
X-Google-Smtp-Source: ABdhPJx81BMMYbgtge7Jjl5Pq6P+VeAzmzHufsnbg4GKa9GY7gxa37rB1D0rU9b9If3emraImi742a9ApQVODmjRwps=
X-Received: by 2002:ad4:43ca:: with SMTP id o10mr3845886qvs.25.1611311513082;
 Fri, 22 Jan 2021 02:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20210121103830.9575-1-wsa+renesas@sang-engineering.com> <20210121103830.9575-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121103830.9575-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:31:41 +0100
Message-ID: <CAMuHMdV=RYfvf7sJxc_F1d3PUDtQPr0ROfqkTbf5quVaZ0LXqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add MMC node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram, Matsuoka-san, Saito-san,

On Thu, Jan 21, 2021 at 11:38 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Add a device node for MMC.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

ERROR: Missing Signed-off-by: line by nominal patch author 'Takeshi
Saito <takeshi.saito.xv@renesas.com>'

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
