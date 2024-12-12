Return-Path: <linux-renesas-soc+bounces-11270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE59EECDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168B018844FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F7E217F28;
	Thu, 12 Dec 2024 15:36:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B258216606;
	Thu, 12 Dec 2024 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017809; cv=none; b=ASOVmdaVuPucXRXwvYDC1TrQ4GU6kATNHQe0hm5dLowDFdHLRNqsTbId70VBeaYS7purM4U7GNFFm+pQ5zf0JU4QoWh1lemCVEC1eLVxQUnanwHTKypCTA6C8C8IP2tVKo/veCEbg5ljyQRgW9VULIwSFXUe2bmRJq85xvSRy3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017809; c=relaxed/simple;
	bh=qRDLIw4ZDMRB1Df/8aGHjiOUiQLdpFkt6PMOl/S8o8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7sDeWRTOA4i/w9UGXhSPcFxZX+AT0BPUIGNjsyGORp0yMTj1MF8XHHnRAtvNFsp6nSYORQpo4fp6mfe4nwSMymWl3qFSJ0R+5qNeTbkt4KKUKcD7VlaNBZgJZ+XSOY4+mD69V53JZk1gVc7slKdPlahe0AJyICZbN3jlp6VUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46788c32a69so7934771cf.2;
        Thu, 12 Dec 2024 07:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017806; x=1734622606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEcrdkggV4AEyJeLrUU/fHSVTxhTC+YS3BUPwe7I09Q=;
        b=o1E+ziOPVhleSSsW4GUkNYY1Nk0C66CLKM/JQJUs3tiZhrOR+nD6KQuXt8SYMFGo6b
         mjGFLHX4J7Qa/8HVFnpJXyKOBWaahff/XXNyTJdQqQFsLNJ0VV2p6DlPpdH7upNT7Rd5
         TBV8wGn+Fj5WGRg7rOu9I0zt809dSpBhZuL0EVdCsLjmNgtq/gMU/kZfiAQVoouSs0Kz
         jseN6aw05DFrv76P24vQQwx38rM9DN+/khenVwi7aSPWTi1I9oMCXMVHw5s3rAHVAXJR
         IEwir5+aHZGpLEv+UVLwqCngMMuWykX6qTaLcEZYDPDquda7Qwa80L+6bid7O7DmYRen
         dX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpdUkWO+meOQmmJ9CZWa1VAOIbIsAq4INQaYxU9aXZ9aXW4dOi3S5bcFxBbBzQnxSZu5vA7JLDDttL@vger.kernel.org, AJvYcCVQRUafA3dHMwzETYvdJjCOmbzn7bxSzg74P/XtcwDVR4O59caHM7SmRx6sDn2EvYvzDmapYAt8HyGiXHQnM5T9XIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWXrf0mPa/aFWR5ZCkfesHp2Ve1H64InfwYwhqr3pvnqDuFyFI
	MYMsYcko26mhr/Wdesie5gPZ3l0hIASG4+VJwHVOONsdurjoTYgT6/ADXQtWrxA=
X-Gm-Gg: ASbGncsPOXB6wLvNZgu+F5eQJgNNpbOaquTDY6UMCYdHrSQKJYqv0g7I5KHIxy/MZ3M
	RSXt59g4+gHFsFQR9/PeVVR9p4HkDzIr6qvJQUR778Gm7nPL/15HQpjNRhT7vWujXQHA2fNKJZh
	RT7KQIRNwrCMR9+OBRb0BmSEWcUO4wLb1/apbkFm7bWiOE6zfgQ/m/VvAUD+cmH/rMoj5Ovj9Ab
	QzCSikmGzRolYyh7L81E4fKKKLscRBWz9qv5D0NENCGuTTULUCCqzfWY0kYw5X4KpdSxcxV6SDy
	CenaV5ulOalECgLrx3GDh98=
X-Google-Smtp-Source: AGHT+IHoDC9D+ohy2qjljniS6RlmzfFuHFVdEcMoHhsSALfjtzf/ug7ynXSuLy+SIzVASHqUqSlyFw==
X-Received: by 2002:a05:622a:c9:b0:467:6cd9:3093 with SMTP id d75a77b69052e-467a16e1b4fmr11470881cf.46.1734017806306;
        Thu, 12 Dec 2024 07:36:46 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467753461c0sm32949141cf.57.2024.12.12.07.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:36:46 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46375ac25fbso7802231cf.0;
        Thu, 12 Dec 2024 07:36:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7BxrYfGWEXE2fhuGPUQb3kK9l48BjpgjP4wgABvZKEdmDjXP+Lj6pn0M8OeBdQAx34dV2OOadqaCV@vger.kernel.org, AJvYcCXdSB7699kl32PE/C/C+n5sv808XvPsOJdTn/B8f0Vg+bS4xVA0NE7S3JawxKFToTJGzPvdl6pQOXzPISF+osFKfXs=@vger.kernel.org
X-Received: by 2002:ac8:59cd:0:b0:466:8cc1:6221 with SMTP id
 d75a77b69052e-467a16e1aedmr12701701cf.50.1734017805643; Thu, 12 Dec 2024
 07:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:36:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQGd5WJD3OF6_bEHHzvNE9chTHSJSKbZT3ekM79gYiVA@mail.gmail.com>
Message-ID: <CAMuHMdVQGd5WJD3OF6_bEHHzvNE9chTHSJSKbZT3ekM79gYiVA@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] arm64: dts: renesas: Add initial device tree for
 RZ/G3E SMARC EVK board
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add the initial device tree for the Renesas RZ/G3E SMARC EVK board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ SMARC Carrier-II Board.

Eventually, this should be merged with rzg3s-smarc.dtsi, as they
describe the same carrier board.  But you can indeed not do that yet,
as the latter refers to on-SoC components that are not yet supported on
RZ/G3E.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

