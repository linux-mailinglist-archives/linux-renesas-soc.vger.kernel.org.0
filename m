Return-Path: <linux-renesas-soc+bounces-6002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5690214A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25531C20E4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994D37E782;
	Mon, 10 Jun 2024 12:09:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1007E576
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021357; cv=none; b=NY7YH+Cj9LCUWMCzVYvMZRwTFTCr9LNN2xax3X1J/uCe6vx1BQj9UjnW8n3uz2rXlbtMRN4ISahwbQNr2ugB0XzQ2yY1OWlORa/j2KahB/NvNnZEonVS3WG93DKs1GdLfTOW6it9dCCyaw/7QCwi3BxpuRCUcekCmhqhqZdO1NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021357; c=relaxed/simple;
	bh=YeJzPLx83gfhzcbAyS0DKfdjv6N+DpSV4+UGQln9PJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGbVWCi7dQ+B4uPZaMyBNvEkb1tKLyenT4izfIVlE2WmOCq/gSPEN3aQsncBvAvI/l8aZpyfKI8KC1COI7XPmoo4LELmkkfDJoloAPMeQRtjBALJMSu+JGkbGBPOaVf7Ap1aJwIyGp2TJBGOY3kSzFEDLnOtBKuwZeoRKn/6xYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a087bc74bso43421067b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718021355; x=1718626155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07rMWG8yDXhiM7xSE9cnaa9ZpZ8BsznePNlmVFz2+fk=;
        b=DTeaOxFP+7pVc8yPwrrbfq/4ieBUd19otY1zpZjyOxj3FSeWzoFp65tAkD1xRixNGZ
         2b1s8hZeQqqWNXKC7yqv3NXAG/LX2d5O+bLbOG9vQO7PW1T3KY+m4nbqqe6xlcnGQk+X
         9+2Sou5vs6TS49Vuugi697LuM50E0yVlh/ASTuobMGbVUclgcSudTXv1fsKlTsAKhfdk
         SyQvAhgkrh2Lw6jlyatJakMJQxNyO3Ra5TxcQHWHKHptsTkL+XK4HMIE/eAs/SOZq8/R
         8FLOg0h8Z1Wzj92dpduh7mjHtfomrdZXsonUELDXtUw8krt46vRH026JoLT0k/hhNf0C
         afnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbPwYEBGbWUA7owAhKejWZuUqi/dMJiwcaklJJKvHWJyfesE9Aod7CcN6veAM3hfDf0Rk7GRs+f5/kPX4CHlAd9OTrvn4CXK/py3e9Vr9e0XU=
X-Gm-Message-State: AOJu0Yz2mKo5RsbxljZJh0UPoQxpoBwnW7rfbGfMapb4ot19xwjPYEUD
	rWdFt0bYI3oyWzIFRgEvnNyXSsQqSjBsXF4KqdgVO/+Wozj4zHHusTHR5AUL
X-Google-Smtp-Source: AGHT+IEHwQc0wNxgOiRjoeftpHGMBfOyJZAqdFSc86Fu2e+xz/E45WEAXIlnAPmqAuRswGUGbrVTxw==
X-Received: by 2002:a81:6c49:0:b0:61a:df6b:9d71 with SMTP id 00721157ae682-62cd568b09cmr82256747b3.48.1718021353164;
        Mon, 10 Jun 2024 05:09:13 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62d199ffdc6sm1252207b3.76.2024.06.10.05.09.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 05:09:12 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df481bf6680so4303069276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlXbdw0OUChe7WSMwbHx0f/bcXjAD7ehvAB+tJdrRPzZvxLPt9dTEL5FN0SwbJ6Tdl0Yqyva4kaOaIuU10Gv/BNsNRLe8YoG6tNsyA+oZAhZA=
X-Received: by 2002:a25:abf0:0:b0:df7:6a6b:6c50 with SMTP id
 3f1490d57ef6-dfaf66e6377mr8270613276.57.1718021352739; Mon, 10 Jun 2024
 05:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com> <TY3PR01MB113467988BA719B39A6B1749486C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467988BA719B39A6B1749486C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 14:09:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-FvmjZFphXhGe39qArRA8FwSVnFkV8ri6z-XjStG-tw@mail.gmail.com>
Message-ID: <CAMuHMdX-FvmjZFphXhGe39qArRA8FwSVnFkV8ri6z-XjStG-tw@mail.gmail.com>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after devm_*()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jun 10, 2024 at 2:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Also, I am planning to replace pm_runtime_enable(), pm_runtime_resume_and=
_get()
> with devm_clk_enabled() to simplify the probe()/remove() as separate patc=
h.
> I guess it is ok to you??

I don't think that is a good idea, as it will cause breakage when
extending PM Domain support on RZ/G2L (and RZ/G3S?).

BTW, devm_pm_runtime_enable() does exist,
devm_pm_runtime_resume_and_get() doesn't yet.

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

