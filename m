Return-Path: <linux-renesas-soc+bounces-7646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B989427DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 09:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9064F2889E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 07:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A1C1A4F0A;
	Wed, 31 Jul 2024 07:27:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343081A4F08;
	Wed, 31 Jul 2024 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410873; cv=none; b=U35p7VwpzPXO+guJ452LUed0TNBbj5ZgxwhdmpbBF0jU5t14egBinbdR37ZCtsxNNViFx791ccFHZVtL0SQj9rbBcotzH9UuRP8Nf5YrNf9ZdqdotPioT9ZHqX82DWZ5sRBDuiGJsoaoBLVFAq3KeCQ/4oll1Eoiu6deoIbEbWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410873; c=relaxed/simple;
	bh=SHKR7ZHpf7qpgBELk85zr7mKl3n//7nlezfIgnjhzMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kA1x4TasCi2oJuZCmWmOrQhKjiH2U81riVHra5FXp//N1nJoJW+aTrPK7+fQhMyp2ZDihHuiH8sk3ZGnsvxQMzeyw7xY8R+LbxbdyF/tNczBqpIw7qJNju4pAwUGFDmwIUw6L7VifCxxZH2ioSE4gkbJCWH8/9uwHcSLZQtXu5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-661d7e68e89so5733847b3.0;
        Wed, 31 Jul 2024 00:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410869; x=1723015669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Efl1bAY5jd1ro6+P+ADsXCEREKQIw+S15gw1lpjEg/g=;
        b=AhSBRMxbgvlB+BTxG4EviTzHxWVsCad7NHxm/FgxFKh3WSY7oEI/ocRG8tdelOE0WE
         hNu1esiezuE3Y5fMUQfLAP9+oPiqUrzVD6b4quWRDxFUgOnI5me/CkeQ+qiWbHg9gSuH
         LR4B3AKiqZWE835ZN4Vl4L/v5OLot55w+yNLhbL7Fi5mtWjyaoyRyvD7tgz6owri6mvD
         E3mwIUrcKKHEVYvIjQ5JrTI3b57jG1Q83mx+5EQFS7QZnMTYwC3Shz93jugLCngHD52j
         s5IvnlJp/JO3w39Es4RTizdRnsEiiz6i5i5AmIFvev5pRLMi3mUesxJjnI7Cg56tAIey
         zJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBFygY63g5XfAvxTaXOzmoyrd50KfhObkf73IW1u3A+zz3Qhu6RWaa89IXJaExL2DDkamrP+zTi/84tbAWoZc1mf9ZTWxpa2vryBVCZncwKe4=
X-Gm-Message-State: AOJu0YxVzw3Va3K4hkYzMvkuyhygCJcDZhJcRebtTDnhAEF426xnCVe5
	CM6XGPjZlr58rVCDW4XEfrmckQJmr6G4pkO+SO1UX4OZgZ2S+FCPJEb0ffgx
X-Google-Smtp-Source: AGHT+IGwSWkq4RRj16OcZyLHKJGpmYKTFjLIS7NmFwi8DxxNzmSiSeYgg1ZZm2XBKpj8hqJcbgwJpw==
X-Received: by 2002:a05:690c:6b86:b0:62f:206e:c056 with SMTP id 00721157ae682-6826a0e3268mr51157617b3.5.1722410869422;
        Wed, 31 Jul 2024 00:27:49 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b9bec64sm28231187b3.107.2024.07.31.00.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 00:27:49 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-664b4589b1aso5311997b3.1;
        Wed, 31 Jul 2024 00:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiMOLMiRSBJh7UaLLkx8oAV4ZO8HYE8giar2ZO0+tfU6yeE4YqvAuIBzv+EXy4chlQiIfc1QZQxRibdSYedIxF38Z4eAvdpbchjiQrZCEYe7k=
X-Received: by 2002:a0d:f287:0:b0:651:ee07:76c with SMTP id
 00721157ae682-6826ef4c499mr41180647b3.15.1722410868909; Wed, 31 Jul 2024
 00:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726031954.566882-1-dlemoal@kernel.org> <20240726031954.566882-5-dlemoal@kernel.org>
 <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org> <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
In-Reply-To: <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jul 2024 09:27:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com>
Message-ID: <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Wed, Jul 31, 2024 at 1:39=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
> On 7/30/24 19:09, Geert Uytterhoeven wrote:
> > On Fri, 26 Jul 2024, Damien Le Moal wrote:
> >> Introduce the function ata_dev_print_quirks() to print the quirk flags
> >> that will be applied to a scanned device. This new function is called
> >> from ata_dev_quirks() when a match on a device model or device model
> >> and revision is found for a device in the __ata_dev_quirks array.
> >>
> >> To implement this function, the ATA_QUIRK_ flags are redefined using
> >> the new enum ata_quirk which defines the bit shift for each quirk
> >> flag. The array of strings ata_quirk_names is used to define the name
> >> of each flag, which are printed by ata_dev_print_quirks().
> >>
> >> Example output for a device listed in the __ata_dev_quirks array and
> >> which has the ATA_QUIRK_DISABLE flag applied:
> >>
> >> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> >> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applyi=
ng quirks: disable
> >> [10193.469195] ata1.00: unsupported device, disabling
> >> [10193.481564] ata1.00: disable device
> >>
> >> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
> >> last quirk flag defined. This value is used in ata_dev_quirks() to add=
 a
> >> build time check that all quirk flags fit within the unsigned int
> >> (32-bits) quirks field of struct ata_device.
> >>
> >> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> >
> > Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
> > libata: Print quirks applied to devices") in libata/for-next.
> >
> > During boot-up on Salvator-XS (using rcar-sata), the quirk info is
> > printed not once, but four times.  Is that intentional?
>
> Not at all. I tested on x86 with AHCI and see this message only once. So =
it
> could be that different drivers may need some tweaks to avoid this spammi=
ng.
> Though it is strange that the initialization or resume path takes this pa=
th 4
> times, meaning that the quirks are applied 4 times. Need to look into tha=
t.
> What is the driver for rcar-sata ? Compatible string for it would be fine=
.

drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.

I added a WARN() to ata_dev_quirks() to show backtraces:

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0x74/0x12d8
 ata_eh_recover+0x8d8/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0xf34/0x12d8
 ata_eh_recover+0x8d8/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0x74/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_do_set_mode+0x534/0x6bc
 ata_set_mode+0xc8/0x128
 ata_eh_recover+0x944/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0xf34/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_do_set_mode+0x534/0x6bc
 ata_set_mode+0xc8/0x128
 ata_eh_recover+0x944/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

The backtraces seen during s2idle are slightly different:

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0x74/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_eh_recover+0x7b4/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0xf34/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_eh_recover+0x7b4/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0x74/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_do_set_mode+0x534/0x6bc
 ata_set_mode+0xc8/0x128
 ata_eh_recover+0x944/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

Call trace:
 ata_dev_quirks+0x98/0x19c
 ata_dev_configure+0xf34/0x12d8
 ata_dev_revalidate+0xb4/0x1b8
 ata_do_set_mode+0x534/0x6bc
 ata_set_mode+0xc8/0x128
 ata_eh_recover+0x944/0xd08
 ata_do_eh+0x50/0xa8
 ata_sff_error_handler+0xd0/0xec
 ata_bmdma_error_handler+0x7c/0x12c
 ata_scsi_port_error_handler+0xc8/0x5f8
 ata_scsi_error+0x90/0xcc
 scsi_error_handler+0x148/0x308
 kthread+0xe4/0xf4
 ret_from_fork+0x10/0x20

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

