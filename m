Return-Path: <linux-renesas-soc+bounces-12345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C220CA196A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14320161C27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 16:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA8221507F;
	Wed, 22 Jan 2025 16:36:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBB215079;
	Wed, 22 Jan 2025 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563766; cv=none; b=KiD16POakD1K9t+l/8abVMqNBcNtemwDKIzJWwqM3QPcxWNvFE4RbKa7CInaZ2RxGAVBoNd68Zl1EPfPPxOKHeCrjkUY0jp/78YOY7OCcq5RORzfq0f5rPfjSj9evqVQfwWFJb+cfKuoZEoefJTJnUSJh8CE9xu6f1gS0BstkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563766; c=relaxed/simple;
	bh=xU7qb6IBMx4T3l34r/Q7gYo/a5vWx9vi4ipHbCyqFjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+PsPS1vu+4RTuty6Mse6rP24AgX6M11GmyXRNXvybwanc7G8d8Ty1zihKjbVZ14Gl8CVd3l7ABXHKsVbwM7A8S+Z3dd1RB4cC7KNkdPPOYrxlGu2T9RupIhCzS8VePcLyzFsHM/P+vBzIGufmIKDCLEt3mPfUO5nqCzlAc8VtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c5d4f3d58so1746508241.3;
        Wed, 22 Jan 2025 08:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737563763; x=1738168563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56w9Ag2rCQpj7nl+073rNPA3cdHRN+b4zY95aC7PEcc=;
        b=Yr9byMRSevr8fdlPZoT4bB6sIGcWukgVhFGh7wV0IWX3347iVCqlU0H+ePpVcZRYvF
         YbX2Tqs49drSePU617JaHvuhD6QfjRzxuKLoNJdigrvJ3XJNT9eEVdZrb+XGq9yKVIoV
         ULt+1gmYY3V2VNYv0vRmRDz6+MEgTZRM7IZ2k6ouygNNaW43aPQk4YL/BsyZgbFOH7cB
         Q8/OeqfJKKwUURmEaJ5tYAV4teaqIX0RiBSSXDfWSs72esX0k0Cqh8RMRxrTjIQo5k/Y
         1I6mf35p28ojBoLrYWPD0TxHRfjfOFmCw1NTBIXR6HojiOVquQA6qQTxJUUvncG6lx1b
         UyZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOftfop7x4NIAMlbw26bqnabfZqIOQ3TJ/bBQFcQ60wvF5Z2eGDQrI5Ykp1x+xVtPKmzFh0Lv+RUzE@vger.kernel.org
X-Gm-Message-State: AOJu0YymzE3Qc4H7oFuRYUvuPiRw7xqJaOsVtC2AE3J69p2xjsrjId0C
	uYKxJJkIGYYF4w1kv2WBIlN2rfToMEtoHp5Cjt0xSIP/6MJGLtFviiduCu33
X-Gm-Gg: ASbGncuk7wsw3iCqzdxlk9I1d2XNvr+QUza41lhN82oYwMGfVLCDS2gfhtVi4/AaCLZ
	NJbPV9bKjVq/go8K/ZS2Hzh0UsomvUTAKtKDgF0EuAuTpSuusWBi2SegDwWGjZINf1nHUrA3/tc
	U2Jz9whYhfG8/VTwSJ26NeAqISUhqxVb/dknc7LmzOQvqmvIaS1JZTpw1z/GZUthYcpzrJ1Hwzu
	e3+DoToWtsCuuY9qoMqh7/K4o3u0QPdhG7kSnT3zeOeAqK7dEXDtrdetkWBbSy/ps/tzlgENVzK
	/GrvLoB39zAX+aroFSTyAYmttWpvM8DI
X-Google-Smtp-Source: AGHT+IGE99UHYcIIvu2J9wC7UWLxR8AMeqENcxmrG5msWjKOB/UV55F/+1ZLiJGKNZbW1sjcdzDM1g==
X-Received: by 2002:a05:6102:c52:b0:4b1:101f:a5a0 with SMTP id ada2fe7eead31-4b690b8ad7cmr16837395137.5.1737563763409;
        Wed, 22 Jan 2025 08:36:03 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a33f5d7sm2762697137.27.2025.01.22.08.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:36:03 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso1576677241.0;
        Wed, 22 Jan 2025 08:36:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdZ2RJeeKrDRnoPiOMxt35e2HpB567k+BH4moAMIvn/e2UpaLS/ANsBeq40KzUptRkXUfcZCNR7PiU@vger.kernel.org
X-Received: by 2002:a05:6102:54ac:b0:4af:f275:e752 with SMTP id
 ada2fe7eead31-4b690cdc468mr18443760137.22.1737563762991; Wed, 22 Jan 2025
 08:36:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se> <20250107160127.528933-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250107160127.528933-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 17:35:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBnbx0mF2fEuVcsB1y2LBx2YBhbRKOKfdynyED-=o4jg@mail.gmail.com>
X-Gm-Features: AWEUYZkoTOb-7hlD-XrJUS0cX2H99F-8JuL3z7omoxRKLYdnhU9EOTNHJqDRMOw
Message-ID: <CAMuHMdXBnbx0mF2fEuVcsB1y2LBx2YBhbRKOKfdynyED-=o4jg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Describe AVB1
 and AVB2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 5:01=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the two Marvell 88Q2110/QFN40 PHYs available on the R-Car V4M
> Gray Hawk single-board. The two PHYs are wired up on the board by
> default.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

