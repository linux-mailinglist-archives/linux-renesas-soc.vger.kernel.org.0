Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7483D94CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 17:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393172AbfJPPCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 11:02:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393123AbfJPPCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 11:02:16 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A129A21A4C;
        Wed, 16 Oct 2019 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571238135;
        bh=WfD3t0sOjn0IeRh/fxGxBgyuFYh2uz6Bl2g2olvFPCs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oVcWndIeLBrN1dxqtfaQdGl5ih419TuNLsVrvVkSNtG6HzaoxUpnbuGwRrcUSGPii
         Ltm5cEek/qy2eQgJ/wS062dHuO63leEnK9QAwK4U45nDTvZkYUM9LCkWo7to2tERKm
         gFBZgIXi6BfM5S/bLwAvaEers78yLTAaHJcia9eI=
Received: by mail-qk1-f174.google.com with SMTP id f16so23034718qkl.9;
        Wed, 16 Oct 2019 08:02:15 -0700 (PDT)
X-Gm-Message-State: APjAAAX+ICjvdv0/U+jbsQbPPDAEQ2AmdFx66z2WAo+RwCFus7vNrVdI
        8kB8vWdVoO7a94cwpRRWQZPElma5PgIZ16Jzlw==
X-Google-Smtp-Source: APXvYqwIgxUwPf/s3sC4AudetBNSqYxFoA0xPNh/UnC4v7MU1s4IRnaWSFhGgS/6m+dhMqCc0QMp0cOsku4Rj7MAdD0=
X-Received: by 2002:a37:9847:: with SMTP id a68mr4997426qke.223.1571238134770;
 Wed, 16 Oct 2019 08:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191016144747.29538-1-geert+renesas@glider.be> <20191016144747.29538-3-geert+renesas@glider.be>
In-Reply-To: <20191016144747.29538-3-geert+renesas@glider.be>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Oct 2019 10:02:03 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+t+JqeS9+xUb2Fv=_3RRKx=c1Jssn4U3SpWu++zECfGw@mail.gmail.com>
Message-ID: <CAL_Jsq+t+JqeS9+xUb2Fv=_3RRKx=c1Jssn4U3SpWu++zECfGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] clocksource/drivers/timer-of: Use unique device
 name instead of timer
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 9:52 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> If a hardware-specific driver does not provide a name, the timer-of core
> falls back to device_node.name.  Due to generic DT node naming policies,
> that name is almost always "timer", and thus doesn't identify the actual
> timer used.
>
> Fix this by using device_node.full_name instead, which includes the unit
> addrees.
>
> Example impact on /proc/timer_list:
>
>     -Clock Event Device: timer
>     +Clock Event Device: timer@fcfec400
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  drivers/clocksource/timer-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good. One less device_node.name pointer use to get rid of. I want to
drop it from the struct and stop storing both node name strings.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
