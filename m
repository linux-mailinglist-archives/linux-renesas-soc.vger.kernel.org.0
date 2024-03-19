Return-Path: <linux-renesas-soc+bounces-3890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A292987FCBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 12:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D477E1C226A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 11:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3CA7EF1E;
	Tue, 19 Mar 2024 11:25:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A27EF18;
	Tue, 19 Mar 2024 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710847516; cv=none; b=BkvYRF2PkWnRV8pU6kQOmalX7eyiFMS0tr/lgPzA8eTWW3T0BTv7kA63WtQh4/Ylkk4YHJxsSVpVPqHHYve5da7SjNSTw+8+XRGBuQ0gBKH1rXFR8QeCw0Myt3HlMIAspMuNlI5wsj5ybAdI/AmbYsvtKV1PUr1hbTdC1rHwpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710847516; c=relaxed/simple;
	bh=O3XfRAlsxj1cTSKG8Un87uspj0OssNlC3ZR5Bfa4Tzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1wtjJMnytUF+9s3qMuq3yKLpij0b4lX47Zo7/eVwZBGvGfBaKDIdSj9lW+3PUwYVZfTTmcHjEE5pnjtaqy3JQl8OGaDQMdSBioDnz1yDu6nnRmhy8DGXzCW/Q8+3Hh6BYZ4Kk8ztfHvvzun9RYgpSTQ2dTv1zmP7ySIXa1yq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso5109924276.1;
        Tue, 19 Mar 2024 04:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710847512; x=1711452312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRHixnOWRC/KMdGbivl51biaiJO7zcc3pvTocEgACtY=;
        b=qHrlbuBkIxcEPW6NXVQcDNmX/lt0qC6zP0EiqXx+BYtUipDjb1qGPW8KLBcV6m7jtW
         rTM0/Klv5gM7fU8Bro8r1CxeXZ1m/YnQaSaoiukbxNfuRgrNMxI9UVm+0kRIZkCsIbPU
         Sf4vKYCl74DNX13XCa+gXwiXdDajkqQi8ld0GPRrXxFT9kNdK7nRQuAppbXMCQeKrzRv
         lj/n/LTXBJlECkpL31cSBz0NsC8aOD4MKKQMbujm7aXXcuuxLzfwiP/wtH0qouPpFq1r
         6f9Xp0fuPpr2lWEd7YNgdJRTC7OzAHlQhKKDvOJHK5ZORrIgMeUGglbgJIKr4+OE5pPc
         OZ0g==
X-Forwarded-Encrypted: i=1; AJvYcCXXbaUX8Exfk54CQIQxvGIgu2N1uLheRlCz6cskr0X4oKbkdhMCdzebWg+KmSGZckXZjt+51uwsnJ8QCI1Ql0kwOvIeNlkakEMqmJkA6BfK4DgTCx6BNwrDM8/UHxzcNE9dhbh9a5Wruz/E76w=
X-Gm-Message-State: AOJu0YyBmCe8NyaEixu6WVIR3I+yEgRZwvqmItId1TsOecxKlKQboRQ1
	4kXCuDlcy+joWXdqfa8juK0nXhsil3ps38v6+9dEANkwVnGIKznEBRtT9cW0Cks=
X-Google-Smtp-Source: AGHT+IFOE5qU6uDOTeV1C5Ip/v05Zf7GLBu17GazOMxyt0Z6wOsbPBsSJXF7TnmH90JOZcYFPPxY/w==
X-Received: by 2002:a5b:8c6:0:b0:dd0:c866:ec3a with SMTP id w6-20020a5b08c6000000b00dd0c866ec3amr9259270ybq.22.1710847512140;
        Tue, 19 Mar 2024 04:25:12 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id y23-20020a25ad17000000b00dcd56356c80sm1603544ybi.47.2024.03.19.04.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 04:25:11 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a0a1bd04eso56780377b3.1;
        Tue, 19 Mar 2024 04:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpLPA3t2QiXob4Ixc2PK2JYGg9FNzMI+IO6+/lC9guzsIYFDtLcTln9nstR13D3M9nrHkHwgnxGEplUyT/ACJslE/LUnHAbzYurHVmJJPAixquAOpAAd8RguXZtuCIvAzxeJG54yhF8FUQ+Gg=
X-Received: by 2002:a81:d514:0:b0:60c:bdb0:cd28 with SMTP id
 i20-20020a81d514000000b0060cbdb0cd28mr16408139ywj.6.1710847511226; Tue, 19
 Mar 2024 04:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319105356.87287-1-biju.das.jz@bp.renesas.com> <20240319105356.87287-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240319105356.87287-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Mar 2024 12:24:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCF4o34ipVygU0_gXcie2JSkoeC3n18+EO=A5we2W1-g@mail.gmail.com>
Message-ID: <CAMuHMdXCF4o34ipVygU0_gXcie2JSkoeC3n18+EO=A5we2W1-g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 11:54=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> The RZ/G2L family SoCs has 10 pipe buffers compared to 16 pipe buffers on
> RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and use
> family SoC specific compatible to handle this difference.
>
> The pipe configuration of RZ/G2L is same as usbhsc_rzg2l_default_pipe[],
> so select the default pipe configuration for RZ/G2L SoCs by setting
> .has_new_pipe_configs to zero.
>
> Add SoC specific compatible to OF table to avoid ABI breakage with old
> DTB. To optimize memory usage the SoC specific compatible will be removed
> later.
>
> Based on the patch in BSP by Huy Nguyen <huy.nguyen.wh@renesas.com>
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Restored the else path for has_new_pipe_configs check in usbhs_probe()=
.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

