Return-Path: <linux-renesas-soc+bounces-6568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C0910ACA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F2171C2122B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6727B1B0103;
	Thu, 20 Jun 2024 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkIRFZwV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61141AC434;
	Thu, 20 Jun 2024 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899030; cv=none; b=NsZlGjZ9rbzxReihvbcNFcZPb+P0xm3/D+7I5tunzeL74arsbCl551Npd6mvL/iidMLrjI/bN3+4XJzPxxG2ySTTaZ74t2i04i6jt1sHun3tseGMFWbbIPRIztN/jeFFH5Fh2nNrBqIqKMRYKHuo7upmL5hk+ZL/KXyVaWfPLn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899030; c=relaxed/simple;
	bh=1/3jMQta6TJTs+n1vvC+mx8axZltBF9BRh8e6GozG1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNunQElwTOIDB9PT+3KG1fSmYfzvtDOKQePoodyIz/RaSvaCJ5SSbdDAldhsVjeDMvmsHyadCh9uJuvcKno+0FTFbJohwIxRYzto5LTHvDqQA11+3VYmlCIVGdJtVoscPCbubVnr3nTwuesx33jdVcqRkryDTC+bc9w5d1xEsM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkIRFZwV; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d220039bc6so542561b6e.2;
        Thu, 20 Jun 2024 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718899028; x=1719503828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yH+4x0Ne5PVUvj2VIv4THnKxxFN7sxSm6+NDSVc/Dk=;
        b=nkIRFZwV/nEsWNWU7cysyRbnDaOjRoXH0u5xX1aNG0Bwccw0hLCAb9GMo1Gfsjflbo
         Bp7jEsmKDWEN4mKMvoBsRTZD0nhkTe5Ks9pkonEsrtBFT9wS/G/3LY/RX6ZMZ+zWb8ou
         dh7lYsnzOhX50E54ZU9+r4jRok771TM0RYgKytd56dumvJYmaHwRYBd8lhbXzfKrJS3B
         rTU8UFTboOwyUErNjXQylmOvBF9XnXi92TAXXHp9WQ7mNjfpytxXuZW9t2gNF93Y9NE9
         V+nDieNOIlX5PENaEM6olCAfEAgXbkeZEva+5lOQ91/8toI6asdDO7Ptrm3vfXUFYqKs
         b1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899028; x=1719503828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yH+4x0Ne5PVUvj2VIv4THnKxxFN7sxSm6+NDSVc/Dk=;
        b=YcEeeTsx4AvrYmgrvDKyNb4us5FkGhkiH6kxFU014kyULagps9NVrtzsJhEa9p5wD/
         KzIImMI0ICjBjzLnpKzfEhorwIXyM+XYya8b6X5Dw/iCrrtDmYRWmkpV+7DAenMJWhZs
         Gj1+/gO7ZpP7KuXynSt6mXSnuaYn0zuhvvIR+joeVUre7WqKVhbacgcR/ITreleoQduk
         BjbHME4Hi93RJyxaG5CjS26WoKlaZf0KNHi0a4XU1R8nvaq4FoH3dLf6l9ngyLXWkKb4
         tW9MsTMg2xWns6miLSXpGA96RMiGMRwHUXPNNNysCnw2WZcPaCs9ovI1CiC6GwlfbhMQ
         kriQ==
X-Forwarded-Encrypted: i=1; AJvYcCUePwcVkh4bImYaw3nQW2XH0BxWk8v3SL7X4jhIm95F22pBIz2e3DJZHtQ/SoZdHfZXwrv71vlh3Q12tYUZeYROrg9rSzzjxuTs7Lusyp8CGj2uMndUlq35MhBNruGLe1IJjJhX3zQ6KmxBQGYHWcl4gSUyRTNQiNIkpTRfQdQJwPvvFT5b3cZrQd2ueYP+DqmuZgu9M+e+2tgMKFJLvujB6CD0p7jx
X-Gm-Message-State: AOJu0Yxl3kd8LLEdYamM69J8/tflmn5x0pzc4ZJNJLkoT5Km3hTB/9qT
	DrZl/D4Ubixb6GP7rKJGq1V1twGzld449D2nopRXu0+yXh9teMxSY5UM3IXFibNVBfvzko3PiyM
	YqTRn5N3vEtVG5dWAQIK2siotPWc=
X-Google-Smtp-Source: AGHT+IEpPyR93wa8MmcURc+azft6wBBGKdu4UUIVXgLDzmGMOOcH6MmPKS71AqKGIIVorCAxdNVazKLVGTx7AzEwLP8=
X-Received: by 2002:a05:6808:148c:b0:3c9:6a21:8cb4 with SMTP id
 5614622812f47-3d51b99609amr6332410b6e.18.1718899027469; Thu, 20 Jun 2024
 08:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 16:56:41 +0100
Message-ID: <CA+V-a8v_r5efeR3U+J0MK7cKxPR7a6s0z4fws0iHO1-uezAuTA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 20, 2024 at 4:40=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Thu, Jun 13, 2024 at 11:17=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
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
> > regulator support is added to control the volatage levels of SD pins
> > via sd_iovs/sd_pwen bits in SD_STATUS register.
>
> Probably I am missing something obvious in the big picture, but why
> must this be modelled as a regulator?  Can't the SDHI driver handle
> this register bit directly?
>
It can be handled directly. I had asked for suggestions on how to
implement this ("Subject: Modeling the register bit as a voltage
regulator for SDHI/eMMC '' also CC'd you), based on the feedback below
from Wolfram I took this approach.

> There is a similar instance of regulator driver [1] which is
> controlled via register bit write, but in our case the SD_STATUS
> register is part of the SDHI IP block itself.

... I could imagine that the SDHI driver itself exposes a regulator
driver. Just without a <reg>-property. The compatible will induce which
register and bit to use.


> Cfr. tmio_mmc_power_on(), which can use the tmio_mmc_host.set_pwr()
> callback[1] instead of/in addition to a regulator.
>
PWEN bit would have been controlled via set_pwr()

Cheers,
Prabhakar

