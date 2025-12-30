Return-Path: <linux-renesas-soc+bounces-26198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D6CEA023
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3B1430146D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33A23195EC;
	Tue, 30 Dec 2025 15:05:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895731A06C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107126; cv=none; b=CYp0aFGJCjZgphkmnhhDnGbJg6/Uzk/q3OqulohHx7ZC0UPxQAMTck0UciHvYuO0RXgbv/rLuP3Rk9ZG0jzlNf4ho3mhhohNRfJT61yFmTuMCl2TgShtivIVseY1bz3zUXyHbdownvnscCn3GSVe6lSWgKC2JAauoIOJ+WkC+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107126; c=relaxed/simple;
	bh=dkjLK7cj8/C4JRusSr9IXX3Q+juZmbMwsVO/nZqCEKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOPjcDPAW50yaSbfe2+Z/jr6zGcEjAK9hmJnu2BgIWf85/GSFlHbHGp5MveJ8INNNMActk9bzngs9WhBMXtzWhWA2hXtqE37EgufNJdVx29h+HzRTaTgHK96/xXmyZoUhhxNSrgkSB87hM60nPwmVFUZkLb/z4XEBoD4YtWJ9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55999cc2a87so2414456e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 07:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107124; x=1767711924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3bghUu0vru4RrxnbMTcftVq/cqOVIrTFnZfWBS4mDw=;
        b=L2fD1WlYiTMPuciHkUspYfblWyi/x658tUO6cgMCyHbZ+EOA+W80VTGB8UQUypW+Ec
         w1ZhmDgCy0WYGr9m2A2YbnYngmYTPcBI+SWee8UHff3YyxQSjWfz/FIloYU2jN5ARM0G
         kXTuxnNESf3MSvaqUwpI3LgNOBZPbDGzMA4FykLis7aWuaxiyp/hP+QGR2bdGM6gq+Zu
         WWTvfNPyzhLgq2eV9aV0/qR1C0C/11CMp70w5HOWsieyFIPSKs/PsjKk7hvgQ/+/Zwsq
         Kh8rb5ADgqeZ60LGa884UbppK4kWL4PaacGNntxUtaFy2rz5Ms3wmZJdfU1kORK1g9r+
         gosg==
X-Forwarded-Encrypted: i=1; AJvYcCVhv3ZFN0570ABMz+gPm2F7GQ6gK4CG/33DD+9HJILd69Mg67zZJ0QBu2nB0+DYCrYluzKMNWbf7O13Hp1LpOl7zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziTLOb2UBwz2lb1N++las7Nrkza0aE/S9o9AS+K52qRT3AxctV
	kFCwb8eVBh7tUTPq6pVN2weYlPlApKkpn6FBPCbOjno55NAb8XsJ1QYvG+VIWoSB
X-Gm-Gg: AY/fxX4X8SAiYeR8FDDpzpNpcdczdhvjRroquOom54jI/8pyPVDkwNh7xmcSIEXe/3q
	1yeO3ivuRMjJgO8xrk9HHHfR1Dvg+Ya28q8Of9hHnWP4/vZgUaF5xysG6+hgBGbu/pFOx2pLww9
	MntWi6t9MM6KXF2/aD7Z9Zpf1q1U/UzojHpP7Qq0uEjqvtlNiz7EK4ORwotTDa5KDVj20VU0iu3
	yts2BceVjRN39sMY2cPsaYZakP1CtJkODrJfzNUqcGpSd24hmtXGtQNlBi0H4RZXVse2q5485lt
	nUT0WqVCbv5cGM+gnElXOvTCENKNuYmyOoA3PmX+EEwE1Zv7upMsLb+CqyNvv31KFJm/pAWfzHr
	fP9C2LjOTZzBXcMNa338jmRcPvC31l8jdFhuWXMA/VWNlyeaRw8pN9SgzMDkohO+NHxxkTpDhk0
	H0uXgVgAds70a/Utgx1HuuYECKfV1iFHbc3JhyjTQptYM8IDhGJ8ld
X-Google-Smtp-Source: AGHT+IHos4cwZ7IPYMfCbzKGTVn0xWGHUwcE8/Ze3uXVufx0hcBEMIU0l6YB5z/kxlfj2pgASNCt9Q==
X-Received: by 2002:a05:6122:1354:b0:55b:305b:4e3b with SMTP id 71dfb90a1353d-5615beb8214mr9695304e0c.17.1767107123837;
        Tue, 30 Dec 2025 07:05:23 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b58bsm10348575e0c.1.2025.12.30.07.05.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 07:05:22 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55ae07cf627so2413502e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 07:05:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDRKs4JOCUERM6AESCOrH3Uzq4NSOkn9P/xjroJlcID3zBekEJE7I5Ig+w8gtbpGmrXXe3i8Clf0vCRcXHvxCxFw==@vger.kernel.org
X-Received: by 2002:a05:6122:1354:b0:55b:305b:4e3b with SMTP id
 71dfb90a1353d-5615beb8214mr9695143e0c.17.1767107122056; Tue, 30 Dec 2025
 07:05:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <2556645.jE0xQCEvom@rafael.j.wysocki>
 <CAMuHMdVMFQebA43FJ53PBnd67C8fxWAC21cr4jWTGDwg-HV53w@mail.gmail.com> <CAMuHMdWshJOjzD5DGzyRUG66jvPC6PPVBgaT=UdWy+XOk_T5Pw@mail.gmail.com>
In-Reply-To: <CAMuHMdWshJOjzD5DGzyRUG66jvPC6PPVBgaT=UdWy+XOk_T5Pw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 16:05:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeHY7+9Jz60OX521iaEorGOcrxuGC8iuzDRUA-tkEvLQ@mail.gmail.com>
X-Gm-Features: AQt7F2rwnAcC5lQxf8KDSlHqxdZgmhT_kPKehxVIuLLpkwUasjT0-vp_jZiOQQo
Message-ID: <CAMuHMdVeHY7+9Jz60OX521iaEorGOcrxuGC8iuzDRUA-tkEvLQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/23] phy: core: Discard pm_runtime_put() return values
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-phy@lists.infradead.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Dec 2025 at 11:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 30 Dec 2025 at 11:34, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, 22 Dec 2025 at 21:40, Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > The PHY core defines phy_pm_runtime_put() to return an int, but that
> > > return value is never used.  It also passes the return value of
> > > pm_runtime_put() to the caller which is not very useful.
> > >
> > > Returning an error code from pm_runtime_put() merely means that it has
> > > not queued up a work item to check whether or not the device can be
> > > suspended and there are many perfectly valid situations in which that
> > > can happen, like after writing "on" to the devices' runtime PM "control"
> > > attribute in sysfs for one example.
> > >
> > > Modify phy_pm_runtime_put() to discard the pm_runtime_put() return
> > > value and change its return type to void.  Also drop the redundant
> > > pm_runtime_enabled() call from there.
> > >
> > > No intentional functional impact.
> > >
> > > This will facilitate a planned change of the pm_runtime_put() return
> > > type to void in the future.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Thanks for your patch, which is now commit caad07ae07e3fb17 ("phy:
> > core: Discard pm_runtime_put() return values") in phy/next.
> >
> > This is causing several messages like
> >
> >     phy phy-e6590100.usb-phy-controller.2: Runtime PM usage count underflow!
> >
> > during boot, and s2ram on Koelsch (R-Car M2-W).
>
> On R-Car Gen3, there are no such messages, as e.g.
> drivers/phy/renesas/phy-rcar-gen3-usb2.c does support Runtime PM.
> R-Car Gen2 uses drivers/phy/renesas/phy-rcar-gen2.c, which does not
> use Runtime PM yet, but still relies on explicit clock management.
>
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > > @@ -190,15 +190,12 @@ int phy_pm_runtime_get_sync(struct phy *
> > >  }
> > >  EXPORT_SYMBOL_GPL(phy_pm_runtime_get_sync);
> > >
> > > -int phy_pm_runtime_put(struct phy *phy)
> > > +void phy_pm_runtime_put(struct phy *phy)
> > >  {
> > >         if (!phy)
> > > -               return 0;
> > > +               return;
> > >
> > > -       if (!pm_runtime_enabled(&phy->dev))
> > > -               return -ENOTSUPP;
> >
> > Adding some instrumentation shows that this branch was taken before,
> > thus skipping the call to pm_runtime_put().
> >
> > Can I just put the check back, or is there an underlying problem that
> > should be fixed instead?
>
> I assume the PHY core should support both drivers that do and do not
> support Runtime PM.

I have sent a patch:
https://lore.kernel.org/3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

