Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8A9300092
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbhAVKot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:44:49 -0500
Received: from mail-qt1-f180.google.com ([209.85.160.180]:44920 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbhAVKfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:35:39 -0500
Received: by mail-qt1-f180.google.com with SMTP id r9so3692029qtp.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 02:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIs0ctLj6Scyu8rQsE09KeMGGUze7WYd2d4sBHjiuNg=;
        b=CGyQV8eU7y20iEKEgA1rdFJCBZnRQaAEwlnmRuTAeWKMfpbgfd6phPTL/kPbwBjnS9
         GKy4jwa0jPNZi7inTBS3c1voeLt96oc9iwsyZxdEgDygXJYLYEH4qnvnK8AgZIQ1shkX
         EDGD0//vIKr+svygVRb46JTlfCVik9LLHwVPqfWu5RcsHGwcfjbGCUn/YpzvLVpBsjj+
         9oOYQ/xyHXNnkRLwhSLlpZyMJVK/OcRTk/b15fS2mGscX/E5nkSjBJLlstfGst8dW8NB
         xLaHzPX1CdEYItfliEsT37XuaPuC2lc4IsXDw9FZ7PjHbuUzvKqn4oEU85zh/LgVuH62
         UxWQ==
X-Gm-Message-State: AOAM530hbmbgB959IcgOuEFZpn4BiTRRs74E4bVKoPOYjqP2agwZwaQT
        poeqbLxmDCpGh+Bhz72nBXTCDOK5MkvlNz1ucI+9Z92Xejk=
X-Google-Smtp-Source: ABdhPJybL3hYDRNQAz5ULSjdPa/s/hPwV+xkj1HI0ZIqu0MJkYWCEWcYftydqjW2CwKG/DC2I65mJ3g5TNfppJAR1W0=
X-Received: by 2002:ac8:3986:: with SMTP id v6mr3620431qte.308.1611311697945;
 Fri, 22 Jan 2021 02:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20210121103830.9575-1-wsa+renesas@sang-engineering.com> <20210121103830.9575-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121103830.9575-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:34:46 +0100
Message-ID: <CAMuHMdWAA8bw338KsaT7ztnPo3oAWB_RWGSw=Lze11A+3_0D=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: falcon: Enable MMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram, Saito-san, Matsuoka-san,

On Thu, Jan 21, 2021 at 11:40 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Enable MMC on the Falcon board.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked, rebased, slightly improved, moved to falcon-cpu]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

ERROR: Missing Signed-off-by: line by nominal patch author 'Takeshi
Saito <takeshi.saito.xv@renesas.com>'

> ---
> Changes since v1:
> * improved node names for regulators
> * moved entries to Falcon CPU dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
