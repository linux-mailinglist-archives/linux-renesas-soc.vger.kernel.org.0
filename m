Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0F480C72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 19:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbhL1STG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 13:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhL1STF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 13:19:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529B0C061574;
        Tue, 28 Dec 2021 10:19:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F34AB816E1;
        Tue, 28 Dec 2021 18:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0C2C36AEC;
        Tue, 28 Dec 2021 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640715542;
        bh=ZnKDE/v9udXF0UgJnUTZ/MpLc2GH6UBAzgwvvqkB6yE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rY1TJPTzIunmBnOQWSutGLIOxbmbO/g0JZfBO0Wx9OYKQRf13cLzmZNtgzhqvDO6U
         XkvSCg3xfM+pjDlHo4O4WmoWUBXnyINEXqZWowXBUnMnIRGsHPgb2a+aTkTvHlMNdz
         iu5JXcPCMz6yr30ko6rYT8RlOnafxBQHuYOKJFKeKrtL3XH8FyIhkpTibgYuQtEuMk
         XZxLk/svYos4mosXH0Hbw0xNWmBdOA2nsaeIuCgiuftBrJ0m+34XK1xY/gbnXLCDwj
         XnUh4VqhG5CeCCr2yPVESEwkipq6CpbCVda/wvYtcM55D1oOC+AcjJq2rN+dZNNRQB
         PXIiB+Sr+bQng==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1n2H3s-00Elae-Ac; Tue, 28 Dec 2021 18:19:00 +0000
Date:   Tue, 28 Dec 2021 18:18:59 +0000
Message-ID: <87h7aszj70.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] drivers/irqchip: add irq-inverter
In-Reply-To: <20211228165642.2514766-1-nikita.yoush@cogentembedded.com>
References: <20211228165642.2514766-1-nikita.yoush@cogentembedded.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: nikita.yoush@cogentembedded.com, tglx@linutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 28 Dec 2021 16:56:43 +0000,
Nikita Yushchenko <nikita.yoush@cogentembedded.com> wrote:
> 
> Interrupt trigger type is typically used to configure interrupt
> controller to properly interpret interrupt signal sent from a device.
> 
> However, some devices have configureable interrupt outputs, and drivers
> tend to use interrupt trigger type also to configure device interrupt
> output.
> 
> This works well when device interrupt output is connected directly to
> interrupt controller input. However, this is not always the case.
> Sometimes the interrupt signal gets inverted between the device
> producing it and the controller consuming it. Combined with both sides
> using the same interrupt trigger type to configure the signal, this
> results into non-working setup regardless of what interrupt trigger type
> is configured.

Regardless? Surely there is a canonical, working configuration.

> 
> Irq-inverer is a solution for this case. It is a virtual irqchip that
> provides additional virq number that behaves exactly as existing one,
> but with inverted trigger type reported via irq_get_trigger_type() API.
> 
> Usage example, for Kingfisher extension board for Renesas Gen-3 Soc,
> that has WiFi interrupt delivered over inverting level-shifter:
> 
> / {
> 	wlcore_interrupt: inverter {
> 		compatible = "linux,irq-inverter";
> 		interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_RISING>;
> 		interrupt-controller;
> 		#interrupt-cells = <0>;
> 	};
> };
>
> &wlcore {
> 	interrupts-extended = <&wlcore_interrupt>;
> };

So you don't describe the trigger at the endpoint level, but at the
pseudo-interrupt controller level? /me feels mildly sick.

And by the way: "An interrupt specifier is one or more cells of data
(as specified by #interrupt-cells) ...". Ergo, #interrupt-cells cannot
be 0 when the interrupt controller can be an interrupt-parent.

> 
> Then, wl18xx driver gets IRQ_TYPE_EDGE_FALLING return from
> irq_get_trigger_type() call, and configures interrupt output for that.
> Then the signal is delivered inverted to the GPIO module, and handled
> correctly, because GPIO is configured for IRQ_TYPE_EDGE_RISING.

So this is only to avoid writing the correct device tree?

> 
> Implementation notes:
> 
> - why platform_driver and not IRQCHIP_DECLARE()?
> - because IRQCHIP_DECLARE() does not process EPROBE_DEFER properly

More importantly, IRQCHIP_DECLARE() is for root interrupt controllers
that need to be probed long before we have a device model up and
running.

> - why not using hierarchial irq_domain?
> - because with hierarchial irq_domain, same interrupt gets the same virq
>   number at all levels, and trigger type is tied to virq number, so need
>   different virq numbers for reporting different trigger types

Why would you have different interrupt numbers? A given line has one
configuration at any given point, and only one.

> 
> - why using request_irq() for parent irq, instead of setting up chained
>   interrupt in irqchips?
> - because this way code is much simpler, and shall work for all cases
>   (such as normal/threaded parent irq, normal/threaded child irq,
>   different parent interrupt chips, etc)

And that's a NAK for deliberately violating the irqchip API.

> 
> - why just not introducing separate API for consumer-side and
>   produced-side trigger type?
> - because with the chosen approach, no changes are needed to any cases
>   that don't suffer from inverted interrupt routing

The right way to do it is to use the existing API by exposing the
inverter (there are existing examples in the tree, using the
hierarchical model). It isn't rocket science, and not much more code
than the pile of hacks^W^W^Wcreative approach you have.

	M.

-- 
Without deviation from the norm, progress is not possible.
