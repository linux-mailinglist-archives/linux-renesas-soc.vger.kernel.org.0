Return-Path: <linux-renesas-soc+bounces-7671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED0944777
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 11:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B688C2863E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 09:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1E2481DD;
	Thu,  1 Aug 2024 09:07:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527AB16F907;
	Thu,  1 Aug 2024 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503244; cv=none; b=C+xj4ONUbBVCU5bng/WiKXs8iGNi5rauIOlixb/0w8hPuTAs8A/nF3Cqe58PGiJ8dP9A+QWP3cRLKT16fsGq7bCbhQN895ZIkSBpZntrArxVXBy8KZP5YAV86zDJ3u86gD9BaV57CIcFDOZfs7Ap9Mmf0gu+/EQSJkKnBqopS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503244; c=relaxed/simple;
	bh=0aC5RnRL5pAi2OkV0cuhyGIRzfiO7v/VVlybKppWBEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kr8NRREcDLGPJZXFt/lm9Yga/RzQaC2T6HUdm2VrrzzXzK18eiHYCTENObLoBjLtjsjcSdAXKGyzZANk2QF4llNqFLG6jKZinr8LiTVTjrjsQi+uNOBGY7X5tx60gm6zXeTdwd1j+Td+Ync2mfArmMAuB9dgrhVfV61Cq4Hb06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e05e2b2d88bso5210431276.0;
        Thu, 01 Aug 2024 02:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503241; x=1723108041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5pA05qveT/ExK++IgOZdxvaIfl26j3G6L05udDWBGM=;
        b=WaLyQa8neWZuq9Let42Tt2TbEEtfkMUO5gIbtoxrLhIOtmngl3ZpSaL/SuH/oMYec8
         EzvtQTTnD5oQ6sPFzO7CkfOgQLs95M7Xz22rUlZlpLNh8ks2ksgYGCS5cYGFXOTmPl+s
         ZKt754mbrVySvHhm/qTuw9+vmTzug5Wf8b4xEA8fk7BgasE47XoXfvzsUE8fDXHHa9Fu
         nEQOTvEq5l72L+CrtfBD0xSd99cqzSZzT12gm0xn3MMqaSwVf/sWGw+qoKwAX9VXbBE7
         Hodf2tw2l+iVkzwVYLCBr2bgTSs+ivltvtEJdfDX/AQL2W8pG8ahMZBguu6yd6VFfXFG
         B28Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTtxYNGZTjtlW9/d34KYUXPhojOBMcIAxnh3/isa6W0OZXk844ufYGXewXmJByDVMMVwewwrAj3NV2Rif2kRYLFmksVFx+VArzOGdzgExlviU=
X-Gm-Message-State: AOJu0YwC0Ky8d7yODBUlqPweUd2nFyziH0tYfLXYP6g0weMMCwnA2o0u
	Z4eTLI1Yf/kC88BL8OtTs2r2KFbdiZ7sId3mLwMBi3P8QRB8iPXLbpsy0ww6
X-Google-Smtp-Source: AGHT+IFPKxfO3Lek+XuAL3pUoiBLKh+4/lCxAPEF//eKplbFPeqGo2wWTPVzwzFlb/1OzjQFUH03cA==
X-Received: by 2002:a05:6902:2b07:b0:e06:1bd:976 with SMTP id 3f1490d57ef6-e0bcd30b140mr2187996276.22.1722503240688;
        Thu, 01 Aug 2024 02:07:20 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a289b7dsm2998823276.36.2024.08.01.02.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 02:07:20 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-68518bc1407so20392357b3.2;
        Thu, 01 Aug 2024 02:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1cTjK2F+aihHf8JHex9Cx9wBUpL/cvmnkM5NEV6zh2CYDM5bSOSQ2oci+wS3Pq9fW56NvGpoEPqij3/8KbJJkJ/Iq3AMNrvR+kay/l7JFXfc=
X-Received: by 2002:a0d:de87:0:b0:62f:aaaa:187a with SMTP id
 00721157ae682-6874c2549fcmr10063457b3.14.1722503240296; Thu, 01 Aug 2024
 02:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726031954.566882-1-dlemoal@kernel.org> <20240726031954.566882-5-dlemoal@kernel.org>
 <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org> <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
 <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com> <5700ac9c-0f7e-40c2-b969-ad67b0ee96ba@kernel.org>
In-Reply-To: <5700ac9c-0f7e-40c2-b969-ad67b0ee96ba@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 11:07:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbkeeQy_WBcBhKhOzWv=MsCUjsVEBDrEi0b+g_-RKCOQ@mail.gmail.com>
Message-ID: <CAMuHMdVbkeeQy_WBcBhKhOzWv=MsCUjsVEBDrEi0b+g_-RKCOQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Wed, Jul 31, 2024 at 11:08=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org=
> wrote:
> On 7/31/24 16:27, Geert Uytterhoeven wrote:
> > On Wed, Jul 31, 2024 at 1:39=E2=80=AFAM Damien Le Moal <dlemoal@kernel.=
org> wrote:
> >> On 7/30/24 19:09, Geert Uytterhoeven wrote:
> >>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
> >>>> Introduce the function ata_dev_print_quirks() to print the quirk fla=
gs
> >>>> that will be applied to a scanned device. This new function is calle=
d
> >>>> from ata_dev_quirks() when a match on a device model or device model
> >>>> and revision is found for a device in the __ata_dev_quirks array.
> >>>>
> >>>> To implement this function, the ATA_QUIRK_ flags are redefined using
> >>>> the new enum ata_quirk which defines the bit shift for each quirk
> >>>> flag. The array of strings ata_quirk_names is used to define the nam=
e
> >>>> of each flag, which are printed by ata_dev_print_quirks().
> >>>>
> >>>> Example output for a device listed in the __ata_dev_quirks array and
> >>>> which has the ATA_QUIRK_DISABLE flag applied:
> >>>>
> >>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300=
)
> >>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', appl=
ying quirks: disable
> >>>> [10193.469195] ata1.00: unsupported device, disabling
> >>>> [10193.481564] ata1.00: disable device
> >>>>
> >>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus th=
e
> >>>> last quirk flag defined. This value is used in ata_dev_quirks() to a=
dd a
> >>>> build time check that all quirk flags fit within the unsigned int
> >>>> (32-bits) quirks field of struct ata_device.
> >>>>
> >>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> >>>
> >>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
> >>> libata: Print quirks applied to devices") in libata/for-next.
> >>>
> >>> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
> >>> printed not once, but four times.  Is that intentional?
> >>
> >> Not at all. I tested on x86 with AHCI and see this message only once. =
So it
> >> could be that different drivers may need some tweaks to avoid this spa=
mming.
> >> Though it is strange that the initialization or resume path takes this=
 path 4
> >> times, meaning that the quirks are applied 4 times. Need to look into =
that.
> >> What is the driver for rcar-sata ? Compatible string for it would be f=
ine.
> >
> > drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
> >
> > I added a WARN() to ata_dev_quirks() to show backtraces:
> >
> > Call trace:
> >  ata_dev_quirks+0x98/0x19c
> >  ata_dev_configure+0x74/0x12d8
> >  ata_eh_recover+0x8d8/0xd08
> >  ata_do_eh+0x50/0xa8
> >  ata_sff_error_handler+0xd0/0xec
> >  ata_bmdma_error_handler+0x7c/0x12c
> >  ata_scsi_port_error_handler+0xc8/0x5f8
> >  ata_scsi_error+0x90/0xcc
> >  scsi_error_handler+0x148/0x308
> >  kthread+0xe4/0xf4
> >  ret_from_fork+0x10/0x20
>
> OK. So it is ata_dev_configure() being called many times from EH. Weird.
> But I have not a lot of experience with the bmdma drivers.
> Need to look into that.
>
> In the meantime, can you try this ?
>
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c

> @@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct ata_d=
evice *dev,
>         size_t sz;
>         char *str;
>
> -       if (!quirks)
> +       if (!ata_dev_print_info(dev) || !quirks)
>                 return;
>
>         sz =3D 64 + ARRAY_SIZE(ata_quirk_names) * 16;

Thanks, that reduces the number of quirk prints from 4 to 2 during
boot-up, and from 4 to 0 when resuming from s2idle/s2ram.

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

