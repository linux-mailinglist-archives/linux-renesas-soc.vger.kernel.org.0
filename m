Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AC41F181C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 13:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgFHLq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 07:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbgFHLqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 07:46:07 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA3BC08C5C3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2020 04:46:06 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id n22so3873353vkm.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2020 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YJ3wgAOdvNXlMVE1Zx0OYAy8UaY6DpX6nMjfk8Dh14=;
        b=WKs7/sx3LX7LjaJ5AlQbGKOWD6QQBOPFWmCuOx9g3Nm7SArSzREeoTh6uRxANlUtx5
         PX176yFN1dooLor1zhJ/KCTRCHbU5WWL/+WTpOHy+5TH9lvUZ50Vm1O3JA0tWFzeYUtq
         DJbH76ekL55mPDKCH0XLPL0H+wE/LjZ22z6mcdzNB70Ebd6SosyN1VVX2UUZXAYdAi2y
         sC83PTzCjs3T4ccpB2s69/hq5Tmb7bqG7fMbMmxcTXnmx7MPdmD8Kwz58jRZb5aKzIB+
         Y+oJfZShfaCW5q9WoJNZHmGJGvN6NfGWlxFqrJO9ULypyvjM/Jh6+YM/esiEoaCV02Xl
         S7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YJ3wgAOdvNXlMVE1Zx0OYAy8UaY6DpX6nMjfk8Dh14=;
        b=L6yTA+UQts10QNIWaCBUzdfVQKccixQu3mpw0HX9fv1Ue5r4edsrmjSHbwLEp3Ffyu
         cPBQlqXHLGFfGc0RZAp4etVzRQknuvlTb/WZ+zaKIkenjoFv0UKoPxyhfHpfLIHJquyV
         SMpndo9DY3Uy/e0MU+qImus0DG7un6eOjKU4uRBm/yAbFffnxcC13hH7u0cxVxAWvrA3
         bJ3kJAwjkfRMj+4aAgLMyWcjmNkIft7SV8/BOoxo0JDbsuVt/guqbr1qal+Yqu7wk10c
         w120TNzrDe2Tm6CUg1BJA6mPyMTR0XWaGfuOJ5WmJ839HOItcZ+k4/0LGg2ucgGpfEz0
         BTgg==
X-Gm-Message-State: AOAM530fA3X7dpzS7jrncKmJoXV4ZMjMQK4mnqK3+CT5xqR1z9ihV12F
        Genb6xJOvXI2IGmPneX3J9bCxGeKjYhswQtbytAA6+5kOO8=
X-Google-Smtp-Source: ABdhPJw4VeICZfAKwBX/C2g4n94b/n09KpG6cv00YdCQaXXJWpIbIxQoUOVAHwiJNO+YgdjJlJhC/8Bzf3zLObnn40o=
X-Received: by 2002:a1f:5e51:: with SMTP id s78mr15013644vkb.59.1591616765324;
 Mon, 08 Jun 2020 04:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com> <TY2PR01MB3692FAFE6FCA89538FA3AC4DD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692FAFE6FCA89538FA3AC4DD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jun 2020 13:45:29 +0200
Message-ID: <CAPDyKFrcENub_NCP5s0v+3A09O55qGrK+gNrVswYjdqoLzPVzA@mail.gmail.com>
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

On Mon, 8 Jun 2020 at 12:39, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> > From: Ulf Hansson, Sent: Monday, June 8, 2020 5:14 PM
> > On Thu, 4 Jun 2020 at 14:17, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > >
> > > Hi again,
> > >
> > > > From: Yoshihiro Shimoda, Sent: Tuesday, May 19, 2020 8:33 PM
> > > >
> > > > The commit 432356793415 ("mmc: core: Enable power_off_notify for
> > > > eMMC shutdown sequence") enabled the power off notification
> > > > even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
> > > > not set. However, the mmc core lacks to issue the power off
> > > > notificaiton when Suspend-to-{RAM,Disk} happens on the system.
> > > >
> > > > So, add Suspend-to-RAM support at first because this is easy to
> > > > check by using pm_suspend_target_state condition on _mmc_suspend().
> > > >
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > I'd like to add more detail why this patch is needed.
> > > I think we should think some events (which are Shutdown, Suspend-to-idle,
> > > Suspend-to-RAM) for the Power off Notification control.
> > > I described these events like below.
> > >
> > > Assumption of the host : MMC_CAP2_FULL_PWR_CYCLE=false
> > > Assumption of the eMMC : in POWERED_ON
> > >
> > > 1) Event  : Shutdown
> > > - power   : going to VCC=OFF & VCCQ=OFF
> > > - ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT
> > > - current : POWER_OFF_LONG --> Perfect
> > > - Remarks : the commit 432356793415
> > >
> > > 2) Event  : Suspend-to-Idle
> > > - power   : Keep VCC=ON & VCCQ=ON
> > > - ideal   : issue MMC_SLEEP_AWAKE and keep the power (because the host could not change VCC=OFF)
> > > - current : issue MMC_SLEEP_AWAKE and keep the power --> Perfect
> > > - Remarks : IIUC, even if the eMMC is in POWERED_ON, a host can issue CMD5 (sleep).
> >
> > As a matter of fact, VCCQ *must* remain on in sleep state, while VCC
> > can be powered off.
>
> I got it.
>
> > >
> > > 3) Event  : Suspend-to-RAM
> > > - power   : going to VCC=OFF & VCCQ=OFF
> >
> > I don't understand why you think S2R should be treated differently
> > from S2I? At least from the MMC subsystem point of view, there is no
> > difference. No?
>
> On my environment, VCC & VCCQ condition differs like below.
>  S2I: VCC=ON & VCCQ=ON
>  S2R: VCC=OFF & VCCQ=OFF

Can you explain why it differs? Who is managing the regulators and who
decides to turn them off?

Perhaps this is a regulator-enable usage count problem?

>
> So, I think the MMC subsystem should not enter sleep mode
> on such environment. If this is board-specific, I'm thinking
> I should add a new flag to fix the issue which is entering
> sleep mode even if VCCQ=OFF.
>
> > > - ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT (because the same as the "Shutdown" event)
> > > - current : issue MMC_SLEEP_AWAKE --> NG
> > > - Remarks : So, I tried to fix this by the patch.
> > >
> > > In addition, we should also think about the event of unbind.
> >
> > Yes, very good point.
> >
> > >
> > > 4) Event  : Unbind
> > > - power   : Keep VCC=ON & VCCQ=ON
> > > - ideal   : NO_POWER_NOTIFICATION because user is possible to turn the power off
> > > - current : Keep POWERED_ON --> NG
> > > - Remarks : But, I didn't try to fix this yet.
> >
> > I don't quite understand why we should keep VCC and VCCQ on?
>
> Oops. I should have described a use case. I thought one of use cases was
> using mmc_test driver. So, I thought we should keep VCC and VCCQ on to
> use mmc_test driver.

Okay, let me think about this.

Actually, we can also unbind the mmc host. And if re-binding again,
that should still work.

>
> > In principle I think we should treat "unbind" in the similar way as we
> > treat S2R/S2I. Which means sending power-off-notification if the host
> > supports MMC_CAP2_FULL_PWR_CYCLE, otherwise we should send sleep.
>
> If we didn't take care of mmc_test driver after unbind, I think so.

Kind regards
Uffe
