Return-Path: <linux-renesas-soc+bounces-17644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5DAC6D78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 18:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1C716540C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 16:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A29428C011;
	Wed, 28 May 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSshGpZ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553732E401
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448324; cv=none; b=m+u3hUEZzUGdZkVFlt9DXvEuqwaMtYNE/nGSFe8zQX1MWDu9SIWNHEK8o2hA2i2wbUCJNH8itUrxsotXEUs0jIQywEVXppmhW2J6MWzo2O9Uodom0rqc5rGVry1Muw9BT/KeO/OBC4S8Rg7Y4XIoXAFLUX++TlEj1wlw9Bol6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448324; c=relaxed/simple;
	bh=DcRREdQ0ZIb5xF00hDHe1rvvAjFzi38y8N1Y5D0c45k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWQQPDkq6jnyJZlgiXg1Di0naezR+a89cG1IojxKH0QwnVTxJNYuHiIz8pwQGGS8kwZE0HR36rQaW+UHjoDn/R8tuC5102C4ZuyR8vKNS/Tnx/stqQD4lkz8oCJuXEEqLsLIHGe0NbW1g7TkY6MYKs5m+crVpgnjgM1Kl8DeoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSshGpZ6; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7d8eb10c06so3051330276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448322; x=1749053122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6tC/IsairDziVWtXhkaDimMYA0/jNvKbB4X1Lbk06g=;
        b=qSshGpZ6ItWc+JjyMXR2REHAQc/3Pziq99/UpT7Ijf1RBHG0RPIc1TRpPb+A22tglG
         zUD8QdytkIx5O8U+/Vw+wZNYZ63f2fFKmo+3h7AhAhUwkd8fEiSJ0Pm9BICC73TnlwUo
         Bn+xHyXgrUd6egnSBpgo8wyrbR6Xzy6ph0MunleESFgCWgtcquwhJSYu1WK4SaccwP/H
         Fq7xz4hVk7MnYE0ixGsZk+l90k9R8+L/U3n5mlHdRtYRNYahWSXunL1qQaZn0n5RZaiR
         +gnuJx+lq4/mDapjVAGRW3pyzWSCjqitGKdJBzpowDlzoCYBn+ln4rdNiJbabBrmSlXw
         J+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448322; x=1749053122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6tC/IsairDziVWtXhkaDimMYA0/jNvKbB4X1Lbk06g=;
        b=R+4QDjRNsIy/i1JGiek2BiKJCdalcpFN/NFogpqdZ5bKR9hMGwH3BMCSnGhysovIhR
         00r9h3QgMb+XpLgDdH2H/r831EAQUxfZdjB+3QciRq5dLzyxc6qCvjY79C02gvL4hliQ
         fCykQMs4QW+fotSgXH+2eEIoCZL1gZPtYT4W+9h8HnZNjg77vuaVKclfzkb8pZ2VLV01
         roN8adJvEy6Dxtc1byGWcJ6IwtNQUzpL/490tgKaAyceUqQJiNzP2pMmDT6vr48HU1c0
         2I4vbfOREcfYY1+9fEVAfs9DTOVvY/VDYzx9iAfZpScOYe56XhQx/7inNmxtSFiphojc
         xhog==
X-Forwarded-Encrypted: i=1; AJvYcCUpyu+wf8GrGJMMDex4C3Ccwqec+FCMt3DMpR4+thnVYFGgT2IGMcfl5go6gkfvtAS2nGiNFP1xu34a3R7puV7I0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbsifRCMvNaq1IB/0sXQqCr/GXnhC7peBS9Akd5ZqRkkdQiss
	RQpjWgouuVLfiz6MR+Zv8blMM15/eS1SS0KEFWeSO73Z+nNP1LYuSJBGlrujc5KCVb9rKxwWa53
	paqzLzHzhhJ/cTala2V4r51J2dpRVwj0wT4D737q85Q==
X-Gm-Gg: ASbGnctjQVbUaFxxI+9Q8jpb1fCeIsTO8uElm8G8o1bMAFTtn++n+rJ1IO4+w3EUxxu
	Bx/q94dBGeTcVKaZZ58iuo7TmOuvMXHj3l+KKa68Eh0QulYpNsKZ835HcDZy+ILG4nzdcwes7qT
	Jsu2JqvjtwoQqD2+BfJgyjjnZFwZJ/o2pxEg==
X-Google-Smtp-Source: AGHT+IFnwa31CIcmyHHl56Vao4/q5XtrthfioWrNJoyx+lhgVVPWYbbs9O9qtYqlGYN36k/DfrFLU8QJs8LWaKoEyMQ=
X-Received: by 2002:a05:6902:2203:b0:e7d:b107:d829 with SMTP id
 3f1490d57ef6-e7db107e038mr15334137276.34.1748448322260; Wed, 28 May 2025
 09:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com> <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
 <111d2d6c-8ac0-40b9-94c3-02f2f64ef9fe@tuxon.dev>
In-Reply-To: <111d2d6c-8ac0-40b9-94c3-02f2f64ef9fe@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 May 2025 18:04:45 +0200
X-Gm-Features: AX0GCFuID4VhGiX2apyC0Knv4lDmWLbvgXL8Xh33MSHxiRPOzOEH1v_hZ2IXp8w
Message-ID: <CAPDyKFoQYTNBhtBXY-Ds7E0TohtA6558W1Jf3cLsnXDQC74DSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

[...]

> >> +/**
> >> + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
> >> + * @dev: Device to attach.
> >> + * @attach_power_on: Use to indicate whether we should power on the device
> >> + *                   when attaching (true indicates the device is powered on
> >> + *                   when attaching).
> >> + * @detach_power_off: Used to indicate whether we should power off the device
> >> + *                    when detaching (true indicates the device is powered off
> >> + *                    when detaching).
> >> + *
> >> + * NOTE: this will also handle calling dev_pm_domain_detach() for
> >> + * you during remove phase.
> >> + *
> >> + * Returns 0 on successfully attached PM domain, or a negative error code in
> >> + * case of a failure.
> >> + */
> >> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
> >> +                      bool detach_power_off)
> >
> > Do we have examples where we power on a device and leave it powered on
> > (or do not power on device on attach but power off it on detach)? I
>
> I haven't found one yet.
>
> > believe devm release should strictly mirror the acquisition, so separate
> > flag is not needed.
>
> I was in the middle whether I should do it with 2 flags or only to revert
> the acquisition.
>
> >
> >
> >> +{
> >> +    int ret;
> >> +
> >> +    ret = dev_pm_domain_attach(dev, attach_power_on);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    if (detach_power_off)
> >> +            return devm_add_action_or_reset(dev, devm_pm_domain_detach_off,
> >> +                                            dev);
> >> +
> >> +    return devm_add_action_or_reset(dev, devm_pm_domain_detach_on, dev);
> >
> > Instead of 2 separate cleanup methods maybe define dedicated devres:
> >
> > struct dev_pm_domain_devres {
> >       struct device *dev;
> >       bool power_off;
> > }
> >
> > ?
>
> That was the other option I've thought about but I found the one with 2
> cleanup methods to be simpler. What would you prefer here?
>
> Ulf: could you please let me know what would you prefer here?

As it looks like we agreed to use one cleanup method, the struct
dev_pm_domain_devres seems superfluous to me.

[...]

Kind regards
Uffe

