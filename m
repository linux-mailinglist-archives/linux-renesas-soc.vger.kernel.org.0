Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2AD493E71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 17:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356177AbiASQjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 11:39:23 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:41587 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344617AbiASQjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 11:39:05 -0500
Received: by mail-ua1-f52.google.com with SMTP id l1so3695933uap.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 08:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NGEJXJkbgkvVlVv6fOgKTSybwOxGDrAAlMuKicegYfE=;
        b=GpScAxRecN84pEK0aUlaxsQp5NtfPCqRiacLkfELDvwHtd0EfQSSk2fc2U/jUX4vJ5
         oc5qUdWGfgvwxWIP1Xxh1lHtJl3tt6bVCLRxB1UUsJZYdgHy8HkpdcH86KZlERvfNe8o
         aTI01XyWCQ4o3m0QDQZbXJ9Xxqk+9Y8QXGObir+7QxGwJJcbnai0GJSVOVT3dWZJ3/Rp
         MQRrxM4P7kPWlt3FZThc6SnLb1qvITOarAiXwM5j4snyDYXFrxVEGyKC/HU406Lj/XIy
         /mDBxfbxnnU8Z0cDq/OPhtK+qOE/w5NYtwyrfr6eUUDRPsrVZ1YkXBjZj+NU2PyYwLWS
         1twA==
X-Gm-Message-State: AOAM530Y8B9s7uAJZ95v2K4TYlgiK+1uiGoOOF8C5+h+X/xGnLtOoWkG
        QTTrkRVSkpBML82MasS3+Q6VoVswhpPUkA==
X-Google-Smtp-Source: ABdhPJzPBSaTP9UJdicZ9SjObztd/GneQcZSb9I3zrW2Gvi6nqHlZLe7abhBTEaLvxjcjaZn4D8d5w==
X-Received: by 2002:a67:df84:: with SMTP id x4mr11939823vsk.84.1642610344348;
        Wed, 19 Jan 2022 08:39:04 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a191sm56501vke.7.2022.01.19.08.39.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 08:39:04 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id n15so4060809uaq.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 08:39:04 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr12553687uai.89.1642610343777;
 Wed, 19 Jan 2022 08:39:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642599415.git.geert+renesas@glider.be>
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jan 2022 17:38:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJd1SJ35Z6RgdDmtjO96OGrscqPXPRURkdrY7Ai49wZg@mail.gmail.com>
Message-ID: <CAMuHMdWJd1SJ35Z6RgdDmtjO96OGrscqPXPRURkdrY7Ai49wZg@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/15] arm64: renesas: Add-R-Car S4-8 Pin control support
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 19, 2022 at 3:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds pin control support for the Renesas R-Car S4-8
> Soc on the Spider board, and enables pin control for the serial console.
> It is based on patches in the BSP by LUU HOAI, with many changes on top
> (see the individual patches).
>
> This series is marked as an RFC because of 2 reasons:
>   1. PFC register banks 4-7 do not seem to be accessible as-is using
>      either the Control Domain (0xffd9....) or Application Domain
>      (0xdfd9....) addresses, so currently you cannot configure pins
>      controlled by these banks.
>      How to make the Control Domain release the bus guard, so the
>      registers become accessible?
>   2. It this has been tested only lightly with remote access.
>
> For testing, this series and its dependencies can be found at[1].
>
> Thanks for your comments!
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/r8a779f0-pfc-v1

>   pinctrl: renesas: Initial R8A779F0 PFC support

Unfortunately 04/15 didn't make it to the list or lore (too large?),
so you have to grab it from git, or ask me for a copy in your personal
mailbox.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
