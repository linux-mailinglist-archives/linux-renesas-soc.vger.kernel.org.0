Return-Path: <linux-renesas-soc+bounces-7684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA30D944EB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364D81F21F81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F34A13AD2A;
	Thu,  1 Aug 2024 15:04:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3D130A47;
	Thu,  1 Aug 2024 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524660; cv=none; b=jrvXfnHkJatOtXvhLn/P5jN/+TW3kau4DSXFJiiX5MkpF8Sl4oLYGI2ytgb92NqIuSvB8cLdVzG2GxZEy4tT63fO2JgzNy0V8cP5kX68B/TI3qGL7ToHwP8E6l8kuPfOQM85ULCjLpopB1drcpQm7gzXKJc1o0uThtVG+Qm+D+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524660; c=relaxed/simple;
	bh=Tjf521G/AlPvcwe92gKEgwLzoei4fPVNKjrAyLUBxgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTAcFkVC+CYGHfAEX6WSPJtMkSnWrBzzBqQAH20W5ZTcKeYwq6uNV1jC5alIRq7htM9MPG/HR46NNEWe8cxDwbipym9mOplTRa0VjAf/SkoynVq5w2R4/Id1BLERZrKneLQhq40Dhu93zfGGzv+j6Ptudvo+5zwjwgeV4q+ewKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0878971aa9so1800041276.0;
        Thu, 01 Aug 2024 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524657; x=1723129457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxUAxr4GoMo80LJex8VF+rjOD0aybhsuz+CMjk4XlD0=;
        b=QE5YAflnFI/T7LLhl+h8fD+YbOpjsnZ0Xo8XlTIfSaDPzT5DrzL6H0z4vXWMNrBIYC
         047qE2/jKfwa79+thwUKMWAoYQOd8NAAzgGNChuLX/XWLf2TWCsOtprxzEhMSyGP8NxH
         hdMuUgNPtkQSEpe4dKBN0hbvqp3wq5Uv8u7cKrbGI7Dh1qfLm+OEC1AfEJ62xuZTk40U
         U7jkRnvJ6WUdPc5wCcAxU4WiHJWEd1AqNNjW8FdcLjWDVZTr9QQgNVl7qNnAdX+mq8Do
         BAdkZfHwnWABxJD8fe3nisdDWbYoDn5c+ill24VQv7l+DGT40zbGaAdrP4ucrKHvrCBE
         MADA==
X-Forwarded-Encrypted: i=1; AJvYcCXm6FYfOby+y7UM/vsb3oBJr9/liyFhso6Y3eSTU+eesZacqGxc5etp9/87QMYzTZC2JY5cQBnJnXQbpil48xKwDNBE2qZqGqjuzQVl9Z13p/c=
X-Gm-Message-State: AOJu0YymZkZwmOyfe1jHBrEdm92Cn2OZBqttSKybT2P7pBslR9MqOBj8
	dJnEWfmACPZ70X8FDNwyP+ZlSOuX40Z4E+sqC0co0rA+cI0R+PVImT+jF2w+
X-Google-Smtp-Source: AGHT+IGdCRVcN3EjXMXbkL78oAxQ44nRPjBSD2sotXwZXPf7BXPP1UKBe4NEi3V6rAtEO8ew00xlsg==
X-Received: by 2002:a25:ce10:0:b0:e0b:d2e3:4da7 with SMTP id 3f1490d57ef6-e0bd5afaa73mr1219377276.18.1722524656647;
        Thu, 01 Aug 2024 08:04:16 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a177e0esm3239422276.32.2024.08.01.08.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:04:16 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0878971aa9so1800011276.0;
        Thu, 01 Aug 2024 08:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhGpt7phJpW+dLRbGBGwdn3gKhBP1C9IbBwa4XhOQ3ZYDXnPxCe//q34Pw/GpKdfVtOrx7zHWrYSlcijOBnu3wbxq3HtOz1TsW0IweWITJGGo=
X-Received: by 2002:a05:6902:1144:b0:e02:c458:c70f with SMTP id
 3f1490d57ef6-e0bdeaf3d8amr243829276.22.1722524656198; Thu, 01 Aug 2024
 08:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726031954.566882-1-dlemoal@kernel.org> <20240726031954.566882-5-dlemoal@kernel.org>
 <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org> <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
 <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com>
 <5700ac9c-0f7e-40c2-b969-ad67b0ee96ba@kernel.org> <CAMuHMdVbkeeQy_WBcBhKhOzWv=MsCUjsVEBDrEi0b+g_-RKCOQ@mail.gmail.com>
 <0f9d26c0-e79e-4913-862a-3df642177415@kernel.org> <CAMuHMdWduj2CeB=dqzHPNgHxTXgpWD18H_ew1zp_rc6OwyqHQw@mail.gmail.com>
 <daeda931-7b82-42e6-af8e-49d9d6e8eb20@kernel.org>
In-Reply-To: <daeda931-7b82-42e6-af8e-49d9d6e8eb20@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:04:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv6mTryGX-ozZeLiH1yX2Bw14ykMtOJaVHmryHX+KHKw@mail.gmail.com>
Message-ID: <CAMuHMdXv6mTryGX-ozZeLiH1yX2Bw14ykMtOJaVHmryHX+KHKw@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Thu, Aug 1, 2024 at 12:42=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
> On 8/1/24 7:05 PM, Geert Uytterhoeven wrote:
> > On Thu, Aug 1, 2024 at 11:25=E2=80=AFAM Damien Le Moal <dlemoal@kernel.=
org> wrote:
> >> On 8/1/24 6:07 PM, Geert Uytterhoeven wrote:
> >>> On Wed, Jul 31, 2024 at 11:08=E2=80=AFAM Damien Le Moal <dlemoal@kern=
el.org> wrote:
> >>>> On 7/31/24 16:27, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jul 31, 2024 at 1:39=E2=80=AFAM Damien Le Moal <dlemoal@ker=
nel.org> wrote:
> >>>>>> On 7/30/24 19:09, Geert Uytterhoeven wrote:
> >>>>>>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
> >>>>>>>> Introduce the function ata_dev_print_quirks() to print the quirk=
 flags
> >>>>>>>> that will be applied to a scanned device. This new function is c=
alled
> >>>>>>>> from ata_dev_quirks() when a match on a device model or device m=
odel
> >>>>>>>> and revision is found for a device in the __ata_dev_quirks array=
.
> >>>>>>>>
> >>>>>>>> To implement this function, the ATA_QUIRK_ flags are redefined u=
sing
> >>>>>>>> the new enum ata_quirk which defines the bit shift for each quir=
k
> >>>>>>>> flag. The array of strings ata_quirk_names is used to define the=
 name
> >>>>>>>> of each flag, which are printed by ata_dev_print_quirks().
> >>>>>>>>
> >>>>>>>> Example output for a device listed in the __ata_dev_quirks array=
 and
> >>>>>>>> which has the ATA_QUIRK_DISABLE flag applied:
> >>>>>>>>
> >>>>>>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl=
 300)
> >>>>>>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', =
applying quirks: disable
> >>>>>>>> [10193.469195] ata1.00: unsupported device, disabling
> >>>>>>>> [10193.481564] ata1.00: disable device
> >>>>>>>>
> >>>>>>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plu=
s the
> >>>>>>>> last quirk flag defined. This value is used in ata_dev_quirks() =
to add a
> >>>>>>>> build time check that all quirk flags fit within the unsigned in=
t
> >>>>>>>> (32-bits) quirks field of struct ata_device.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >>>>>>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> >>>>>>>
> >>>>>>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata=
:
> >>>>>>> libata: Print quirks applied to devices") in libata/for-next.
> >>>>>>>
> >>>>>>> During boot-up on Salvator-XS (using rcar-sata), the quirk info i=
s
> >>>>>>> printed not once, but four times.  Is that intentional?
> >>>>>>
> >>>>>> Not at all. I tested on x86 with AHCI and see this message only on=
ce. So it
> >>>>>> could be that different drivers may need some tweaks to avoid this=
 spamming.
> >>>>>> Though it is strange that the initialization or resume path takes =
this path 4
> >>>>>> times, meaning that the quirks are applied 4 times. Need to look i=
nto that.
> >>>>>> What is the driver for rcar-sata ? Compatible string for it would =
be fine.
> >>>>>
> >>>>> drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
> >>>>>
> >>>>> I added a WARN() to ata_dev_quirks() to show backtraces:
> >>>>>
> >>>>> Call trace:
> >>>>>  ata_dev_quirks+0x98/0x19c
> >>>>>  ata_dev_configure+0x74/0x12d8
> >>>>>  ata_eh_recover+0x8d8/0xd08
> >>>>>  ata_do_eh+0x50/0xa8
> >>>>>  ata_sff_error_handler+0xd0/0xec
> >>>>>  ata_bmdma_error_handler+0x7c/0x12c
> >>>>>  ata_scsi_port_error_handler+0xc8/0x5f8
> >>>>>  ata_scsi_error+0x90/0xcc
> >>>>>  scsi_error_handler+0x148/0x308
> >>>>>  kthread+0xe4/0xf4
> >>>>>  ret_from_fork+0x10/0x20
> >>>>
> >>>> OK. So it is ata_dev_configure() being called many times from EH. We=
ird.
> >>>> But I have not a lot of experience with the bmdma drivers.
> >>>> Need to look into that.
> >>>>
> >>>> In the meantime, can you try this ?
> >>>>
> >>>> --- a/drivers/ata/libata-core.c
> >>>> +++ b/drivers/ata/libata-core.c
> >>>
> >>>> @@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct =
ata_device *dev,
> >>>>         size_t sz;
> >>>>         char *str;
> >>>>
> >>>> -       if (!quirks)
> >>>> +       if (!ata_dev_print_info(dev) || !quirks)
> >>>>                 return;
> >>>>
> >>>>         sz =3D 64 + ARRAY_SIZE(ata_quirk_names) * 16;
> >>>
> >>> Thanks, that reduces the number of quirk prints from 4 to 2 during
> >>> boot-up, and from 4 to 0 when resuming from s2idle/s2ram.
> >>
> >> 2 times on boot... Hmm.. So that means that you are seeing all the pro=
be
> >> messages twice (and not just the quirk message), right ?
> >
> > No, I do not see all probe messages twice.
> >
> > $ grep ^ata dmesg:
> >
> > ata1: SATA max UDMA/133 irq 128 lpm-pol 0
> > ata1: link resume succeeded after 1 retries
> > ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> > ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
> > ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
> > ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
> > ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
> > ata1.00: configured for UDMA/133
>
> OK. This path should get rid of the useless extra print:

Unsurprisingly, it does ;-)

>
> commit 3c65fcbf942c26ece6d1efef7ad1405c0163575f
> Author: Damien Le Moal <dlemoal@kernel.org>
> Date:   Thu Aug 1 18:04:22 2024 +0900
>
>     ata: libata: Print device quirks only once
>
>     In ata_dev_print_quirks(), return early if ata_dev_print_info() retur=
ns
>     false or if we already printed quirk information. This is to avoid
>     printing a device quirks multiple times (that is, each time
>     ata_dev_revalidate() is called).
>
>     To remember if ata_dev_print_quirks() was already executed, define th=
e
>     EH context flag ATA_EHI_DID_QUIRK_PRINT and set this flag in
>     ata_dev_print_quirks().
>
>     Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>     Fixes: 58157d607aec ("ata: libata: Print quirks applied to devices")
>     Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

    Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

