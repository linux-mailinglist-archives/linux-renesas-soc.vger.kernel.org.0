Return-Path: <linux-renesas-soc+bounces-14569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73348A66F90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF5D01724E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8381E206F1A;
	Tue, 18 Mar 2025 09:22:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B22146D6A;
	Tue, 18 Mar 2025 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289755; cv=none; b=eFEnIHo7PqE5QMoLT3LqI5+hYSurznl98OS8Bf5pyt+wNNibftzaU4l3OFzs0XbqvGs/J8I+W8R8viofpmEovCg22llyr+TUjhY7kURVHjkz1OQcQ4Yrl8HZ8Bw5o+NDch16yfq9rKlNwzuHzmUn3JPpBS6pEoab4a2vf4Rk1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289755; c=relaxed/simple;
	bh=8NOddPpZg0LzHsSjHXPljcpkJ+XK9I8+EiexxCOttz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJXpCY47vTLQ0QVFbSgcSR9D4TTnqfMTOejLKDOackdTTmF8mfSi4jA44AIBVEVPm2KJzuCfRUouaGEV4eZoymoRNJaiS3x13CR7Xt6y0s27PV7jH9jN0thG+badIe84M9VwrA8eUN3cryldLxFftknZ1g4MCW19ug39tfj8kOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d3805a551so2430027241.3;
        Tue, 18 Mar 2025 02:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289747; x=1742894547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T9gwP3KQCNvNbrmSJU3A4uSZKNCt5la2XAZIE6KqRE=;
        b=hwW8J/aaX/L8Xs7LQLGCL6VKXkwVZL3RRq8pgJp/5GSLDqLvnEUNIEmN+22efQb/Ox
         yqW4k1xio+4OjmXnpVI8hrKvHh6Z7ti4gNM3jvV3sH8IVLJQNntr0uwsnAJtT7LGs/nr
         kj9vq7wZqKhndqrK2rIG5YKXlGUW1seybDCIHW1ixD/wbEXOK1pIDJxEhWM75bytfe5Z
         vLQfSARIvaYudjZlbK+TkgVuog1tsX4v+nwRzW7xA3kv5ehz/ZthAnyTj8+3ihboYNvv
         Kgddz6XLYt5P5PR1CgEn44VPU3QyOAF9RlHZDWttnXNKAC0Sk/3a659Ixe8NU5rFHOsG
         fV8w==
X-Forwarded-Encrypted: i=1; AJvYcCUHQ1889FFk978SvqMAsvvmPgT9PgcGEXEWdkFqCd+PjwAuqg+gVF0uFRUvYgqP+Ms9A0JRFC0DbMSg@vger.kernel.org, AJvYcCVo9o0SrBFcv9mIeNW/kiDd5IiA4xbwKy7gk/ybj1X/ZW7cEDd6LFBWieF5e3WeQczuCL/hXNOrCS5HqcV+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6DEvPe/9LI/EQt7LE+NKuLB4xLcaHmiC4euPymQn6GnpbZMap
	S6OuvHK3gWGboqf2kdhI4WishdFUfgxAaHDDczCHTw6BS4RPjG7INGbJevji
X-Gm-Gg: ASbGncv4DFVX/PeWyWXU15UisgP4tWqaeSOawsWgu3Vl+SQ28AllX5W7t7q1cceHUU7
	Ia79pfaiUIE6Uvvfhr0Po4T/Pi/qgdS7bsstLevtnvszvKBs3nGVLGbIQ3qPCaB1NMn2cJsqOow
	F4yQuaro9XkZwv0UsLiGYUdQsRTNThynLOFsyQSNUkHaestRrwVIxgPCZ6mnnZp8O0KfWVdzMhc
	nnS1HdRfgFNErpes2nWyIBLUH+jP21l0/oAo9DluaQVBvtqzSflCv4kXLbNBHenDFIxxnF6L+wR
	XpY6wDjoGtZYoQc2HH13g4OAKwTS8rGhRIbEvjRa8No5fkn0d2lET15bBpTmJwTVjsGX8fHWrP+
	FF/2jo6I=
X-Google-Smtp-Source: AGHT+IHHLEKYrf4lE1Gu+khOtEu6HzPeV5ukEGXpW8O4caMVuv5sRG9muBTAtP3bvg8ry8imeVglew==
X-Received: by 2002:a05:6102:442c:b0:4c2:2beb:b726 with SMTP id ada2fe7eead31-4c383139884mr9213858137.10.1742289747274;
        Tue, 18 Mar 2025 02:22:27 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e7481csm1968086241.27.2025.03.18.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 02:22:26 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-868ddc4c6b6so2408122241.2;
        Tue, 18 Mar 2025 02:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIvTSZStqsUzOGLxlkMkQ+w08pejuSiF156BJBag2QWR1IUoeDr5jdUkFPINAWezojsIEOScst8Z11@vger.kernel.org, AJvYcCUqaXiKsr1Pji1M0QXy4dthuSTS46bfboSeyOuVFnOk1eWoeRvs+NWVg8Iy3wQ1EsbKTpDxVst1SqXTgNXR@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:4c2:2beb:b726 with SMTP id
 ada2fe7eead31-4c383139884mr9213843137.10.1742289746158; Tue, 18 Mar 2025
 02:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWP8a5eR_1sk2oUe02KdiDaibHnqAHbn2mSyBHzP1FNJA@mail.gmail.com> <Z9k4qrFXCRf23MDo@shikoro>
In-Reply-To: <Z9k4qrFXCRf23MDo@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Mar 2025 10:22:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULR-=emVpF=MwTtC+MUb=R1J15eS6Baet-m9MrRLQ+Jw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq20oshhdEkIeb1-ap1NWSTSjrg487JcMisQ-ov8tinp3H60h_uUjSTXqU
Message-ID: <CAMuHMdULR-=emVpF=MwTtC+MUb=R1J15eS6Baet-m9MrRLQ+Jw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 18 Mar 2025 at 10:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +            - enum:
> > > +                - renesas,r9a06g032-uart
> > > +                - renesas,r9a06g033-uart
> >
> > I think you can simplify by replacing the enum by
> >
> >     - pattern: "^renesas,.*$"
>
> I still plan to remove r9a06g033 bindings from the kernel because that
> SoC cannot run Linux with only 4MB of internal SRAM. So, all this will
> become "const: renesas,r9a06g032-uart" in the future anyhow. But one
> step after the other...

DT is not just for Linux. I guess it can run Zephyr?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

