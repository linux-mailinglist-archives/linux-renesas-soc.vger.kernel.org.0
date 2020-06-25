Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D1F209B94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 10:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390771AbgFYI6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 04:58:05 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37192 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390330AbgFYI6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 04:58:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id v13so4576756otp.4;
        Thu, 25 Jun 2020 01:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLPZD7PFE1Gd0rOLnIGy3Ohui9fGoP3OOJI6weOrvCc=;
        b=GlgKsX1EvGkXIGaSR7PKaPyxJPWvYATJ/wF/js5HVj1f87/5u+a1dTEYxDY4Di6sWV
         P6Lz8uZ3FxBAlyEbYnHPi49IVuueTxMlq4Qcc1Id6xfiXg7Lt/jAD3Jtjxl5NYAVJgpN
         qC5juJ3YtbSrJ2KcHUFUJcqOy1UVPIrTxFxAP3UyA7cqX1Wu8M4TWNjhZU309oCTvbyu
         Vb6bKnIYZP1So6lZ5lWgEoYjrZOkxcRj/gmhk9aXDyPxGKI+MpQVS0tLRyonJdHqzTKS
         lL7bNI1Q+iUheJ5Gax7kqdfM8KiXRPpuA5TCsB6FLqD2vY2zuBnHbLnHIs/KENBIzB+X
         uR7w==
X-Gm-Message-State: AOAM533YdzmxTHT5aZQnG4IYDQaeZ2wtArHwpa38fLBIr0ilEOthYOBv
        bkfJSg411pzpNhPyVI/NPkUfkpsqapDjIK+UeZo=
X-Google-Smtp-Source: ABdhPJykpfn0DLcmVLEthmAqqqmjCHMhTsy0UwLlx+zOOQgay++hZ1cGg1mJxWDV9LviySSWeN+kBuSsGmUWVMQOlpQ=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr1590023otk.145.1593075483314;
 Thu, 25 Jun 2020 01:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200625032430.152447-1-saravanak@google.com>
In-Reply-To: <20200625032430.152447-1-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Jun 2020 10:57:52 +0200
Message-ID: <CAMuHMdWiAPOGPh+LCwxebfwZTxQvwEi7G3R1btdEz6xWkbFPUQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Fix suspend/resume order issue with
 deferred probe
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Toan Le <toanle@apm.com>,
        Feng Kan <fkan@apm.com>,
        Android Kernel Team <kernel-team@android.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

Thanks for your patch!

On Thu, Jun 25, 2020 at 5:24 AM Saravana Kannan <saravanak@google.com> wrote:
> Under the following conditions:
> - driver A is built in and can probe device-A
> - driver B is a module and can probe device-B

I think this is not correct: in my case driver B is builtin, too.

> - device-A is supplier of device-B
>
> Without this patch:
> 1. device-A is added.
> 2. device-B is added.
> 3. dpm_list is now [device-A, device-B].
> 4. driver-A defers probe of device-A.
> 5. deferred probe of device-A is reattempted

I think this is misleading: in my case driver-A did not defer the probe
of device-A, and driver-A never returned -EPROBE_DEFER.
Probing was merely paused, due to fw_devlink_pause();

> 6. device-A is moved to end of dpm_list.
> 6. dpm_list is now [device-B, device-A].
> 7. driver-B is loaded and probes device-B.
> 8. dpm_list stays as [device-B, device-A].
>
> Suspend (which goes in the reverse order of dpm_list) fails because
> device-A (supplier) is suspended before device-B (consumer).
>
> With this patch:
> 1. device-A is added.
> 2. device-B is added.
> 3. dpm_list is now [device-A, device-B].
> 4. driver-A defers probe of device-A.
> 5. deferred probe of device-A is reattempted later.
> 6. dpm_list is now [device-B, device-A].
> 7. driver-B is loaded and probes device-B.
> 8. dpm_list is now [device-A, device-B].
>
> Suspend works because device-B (consumer) is suspended before device-A
> (supplier).
>
> Fixes: 494fd7b7ad10 ("PM / core: fix deferred probe breaking suspend resume order")
> Fixes: 716a7a259690 ("driver core: fw_devlink: Add support for batching fwnode parsing")
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

This fixes wake-up by GPIO key on r8a7740/armadillo and sh73a0/kzm9g.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -109,6 +109,8 @@ static void deferred_probe_work_func(struct work_struct *work)
>                  * probe makes that very unsafe.
>                  */
>                 device_pm_move_to_tail(dev);
> +               /* Greg/Rafael: SHOULD I DELETE THIS? ^^ I think I should, but
> +                * I'm worried if it'll have some unintended consequeneces. */

Works fine for me with the call to device_pm_move_to_tail() removed, too
(at least on the two boards that showed the issue before).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
