Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AFD1F144C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 10:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgFHIOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 04:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgFHIOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 04:14:41 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A84FC08C5C4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2020 01:14:40 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id t132so8980132vst.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2020 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f5QRDlpjjmp5UIZrVxleXxB/5oVYgBWwLLrGOGxFJ0E=;
        b=uNwcGXq3bvo06YTZ+4Hf4nFxAOJms1OHjnacUT0xrISN52TXuwEv89VxnIhRSmh0QJ
         KYpVsMj4DsBuZwXfjs3kfuhKmw5PaNmdWr6akHMizU/8Y98Ec/V7kvLwcINo1VLvQ7pb
         IxQSvgMXVYp6Dc8AisFaGZ3+bTIOZKVsK3Vecd7Wnfs8ie6GO2gzNLVAcWa5NP3/fRMJ
         tmvns8Gqa6MuKGvjAwWJFVvjF9FwEaK5v+C/dKAorXS6Xa8+9AzSDlTxGZ8m2ex1+Rsi
         iPTz5iAWp1cFVsRaCfIW3+hmIR3VcxP8DmRMaMh57T8eR1cotGwFzlXmkUUuzGxmi778
         HEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f5QRDlpjjmp5UIZrVxleXxB/5oVYgBWwLLrGOGxFJ0E=;
        b=hvQGgO/8LSdN4HJ5m1NnhysfmeK0Z1sS9IO6cOzsvkzBO/ULY+rqlS04h7VUZxSBwa
         /Eunbad9zW268yjXwGsJ/EvgzDL0NitmEB9oFAADn/17c1GQEOwFoV9yoxnQTKGXj2lr
         nJxhP4kBK0z703CS0MPmk1sud4QHLJIBfUkpyP8tICQLPCHWVTMtcLaXXV8pgKOaq/Zs
         GiHT4QzHoeZ8ASnaKLCUlnBDQ7L9SGrmELDO9m9S1b7vO8IGfX94lJOXNc2YJEKcRVre
         BjbJA7yoakmY0kao+tPKjvyB0VAj8sOF4U8nds1qs/zGWsK7yRie5lqhdj0/enwG+rOh
         iKBQ==
X-Gm-Message-State: AOAM531MaDsUyJqlKq4Nzz8e8zqG6E3G5rQ/Opt9AU2enbws0ITrBe0M
        oJ/7awYoRo6fv4OJoIM65HFAp4Xsk57eef2fYtPEJA==
X-Google-Smtp-Source: ABdhPJyfRu4N681uC0sBZyqn+KaDCeapEujjgz3KmC7KtL8k2ohGKpkKiAe8i4+DLKsrMH7WjAh1MBiqmu1DvPWOsss=
X-Received: by 2002:a67:db88:: with SMTP id f8mr13465526vsk.165.1591604079310;
 Mon, 08 Jun 2020 01:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jun 2020 10:14:03 +0200
Message-ID: <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com>
Subject: Re: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC Suspend-to-RAM
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 4 Jun 2020 at 14:17, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi again,
>
> > From: Yoshihiro Shimoda, Sent: Tuesday, May 19, 2020 8:33 PM
> >
> > The commit 432356793415 ("mmc: core: Enable power_off_notify for
> > eMMC shutdown sequence") enabled the power off notification
> > even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
> > not set. However, the mmc core lacks to issue the power off
> > notificaiton when Suspend-to-{RAM,Disk} happens on the system.
> >
> > So, add Suspend-to-RAM support at first because this is easy to
> > check by using pm_suspend_target_state condition on _mmc_suspend().
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> I'd like to add more detail why this patch is needed.
> I think we should think some events (which are Shutdown, Suspend-to-idle,
> Suspend-to-RAM) for the Power off Notification control.
> I described these events like below.
>
> Assumption of the host : MMC_CAP2_FULL_PWR_CYCLE=false
> Assumption of the eMMC : in POWERED_ON
>
> 1) Event  : Shutdown
> - power   : going to VCC=OFF & VCCQ=OFF
> - ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT
> - current : POWER_OFF_LONG --> Perfect
> - Remarks : the commit 432356793415
>
> 2) Event  : Suspend-to-Idle
> - power   : Keep VCC=ON & VCCQ=ON
> - ideal   : issue MMC_SLEEP_AWAKE and keep the power (because the host could not change VCC=OFF)
> - current : issue MMC_SLEEP_AWAKE and keep the power --> Perfect
> - Remarks : IIUC, even if the eMMC is in POWERED_ON, a host can issue CMD5 (sleep).

As a matter of fact, VCCQ *must* remain on in sleep state, while VCC
can be powered off.

>
> 3) Event  : Suspend-to-RAM
> - power   : going to VCC=OFF & VCCQ=OFF

I don't understand why you think S2R should be treated differently
from S2I? At least from the MMC subsystem point of view, there is no
difference. No?

> - ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT (because the same as the "Shutdown" event)
> - current : issue MMC_SLEEP_AWAKE --> NG
> - Remarks : So, I tried to fix this by the patch.
>
> In addition, we should also think about the event of unbind.

Yes, very good point.

>
> 4) Event  : Unbind
> - power   : Keep VCC=ON & VCCQ=ON
> - ideal   : NO_POWER_NOTIFICATION because user is possible to turn the power off
> - current : Keep POWERED_ON --> NG
> - Remarks : But, I didn't try to fix this yet.

I don't quite understand why we should keep VCC and VCCQ on?

In principle I think we should treat "unbind" in the similar way as we
treat S2R/S2I. Which means sending power-off-notification if the host
supports MMC_CAP2_FULL_PWR_CYCLE, otherwise we should send sleep.

Kind regards
Uffe
