Return-Path: <linux-renesas-soc+bounces-9087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B32987427
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 15:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42A01B28BEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 13:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D33EAD5;
	Thu, 26 Sep 2024 13:07:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C59219FC;
	Thu, 26 Sep 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727356051; cv=none; b=L/Eporv8hZa4cIXQYgfJyfAf6iffl6OthcnB/6e/s671ThMwKHWeCWLcqiFIWB5Cmo38X2R1PxLjFNJA9XaO481GZADmj8BTTUbTiRJ7lViRRp8l0ouWs0y8KbLq21aKweGy3+ZLsoK+3Jhn1XeCOlMEokrgo4Tlelj5wClLiJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727356051; c=relaxed/simple;
	bh=qzpO/HTuH/tItojsQXiylVnhtgioNt73YdyvPHTexKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxPzhmelZwZjQJ2OOZzvw7viQi1bB6QEz0a897QrgQZLGv9ncbFn0UlBSNvbuvSCykqqpIIY4KL226PWoeKnw8KSPNTPUCX/2rDoV1SoV2aGQ5PAqWFWwRp00kGqSt2zCm4cgCKd6NViX7njwELpPeL91T1rwC17NXPCjfmjNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-710e14e2134so544280a34.0;
        Thu, 26 Sep 2024 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727356048; x=1727960848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAGnMuP1Lt9IvSivgeIov8R45n6wGMgQcTTPjLL4kxo=;
        b=PEnpF7BRbjyd2CjRL6PdPl/CDmuVYXYJ+N55TefdIR7zFgzZDt+PKdqTtietwEacap
         0pTopkw1eOZrmEVgThwy5YixOqH1j9PwPaUIPhl2b7MxLzo6PBvfgWXb2gWuMTiJbz6m
         vnFJc+x7sid/+3b/ALWH35GsVapUvUcYdJCVOwGDWPusrE4y3NecWDl8BMbIj1zRkq7a
         00iDK7BsfjyYfWAmxOdKjsViV5X6nMhPf2VTgsJOMiGVolADmXtZFBnz2bxivbe1P3l3
         wheJnLePOvU5yBZy7xixvSKNO3km6r05QWDAu9qXhifvPec4GScyhov5BWYIFxu+YvD7
         kAdw==
X-Forwarded-Encrypted: i=1; AJvYcCXecTyN461hYQIudKCl6bjRsBxq70x5FzNx3ZIokki8G7DySArEwgot41HAv0H5RfiT46vYGrRORuGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+JcqIo0/yGVNjUErizqYv99Wqg3t+1vadx/EgVo1przPFnUm
	Omx5ZoTKVFiH7vs8YHW3b5n4ONzKg4i50/YgAdnpqLgrdvd+ppsc3/CHrwaV
X-Google-Smtp-Source: AGHT+IFdNjyznFy4hJigaI2RtivEmYJ5Uc7ks2gDK6oApfw3gzN6S1IFMgr+YPstPLwcq6UegpVhxw==
X-Received: by 2002:a05:6830:6c82:b0:710:f522:75d6 with SMTP id 46e09a7af769-713c7e1df39mr4104864a34.25.1727356048460;
        Thu, 26 Sep 2024 06:07:28 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-713beae5c11sm1405406a34.33.2024.09.26.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 06:07:27 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-710e14e2134so544244a34.0;
        Thu, 26 Sep 2024 06:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCOdYazoo0WojuJXNwB+BIvJ3SFK0lqoSjzqKz0ThxfxhM0wDKbekm/Yx4p3BnPvs1WQ2RuW08+PkF@vger.kernel.org
X-Received: by 2002:a05:6358:71a:b0:1b8:5022:327 with SMTP id
 e5c5f4694b2df-1bea860c2a3mr413231355d.17.1727356047247; Thu, 26 Sep 2024
 06:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150904.3582-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240925150904.3582-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 15:07:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvbWHrV3fn2f8e9HMv3Os1vmLZaDxYhnXL6QLFBB2p=A@mail.gmail.com>
Message-ID: <CAMuHMdUvbWHrV3fn2f8e9HMv3Os1vmLZaDxYhnXL6QLFBB2p=A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: remove 'reg-io-width' properties from
 MMCIF nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Sep 25, 2024 at 5:09=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The driver does not use this property and all upstream SoCs use the same
> value anyhow. Remove it and get rid of a lot of dtbs_check warnings.
> Tested with a Lager (R-Car H2) board and with the soon to be added
> Genmai (RZA1) MMCIF support.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

The driver has been using 32-bit accesses since basically forever.
If we ever need smaller accesses, that can be handled through the
compatible value.  Note that on SH, this driver is used only on SH7757
and SH7724. At least the latter is documented to use 32-bit accesses,
but e.g. SH7785 supports only 8 or 16-bit addresses (depending on
the register).

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

