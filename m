Return-Path: <linux-renesas-soc+bounces-17368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E04AC0AE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 13:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55EAE18920F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A65D28A1FC;
	Thu, 22 May 2025 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpzQjW5I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E128A408
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914877; cv=none; b=sio3y57J4FYn8PsUDnnF8zj6khyrFyPy/YbTpJwMurDHSljJiKyrXFOfDNGocO1e+cm2q0q5f2gYPf/FSOjzesHCY5HsMvyaiP245QA05hnEBxmLNLnpVX03d51WJD8gcWctb5zpLSQ11FWLjaM5RqGyV8eZ2P53qtZ2Z3/q5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914877; c=relaxed/simple;
	bh=OBwru+cRfueT1e3kkrOMrY8pYvfmQq0K2S+WKQU6xw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTpbfVYFYRwEiy1IKi7BTwd2qi6pRFEYZt1nV/etkuSAr4mBaIjun7LNQIzq2hWk5q37ljxqfSH3TOqnApbNjsH+BVK1Ipd5ceOoVAvLm0wKnb0eeyPty2sgOYMtIWWGWuvZoJANmpCn1M+HPTmXOW610yvX7/OxbF/QRXQtMRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpzQjW5I; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e694601f624so5818650276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 04:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747914873; x=1748519673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nahjDlHZRtIQPLWgWjg8FK6SCa/IxKI/5CZRJv2Bs5A=;
        b=SpzQjW5InH47mXQbK9tXmx3vo6bOfcUx8vk33QyvfspSuL0om79NNv5CnitUjSBfGr
         gjkVJcX2/cWSiJTCuHTQwyd6bVA87n/aZm8hGPk9ZoOA25sX6tgX8y1ePTv546aOvfjO
         tn4IGekha/oBUE7pGQ1WJTFPhXwOqgAmNiZiDdIEAgoW+ln/SavAHmPCCZgngPEhlMMx
         /4/DwvZXZElhDzuhqv8qDcd0lcfsIckORWGG1A8hU8bxHPkiWAdzi/4s5jZguPJVLCL7
         Y3N8tyXdDsdD3xP5wfLA2K2LofKotWNeUfVqOaM9SmU/EEhnVV1HsTTrDhyNmYrvSSXv
         pS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914873; x=1748519673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nahjDlHZRtIQPLWgWjg8FK6SCa/IxKI/5CZRJv2Bs5A=;
        b=lzEdT9MMukX16hegysNnwF22PyTvlu4LoswqODBFhfSJnFVG/VN7Ii1kF9bKkmYC8K
         08efElVHbgQ9nT4SRKQyLLhQE/Q04LpeqCeoG8lH8L0zW1PhwZ6QHp9PejA0pFst7pVo
         isC94rrARkA2Yux5rg3QFAcNEUlniVShHzCxlw/1EkbgT7as8jUaW1F7JNF43lSLPuT9
         lTUVRcqEteB8LAPmDlWcsjnbS2ckHvqdgTSQDg5gRHEf6UstcHMbxP83WvVfQHkNGR6h
         4MFM+jSSJ9JuLM2HFVsggwxTy1hg3mP5jlu29/xZmUGCAP6jLvNl4wjIKTwN0IoJb/QK
         Zdxg==
X-Forwarded-Encrypted: i=1; AJvYcCUT+bYSJiLUBgL0kTZBq7/PqSqCqVH9Mby6E7u5zh3oZACEtqgZSrZLrnH5WIXCttuEV6xaOvBTG18Ngr6hpeY9Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMb1SsCiR/hilwOA01ZsLDpkM6A2OCMo6UvnEL1XZ5EKtmHz8v
	dfuxZ87Zk1vsdBsDnCs4+lSd222MA8gcHRpY6Ho3TzF6T8OXXEs3ZPZSn6kdxIYaymDbu3m0nuu
	GJ79/AuFurFmcUqz8AEkSMKhOqyKH13bcq1jHB0WMNhPPAhKgdSF+OtSC2g==
X-Gm-Gg: ASbGnctjZEUWFX1DVqYyoxulcYKYeYZ/+AUdZ6QsFj7YQ+RTGuUFsFmT46ciKIzRLq8
	9jhBU5AqaOj3KK7VCV8/ys4GezAl7WA5RP+NEgMGC5G2HDfemduRvt710jj3yEsO6xF7sloOBl/
	O0rry/3yywZ6hYmHRGPzhwLVIVkRR/geQrj3h/ZGv245CX
X-Google-Smtp-Source: AGHT+IEvyYJoez3OuvyFjy/eMJjsM7ltpFQ1t1siHOuCIOR1BtW01wfO+hiXpRAVJAZv2ewkmX80/iPYOP1QH6psj1c=
X-Received: by 2002:a05:6902:1144:b0:e7d:7767:81ed with SMTP id
 3f1490d57ef6-e7d776782ffmr745394276.43.1747914873551; Thu, 22 May 2025
 04:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330163129.02f24afb@jic23-huawei> <5bca6dfd-fe03-4c44-acf4-a51673124338@tuxon.dev>
 <95f5923f-7a8f-4947-b588-419525930bcb@tuxon.dev> <CAPDyKFoMqmCFBoO8FwQe2wHh2kqQi4jUZNFyiNckK7QhGVgmvg@mail.gmail.com>
 <c3a2950a-17ff-444a-bee7-af5e7e10e2bf@tuxon.dev> <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev> <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid> <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev>
In-Reply-To: <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 May 2025 13:53:57 +0200
X-Gm-Features: AX0GCFv4fOj3U6qHEnXPsAPzrJUl0MUGhARn9unikV5eCSTTNgUooV9tTdSMvdg
Message-ID: <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 May 2025 at 11:48, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Ulf,
>
> On 21.05.2025 17:57, Dmitry Torokhov wrote:
> > On Wed, May 21, 2025 at 02:37:08PM +0200, Ulf Hansson wrote:
> >> On Wed, 21 May 2025 at 07:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >>>
> >>> Hi, Ulf,
> >>>
> >>> On 20.05.2025 15:09, Ulf Hansson wrote:
> >>>> For example, even if the order is made correctly, suppose a driver's
> >>>> ->remove() callback completes by turning off the resources for its
> >>>> device and leaves runtime PM enabled, as it relies on devres to do it
> >>>> some point later. Beyond this point, nothing would prevent userspace
> >>>> for runtime resuming/suspending the device via sysfs.
> >>>
> >>> If I'm not wrong, that can't happen? The driver_sysfs_remove() is called
> >>> before device_remove() (which calls the driver remove) is called, this
> >>> being the call path:
> >>>
> >>> device_driver_detach() ->
> >>>   device_release_driver_internal() ->
> >>>     __device_release_driver() ->
> >>>       driver_sysfs_remove()
> >>>       // ...
> >>>       device_remove()
> >>>
> >>> And the driver_sysfs_remove() calls in the end __kernfs_remove() which
> >>> looks to me like the place that actually drops the entries from sysfs, this
> >>> being a call path for it:
> >>>
> >>> driver_sysfs_remove() ->
> >>>   sysfs_remove_link() ->
> >>>     kernfs_remove_by_name() ->
> >>>       kernfs_remove_by_name_ns() ->
> >>>         __kernfs_remove() ->
> >>>
> >>> activating the following line in __kernfs_remove():
> >>>
> >>> pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
> >>>
> >>> leads to the following prints when unbinding the watchdog device from its
> >>> watchdog driver (attached to platform bus) on my board:
> >>> https://p.fr33tux.org/935252
> >>
> >> Indeed this is a very good point you make! I completely overlooked
> >> this fact, thanks a lot for clarifying this!
> >>
> >> However, my main point still stands.
> >>
> >> In the end, there is nothing preventing rpm_suspend|resume|idle() in
> >> drivers/base/power/runtime.c from running (don't forget runtime PM is
> >> asynchronous too) for the device in question. This could lead to that
> >> a ->runtime_suspend|resume|idle() callback becomes executed at any
> >> point in time, as long as we haven't called pm_runtime_disable() for
> >> the device.
> >
> > So exactly the same may happen if you enter driver->remove() and
> > something calls runtime API before pm_runtime_disable() is called.
> > The driver has (as they should be doing currently) be prepared for this.
>
> I took the time and tried to do a comparison of the current solutions
> (describing the bad and good things I see), trying to understand your
> concerns with regards to RPM suspend|resume|idle while unbinding a device
> from its driver.
>
> I see the following cases:
>
> Case 1/ the current approach when devm_pm_runtime_enable() is used in
> driver's ->probe() with the current code base:
>
> - right after driver ->remove() finish its execution clocks are detached
>   from the PM domain, through dev_pm_domain_detach() call in
>   platform_remove()
>
> - any subsequent RPM resume|suspend|idle will lead to failure if the driver
>   specific RPM APIs access directly registers and counts on PM domain to
>   enable/disable the clocks
>
> - at this point, if the IRQs are shared (but not only) and devm requested
>   the driver's IRQ handler can still be called asynchronously; driver
>   should be prepared for such events and should be written to work for such
>   scenarios; but as the clocks are not in the PM domain anymore and RPM is
>   still enabled at this point, if the driver don't run runtime suspend on
>   probe (and runtime resume/suspend on runtime), I think (because I haven't
>   investigated this yet) it can't rely on pm_runtime_active()/
>   pm_runtime_suspended() checks in interrupt handlers
>   and can't decide if it can interrogate registers or not; interrogating
>   should lead to failure at this stage as the clocks are disabled; drivers
>   should work in such scenario and the CONFIG_DEBUG_SHIRQ is a way to check
>   they can; I previously debugged a similar issue on drivers/net/ethernet/
>   renesas/ravb driver where using devm_pm_runtime_enable() in probe and
>   pm_runtime_suspended() checks in IRQ handlers was the way to make this
>   scenario happy; at that time I wasn't able to find that
>   dev_pm_domain_detach() have the impact discussed in this thread
>
> Case 2/ What is proposed in this patch: devm_pm_runtime_enable() used +
> open devres group after dev_pm_domain_attach() (in probe) and close the
> devres group before dev_pm_domain_attach() (in remove):
>
> - right after the driver ->remove() is executed only the driver allocated
>   devres resources are freed; this happens before dev_pm_domain_deattach()
>   is called, though the proposed devres_release_group() call in this patch
>
> - while doing this, driver can still get async RPM suspend|resume|idle
>   requests; is like the execution is in the driver ->remove()
>   but the pm_runtime_disable() hasn't been called yet
>
> - as the runtime PM is enabled in driver's ->probe() mostly after the HW is
>   prepared to take requests and all the other devm resources are allocated,
>   the RPM disable is going to be among the first things to be called by the
>   devres_release_group()
>
> - then, after RPM disable, all the devres resources allocated only in the
>   driver's ->probe() are cleaned up in reverse order, just like
>   device_unbind_cleanup() -> devres_release_all() call in
>   __device_release_driver() is doing, but limited only to the resources
>   allocated by the driver itself; I personally see this like manually
>   allocating and freeing resources in the driver itself w/o relying on
>   devres
>
> - then it comes the turn of dev_pm_domain_detach() call in
>   platform_remove(): at the time dev_pm_domain_detach() is executed the
>   runtime PM is disabled and all the devres resources allocated by driver
>   are freed as well
>
> - after the dev_pm_domain_detach() is executed all the driver resources
>   are cleaned up, the driver can't get IRQs as it's handler was already
>   unregistered, no other user can execute rpm suspend|resume|idle
>   as the RPM is disabled at this time
>
> Case 3/ devm_pm_runtime_enabled() dropped and replaced by manual cleanup:
> - the driver code is going be complicated, difficult to maintain and error
>   prone

Yes, the driver's code would become slightly more complicated, but
more importantly it would be correct.

To me it sounds like the driver's ->remove() callback could do this:

pm_runtime_get_sync()
pm_runtime_disable()
pm_runtime_put_noidle()

In this way, the driver will runtime resume its device, allowing
devres to drop/turn-off resources in the order we want. Except for the
clocks, as those would be turned off via dev_pm_domain_detach() before
the IRQ handler is freed (via devres), right?

To avoid getting the IRQ handler to be called when it can't access
registers, we could do one of the below:
*) Look for a condition in the IRQ handler and bail-out when we know
we should not manage IRQs. Is using pm_runtime_enabled() sufficient,
you think? Otherwise we need a driver specific flag, which should be
set in ->remove().
*) Don't use devm* when registering the IRQ handler.

Yes, both options further contribute to making the driver code
slightly more complicated, but if you want to solve the problem sooner
than later, I think this is what you need to do. Yet, I think there is
another option too, see below.

>
> I may have missed considering things when describing the case 2 (which is
> what is proposed by this patch) as I don't have the full picture behind the
> dev_pm_domain_detach() call in platform bus remove. If so, please correct me.

The dev_pm_domain_attach|detach() calls in bus level code
(probe/remove) were added there a long time ago, way before devres was
being used like today.

Currently we also have devm_pm_domain_attach_list(), which is used
when devices have multiple PM domains to attach too. This is *not*
called by bus-level code, but by the driver themselves. For these
cases, we would not encounter the problems you have been facing with
clocks/IRQ-handler, I think - because the devres order is maintained
for PM domains too.

That said, I think adding a devm_pm_domain_attach() interface would
make perfect sense. Then we can try to replace
dev_pm_domain_attach|detach() in bus level code, with just a call to
devm_pm_domain_attach(). In this way, we should preserve the
expectation for drivers around devres for PM domains. Even if it would
change the behaviour for some drivers, it still sounds like the
correct thing to do in my opinion.

[...]

Kind regards
Uffe

