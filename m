Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0C91F18DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 14:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgFHMgl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 08:36:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35009 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFHMgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 08:36:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id 69so13472613otv.2;
        Mon, 08 Jun 2020 05:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Urk+4YjXJumvH40dBM7FyLM3Pj+WNYIMaFPMbUNNJYg=;
        b=LER6G1c/8jlym5hzx/PFEZxRcSvRA/+4hM2MWhY286iug4+oJQmWlz1PpI7/Ddxh2x
         6DR1mngaSNGdYShiR0e/cLP0pH9hWMS6vcVItHqxzH8abbhQaDr6qejaIuHKhNVAl/2w
         I30LNn2UgMCWEzEwu1v50rgiqnhlNSHgnYAAxvoQIQh7DHlvCGLA2AG6eoSkLIFNXEOW
         gJxG22epmwxEVoggDX0Vz77aS8pzlnWoyGaQwdxqiRfqNYaQ7R15uJ20BoLkl4/0sMh2
         6pSQD8oEc7J2df7Hq7whXAD9RQte50zqhifeUEWj3dIT5fG2V65YKltZCU5FaRV6rGmQ
         B/Rw==
X-Gm-Message-State: AOAM532A4XChk1Ih/w+vO1tj5gEGcGYoKmXGXjSBmHNmGzr3mGT0nfM9
        cC4zxo9OXV4gYUXX1HzpxC8IdsiRdiYOR2ucHkDr20Fv
X-Google-Smtp-Source: ABdhPJytSfx3HCBs39HB5pRzUqY4VGcm8mahWSOA6S7qRDgN8etr9EEdfqrwYct3CKhPiAU018quK6QqzYfvxalOzpM=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr16286596otr.107.1591619799043;
 Mon, 08 Jun 2020 05:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com>
 <TY2PR01MB3692FAFE6FCA89538FA3AC4DD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFrcENub_NCP5s0v+3A09O55qGrK+gNrVswYjdqoLzPVzA@mail.gmail.com>
In-Reply-To: <CAPDyKFrcENub_NCP5s0v+3A09O55qGrK+gNrVswYjdqoLzPVzA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 14:36:28 +0200
Message-ID: <CAMuHMdXK2QkxMr3Lh6JnAh9RzHm4-CwpO_GLjD0+Vh-cM5a7nw@mail.gmail.com>
Subject: Re: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC Suspend-to-RAM
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Mon, Jun 8, 2020 at 1:47 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 8 Jun 2020 at 12:39, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Ulf Hansson, Sent: Monday, June 8, 2020 5:14 PM
> > > On Thu, 4 Jun 2020 at 14:17, Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > From: Yoshihiro Shimoda, Sent: Tuesday, May 19, 2020 8:33 PM
> > > > >
> > > > > The commit 432356793415 ("mmc: core: Enable power_off_notify for
> > > > > eMMC shutdown sequence") enabled the power off notification
> > > > > even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
> > > > > not set. However, the mmc core lacks to issue the power off
> > > > > notificaiton when Suspend-to-{RAM,Disk} happens on the system.
> > > > >
> > > > > So, add Suspend-to-RAM support at first because this is easy to
> > > > > check by using pm_suspend_target_state condition on _mmc_suspend().
> > > > >
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > >
> > > > I'd like to add more detail why this patch is needed.
> > > > I think we should think some events (which are Shutdown, Suspend-to-idle,
> > > > Suspend-to-RAM) for the Power off Notification control.
> > > > I described these events like below.
> > > >
> > > > Assumption of the host : MMC_CAP2_FULL_PWR_CYCLE=false
> > > > Assumption of the eMMC : in POWERED_ON
> > > >
> > > > 1) Event  : Shutdown
> > > > - power   : going to VCC=OFF & VCCQ=OFF
> > > > - ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT
> > > > - current : POWER_OFF_LONG --> Perfect
> > > > - Remarks : the commit 432356793415
> > > >
> > > > 2) Event  : Suspend-to-Idle
> > > > - power   : Keep VCC=ON & VCCQ=ON
> > > > - ideal   : issue MMC_SLEEP_AWAKE and keep the power (because the host could not change VCC=OFF)
> > > > - current : issue MMC_SLEEP_AWAKE and keep the power --> Perfect
> > > > - Remarks : IIUC, even if the eMMC is in POWERED_ON, a host can issue CMD5 (sleep).
> > >
> > > As a matter of fact, VCCQ *must* remain on in sleep state, while VCC
> > > can be powered off.
> >
> > I got it.
> >
> > > >
> > > > 3) Event  : Suspend-to-RAM
> > > > - power   : going to VCC=OFF & VCCQ=OFF
> > >
> > > I don't understand why you think S2R should be treated differently
> > > from S2I? At least from the MMC subsystem point of view, there is no
> > > difference. No?
> >
> > On my environment, VCC & VCCQ condition differs like below.
> >  S2I: VCC=ON & VCCQ=ON
> >  S2R: VCC=OFF & VCCQ=OFF
>
> Can you explain why it differs? Who is managing the regulators and who
> decides to turn them off?

The firmware does, through PSCI system suspend.
And what it does exactly is not standardized.
Perhaps we do need an "arm,psci-system-suspend-is-power-down"[1]
DT property?

> Perhaps this is a regulator-enable usage count problem?

Unfortunately not. Else we could fix it :-)

[1] "[PATCH/RFC 4/6] drivers: firmware: psci: Fix non-PMIC wake-up if
SYSTEM_SUSPEND cuts power"
      https://lore.kernel.org/linux-arm-kernel/1487622809-25127-5-git-send-email-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
