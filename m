Return-Path: <linux-renesas-soc+bounces-26058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C5CD962B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63207301BE88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B23331235;
	Tue, 23 Dec 2025 13:00:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A80335572
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494812; cv=none; b=pvYT97A+L9Dv6NoG4XmFSmNxcLTp3xJU8Fkow49hvNUE138xtuhbFzCozHH/heMmmBLhlLZMpKLgdsl7XeZcS8/AIBZ8H9JdBRoZt3VJXCmWvWSkjaeAPrewMt47f5Qwydw4MdtFYtpTG/XvI7QpeNLVsg2xduwos+YfJ0/X9fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494812; c=relaxed/simple;
	bh=/HGcUjd+rldHrGgw+/2LMI43pg6m/SpY71YJmNi45YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvf0QrE7CcPObwRO77A4K3rDtqR9MmAkQXRiccIPRZUTxVVqPx4HB8cMxnPlRNZoj0t161u3e1lF40nHt2KV/L8x4wt0bwd69j0kIlnS8sD9AYMU5Pjpb9UloyMDwQdtK1GkGZBaDUYjCd3Fo9tiKr+y2fPlBBDZ9OSh98UtVSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso1256045e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494809; x=1767099609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTXbUPXuA0xDnhafe/vn+TvF0Mds5OJ7HH8a+9lQG4Q=;
        b=aPvVhBgYh2Er3AUIaRik11duAVmv91D0/37tl/7NOvb9MszlT5OdcH8RrsEgZDAKE9
         /BbHDxirBoMsFUDxrULd8zmFXGMyiIOXfrVo+orYL6ZWJ884idsU69yppGL5rwC3QHdc
         CNaRptsG86NLGCEfL7tbUeGFp1azUr8mpOqNMqu38e6qZvH6opcS50oNUc1knACrzUWn
         Sv1PGc9fdOkkVgZS1L7QO+U2CSs9R7SXhhC9NmAYBXjSrn3+MxDxlTMb7pr+C8r7g+la
         7xNwyCutowqcnyy7+WyLpGfZn02EYNuIF7ywKxpOMkkqapItxdCynkHqqmGk3L/DNFtU
         ofpA==
X-Gm-Message-State: AOJu0YyhBg8MycpMJ/UyvFER4WeIQL1FXux/FEwLHr4/HUMt1pWc3NrW
	gDWVQDwz0E1+mY7EJQ8affvWdEmkLXby1nyVhP4M61dSDtAXdBG7aflxpU8IngtC
X-Gm-Gg: AY/fxX4ul2CpzDbVbRiUauaNethF/4d/gEkgVxHqPET9DD7Rr7qpFi6xYBxtYm06S7V
	1503nIc8btaNFIk+owlWt6vmgtOWTaw/GttAcxWVWaAuTbfsiMA67JQnpRV4nEyadZfJn/2uQen
	kUSXjeH/z2m2Q0+B3IaxIdHxDvE5biQZtFqEOtyAJyIx/nFoIkhM0flnwNubolmSqx8Fj9uA3RN
	njSP9rvxugtqjmnp4yzF4/xN5tCf1pnGIgwH47rloByup++ugrFE5+s3CSBf8ztIztw4+J31IRx
	BoLKyxBQFHRQDOufEuy+YoqfqljJ75TAMqMM+EZvRY8jwiCgwRAEDcmFpwPPOtzhFHAGGPbUNGw
	sWNS9KEkYfm2mOV2zZ0de98EtAGnd8OurPuQ1oeueeNLmwEzeQPYPbGiJ4ZdkLZ63GMyFafjO2i
	hzSEPkE3NB+fEz1quyaqrVdVNyKooXqATUBE45tFoPFB/y30Xa
X-Google-Smtp-Source: AGHT+IGORI3yd84vnbzou64Ui2X3vAeaSK6P/+M8eKtcemRxDiX42q3oNTLrefFxWtDeoeimR86f0Q==
X-Received: by 2002:a05:6122:1d91:b0:55b:305b:4e2e with SMTP id 71dfb90a1353d-5615befd913mr3858796e0c.21.1766494808620;
        Tue, 23 Dec 2025 05:00:08 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d060bf4sm4647140e0c.7.2025.12.23.05.00.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:00:08 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfb5fcf063so1597929137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:07 -0800 (PST)
X-Received: by 2002:a05:6102:f92:b0:5de:694:15e0 with SMTP id
 ada2fe7eead31-5eb1a836ae9mr4138531137.45.1766494807481; Tue, 23 Dec 2025
 05:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 13:59:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7hVALx0pWb4T1LzwCWYGUAg=rY=fRA7OiKR1ScvD8rA@mail.gmail.com>
X-Gm-Features: AQt7F2rcODnJ7kIz2qCSlRU0AoTajvhbnpqvSDaRnRnKco6ge-a6KDHZReHmBIM
Message-ID: <CAMuHMdW7hVALx0pWb4T1LzwCWYGUAg=rY=fRA7OiKR1ScvD8rA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a779a0: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Dec 2025 at 04:48, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

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

