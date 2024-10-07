Return-Path: <linux-renesas-soc+bounces-9520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC6992B45
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3321F21268
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7A51D2780;
	Mon,  7 Oct 2024 12:14:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C618BB90;
	Mon,  7 Oct 2024 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303263; cv=none; b=GceRUBfLV/eMqdjNUThUG7qDAi3a3xIDb0hX/BIEijZDWAzRXphAmVOlaRcKsy6bZxiDTXosY83E++Kc1IXwpx/ueU5wx1s1Hxx6u+n1rM49xz1TcHBvWYqzy3FSycAXUc62mU/mINgHE2VAZSVt/eHpc1ueknOMt3Ac4yA5lQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303263; c=relaxed/simple;
	bh=4sSGCDLwPN+U28F73sNGg2q+CYzTc0YM7kzHzcUXXoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ppr2RZ+Lo0uGpzYNAjoTfVo6RNNsfuMU70KMi3pQUTB1uvrt7aarnW1jhbGe7Csqoci4sE1gVSe/sPf5cOKD63/qSzNpQwQVTnjV7Bd+bnHkbwLuPIGXibJy/RkBGcVMVRLxbNVkyt6WVCdVhlZ4rHi6/wjIBj1FmsS2UGu1IV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e25ccd64be9so3538035276.2;
        Mon, 07 Oct 2024 05:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303260; x=1728908060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKQcG8eoz1Evv9veuEw/hAwUv0fb5yj/EVJEw7Llhj0=;
        b=d94GXzz0fEBefksVSsURNzNH7TIJm5z5K30qfwztE1yGU07zM7aXHUOgbwPE1L1Hf+
         ZCcksGYrYs61MBBaIxgwM6vQVsstq4rmSW4/1lMlO+wLMp5dbWYEaxR/YryMI7SqVg26
         EZRaCR+Ro6fLOZE+jcZ7nUcl944tYNwIp4sOKf8pl1uKDxbEzFdOgoBinQlz+jpSMHAc
         TRxZT0xxwJe5tnl89a5cOMtDsUvpg7iiRkgFZv5xGSZ2ELwcwXIcR4uZFYWnCIUQM7lY
         LHPGyJW/CFKw9lBuHZ1i6XTo0D+ogyFaj5Epkhz4ONt5Qr32qftgNLHV3+elBmWupBc4
         4/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBvxm+SiYNziqdX9dsByrTeKffckkIL9TeuX87VlQJw+amzdWWJrmxNOIvQquXQk5YI4Poi5uPp1j6l5Q2+BCSZXU=@vger.kernel.org, AJvYcCVwuSi4UyBMSgbCtOW/CPQjTaqfpYvsvwuT0q8VWfdlcw4/iKLXu5nmAhJWjvmoqflA9g/YV/4/dnICBYoz@vger.kernel.org, AJvYcCXx9/m28z+/xEt1+2EqT7N/UqJd/5ZiyTaAsqp22m+BXhPu0ai8biGVGhUGI2VOhSdw7GeGo8aCOoue@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6OEUfPBJm3KykYK1SMIb4KjXfBp03IU/GzOPyqc7kQnsV2gc
	ZavMFCgkQB35wwBAU9xva/Z+gmSvgBk+Rg0yC7gmyTOqO+668l6W1Cr3BQKE
X-Google-Smtp-Source: AGHT+IEmIBSiws4+5cqA702Q8rxIz2DwWandOymZmHXr/dAWruTydWeBSFBXUQv1mWH1v1OT9mMAUg==
X-Received: by 2002:a05:6902:2608:b0:e26:60f:301f with SMTP id 3f1490d57ef6-e28936dcb78mr7783721276.24.1728303260183;
        Mon, 07 Oct 2024 05:14:20 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e28a5c37b74sm949319276.16.2024.10.07.05.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:14:19 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e20a8141c7so36235027b3.0;
        Mon, 07 Oct 2024 05:14:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEzUFtdgj45ab/AKvym72Ou0QGXEyFLoRe/3bnA3tw5OoWEa2Qaq4epZAt1xHx4PW8KP5pyQJ3HnOm@vger.kernel.org, AJvYcCVzyAyOuQIQ8zNjO/RGUZElQvOGmTTaQCxxwNBymUEeRXWYYFObbDNZOcePx8rMnl6MMfs+Md0dhX0jELlK@vger.kernel.org, AJvYcCXol5DO9xxHfqaiRm5xkcya+yDbZ/ZB06RCc4bTKRPSgXX6TpA1rMundsNmwQsPP5+/HAEfbI6cDFg23SQ5ij8STA8=@vger.kernel.org
X-Received: by 2002:a05:690c:2e8d:b0:6ae:e4b8:6a46 with SMTP id
 00721157ae682-6e2c732c4bemr67291277b3.44.1728303259816; Mon, 07 Oct 2024
 05:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev>
 <20240926180903.479895-3-sean.anderson@linux.dev> <CAMuHMdVB74QEko-bNbLvdWF05eAYQhpRS1u2PV9b8MrSxQyPjg@mail.gmail.com>
In-Reply-To: <CAMuHMdVB74QEko-bNbLvdWF05eAYQhpRS1u2PV9b8MrSxQyPjg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:14:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4jyb9fGPKSGPxyXvFrOYWGqFxV-N4jWNrWo6JL25erQ@mail.gmail.com>
Message-ID: <CAMuHMdX4jyb9fGPKSGPxyXvFrOYWGqFxV-N4jWNrWo6JL25erQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: ulcb: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:34=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Sep 26, 2024 at 8:09=E2=80=AFPM Sean Anderson <sean.anderson@linu=
x.dev> wrote:
> > Add SD/OE pin properties to the devicetree so that Linux can configure
> > the pin without relying on the OTP. This configuration is based on
> > inspection of the schematic (which shows the SD/OE pin permanently tied
> > high).
> >
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> There is no change in the output of
>
>     grep 10: /sys/kernel/debug/regmap/*-006a/registers
>
> before/after this patch, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.13.

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

