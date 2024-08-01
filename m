Return-Path: <linux-renesas-soc+bounces-7673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26A9448F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 12:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E4D6B22A8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9B9171E7C;
	Thu,  1 Aug 2024 10:05:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F32AD25;
	Thu,  1 Aug 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506759; cv=none; b=Eb/KU8m4Xe4hSv5m9s/GjOUEl02S6clwCcZbnRwqL8qvYXLATICZDCvHd3N+Yaqv19MYf5uW4I9jBrWfRTy/Y1kXzPzbe9d6F/fpB6004B40K5dEwRbPED7n+IJoGDmtSgxlYXPNMigRJ42brI+eSPikRcaGmb94pwweR/3LxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506759; c=relaxed/simple;
	bh=VdpPx5dnjpYWgRLJV8bXAnMmNOnoqYVRfza+EbgKDgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kv6scdojtWYHMXoDASMeGgBQMgvsO9eyAlIYAsfOnG3TcTeGi/GNFtnBfrbHE1Fj9rGtB3LlF23Cw1Auxf/080xe3oc/PYszu4Zj8B8PrXJJOYd00NmPFs16GnNy917qryMErDIcb+j10vL3zTjdXY3u4nuBt8Eub1DIMKcSV/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0857a11862so5488414276.1;
        Thu, 01 Aug 2024 03:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506756; x=1723111556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT02MDM/HGNPMHZT42SXUhSCLFvJXxieiNlVB0dDDYQ=;
        b=ZqoeAioN26x+xRtlwBEtbBgEO1Q2xA/KfA8GVVnQzsrdS+xhCxaebjAE+VwcyLyLzv
         obCdBkRGrWjEKOh3Z6z07sNtlotW02vIg7GZV+xv7UTEKC8REsyTZ3/+n/SJkHCXQjZd
         PwyQxy7aw0BKT2EbvpREiAHL5KKZM1yjaXtvVY7+s4UeYOOHFXyZwzCzqE5cttSPFbwB
         ZO7zV1GuohxJ00k7qiw6Wzg4czqNqoaTW+fuDv/5URMNIHfUozlRpodqjS2buLScccsX
         Hfpw4+Et0Tuz/P/rnquNjrrjrgLdoHGDMaLvRFv5EwvECgvDhnP3gzasQ5xq0t3jbaWE
         uLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNEKseZPIBd8FkYf3kQFyErvoj99VxltAs9H8ph4f9rEqrpbHUm2wR+vhpOOpn9FImBMdM/WQ+FePrB5GnQKJ5PWHiotEh3A0d+CczESoCevU=
X-Gm-Message-State: AOJu0YxF2lb70Cjv1WVJ/bCq99Xb9A/Njg4Cb6sLcLBtGMiRibAZvHm1
	VZABGQqkzxIH5UGjLloxGThfBpmH3sbXbhBT5tyoDocXVzG2OApKQ697aJqn
X-Google-Smtp-Source: AGHT+IHW0BoQldvOCw6C5fXBXN+8Nb9Z3XOG1617s0bJlZOqt1smn0N6L85Cw7kHVsOyELgzD00yOg==
X-Received: by 2002:a05:6902:2741:b0:e0b:122c:46b6 with SMTP id 3f1490d57ef6-e0bcd471e4cmr31541276.53.1722506756145;
        Thu, 01 Aug 2024 03:05:56 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0bd9684584sm12769276.58.2024.08.01.03.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 03:05:55 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66108213e88so53797337b3.1;
        Thu, 01 Aug 2024 03:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL6NLtWUPKRq2S27yV1Qcm4xgDAd4e53K9W/ejrKDMAiQ006BcRi6bVlrMMTchVR+YC4msYgwRH7F4eKlpjmFOsWYwXDltTC5Pdtll72gcQ38=
X-Received: by 2002:a81:9e02:0:b0:627:a757:cdfa with SMTP id
 00721157ae682-68750c2e545mr217707b3.38.1722506755675; Thu, 01 Aug 2024
 03:05:55 -0700 (PDT)
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
 <0f9d26c0-e79e-4913-862a-3df642177415@kernel.org>
In-Reply-To: <0f9d26c0-e79e-4913-862a-3df642177415@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 12:05:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWduj2CeB=dqzHPNgHxTXgpWD18H_ew1zp_rc6OwyqHQw@mail.gmail.com>
Message-ID: <CAMuHMdWduj2CeB=dqzHPNgHxTXgpWD18H_ew1zp_rc6OwyqHQw@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Thu, Aug 1, 2024 at 11:25=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
> On 8/1/24 6:07 PM, Geert Uytterhoeven wrote:
> > On Wed, Jul 31, 2024 at 11:08=E2=80=AFAM Damien Le Moal <dlemoal@kernel=
.org> wrote:
> >> On 7/31/24 16:27, Geert Uytterhoeven wrote:
> >>> On Wed, Jul 31, 2024 at 1:39=E2=80=AFAM Damien Le Moal <dlemoal@kerne=
l.org> wrote:
> >>>> On 7/30/24 19:09, Geert Uytterhoeven wrote:
> >>>>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
> >>>>>> Introduce the function ata_dev_print_quirks() to print the quirk f=
lags
> >>>>>> that will be applied to a scanned device. This new function is cal=
led
> >>>>>> from ata_dev_quirks() when a match on a device model or device mod=
el
> >>>>>> and revision is found for a device in the __ata_dev_quirks array.
> >>>>>>
> >>>>>> To implement this function, the ATA_QUIRK_ flags are redefined usi=
ng
> >>>>>> the new enum ata_quirk which defines the bit shift for each quirk
> >>>>>> flag. The array of strings ata_quirk_names is used to define the n=
ame
> >>>>>> of each flag, which are printed by ata_dev_print_quirks().
> >>>>>>
> >>>>>> Example output for a device listed in the __ata_dev_quirks array a=
nd
> >>>>>> which has the ATA_QUIRK_DISABLE flag applied:
> >>>>>>
> >>>>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 3=
00)
> >>>>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', ap=
plying quirks: disable
> >>>>>> [10193.469195] ata1.00: unsupported device, disabling
> >>>>>> [10193.481564] ata1.00: disable device
> >>>>>>
> >>>>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus =
the
> >>>>>> last quirk flag defined. This value is used in ata_dev_quirks() to=
 add a
> >>>>>> build time check that all quirk flags fit within the unsigned int
> >>>>>> (32-bits) quirks field of struct ata_device.
> >>>>>>
> >>>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >>>>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> >>>>>
> >>>>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
> >>>>> libata: Print quirks applied to devices") in libata/for-next.
> >>>>>
> >>>>> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
> >>>>> printed not once, but four times.  Is that intentional?
> >>>>
> >>>> Not at all. I tested on x86 with AHCI and see this message only once=
. So it
> >>>> could be that different drivers may need some tweaks to avoid this s=
pamming.
> >>>> Though it is strange that the initialization or resume path takes th=
is path 4
> >>>> times, meaning that the quirks are applied 4 times. Need to look int=
o that.
> >>>> What is the driver for rcar-sata ? Compatible string for it would be=
 fine.
> >>>
> >>> drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
> >>>
> >>> I added a WARN() to ata_dev_quirks() to show backtraces:
> >>>
> >>> Call trace:
> >>>  ata_dev_quirks+0x98/0x19c
> >>>  ata_dev_configure+0x74/0x12d8
> >>>  ata_eh_recover+0x8d8/0xd08
> >>>  ata_do_eh+0x50/0xa8
> >>>  ata_sff_error_handler+0xd0/0xec
> >>>  ata_bmdma_error_handler+0x7c/0x12c
> >>>  ata_scsi_port_error_handler+0xc8/0x5f8
> >>>  ata_scsi_error+0x90/0xcc
> >>>  scsi_error_handler+0x148/0x308
> >>>  kthread+0xe4/0xf4
> >>>  ret_from_fork+0x10/0x20
> >>
> >> OK. So it is ata_dev_configure() being called many times from EH. Weir=
d.
> >> But I have not a lot of experience with the bmdma drivers.
> >> Need to look into that.
> >>
> >> In the meantime, can you try this ?
> >>
> >> --- a/drivers/ata/libata-core.c
> >> +++ b/drivers/ata/libata-core.c
> >
> >> @@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct at=
a_device *dev,
> >>         size_t sz;
> >>         char *str;
> >>
> >> -       if (!quirks)
> >> +       if (!ata_dev_print_info(dev) || !quirks)
> >>                 return;
> >>
> >>         sz =3D 64 + ARRAY_SIZE(ata_quirk_names) * 16;
> >
> > Thanks, that reduces the number of quirk prints from 4 to 2 during
> > boot-up, and from 4 to 0 when resuming from s2idle/s2ram.
>
> 2 times on boot... Hmm.. So that means that you are seeing all the probe
> messages twice (and not just the quirk message), right ?

No, I do not see all probe messages twice.

$ grep ^ata dmesg:

ata1: SATA max UDMA/133 irq 128 lpm-pol 0
ata1: link resume succeeded after 1 retries
ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
ata1.00: configured for UDMA/133

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

