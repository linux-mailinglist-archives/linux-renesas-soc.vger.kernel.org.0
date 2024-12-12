Return-Path: <linux-renesas-soc+bounces-11251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3D9EE1E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 09:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C091F167460
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1F1209F41;
	Thu, 12 Dec 2024 08:53:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4720CCE7;
	Thu, 12 Dec 2024 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993594; cv=none; b=As6v9J33ZX2L3meQESm4FejTrwCP1vR/JKP0+vv2Va/H8BAILIOESRA7C2CmvqQPczQbX5Ghp7zs1yM1izIsCtH3Opz2nlJ7Mg+oYghznOLI431UDMXlADO1f6vsr87zIUo0ENVYoc0X2Cvyu8tZsFKIZFoVBwAU0/OKkggHSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993594; c=relaxed/simple;
	bh=h5oj/YCgadl4DNWPD+FEaJ5jCAxC5cbl4IGm01tjhn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxf14J69OxttX/Y+IRP34L4dsi3nus0KpariJJ6HqxLwcKlsWpHTLhw/mtraGDF14KsOu4hv5O3jB5WW6JUac72rwdp7Qs1SDgEXZHZqhD4YVak/9GcHlpNUFbyqhSc657lkdOPSw+Bvh2mPQ4ChkjGea/F7y9kjs73Df6AkUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51882c83065so206582e0c.0;
        Thu, 12 Dec 2024 00:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993591; x=1734598391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kswEXNgu6h6p41UQ2kpE02FUHTphvDII2iRCuGcExDo=;
        b=t80YUzPG08260K1tyVTrZU8mB7J7BWVJ130HAIxt91yXjZI1oB6jPrbBzFqauEBMYQ
         PQd5uvibHRti5SJAhZhC8cRdZl1bKB95ykI6SPRUUgZgZCMzQePKD9pIpYE1YM695g/s
         vsm4atCwR6T7nNwUzxkKVRmJUOEKkWtENDF5Shedg3qdE1SkvDAZlctuFNEDpnYlIZvD
         mxZxYrpNOyqphjESuUzyMQEaoNFy3aFzThjhgcL99mbQySTTSdq7Uee9XMy6w4h/J7zX
         Eul+Sm2T1nyd8/2QcyPXSfTqqYARon0BR9O4txWAV+7v8bDFfm9nz7KXEXIAikjhXkPn
         Vmow==
X-Forwarded-Encrypted: i=1; AJvYcCVl5aerFOf5EgPuku/YvfxUFfQ+qkrM+ySwF5geoXpHDF1iDyJ0TqeslVKsStPc8DNNNuE19X4Lq4noT87A0opPmDw=@vger.kernel.org, AJvYcCXHM0vsojFEuVyPaZXKdNPsOibJhC/9a+FWIJLN/zCwiaNld18s9rSunGZtHKNsqRMnMguHt0s+t7dg@vger.kernel.org
X-Gm-Message-State: AOJu0YyqwFWOQh+GmeO17tRjzPYCRjnD65z5YXlPNvfogWiqnu4iFgIY
	91jYvPUs8bW0c50VGl9rTEaaBz3/tLVtpNyyXBGHn0tU9WQM60pt0aHdoUhnfGs=
X-Gm-Gg: ASbGnctwx+8kGXs2gTo20i2MBvQP38kuq0Q04inBmc67JpIxt0bVoWv+snUjNONtdMn
	LHCRsEKPZV39jiZ7G+NPvBtbNWRH5WvZG+YlxI2ftIyKR8YJuaJAXPDo/sZhjIW32vFk9WO+FMC
	lkoO/alGt7RqqjFu+ZppLfNtZJtURkDGb5PmMC0RX1xIuU706DhGQvdSUAJLhbDH2rb8Is1YS2S
	8skCFuxYabZ5xHVQP5jZX1rsIQJgC+SiqAye226QPC4yKAraadPw5pyBR/rw2GUxA5pxzpbruXe
	00GT0JxOW5KuuC8yiYg=
X-Google-Smtp-Source: AGHT+IFuXFmixzJKVdSsqJOoZSWQ1w5pFQ1yk3Sz6hNhMDxTWG09jITr9W/ixdbnkMU0E9g8FDzdAA==
X-Received: by 2002:a05:6102:32cd:b0:4af:e61d:e225 with SMTP id ada2fe7eead31-4b2477aba10mr2855057137.10.1733993590849;
        Thu, 12 Dec 2024 00:53:10 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afda73c931sm1665362137.24.2024.12.12.00.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 00:53:10 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso217918241.0;
        Thu, 12 Dec 2024 00:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAEh2cqvQ3yJyxDJHG+kQxRdS0bm4pOWEjub8xPRhMziwAFW4YX+tt5XWZSvTPgFv9npAGyAgZWwva@vger.kernel.org, AJvYcCV18QLcqzEZMLgKbja1OAVjwHwZDiTHCPLCP+CW26fZSNKmmMQyJUVuzlrr/y+t+BkNiPbKyGKDnSR29zt4f0k6498=@vger.kernel.org
X-Received: by 2002:a05:6102:3907:b0:4b2:48dd:aade with SMTP id
 ada2fe7eead31-4b248ddace2mr2096817137.12.1733993590441; Thu, 12 Dec 2024
 00:53:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se> <20241023154643.4025941-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241023154643.4025941-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 09:52:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSJ2fTR=x1nOe=sxk99Pkhj2PFHRubQ=HvbZPOLCpJfg@mail.gmail.com>
Message-ID: <CAMuHMdXSJ2fTR=x1nOe=sxk99Pkhj2PFHRubQ=HvbZPOLCpJfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779a0: Remove address- and
 size-cells from AVB[1-5]
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:47=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When describing the PHYs on the Falcon Ethernet breakout board mdio
> nodes will be needed to describe the connections, and each mdio node
> will need to contain these two properties instead. This will make the
> address-cells and size-cells described in the base SoC include file
> redundant and they will produce warnings, remove them.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

