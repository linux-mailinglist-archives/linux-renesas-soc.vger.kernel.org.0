Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEF3336F5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhCKJzD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:55:03 -0500
Received: from mail-vs1-f46.google.com ([209.85.217.46]:45241 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhCKJyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:54:31 -0500
Received: by mail-vs1-f46.google.com with SMTP id z65so10351434vsz.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 01:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJYYxV2OjFbZbLBZ0NiYulkVr/IOfC10zf6Z7DuEY24=;
        b=eaKwlDfLkqoSaKIXcpxpS+YDvPCV8bgPywMIKmAXbDWzXzWbnimQM+WAB9H84/+60i
         Mxfqt6wvNJvg2p11R6d002m7+X7g0bx+5hEgPGDvP7kKHe98o8SvUnrPW7015TMyYlCF
         EvAxA5LBqtPjIn/NZAJtw5gUq1vwIyc80WY2ixajy0qxiGBzRci9dr/90f/xXExXqE2W
         ZIO3ib7qTbWCAKvAuurQw0JJqjcB+HqLFywwSdRn1QbG14gD4h9wEjJ/+C/ycUNOdBc2
         iVunWNJ2u/DfTL6d1/RBz0aEZ5Wd5z+FxKPuayl92q9+ukhD97cqTW3wphtvaBIUGz6L
         otqg==
X-Gm-Message-State: AOAM531vz9kmKZw+Fyk48gBJhhuKpiVqr2SGml7c7UW3a5ggC70aHFR0
        e9Q2sDNi36XhgOGEGJvKTiQ5QvB4QyA4mP3fhDg6xHvt
X-Google-Smtp-Source: ABdhPJy/mxQCFn981jwQJn3XewIz9E9KXi+ynqN1BmLcGy0Y02Mfvfag2hpXn5ocFAtQGHBYeaAVOO9cQUhwv79zSsg=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr4769008vsp.3.1615456470985;
 Thu, 11 Mar 2021 01:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20210311092939.3129-1-wsa+renesas@sang-engineering.com> <20210311092939.3129-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210311092939.3129-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Mar 2021 10:54:19 +0100
Message-ID: <CAMuHMdXSK0UoLToWVHxGMZ1iWAqM0uc3BHGbW5sT5bk_jzbdfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add CMT clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 11, 2021 at 10:29 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
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
