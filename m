Return-Path: <linux-renesas-soc+bounces-7056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC05927AB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 17:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50771C239FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 15:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C7C1B29C3;
	Thu,  4 Jul 2024 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzah5f2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677311ACE67;
	Thu,  4 Jul 2024 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108692; cv=none; b=o6xzWEqFc+4tKtKaAGYvmxL+oZu+QaLIV90aAAj0GTMUEp4kkWgTWGYZzzEPPblAeJ8+Gq3Vz1tyWb03+zbh+eCGnYljpugTuF54+mAT/2T4zxO65fkoctLrOzR+NjqOzRCFsPzrzS7UoIHm+sP6RoMAwnCMR2HQsbq9nj8oWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108692; c=relaxed/simple;
	bh=wJE7HlCPQ2VZ9sr7/loD0hwkFhbboA9WmXEnW4+ChsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orgkQGoQCEx7Ffkguj34NQy7tQWkLxTfo9ebzOtFShuNqrcgGqMIDQd44+QVcVLKvCbwTDvdva7ZmTqE74F0GyYDEMikDmjKMYwILtF4E0yKgIces+tEhfsSGOQh5Fyp4j356eZx/4pX1SsP/0rniwo9W+mz80trEcDzQPAA+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzah5f2j; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4ef6c8e3602so326850e0c.0;
        Thu, 04 Jul 2024 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720108689; x=1720713489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n97CqCq+SpioBUdMovQEEVaZXmKGUSWX+N+6ZspvJ5Y=;
        b=fzah5f2jPp6xeoFelee2+jl1Jn3hKibubDigkvbQsHgv5GzFC0+nFQris9eZwQ+NOv
         C8r4OwujqbDFBfGp5PuYGdFVygq9IjqdKzsZhOn6MarqHKJHmQI8OVZYjfXf4u+d0e/A
         niNupZ9nwSJa1XuVz78JbSbP/4X7322uh8tfjRZpbSkkYcN2mde8al0O0GS6auW89S7X
         XrME3v8yxfjby9iiEEcmFuKbxEFVY+nl+iPNCiiVN72FldRTEedUwDc9eSvE+zmPaLvK
         YjakGdyZD3zLSWeOY7JftCVArKFCuq4qOmda6m7TNJrRhW854H1JGVf37RpktRXFOPyT
         vmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720108689; x=1720713489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n97CqCq+SpioBUdMovQEEVaZXmKGUSWX+N+6ZspvJ5Y=;
        b=c47otx7njgEewVCWLFfCNjnj+cPMLfUatpFJK9a7D/ra1IX9FtyEWg9YBTl3XblmoV
         lBqz0sw0iI70GJK5xmxP8F9oJF1x8GqKSMowfybKSePAbpCy4hst8KRVE2aZLDke4/ft
         zIjqFxVqjO9rLnS7pOR7dT78hvM4KGmEisP3Zqni4aa4GhGXnYNALUIrfkmqaQdvK+pD
         7mofMNUIIS1i119+MmLkvU+3VqXl26ChyB8Y2pi+dtI8UGzHUJ1PLxHOMDgAPKo0vYZO
         sE/1gJLyfLI4oJfCPyf6eSS2jkl7XBv6RueKhOwy1/IP7mmxF6zbB9sLDMGgUcoxcnTY
         USLA==
X-Forwarded-Encrypted: i=1; AJvYcCUPnMaayVI6UqPSkxl/wWWdcUDZmXaVfjhjGJEgDNfLOthlhUZaQFGu/CGFjd+/cvRMGq11Y2DVpyAYv+Uf1u4qKTeYLJ/qzf3hqqvtHD8BBZnVr6qvylWV7zrnecE8A2r/9gpsuViln+EYorvAuShD+rNNeVmFfnB30Sl72QWDFeFnsEVjpgE0JPLTf5qlNreQEZRKYaw31oNqC1j0+z3GYAk6b9B/
X-Gm-Message-State: AOJu0Yw0vS/g5Zst0KfddZGebQi5AmWoBPDhKvM/euNn54qeBbTvkD9e
	y6XLeEWTtndTw4u6rlx96s64GewRznvOTreCrHzJ/t5kxBt+Ow0cvLnGO4WN0rF5bCUX0o08RO1
	zhuzpqqDaMV9J1LKg7ZVwlK/BBq4=
X-Google-Smtp-Source: AGHT+IFZ1AIkhnIlR1F2PajHwGmAM3QHm7zYfUYNlGkAcCt+TyLYZj4pGDx0Qw5zZbScstvZjUXz2fAMKekKDEkjrCQ=
X-Received: by 2002:a05:6122:3887:b0:4ef:4b35:896f with SMTP id
 71dfb90a1353d-4f2f3e9ea73mr2621613e0c.7.1720108688497; Thu, 04 Jul 2024
 08:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZoUdUyrld2kZorvU@shikoro>
In-Reply-To: <ZoUdUyrld2kZorvU@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Jul 2024 16:56:56 +0100
Message-ID: <CA+V-a8v5VcBRjp-kPGp2pKXZ2RhCSXHdsL9X5YDOxjL6W1Mg=Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Wed, Jul 3, 2024 at 10:43=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 26, 2024 at 02:23:41PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> > similar to those found in R-Car Gen3. However, they are not identical,
> > necessitating an SoC-specific compatible string for fine-tuning driver
> > support.
> >
> > Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> > - Voltage level control via the IOVS bit.
> > - PWEN pin support via SD_STATUS register.
> > - Lack of HS400 support.
> > - Fixed address mode operation.
> >
> > internal regulator support is added to control the voltage levels of SD
> > pins via sd_iovs/sd_pwen bits in SD_STATUS register.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3=
S
> > ---
> > v3->v4
> > - Dropped using 'renesas,sdhi-use-internal-regulator' property
> > - Now using of_device_is_available() to check if regulator is available=
 and enabled
> > - Dropped extra spaces during operations
> > - Included tested by tag from Claudiu
> > - Rebased patch on top of https://patchwork.kernel.org/project/linux-re=
nesas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/
> >
> > v2->v3
> > - Moved regulator info to renesas_sdhi_of_data instead of quirks
> > - Added support to configure the init state of regulator
> > - Added function pointers to configure regulator
> > - Added REGULATOR_CHANGE_VOLTAGE mask
> >
> > v1->v2
> > - Now controlling PWEN bit get/set_voltage
> > ---
> >  drivers/mmc/host/renesas_sdhi.h               |  13 ++
> >  drivers/mmc/host/renesas_sdhi_core.c          |  98 ++++++++++++
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 147 ++++++++++++++++++
> >  drivers/mmc/host/tmio_mmc.h                   |   5 +
> >  4 files changed, 263 insertions(+)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas=
_sdhi.h
> > index f12a87442338..cd509e7142ba 100644
> > --- a/drivers/mmc/host/renesas_sdhi.h
> > +++ b/drivers/mmc/host/renesas_sdhi.h
> > @@ -11,6 +11,8 @@
> >
> >  #include <linux/dmaengine.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/machine.h>
> >  #include <linux/workqueue.h>
> >  #include "tmio_mmc.h"
> >
> > @@ -36,6 +38,12 @@ struct renesas_sdhi_of_data {
> >       unsigned int max_blk_count;
> >       unsigned short max_segs;
> >       unsigned long sdhi_flags;
> > +     struct regulator_desc *rdesc;
> > +     struct regulator_init_data *reg_init_data;
> > +     bool regulator_init_state;
> > +     unsigned int regulator_init_voltage;
> > +     int (*regulator_force_endis)(struct regulator_dev *rdev, bool ena=
ble);
> > +     int (*regulator_force_voltage)(struct regulator_dev *rdev, unsign=
ed int voltage);
>
> I am open for discussing this but maybe here only
>
> +       struct renesas_sdhi_regulator *internal_regulator
>
> or something and create the new struct with the additions above?
>
> > +     int (*regulator_force_endis)(struct regulator_dev *rdev, bool ena=
ble);
> > +     int (*regulator_force_voltage)(struct regulator_dev *rdev, unsign=
ed int voltage);
>
> Do we need these functions because the regulator framework cannot force
> these actions because it caches the old state? I wonder if we can avoid
> these functions...
>
Yes, for the voltage setting, it caches the values. However, for the
regulator enable/disable, we can use is_enabled(), which probes the
hardware.

The reset value for PWEN is 1. The regulator_force_endis() callback is
mainly added for a scenario where, consider a code flow where the
regulator is disabled (using regulator_disable()) and now we land in
the reset callback (i.e., renesas_sdhi_reset()). Here, after issuing
the reset, the PWEN value will be 1, but we need to restore it back.
Hence, this callback is necessary. Note that is_enabled() cannot be
used, as it probes the hardware when it switches states after a reset.

The reset value for IOVS is 3.3V. Below is the scenario for which
regulator_force_voltage() is added:

-----> Current value: 1.8V (cached by the regulator)
--------------> After reset:
------------------> Hardware has 3.3V, but the regulator core cache
still has 1.8V.
----------------------> When requested to switch to 1.8V from MMC
core: The regulator core returns success, as it sees 1.8V in the
cached state.
----------------------------> As a result, the SD card won't work.

Cheers,
Prabhakar

