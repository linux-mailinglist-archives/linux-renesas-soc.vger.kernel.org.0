Return-Path: <linux-renesas-soc+bounces-11562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9A9F7906
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 10:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7230161A89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 09:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029FC221DA2;
	Thu, 19 Dec 2024 09:55:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B7221473;
	Thu, 19 Dec 2024 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734602135; cv=none; b=s3EtKCdCf0IQAfAEo5jGFs8g48fIeDxcsM0mLb6e183SQ2wVdUaQL+jdIODXczl5FJ0uxMY2NgCi9WBEmHGw59+Cuxinldv1Y5su6jb15WEZ4o6NwoxuWZnraSUgqIvqJ61MXaJdiL7jWj8FHL6JEq6i27+xy9FerZerCQaAGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734602135; c=relaxed/simple;
	bh=fXN8H565+f21GDSedpbN7xPaAZ9fy8mnaMTQk9Pgvtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0IYF5qG+kpGX+HE2h4zfKoHNV6Co/ExbUdhX02SjWIucP4bOxlJZ2peSTCxxjr5bw/OqA9Luv77yu3qOpQ03gTiFQUjX/01vNSfVFvZ31dJz3EcYJ/8nGloDrxwHv3SKj0hJSA2ljoLO8xfSOxx0G2bQUBNbWKTMCGw+KFal08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5174d53437eso345046e0c.2;
        Thu, 19 Dec 2024 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734602132; x=1735206932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49Ss6c9DP7ZaT5yCe8nYBon7tsWJ8HYjfSAZFOtTYRk=;
        b=PPXoGgt1J6khPQdL9g7I1jt0NIfyQVaIXnlzDk+/gqSOfBsvwRinwfQlGdoJuIxzQz
         YNAWz8C8mZQrgU+CWjBwJJptwf6cEhmPtMNMKPyi6hdh2CKxUQxKrvEx5tCSFFxvlXf+
         OS+RHrv7oMn/352yD9IGxjW0qZ3oi7z+fksp/lrHQOecRse12gZWfOTKbbnWaoC0bssQ
         HZbc3zWnAZ836/k15fceae7v/zBi+HTqfVYKE6zsOul4ERIUl/zXVmkO43CdRWczx/Dd
         9lecmmvO0SD+ZtZy8Fh0s/HvnIrvqxfwsIYgBaTGdSQTeIpSNOPJL3RAxM11mwMMde2r
         Z0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUGojanT9DOKSNoSNWiTtKVFUsUOIqXougFYCngZJT5GCjC4+hgdJ0JLqGPFyRuhD0PHjL5BUHKptBl/PWv9U0CEcI=@vger.kernel.org, AJvYcCUbKfD39/NJCPF/gaStrOKI/INXh6EPJCRah2Y5Oed4J/lU1eaAFXeFDtUBSvSm+AP1sWyW9nwOrGr7XfM0@vger.kernel.org, AJvYcCWaLOKRPqVEqK/NtdKK6K9rjPqS6G7N/bBDy4F3MJ7ac8QQlxvMk6ow7blXtiOB4yNIvQKWzcZT@vger.kernel.org, AJvYcCXml4lLPtQb05JiecRpLLlWCR40/U7uQ2h4RvPCqcTQYpWmjjxScNwnutkPAhY7w3Ot4OmjDTvNH9xPuJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEuSPMSoITIWfq04p5sLhIgoEt1lSP6X3QUkCli38/djMFiBJ
	8Z8UC73RMUe7E4mbEEBnkx8rotMp+UOHauOqJAJ2pXnSKVLrcN19HheFM6SQ
X-Gm-Gg: ASbGnctAY7IQuH2aGF9lgkueBPgHulaSSXjKyYSU63E7XgUeo5FTyFZdaJDhYvil67x
	d4/CgvIrH7P3dAYAA7ZIOp6XkMw1LS+CDv41JexWTPPVQlEjBsvgf/0vgiV7DQwCIgED2swldqL
	iULuw7mdwQfNK/MsHD9wA/tiuipuxdK0ORZ1wtw404AdScuuttc2GS1qVSdYPkm2ZU2eWDdMMoy
	crdfmvwHU94EK1BYqPnq2HSFCdjfv9BU92ejGLONM+yfbbNeeOhXo24o6oDs4ms0tA+vnq94uoM
	rTtyOdm6qLwHNBDryz0=
X-Google-Smtp-Source: AGHT+IHf7hFp7t4TKossJI/owZoDCdyUwYGBQysunntCH4UsB2Kc2+MKXn1G98MOkfZziHZYgCBI9Q==
X-Received: by 2002:a05:6122:d89:b0:518:89d9:dd99 with SMTP id 71dfb90a1353d-51a36c53c02mr6270414e0c.3.1734602131649;
        Thu, 19 Dec 2024 01:55:31 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68b7d551sm86781e0c.11.2024.12.19.01.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 01:55:31 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afeccfeda2so329286137.1;
        Thu, 19 Dec 2024 01:55:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU198raFYw+NqaOPihhT7BP1Go/S2HW6R3PJvdUt5IkeUKGL09jXoxSs+jfhQuI0KdsBQj2NLKm7HrEPVfr@vger.kernel.org, AJvYcCVcz8mLLEA+0QFJrtznlCtEdCj8d1rVgDGH6W3obPtmLVvRvns5b4vr0Vj0LtVVFGcVjnnHzai3kASI3q4=@vger.kernel.org, AJvYcCVsPNHQRcR91AkQLSklRny1c/hedVIovtPUtn4GNql4BQKcv9QnkEHIGcue8KZeqe/VnyTwNK0p@vger.kernel.org, AJvYcCWyhtlo3OWqF1ca/MteqsBE8VF7s3HGd8D8/luuv1jJO6kltjZ6HWQFqhyGW0TnZZY823YcEE/0gLnFdCnd/ab64Y8=@vger.kernel.org
X-Received: by 2002:a05:6102:1517:b0:4b2:5c1a:bb57 with SMTP id
 ada2fe7eead31-4b2ae8cc6b9mr6221129137.20.1734602130834; Thu, 19 Dec 2024
 01:55:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 10:55:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWy37+imrUt9wQQoJjxsByarX9AxQZ3Zcaqi+bsJ8OZwg@mail.gmail.com>
Message-ID: <CAMuHMdWy37+imrUt9wQQoJjxsByarX9AxQZ3Zcaqi+bsJ8OZwg@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] serial: sh-sci: Drop __initdata macro for port_cfg
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	wsa+renesas@sang-engineering.com, geert+renesas@glider.be, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org, 
	g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org, 
	ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Dec 4, 2024 at 4:58=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The port_cfg object is used by serial_console_write(), which serves as
> the write function for the earlycon device. Marking port_cfg as __initdat=
a
> causes it to be freed after kernel initialization, resulting in earlycon
> becoming unavailable thereafter. Remove the __initdata macro from port_cf=
g
> to resolve this issue.

Thanks for your patch!

> Fixes: dd076cffb8cd ("serial: sh-sci: Fix init data attribute for struct =
'port_cfg'")

This commit is not the root cause, as it merely replaced __init by
__initdata.

Fixes: 0b0cced19ab15c9e ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON suppor=
t")

For the patch contents:
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

