Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2734A558B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 04:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbiBADSi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jan 2022 22:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiBADSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 22:18:36 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE263C061714
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 19:18:36 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i30so14621264pfk.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 19:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=7ym4guToR5s6XJh+Gyaw0SuEv+LKx7FC/++SseskIfM=;
        b=E++ef+Q5iBCT3v/I5Xsw8Z42hgWOa0/CD59TDIXkDMY0W82NoIdVaA2wlQHAOqNgPW
         HVlfHK7n3vd7hCpdQvMsLK+QRFDHf+nMqZyVlPoR39FJ9/sq7mok7WbE7LsSq4UA96gB
         y4d/Dw5IEj6UGsD60pfH56R5yEmEtlkHe/oa+JG1q70MRkM214E+Q2ZVc2fM23xLE0Rt
         nhKk1G3dW79j8cHJpcnHjsPzWteJo7l2qH3qiSzZnoOBl9BjPaFQed0VBv+B3JHC4XOO
         dXEN0f2BkRCdaUQwNKxUlXgbqy2rWF2PXQUOdD42KKaisUfUC2EeMsCfLbv2tZHgtZuT
         824A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=7ym4guToR5s6XJh+Gyaw0SuEv+LKx7FC/++SseskIfM=;
        b=xg2XHD+FX+8Whij7o+u9x1HOBzv/vWyLrwI7B5l7hWb0jvm6zNgmpnbsCA0n2f02A3
         v69oNYCKIpcgly3SGK7oehfOfo+1GXIayeIb6AB0xCzteuXiiS4/q5Iz6aXDAAb9+/Ds
         SMrKykPX121y4gg90ann4tha3prc20BQeNwODp5vWvuKYJHh1F8hdP2K77s7PvLQglbD
         u2z5voJ+imgfcEDJLx2S5lBer6CYN9H6U75cZyba6RBnVcYXltg3ROsJ1c1uXPSqgd5i
         8PEKkGZsUQRkFBzAJNSMKYrnYhJtF/j8sqsWrUMblzbnHeLcsA3tD7ZYXrtq3Sd3ywsR
         d+HQ==
X-Gm-Message-State: AOAM533aJE+8/6k5WVhjUtnsKbYBWu688Q+9tJ+IMARnEE0mXJiHZm9h
        0LCuwpzqBf5mbrQ0TppwOEJ+hg==
X-Google-Smtp-Source: ABdhPJz49oSgsvYX6rVkuwCkpBFyCD/1vuYWgent4FpvFLEF81sRjkDpqWZmQXP+xsW7pCXULByM5A==
X-Received: by 2002:a63:2c83:: with SMTP id s125mr15529210pgs.265.1643685516138;
        Mon, 31 Jan 2022 19:18:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id c8sm13261985pfv.57.2022.01.31.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 19:18:35 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Saravana Kannan <saravanak@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
Date:   Mon, 31 Jan 2022 19:18:35 -0800
Message-ID: <7hk0efmfzo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

Saravana Kannan <saravanak@google.com> writes:

> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

This patch landed in stable/linux-5.10.y as commit d5f13bbb5104 and it
broke suspend/resume on at least one TI AM335x board I'm testing on:
upstream dts: arch/arm/boot/dts/am335x-icev2.dts, upstream defconfig:
arch/arm/configs/omap2plus_defconfig.

Bisecting between vanilla v5.10 (good) and stable/linux-5.10.y (bad)
pointed me to this patch, and I confirmed that reverting just this patch
on top of stable/linux-5.10.y makes it work again.

Also interesting, this same platform works fine on vanilla v5.15, which
also includes this patch.  That suggests that either 1) this patch
should not have been backported to v5.10 stable or 2) there are some
other dependencies that are missing in v5.10.

Since vanilla v5.10 works fine, I'm leaning towards (1), but if you have
any ideas for deps that need backporting, I'm happy to try.

I haven't debugged exactly where it's hanging yet, but, enabling
CONFIG_DEBUG_DRIVER=y, and suspending with "no_console_suspend" on the
command line, the last line before it hangs is:

   [   28.129966] simple-pm-bus ocp: noirq power domain suspend

Any ideas?

Kevin
