Return-Path: <linux-renesas-soc+bounces-25277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5CC8E917
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79FEC4E948A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5A82DE1E6;
	Thu, 27 Nov 2025 13:47:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4139296BB3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251220; cv=none; b=F8DUxLJHFvtPhrW1WyQblSGl4ryfEJi6CArktfwEQBdg/FNrzWe9PeCouvTnXNOzt2hi7/CTRSTDFs5ChP4eJLEf6SP0Ge7SAdTZ5I/UhAamOw0dQM2wgpY+JLdBKebUvT7ENS5gkJ1ba4ZtsDhIsDuOTp3b3SVwRhXxc5h7rfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251220; c=relaxed/simple;
	bh=AA0eyjIx0yehNxo/E/5axe4dWMJkeEgXsy6bX1rofAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjW85N8nCFO/gKeDrCqHx5OpeU7WAOVHPwvpfRJXiY7hY0YUqH5e4UIUnKLiUDdHSm2dpLIlk/oaavTSBuXG+J339HY8uxEsQ2RWYTQf5uVcaZxe0hf3qacmBNw4xGo3VFcQvGGoyhJal7UoKKKWqYJlpltcTN3nTG7CLfr35Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dfb5fcf063so227648137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251218; x=1764856018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/HhN7PweXDCoHADbAO01OSEGdFHLn6AnoNvGrA1vak=;
        b=rnBZnd927gnh0btmbhjapxOAeyfzHi5gkm5KQ+DLDhIpD+SaDWVzuWC82yF9kCMIJO
         an/1v2jlJQAHISyd9e278qg56i8mP9afQy1Yivd4ty3si/c3esQxyl416qZvWyvzxUlM
         +p/JvSwtLHvs2P+EGyAV/MLQDDQOXcbrhgNrzf8UkJcwNwpiMMnrIqH6stszzTesxaDi
         hwlde2JAcXz0BMvX8qP3QDRtUrWiMDwJ33UP/+2Aq3TYXthxcvOI32oUBfzjf5ObeZyG
         hvVxeVfGZ+yqlNbXYl1AznROdH9ZkWVDtCQUYj56nW+VjwjMN9aIzXWpJuBSZQ043tox
         xyVw==
X-Forwarded-Encrypted: i=1; AJvYcCXV3fkNOOjyVP4xOIRXHCjL9+VYEfG4RThoudZMbnSugaIP4EVBH0QzGJhZNJr82R+hMVkmgoU/U5RPFeAXvvqNKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRW7U2FSKN08+oEc3oq/f0k7LjmgINfB7BUTsFPfNmZEADzwFV
	GGpPoMbGGCpGe7iLTXsGQFlb3S6cIw7FYFtobatpb2ugLCn+aOo84WJ1xpLBVkyz
X-Gm-Gg: ASbGncsyq7XptnuWmhbxWQAda8gUmudv0tehzpoZuDkquq/NH6tL5T1Lgm1oyhR4qFa
	/XABS8hAKDS0J2Z8bszd9rFWmvHUKa7iZZIRn1UmYZI4YFniiewP/+kd18gQeh5XyY6ZsRMb0/E
	bqmvFAp/ioU0HxApAVnNoqTnhwzoG+mSVDT64zsrFKPDHcuTykIOBygES1kJHEgwMGkkm+FQnhs
	YOeLrDLZF1oC5XEWWKMfKBXdyhVgNeaHn+kPbTaSnMVzKuaT2RUAECTPkJ/wy6hESJKt78moCtI
	cp4P4ZfTaAMFXeblQRmmY/HmBVmREgzwhLeh1R5sFg/wY4NTLmrby5pKjbVK0x3V1tsTzty7kFU
	eMJp6K0kdOdW1GYWh8bnWROX87xZGV9kLRZ+IEwQTBJylRABW/I1nY4uJYJhHcMMY/Qqfo1UNjn
	xmq08Ai/bOMbk1gMpKgfo+jW0gjVWBqjUWNp0JBRfv055g+YnutLypVATQTRc=
X-Google-Smtp-Source: AGHT+IFP6/pN8sro7iB7TJmtam0FBAqLnqfbJGnZCfXIolvgXGgVTySd4pQj1FRLLWL34b203IC+zA==
X-Received: by 2002:a05:6102:3053:b0:5dd:b318:26b7 with SMTP id ada2fe7eead31-5e22421cef4mr3417626137.2.1764251217724;
        Thu, 27 Nov 2025 05:46:57 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d934eb9sm484697137.4.2025.11.27.05.46.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:46:55 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dde4444e0cso285881137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVY5UKB7ftxN9VzAIVdGV8VWlhzYkgfxUVKSOyz86xeYKYN6KSpoqXmoVWz59su7ah3wQXy6xifyk84y6lXbxBF+A==@vger.kernel.org
X-Received: by 2002:a05:6102:291f:b0:5db:ebb4:fde3 with SMTP id
 ada2fe7eead31-5e224274604mr3094319137.16.1764251214244; Thu, 27 Nov 2025
 05:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com> <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
 <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com> <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
In-Reply-To: <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 14:46:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
X-Gm-Features: AWmQ_bmuZJ1L1xbNpDXxY3ptFDbRDwAIihpcjmcYa3Px9900l5_objftbJng000
Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 27 Nov 2025 at 14:42, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 13:52, Geert Uytterhoeven wrote:
> > On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>>>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>>>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>>>         if (IS_ERR(priv->io))
> >>>>>                 return PTR_ERR(priv->io);
> >>>>>
> >>>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>>>
> >>>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >>>> The former seems to be the least common option.
> >>>
> >>> As I wrote in the first patch, because to my knowledge it is the
> >
> > I don't see that written in the first patch; it has the same patch description
> > as the other patches in the series (mutatis mutandis)?
>
> https://lore.kernel.org/all/20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com/
>
> I meant that brief statement in the patch changelog.

Sorry, I had missed that, as I don't read patches for foreign hardware,
and had just b4-am'ed the series, and compared the two commits.

> >>> preferred form for holding driver data which are in general pointers. We
> >>> do not store pointers as unsigned long. It is also already used for the
> >>> driver data types - see include/linux/mod_devicetable.h.
> >>
> >> ... and in case it is still not obvious: I do not cast here to final
> >> type, because that cast is the reason for the warning.
> >>
> >> I cast to an intermediary type to help compiler suppressing the warning
> >
> > I know...
> >
> >> - to integer representing the pointer. Unsigned long is not representing
> >> pointers in the kernel. Integer type representing the pointer is
> >
> > "unsigned long" indeed does not represent a pointer, but in the Linux
> > kernel, it is guaranteed to be the same size as a pointer.
> >
> > '"unsigned long" is superior'
> > https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
> > (he doesn't seem to have said anything about kernel_ulong_t)
>
> Yes, that was again comparing to uintptr_t, so we both agree.
>
> >> kernel_ulong_t, I think.
> >
> > include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;
> >
> > IIRC, it was introduced originally because "unsigned long" might have
> > a different size in userspace.  Nowadays (for x32), uapi uses
> > __kernel_ulong_t, though.
>
> Maybe, but if you look at the data structures all have kernel_ulong_t,
> so this fits the logic I was following here - I cast to the type which
> is both representing pointer and is already used for driver data,
> because this match data serves similar purpose as mentioned driver data.
>
> I don't mind casting via unsigned long, but:
> 1. these are old and trivial issues,
> 2. they are quite annoying when people want to compile test with W=1,
> 3. I was trying to fix them (although not sure if for I2C) already,
> 4. and some others probably as well were trying to fix them,
> so how many people need to send them and debate before we fix them finally?
>
> unsigned long vs kernel_ulong_t is a nit-style discussion IMO, unless we
> have here more concrete arguments, e.g. statement from Linus that
> kernel_ulong_t is wrong.
>
> If maintainers of this code want unsigned long, please apply the patch
> and fix directly, but for the sake, let's get it merged...

Sure, let's get it fixed!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

