Return-Path: <linux-renesas-soc+bounces-3105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377585FAE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 15:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B517F1C222B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E71474A3;
	Thu, 22 Feb 2024 14:16:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654C145FF6;
	Thu, 22 Feb 2024 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611384; cv=none; b=P/BRsiuRiqCUyCeb0f9ztsYW8qMksSTwq4dCSXTXVosa8iSWlBocKYsz9J/umqr3HP0iTaHIiIQY1nPbWBbJJTX5AADkz0zBOq2kCKODthN9WWYj5R8D77q7x0jbyr0TQhF6qnIFiTEJSkHpV5y4s8twSZ7q0ujnjwkglvhgXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611384; c=relaxed/simple;
	bh=7UxWlVIsq1bDvQiZQj8mGAwZvWJOLJNxt6rmsZ/RCYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mf1aHe33Jo1/ZnFuiBBAg1k5NpmEhjoOHhu3alrJpqLDsKz2tFA2auXGv9oPzSSMJi8Oego5V2lBe9k5zXWnOisUJH1G9WOuhRD2MIMz18sqyIv8RFd+L2cKXcofpjMVSBGaqqKGOPB0M5Bkxo3TxHG6IpyWtTPJcQHjhDN2ppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so6567733276.3;
        Thu, 22 Feb 2024 06:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611381; x=1709216181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+Ew0Qq9MzZy+17iEJHKAks8/gLWen4uXI5RgK2Xn0M=;
        b=dQaRa1wVZ+ie7thKGDLq9b7JAIo49Iu0OplbUOLBIiJIjY0g3au4oOeXef2HfAfMf0
         pD+oPNDy6VKpR7uB+QVdQ86Ma30oRJVHZps4YHqjiEpS26ikIrIdCiAOukrkBkZyzNJs
         A/F9+VpTHNdQ9bh+0Bb2RvvSceIs6sObjCe+gLCpqukbj+Mqf2PoQAjSdr8hO2Qv9gn8
         CLCfirWgaAkD4U/eCfFfgETr27VfvuU5gEfaVkgMRqimIlWfQTICMghJdOx5ejNwAviu
         H51N1nqqHPR2fZNg0TyjbXFD8aQ+urdXSTrXHKJZC/gI6zxOWkSGa1Rp0VhrttXOZdW6
         qINg==
X-Forwarded-Encrypted: i=1; AJvYcCVPof4dJLYgw2UnOPH+Bpl9t70xaA3ibkweV7XItu1YM8/TKcJhL5JTuLYsOIfc/2q3y3djfvJbHBHA2HqD2KQjv6Mm8OwjdhbUaHPUtc5l/bvsj+07H6cXNBgrSg0jQrWlaDnhodDYTkGBGQ49
X-Gm-Message-State: AOJu0Ywro0J2VbX1seZOUWekIJxtUiSfBInqTts7CN3s6zU+L/p9k0+f
	0mRJDVNz5Vr+qs6Mwn9Q2HbxXeW2JtPR5rl2lokktkfyKvoY1a7utumM5j/v3xg=
X-Google-Smtp-Source: AGHT+IGfIEKZKKYug8wWLhLz1YDu5N7KMv58KLMhMGp3nsmB6jFWmAmUxRau37jiwRZyyaJskJ1UYA==
X-Received: by 2002:a25:aba4:0:b0:dc6:d457:ac92 with SMTP id v33-20020a25aba4000000b00dc6d457ac92mr2317578ybi.31.1708611380881;
        Thu, 22 Feb 2024 06:16:20 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 140-20020a250292000000b00dcbb7dd8b86sm2901962ybc.52.2024.02.22.06.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:16:20 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6083befe2a7so46460407b3.0;
        Thu, 22 Feb 2024 06:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMTrGqK305kyw9IgOrPpVPkRAFuRVXfHSPUUlKi41QVnTi9feNDxqMTTgFlbI9O88Pbgozn4R9s3QtviDYVtT3IULtqgCRC89naTSMuhtsz2ZLNevuOJSfBAH+mN0ZWwqygRKvyE8IN4IJsySL
X-Received: by 2002:a0d:cc95:0:b0:608:7d49:85f8 with SMTP id
 o143-20020a0dcc95000000b006087d4985f8mr4541282ywd.1.1708611380185; Thu, 22
 Feb 2024 06:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222132117.137729-1-biju.das.jz@bp.renesas.com> <20240222132117.137729-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240222132117.137729-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 15:16:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa=o_eNB5S9XBU-MM5+rtcLKR4mLRjigj5WCu2MVtipA@mail.gmail.com>
Message-ID: <CAMuHMdVa=o_eNB5S9XBU-MM5+rtcLKR4mLRjigj5WCu2MVtipA@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm64: dts: renesas: r9a07g054: Add DU node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:21=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add DU node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v8->v9:
>  * Added ports properties.
>  * Dropped Rb tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

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

