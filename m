Return-Path: <linux-renesas-soc+bounces-22717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CABBE83A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CFD93AD5C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F800283FE5;
	Mon,  6 Oct 2025 15:40:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87132D24AC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765228; cv=none; b=ayiTf7WheolRTIOWCXMVTDDFe8Bm6jozoWU8qoE/U7cpvfi8OhslV76/6DcJMGvhc88lQtM5Yp6cY5FOzmvepn5OvYrfv2W91bm9yJsBwCn1fIa863Ie7xnqzpTPhjrQPb7KrI2rlCYTAHmjOC7RSbYXoLwFRdylP8B2vVTrvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765228; c=relaxed/simple;
	bh=0w1ok/EtSBxIWpCinjD6MCuITSeNqV4MZrLf0tJK3BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Csb3w9OUwoe5tfDMDVPy28rIDIrDTI4/WOmnHFKuqqzC4fGbhZqpBIBdQH3Gltlin6/qpZifkgT7TMmupRF/RP2n4g2fxLNyqJb9Ux+SZvv+oZ41rjlmEXGYjwq8d91wN3TlqY0ZP9mtV3NaeNFKKVaMY+nTTLEUdqVBrEcBgaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d4018cb45fso2218628137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765225; x=1760370025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZNZA4DBYRhj4ZPJ7vYe/0KXzQRusoZfXTcALhEPPko=;
        b=i3dXwxU7hbXMLX/eKZXq1IYgBQzU95w0fQXaOdp3f/Iv2268vOhEvekjTffJ3MT1cq
         HQEUyuX15FFQrWsDGf5ah05lWrIL+ubbqByt9qfNrrkREPnKVtZE6WjDcDqQ6Bq/mJRO
         Ir+a3E0oKL4TwFSVILG9XnSLDA6IAaL9Od0NmDIoqbBrK4gIkqc4ZNPrvFL3HsJXydv5
         wIoAYrf4AcushuptfZeO/+zYHAckA3o3tBFN7Fu5wZqZGoK+Qsf+LiKFD+j42Qjl+wn0
         04r3q7sYC8kiD7YS4DmBZwZWvOVxrmaL3aedVmtkdL4At9YWMjPxLurGg3mSy9i3eaFC
         af8g==
X-Gm-Message-State: AOJu0Yxgl1HuKWOBD//pjI9nbfBtpI53qbc7Au/nwj09VuU54rxuLuaW
	+abnLaTiey+D94tJYUVPHLNW29TEgg7NDXujt4wTvS1B5YDXPBvGsCxsGroNXc5Q
X-Gm-Gg: ASbGnct2nq4hLAZmL/nqjAeSx7UgeSGTaWrSVHI00g6MP8a8RYZkNPSKqVLxd7dTDjb
	bPyJGiT0NVqJo+RCnUkEGTH/c4Bx5NokHWfP8JfKatJDx9HnTvzntT7nIgC0VAg9IzJoSeBOVFf
	+jsZFv12WSNBcPuQgsCe2jitJlNEhqmdJWkPBfa4Ci9ABGKydudaACTJK5PMC9gjWxdlkfianO4
	YzHDRlw/C/3TjQC1FTdiBjoyv3moKDwvvBixavfaHcVwh8/6cR+6YMx2WQnG0B1saFhLuROkPN+
	iYZRZSL1nx/KJKoQjOgGDxGFG2X2+tPT1fKSNrU9RcwDbP+lEHUSQ6u/YbX+LR+qHwtaGs57zQr
	C+t+FRK5JW/+RtzDbOL7KbwL9VJHad8OxuAT77hwq76SHnvcGhqpi3zhA2ZCFWGzxrdSwhbGZjO
	QzZp2gvgTpxd8L
X-Google-Smtp-Source: AGHT+IFkZVLks39RTSk6np9uUdHbmjHiq2Tk+kgLp0gdQ1EjbWW9lzH0af2P2yBigUrVHDTFWDZubQ==
X-Received: by 2002:a05:6102:2922:b0:537:f1db:7695 with SMTP id ada2fe7eead31-5d41d10c1f2mr4480108137.26.1759765225239;
        Mon, 06 Oct 2025 08:40:25 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39f1a2dsm79244137.15.2025.10.06.08.40.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:40:24 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54bbe260539so1977679e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:40:24 -0700 (PDT)
X-Received: by 2002:a05:6122:32d4:b0:54c:da0:f708 with SMTP id
 71dfb90a1353d-5524ea54c8dmr4392841e0c.9.1759765224703; Mon, 06 Oct 2025
 08:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-20-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-20-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:40:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTsX7=sPHXoWVuFtXmr_-cJGu2g=jyEm1aHk7113_tYQ@mail.gmail.com>
X-Gm-Features: AS18NWAAoQ3nGAXRtFcEFxkFUwakmeeJVLltROoxiixXKP7GESz5G5hOJakm7es
Message-ID: <CAMuHMdUTsX7=sPHXoWVuFtXmr_-cJGu2g=jyEm1aHk7113_tYQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: gray-hawk: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> V4M Gray-Hawk boards. Sadly, it doesn't mark the node as reserved, so
> this is added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

