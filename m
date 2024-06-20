Return-Path: <linux-renesas-soc+bounces-6566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD2910A29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D85284934
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6CB1AF6B6;
	Thu, 20 Jun 2024 15:40:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE441ACE94;
	Thu, 20 Jun 2024 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898023; cv=none; b=HbAf9nS9mEdkXzOAJ/n+hsGpK4qhvr/3qi55HGakZRAUkagOkX6cSylWFG27eXQqE2mBnCyIer2+LJq+m/BlRIJJDEw033jAwg9DJAg6s3qAgFD5SNpDP9fFSIQr8/PHj++QN/Z6LnDhU9vwgUmH5U905j4pl60QDDSUgsepbew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898023; c=relaxed/simple;
	bh=44UxWeJuayI3bZGqwBHbWalofDb7+ni2lz+I7HuZP18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mak7SS1QC9y1jn0j5iRwAgceFvJS5vPyo3mVm3tGLGz2Hg5ZTvPxmXzsNzXBtO2NIR99pIk8qQYqTHC25FfgrFeT3JQpWLLPVHEkQFbj0CigOhrZG70jeJVGSQB3UkkvIIvW4/Tj4vE23YNNsrQXSIt/JW8WD3WpOBzgoX3pgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63bf3452359so10424127b3.2;
        Thu, 20 Jun 2024 08:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718898019; x=1719502819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sH7+YxOUiDXwjwnxlowJ+B9PVdvEeRNVTnlGmm0Kww0=;
        b=xEeC9uxbIF+dXjTO9Ny0EwsxYd3NaSmUXu1pBDUZ9jfyM7tlbcWwolISTNL0MLR7vR
         dWxYAfGRlnlc+pUv+UOWSTBpCc+4TL9L8x8EpXDZLTZuB59miEjNWrcZp/pDPpBzWd2k
         3DsbMoEDZlLezdxW7VFGIT48Xr22z/7F97/FSzgR23+YUNJelzF3dCxanoF1E62S2TlU
         faBK9EgtSOzKkrQvgtfaSTcGdr9Gv821q2TIwf95pXNejvaqavQQrmzlXcZjJgzo6n1F
         2HLllOcX/wbbfp2sdXblK/4/5XrYFaOsPhXGDHFBx+YScq2PpS8aVaVwMOhR1Gr3qjE5
         pu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgDCbgsCiTndGO5Th/cPOaIESKznxoyeiqvCXZTL1x3ii9alTmUbn20WRVlA83G8XioTGgRbdAeA6+/UcJtxVwUmujEt6/ji6btX0huKS+f/OqdME1MPoUfPsHKWP5+9haKoq6x6v4axwkSYU4HgEFVv3+9QNdqvSiMUEjvLyAOwBkdoVw8XEp4LdiAPSSRGxHF+/fkWLQhWD9eqESJ21dZ9b3wctu
X-Gm-Message-State: AOJu0YzC+VxXSgqEpTwRgcCLyqNyup4K3KlyQtKFxHqMa17se2GSFfRA
	SzGtSuOpN/RxMxme3myGbZe0WqKB7cxyTe8ZGhaTbkPSGyS/oyZqltdpcXdD
X-Google-Smtp-Source: AGHT+IHeLwk3RLz1ugAFOA+qTtKGY0HmYMbOxT79xAtMjZYQD1N9yD97tlJM2gGgPbaC08XmKOZqdg==
X-Received: by 2002:a05:690c:a10:b0:631:1d44:5850 with SMTP id 00721157ae682-63a903a431cmr54698107b3.47.1718898019519;
        Thu, 20 Jun 2024 08:40:19 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e9917asm30523987b3.60.2024.06.20.08.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 08:40:19 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6316253dc52so8497757b3.0;
        Thu, 20 Jun 2024 08:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe2BM8nqJh4hLDGhO98m3VPYsGhFb6YGs6xKx0OvPTmaCQhq4GuIYjgr5eAnzGMoJ6FbiCuGuLsr4UGT0HyG+rseDPos47lXtjJUo84Sat50NKyabpe3DiQQessgCmLrGOJF8Q5j7ZqlzdkjeGTGb+61R/sIorbLpOonJ/Vt4VHiDZvuBtenCv58tSe8QiBDFecgnrGw69BAACKZb1UT0fGNqqF/Us
X-Received: by 2002:a0d:e810:0:b0:632:5b24:c0c with SMTP id
 00721157ae682-63a8dc08affmr55684907b3.5.1718898019011; Thu, 20 Jun 2024
 08:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 17:40:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
Message-ID: <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Thu, Jun 13, 2024 at 11:17=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> similar to those found in R-Car Gen3. However, they are not identical,
> necessitating an SoC-specific compatible string for fine-tuning driver
> support.
>
> Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> - Voltage level control via the IOVS bit.
> - PWEN pin support via SD_STATUS register.
> - Lack of HS400 support.
> - Fixed address mode operation.
>
> regulator support is added to control the volatage levels of SD pins
> via sd_iovs/sd_pwen bits in SD_STATUS register.

Probably I am missing something obvious in the big picture, but why
must this be modelled as a regulator?  Can't the SDHI driver handle
this register bit directly?

Cfr. tmio_mmc_power_on(), which can use the tmio_mmc_host.set_pwr()
callback[1] instead of/in addition to a regulator.

Thanks!

[1] Oh, no more users... Let's get rid of it... patch sent...

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

