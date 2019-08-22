Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C57995E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 16:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731920AbfHVOJT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 10:09:19 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44708 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfHVOJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 10:09:19 -0400
Received: by mail-vs1-f67.google.com with SMTP id c7so3910368vse.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2019 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUyZ4pS6QDRrYD7/OgKLSJ4F0s0QH3uncXHgX+TQnrg=;
        b=J2wPxQ/a9WMhDf1CFQp8WHuH+AP65r3uox+5G+RNdZyar6jdqPGnnoZob4b7bkvjYc
         EZ+lAsWZEWo8U+lo2NIX5OgU9K1cd/c5B4HRtu16C4AheBUvL27tA+su6OX5SNtRIVrj
         spAQMQTxqFwy1YKHGk8EXMwJ5B1FM91kPZnaU7P0hoG2HzT9YzviEy0ZkqMN8Xnxn/mv
         6Dqf4232zj92TWdS+pY7TpnBdVPsMby0A2gTaoALeMLP9eqtdevSIOuWcSQcraXBAkQ3
         aQtrYJ8Tk/W+V/ZUwFgI5dvRRYFSCiipawNqnw/1fPap5Nf79TuGSQXVpPgz4Z5ITceQ
         TJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUyZ4pS6QDRrYD7/OgKLSJ4F0s0QH3uncXHgX+TQnrg=;
        b=Mg2iElKHrEumUO69O8nTe0ty9DKb9MQiyVndpgg1k74ycsrbhHKr2zDqSKfs4BxlEY
         U16Jdt0qOmA1gTMGKJrJkFbhDGODt6DyQSu3swiFSuD+Vdg2oczPpE07HawIdWP85RKy
         5qz4wxakYzFLBaw1rQDEKcel5N9px6HQfBsMEY41HpKW9eAF7tusF5Ay1zi2HxUnglff
         mTUuaCBNUdcEencWK72I9Vws8gYcfT64XWv0+4PZb462gjcX7kEjSUpwgmUXBlZafqER
         BwLesJQv8AmlHNMj4DOLLZ3+pRCIOCbUjE5pP0bW/NqLfcAGnqYIixSHBZYjrmy7Y+b+
         n06Q==
X-Gm-Message-State: APjAAAUkqNaOs70WrECZMbOCNe7hqgmHyM5/9cntywL+C0DIEt6Gnr+i
        uz2f5g2UpH9tkdSPKYW2KyDf+rtT2s379/A75ax6EA==
X-Google-Smtp-Source: APXvYqyUR2goIz9wG+ZfhXReB0qoJ10k0dEznLhIHuy+BpeyMY0qwcCnomsOUP7cY1q29r6Lh9mvmvE6ValwLk9UAAg=
X-Received: by 2002:a67:347:: with SMTP id 68mr19123154vsd.35.1566482958184;
 Thu, 22 Aug 2019 07:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190816125225.16061-1-geert+renesas@glider.be>
In-Reply-To: <20190816125225.16061-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 16:08:42 +0200
Message-ID: <CAPDyKFrxF26gmt3pxp32L6Bt=5tr1PLZVg1bsrjdWKiBqJWf9g@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: renesas: Set GENPD_FLAG_ALWAYS_ON for clock domain
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 16 Aug 2019 at 14:52, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Mike, Stephen,
>
> The Renesas Clock Domain drivers do not implement the
> generic_pm_domain.power_{on,off}() callbacks, as the domains themselves
> cannot be powered down.  Hence the domains should be marked as always-on
> by setting the GENPD_FLAG_ALWAYS_ON flag.
>
> This patch series that issue for R-Car M1A, RZ/A1, RZ/A2, and
> RZ/N1 SoCs.
> SH/R-Mobile SoCs are fixed in "[PATCH] soc: renesas: rmobile-sysc: Set
> GENPD_FLAG_ALWAYS_ON for always-on domain"
> (https://lore.kernel.org/linux-renesas-soc/20190816124106.15383-1-geert+renesas@glider.be/T/#u).
> R-Car H1, Gen2, and Gen3 SoCs do not need a fix, as these SoCS use the
> R-Car SYSC driver for Clock Domain creation, which already sets the
> flag.
>
> To be queued in clk-renesas for v5.4.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for clock domain
>   clk: renesas: r9a06g032: Set GENPD_FLAG_ALWAYS_ON for clock domain
>   clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain
>
>  drivers/clk/renesas/clk-mstp.c         | 3 ++-
>  drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
>  drivers/clk/renesas/renesas-cpg-mssr.c | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>

Feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
