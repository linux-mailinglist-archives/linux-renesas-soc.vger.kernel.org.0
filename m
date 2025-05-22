Return-Path: <linux-renesas-soc+bounces-17365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E86AC09DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AE627B0B8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF602882BF;
	Thu, 22 May 2025 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4gPe61+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD05262FEA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909961; cv=none; b=m7yUTwWssa0agJUsxGH5CrIiKB60OD1seA2Dh24JqjUfxVX1jB7+45fbH1aATUFBq0/42gH34DmeJ+yqPhd2WUA+8hGHwOfhI5kxc/nYmfHUHWQeuGgWst7fj4icTKvsLd+kQ4ftZBmv64VFCG0IwApCArGhPhk/DJo0QI0l1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909961; c=relaxed/simple;
	bh=YI9fPYbxNpIx4m28qeoBw7esjheFt6NN0mg28O/d8YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=reKNlw7khAcCetq+ZJ38dSc7RrYB9kNSP/fX2pyidXGgi0fI083lSJmUdwRqsuNHJAw3+cfgQATsisnT5fIptEtNzhsG4js9jfop7fZS7zJL7v4BoMTBo/Ef1WkOUjmW6vgaxsbYTP4n+DM/2mr/Sx5Zpz9WO8W11IfGf+wh9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4gPe61+; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b9a3d85b9so3993262276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747909958; x=1748514758; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qg9PlAs1c3H2apUuqGgxlCvVOYlrIlBejRb6yanSPt4=;
        b=r4gPe61+5AYjVmjAFy+eu4b8pavfun3dJXse8vPyQi5KgzEgA7uebDbNieriGl8+xI
         fOCM1l/O8Gir2f6pIKbRDYcI2yiAnSu/lD/J9NMpOyHKPPVGda6R/vcMGbvQO55Z3HrD
         c1+7y4aMvcIK6biHNyHEgtF1l2RkNjVVoIqHXo22nedEWHrVFfG+OKRNCwH6ykgbGpyo
         ZwuA11+babu/UBbqA1uHZYUIYPoH/z0wmb3LILXJyk71beSPLyBOd+Hu5PEaOKHNbWyU
         AXYOrXU1JpB6I1ASLGnLGF8n81nig6hMEA9X7CJKXzlfgJ2afoGqAHAebWUmBprA/KMA
         wBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909958; x=1748514758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg9PlAs1c3H2apUuqGgxlCvVOYlrIlBejRb6yanSPt4=;
        b=PZIalHc0j8gaZam+seGG3GhO3bS+o6t2tvVtTvil/ntuBSJmIiTv8NhFIdebl505mO
         o5KVlgWXNR+h9CwirBs4zukLmb/GtcIVgzTehOPfNzX1uZdGfdVFne8sKjcf/oksD6OH
         ioXnRCG4sQYVeZhC/OnS8z64nDPvOUV0gpM+BcROAlcS1MkgPSEroJ7ABMVGToz76iRG
         Q2xtBWSToIFocr6oaVREUaBmOBJhdpQzK0AMYyNfcqOGYmVsBtmoXpsKsVdLgZT5/dh/
         rmLshK5f00upry/ib7mYkGO8krSYX9r3U9kAyVB3kBuDUZmx7kwVsPNKgRXt5ajgOLj5
         1Dmw==
X-Forwarded-Encrypted: i=1; AJvYcCWRY5p1Ro5r7xphtsgziOC8ZvHd+6TdQW5RI65FLUqSfAtTn7S1ucdhnuH2xg/MIes/a6Eyyvuv6aacz9WJu0URFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySAMi6eTYG/3xMkFjm3K0rGGztgdtfvBEzxGGD226XDo3+cHnH
	rPahgXO0lDNd+5SMDgD4hPerAwtwv8cqOqBNBzWTjX/8UWN+5jyWMG8C/ZGrMxxots3plr3KMnq
	YZpiyPXceEum3LZOebibTgbmP0CMSOl2Eoh3fPCOS6Q==
X-Gm-Gg: ASbGncuI8S8ExgrRdfPRjaCzHEE2B6U59VyBKuIfa9AxxOa+KdCzwTVd7CYt6m1jRbZ
	uh/LDdT2EExtWbsfEMn4wkXSOHzozNrD/VrP9nIST2Z5NPgPp5IDT6fz61bVc+TJKNXhlKMEKqA
	78SkasJ4APpWQJ5RxGv/LK8eTCjplEorbmBA==
X-Google-Smtp-Source: AGHT+IEG7xv7iMGd+C2t24T8MuB8mYwImHBZWwHHma4S1d6s3uzDWckhj4BH1W50gTd0IHqU8jYfunAzW1hH/aCCsec=
X-Received: by 2002:a05:6902:20c3:b0:e7d:7663:1687 with SMTP id
 3f1490d57ef6-e7d766317f7mr613007276.24.1747909958605; Thu, 22 May 2025
 03:32:38 -0700 (PDT)
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
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
In-Reply-To: <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 May 2025 12:32:02 +0200
X-Gm-Features: AX0GCFsbcG4QcgjpeUriah20d0XN1Br8aF18T9UTJDZEoQVqyTUAEPAdSEgU96Y
Message-ID: <CAPDyKFq4C_Beay3JBbDc+rRFx_SV0HQg6iO1zrt628tFdjv0pg@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 16:58, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Wed, May 21, 2025 at 02:37:08PM +0200, Ulf Hansson wrote:
> > On Wed, 21 May 2025 at 07:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Ulf,
> > >
> > > On 20.05.2025 15:09, Ulf Hansson wrote:
> > > > For example, even if the order is made correctly, suppose a driver's
> > > > ->remove() callback completes by turning off the resources for its
> > > > device and leaves runtime PM enabled, as it relies on devres to do it
> > > > some point later. Beyond this point, nothing would prevent userspace
> > > > for runtime resuming/suspending the device via sysfs.
> > >
> > > If I'm not wrong, that can't happen? The driver_sysfs_remove() is called
> > > before device_remove() (which calls the driver remove) is called, this
> > > being the call path:
> > >
> > > device_driver_detach() ->
> > >   device_release_driver_internal() ->
> > >     __device_release_driver() ->
> > >       driver_sysfs_remove()
> > >       // ...
> > >       device_remove()
> > >
> > > And the driver_sysfs_remove() calls in the end __kernfs_remove() which
> > > looks to me like the place that actually drops the entries from sysfs, this
> > > being a call path for it:
> > >
> > > driver_sysfs_remove() ->
> > >   sysfs_remove_link() ->
> > >     kernfs_remove_by_name() ->
> > >       kernfs_remove_by_name_ns() ->
> > >         __kernfs_remove() ->
> > >
> > > activating the following line in __kernfs_remove():
> > >
> > > pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
> > >
> > > leads to the following prints when unbinding the watchdog device from its
> > > watchdog driver (attached to platform bus) on my board:
> > > https://p.fr33tux.org/935252
> >
> > Indeed this is a very good point you make! I completely overlooked
> > this fact, thanks a lot for clarifying this!
> >
> > However, my main point still stands.
> >
> > In the end, there is nothing preventing rpm_suspend|resume|idle() in
> > drivers/base/power/runtime.c from running (don't forget runtime PM is
> > asynchronous too) for the device in question. This could lead to that
> > a ->runtime_suspend|resume|idle() callback becomes executed at any
> > point in time, as long as we haven't called pm_runtime_disable() for
> > the device.
>
> So exactly the same may happen if you enter driver->remove() and
> something calls runtime API before pm_runtime_disable() is called.
> The driver has (as they should be doing currently) be prepared for this.
>
> >
> > That's why the devm_pm_runtime_enable() should be avoided as it simply
> > introduces a race-condition. Drivers need to be more careful and use
> > pm_runtime_enable|disable() explicitly to control the behaviour.
>
> You make it sound like we are dealing with some non-deterministic
> process, like garbage collector, where runtime disable done by devm
> happens at some unspecified point in the future. However we are dealing
> with very well defined order of operations, all happening within
> __device_release_driver() call. It is the same scope as when using
> manual pm_runtime_disable(). Just the order is wrong, that is it.

I understand that devres is deterministic, the order to manage things
is ofcourse specified how we use it during ->probe() etc. My apologies
if it has sounded different to you.

What I have been trying to say is, because how the runtime PM works,
drivers must be careful about calling pm_runtime_enable|disable() as
relying on the order from devres is in many cases not sufficient.

Kind regards
Uffe

