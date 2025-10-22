Return-Path: <linux-renesas-soc+bounces-23408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C1BFA819
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 154741A01E1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD792F6160;
	Wed, 22 Oct 2025 07:20:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45C2F6171
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117613; cv=none; b=oSqAepxmpk89MDPZK2ynZXSnkD+BTlS3Gig5+/SgcpZ1zk8YWbvkYDXEE6gZycS/j8zzlVhxJHrtmfgUB+BKFTyrjADQkoXqB6jJog1CMt8y8k03emjvLMnkyXiGlDE1ui/83vKkdg/IwrvQ6rByX1AG2TxtjSMFJDNeWxUvWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117613; c=relaxed/simple;
	bh=oj2g+iXtUrFUuNWS7IxNGMMhQzbaj0lpzDuF73afwdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKmC/1EItzXiISFIBj9HiLJFkD4UqGESK59oTd9HgS4lsOjB/cNpJjaHNbgPZxJ6eONKakUnLl8oqOZygmSNOh52gAbimjrSrmuwpIpYNzsJc4gkePWk/5JhHL4F8WoVzIS3N+708xXDWhxMNYixjlGwPSn9/Z4xQ+cyhlLRtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d758dba570so3223460137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 00:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117607; x=1761722407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LB4UmnebrIV6VHjidh9rexno3FG0/9sLJFVzFv+0Cqk=;
        b=E/QqhDMoCPmrI5JS9K7TvcS8f7MVk9VVbi11D92ABKh1tJ9sI6j6fNoiV0R1wjuBGG
         6rZgON1r6GoRxdi6qEBxVliGOJPt1RXccJLFDdWI6T7TdjtMqWk8X1fVpPYyBqphvQ46
         01SBPuDQkPhafLaJEpdFlHs3+8K0X5IFldkrxitfoUhud+WZS+z5tHZx8aDOi3MjuEL2
         CanYjY/4zYA6QSAbkq+miPUQSzxv63ClHlRqkxX24tz+SM19tkhX8t+YAYLnhYhKDUWv
         kjozN/cWfEFfzY99cWQavzoVmizCKIxJw+ElY6sMfAlxJb3cm9ak3H/crRR/21nIj4nJ
         WH6g==
X-Forwarded-Encrypted: i=1; AJvYcCXBlZb7U4l6wpvnVuYP8gHbRb6uzymDNtoq/RpFZdZol1BqExGRwA8hkgkLvy3GT86UvMqjy2fP8YNQ3xR25fK+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/T6eHgr3d1hbSxS1q57cMKODgHWAZ4dY63RRmXt1mowj3dSW5
	IyCG2JY8IYOB7cnYnkpEF6lVKz4Evvvq86EjgT8xEmMZ8wZkZHiYJBUtynZT+Nh1
X-Gm-Gg: ASbGncu7MTUJjVLrd0/KOsYyL+skrJhBpaEKnlNaJnX1v1g4mY8hmgVnxnP4aYNPejP
	8Fad/qaRWgHqBQNFfkJEYwHnmo5LV3UIYweqzkL8FkzkGG6J/LVncqDFRUezZJGgb8a2sPLNZlv
	eKH8lGQVusDnPOXBlgajfqvKulIHDZZLDFz8dwtNjBazBY0hY9CVTVSsWu0p4aDj+vRRKbBkTIr
	M96DPcNNN7KY/X5FakfjqrstiPt6xK9tBl1tJdlREJHuaIe64JLEvJHIWFYlPdBD+gptTO9uaKN
	nXVmvdu8MxsCt4MG1QKyF9o1Qtri5AAPAT67j2jMymfkQyAOQNDKSkN9TOnmXUVzmFxEr05ZpoW
	wmCEU8bXx3zNkNhYT2HEl7i7jadOXQg4/GuCQeob7/q1PNQNJCzt/Avn5OqKpIspMDISg/SCoeD
	avOYjEDh74AKJmI3iMKI8qbmi9z9Da/fN3RMrEMGw89WbV2UbM
X-Google-Smtp-Source: AGHT+IGuRfsOqIEi8dnluywzTNHLA4n9djxz+0oqNv9cZBCfswoxI3P28Oa6yqNIQqF7utuUtNUQYw==
X-Received: by 2002:a05:6102:ccf:b0:5d5:dcfb:e39 with SMTP id ada2fe7eead31-5d7dd67cdecmr5854635137.29.1761117607053;
        Wed, 22 Oct 2025 00:20:07 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3cd56d4sm4412218241.0.2025.10.22.00.20.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:20:06 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5d980e08e06so1557520137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 00:20:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKJB4V5l5x0JnpbYjThgGJTII66GDG52LnEhnrzKVqW7Ng1Pp69H4EXTfKu4lX8J7w+FjK/Ugzhejf4uDSPWj4og==@vger.kernel.org
X-Received: by 2002:a05:6102:419f:b0:5d5:ff0f:aea1 with SMTP id
 ada2fe7eead31-5d7dd634d15mr5387817137.22.1761117605738; Wed, 22 Oct 2025
 00:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010144231.15773-1-ilpo.jarvinen@linux.intel.com>
 <CAMuHMdVwAkC0XOU_SZ0HeH0+oT-j5SvKyRcFcJbbes624Yu9uQ@mail.gmail.com>
 <89a20c14-dd0f-22ae-d998-da511a94664a@linux.intel.com> <CAMuHMdUbseFEY8AGOxm2T8W-64qT9OSvfmvu+hyTJUT+WE2cVw@mail.gmail.com>
 <20844374-d3df-cc39-a265-44a3008a3bcb@linux.intel.com> <aPerdPErjXANiBOl@smile.fi.intel.com>
In-Reply-To: <aPerdPErjXANiBOl@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 09:19:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjty_fzRp9r8bet7G_YTwAvGRdW73-uxn7Dp8WsFmEEQ@mail.gmail.com>
X-Gm-Features: AS18NWBTgmWnrLRZQpcXx7nybYEdoprYZTPpfACzWUOBzMWL72E1MPEt5nuaQyU
Message-ID: <CAMuHMdWjty_fzRp9r8bet7G_YTwAvGRdW73-uxn7Dp8WsFmEEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI & resource: Make coalescing host bridge windows safer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Rob Herring <robh@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 21 Oct 2025 at 17:49, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 21, 2025 at 02:54:03PM +0300, Ilpo J=C3=A4rvinen wrote:
> > The expected result is that those usb resources are properly parented a=
nd
> > the ee080000-ee08ffff and ee090000-ee090bff are not coalesced together =
(as
> > that would destroy information). So something along the lines of:
> >
> >     ee080000-ee08ffff : pci@ee090000
>
> For my pedantic eye, the naming is a bit confusing here. Is this a mistak=
e in
> the code or in the example?
>
> >       ee080000-ee080fff : 0000:00:01.0
> >         ee080000-ee080fff : ohci_hcd
> >       ee081000-ee0810ff : 0000:00:02.0
> >         ee081000-ee0810ff : ehci_hcd
> >     ee090000-ee090bff : ee090000.pci pci@ee090000

A platform device instantiated from DT is named after the node name
and unit address of the corresponding DT node.  If the device has
multiple register banks, all its register banks are still claimed by
the same device, so all but the first (in DT) register bank show a
non-matching address in the device name.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

