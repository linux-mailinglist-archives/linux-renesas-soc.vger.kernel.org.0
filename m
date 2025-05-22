Return-Path: <linux-renesas-soc+bounces-17410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB128AC166F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 00:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC4103B795B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 22:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A9226A1DB;
	Thu, 22 May 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InczFRKq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF126A098
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951790; cv=none; b=BqDKAHrhw5q3K0UGcRqR4EbanPs08nZ0IL1CfHUHK6+StfwsQjHHqMYs+dchOlb4Fs/LU6p23smBxcl9lyiTppJkzr7NioXkjkp9C/uI9QJmi4ZKblba7Bn5LaqwNqQ/DUQDVeGHYc2I10xGYiasbCA+xwjvfMyJ6JuIySKa/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951790; c=relaxed/simple;
	bh=aGU5joKlmsc4tJLp/ZjJC18En5pCyl2YsaUdNZBEyNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTHsLMZZlh41YSCDlE4YHCfhQOXLp8nqvy6HoIesN5CfjWCA4PzGrqt1tGPhFol3BKBFsacHuLjmLt31zYOCf2G+LVLMkWFeZzRMRjcX4oBzTrlFGWThzk8zP9ltZ+58Ca/ziUkcf2q6rbaOvYPLTE61quupoCHjmIDq5linx0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InczFRKq; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7d6bedd114so1343264276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747951787; x=1748556587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ytKn/xAm5fG7iosGiXWkgx37JTIZsw4UDMYhapgMJtk=;
        b=InczFRKqGynizt5t5Q693n+cNvLNejcpOp/AM69m4g+MUQoMlh4duAJwEpKAg3MFWb
         EeyDXXjX2T6JRfiH1MCstTomOzugDf4mifcFTRTqzYpED1jsL7Q9v2fxxK6MGa4Z7zWe
         Ywr+cqJ5fiqsFCkOFcNT8nrFhnuuRvQTtrlPhiDE7BUMZHJ1np/8trOBsN0uIrxfhwhP
         tiSrXX5rajF/wOni0w0Me7npvHrK3WInvE2qQxjefYV+zZJl/LZwYzCYctADFYoKyG7Q
         wIGhbWRq76xIFRteiCfoOPFbQevBnZMZBcFlEiR94YrJ9s85V85xYXJm7HqYo8CqjQVZ
         C/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951787; x=1748556587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytKn/xAm5fG7iosGiXWkgx37JTIZsw4UDMYhapgMJtk=;
        b=lTiut1BGyJ56v48DK5hyZxreAYtkgZtDshSXOnnj/jIWglVyBlBNVUKR4LWyJJLvWp
         5pMPEnfC6OzCwCONSdxgbvF6kQpHarWoURL3FgF6StHVHaijvgT1uhh0tkS2IXRDXM+P
         +yaS3NqGIwJVZxzZmXnPg6B6G65e4Yr4hnpxzjTEe9pbCOUT+P/Ax0/AV9o10g3apBxz
         jKdf82sWF+xkst2YnUOIWvFfwfUDRw4kFLu2qsu8JuiuEuGr1t7icRbYff+k4E9XjG99
         r//Temyx0fUXtcvRbHwMDzk2aJXyZorPZE/ItfciYJIZO9WabXFQTUMfYxyj5M9Nc55S
         E1YA==
X-Forwarded-Encrypted: i=1; AJvYcCX8pNorDjnS+sSaeSKIR8jsoNEAEbs2IXq6gHeo8BDYGnVOY/j+zFZHr0twBKCSCyGeTO3//yDeB2HVwGewv4pgXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFl9sCkxZGMP3LTBMCK/YsVc5uZ5YFo5BfRAgYzZuVyDBTBImY
	d2IP5peJPb+Gh5z4pm1lWm3mxOncJpnOlU7DEs6pwhmpANbfUgStvGDiFdvEStGEP+v18eTrYZr
	pY4sy3NPq0SHkt8NMHKacWAWn7Px3UPW7+09yh+IpqQ==
X-Gm-Gg: ASbGnctWXlguCXc5g1tIvPOBDEOax6SyxwF7LI6XQfw1DzHHiQYyMGIo62DGOyxyO2b
	khxKWR5tzXyURU6/CU7+7prFg/XQFqCvsY8arNzo99LHALCRqh4ZSTQsRZE+wwOeXiSjjVYdH54
	OK7ax4JJYhsPGl8beOF9DT0+wJ8/il4FBd8Q==
X-Google-Smtp-Source: AGHT+IGYyJxLMA8/8GOi2bmSkwfU/WISSYVhRusNzbVkFPw+Z4WEurkZHKkq6Z3/hyy3zkRDJ4/v8Z7Q+C1zdP3A248=
X-Received: by 2002:a05:6902:2190:b0:e7d:3b61:e24a with SMTP id
 3f1490d57ef6-e7d3b61e544mr19540272276.32.1747951784370; Thu, 22 May 2025
 15:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev> <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
 <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev> <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
 <482b55c9-a210-4b2d-8405-e9f30d48a8fd@tuxon.dev> <CAPDyKFpLF2P438GGWSgbXzpT7JNdUjtZ2ZxYf1_4=fNUX3s-KQ@mail.gmail.com>
 <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
In-Reply-To: <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 May 2025 00:09:08 +0200
X-Gm-Features: AX0GCFugZ72jR4N4Zhb7o7hjSV-HtwPLk02fPFYwEJ3WEVVCfay8AKrTsrcY3DI
Message-ID: <CAPDyKFoxs6wDCLp5EGHVqkqSstBLNmngps2KfanRezV_EN8tuA@mail.gmail.com>
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

On Thu, 22 May 2025 at 20:47, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Thu, May 22, 2025 at 06:28:44PM +0200, Ulf Hansson wrote:
> > On Thu, 22 May 2025 at 16:08, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Ulf,
> > >
> > > On 22.05.2025 14:53, Ulf Hansson wrote:
> > > >
> > > > That said, I think adding a devm_pm_domain_attach() interface would
> > > > make perfect sense. Then we can try to replace
> > > > dev_pm_domain_attach|detach() in bus level code, with just a call to
> > > > devm_pm_domain_attach(). In this way, we should preserve the
> > > > expectation for drivers around devres for PM domains. Even if it would
> > > > change the behaviour for some drivers, it still sounds like the
> > > > correct thing to do in my opinion.
> > >
> > > This looks good to me, as well. I did prototype it on my side and tested on
> > > all my failure cases and it works.
> >
> > That's great! I am happy to help review, if/when you decide to post it.
>
> So you are saying you'd be OK with essentially the following (with
> devm_pm_domain_attach() actually being elsewhere in a real patch and not
> necessarily mimicked by devm_add_action_or_reset()):

Correct!

>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index cfccf3ff36e7..1e017bfa5caf 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1376,6 +1376,27 @@ static int platform_uevent(const struct device *dev, struct kobj_uevent_env *env
>         return 0;
>  }
>
> +
> +static void platform_pm_domain_detach(void *d)
> +{
> +       dev_pm_domain_detach(d, true);
> +}

Well, I would not limit this to the platform bus, even if that is the
most widely used.

Let's add the new generic interface along with
dev_pm_domain_attach|detach* and friends instead.

Then we can convert bus level code (and others), such as the platform
bus to use it, in a step-by-step approach.

> +
> +static int devm_pm_domain_attach(struct device *dev)
> +{
> +       int error;
> +
> +       error = dev_pm_domain_attach(dev, true);
> +       if (error)
> +               return error;
> +
> +       error = devm_add_action_or_reset(dev, platform_pm_domain_detach, dev);
> +       if (error)
> +               return error;
> +
> +       return 0;
> +}
> +
>  static int platform_probe(struct device *_dev)
>  {
>         struct platform_driver *drv = to_platform_driver(_dev->driver);
> @@ -1396,15 +1417,12 @@ static int platform_probe(struct device *_dev)
>         if (ret < 0)
>                 return ret;
>
> -       ret = dev_pm_domain_attach(_dev, true);
> +       ret = devm_pm_domain_attach(_dev);
>         if (ret)
>                 goto out;
>
> -       if (drv->probe) {
> +       if (drv->probe)
>                 ret = drv->probe(dev);
> -               if (ret)
> -                       dev_pm_domain_detach(_dev, true);
> -       }
>
>  out:
>         if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
> @@ -1422,7 +1440,6 @@ static void platform_remove(struct device *_dev)
>
>         if (drv->remove)
>                 drv->remove(dev);
> -       dev_pm_domain_detach(_dev, true);
>  }
>
>  static void platform_shutdown(struct device *_dev)
>
>
> If so, then OK, it will work for me as well. This achieves the
> same behavior as with using devres group. The only difference is that if
> we ever need to extend the platform bus to acquire/release more
> resources they will also have to use devm API and not the regular one.

Sounds reasonable to me! Thanks for a nice discussion!

When it comes to the devm_pm_runtime_enable() API, I think we
seriously should consider removing it. Let me have a closer look at
that.

Kind regards
Uffe

