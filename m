Return-Path: <linux-renesas-soc+bounces-18990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA0AEFAA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 194F77AC558
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6ED26FA52;
	Tue,  1 Jul 2025 13:31:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515F1E1E1E;
	Tue,  1 Jul 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376699; cv=none; b=gN1pk/usW/TQVdnBcYSD3pXCBnW0nGgTCMsipVg59WdNY2ggYHTkfCK6Ns4wWE0all7eQzhX9yF2bDgur3cCD77bTN2MKUXdPpU64TO22ecfoc2KRrU2Zxzz2/JqGKv+7zSTBCxFsfYIoiQeJSs7aogGlWwZ4iVFFHU6lbSQ5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376699; c=relaxed/simple;
	bh=mYu7X1X8qqyecu4ryPK90HfTBlVYex7d/wNFdNQNphY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EITCvBKx2+wdjhn7JgNEhGnvuTEa0omlKZoIUNKonQQ5xFkc6p15nNbiubT+muvz090p6mJQ+rtKLRf+RtWj2iBH/sSlMT4h1Bvj0uYB2p6JdFZZg7RdkXk/dFTPDb/a1Tm5PAS1UoIiJj2+08NRd73YdH3PwuLWFdebSivklrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5315ebfd92cso3464478e0c.0;
        Tue, 01 Jul 2025 06:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376695; x=1751981495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV/QvZy0Nb0wuzQr0ypBrH0VBcR+Ic5t7RZaWoR81tc=;
        b=CJOifO23Fi7n7rztLfOjI3D/cIWeud8lVpj2i4zwWyUTvWmSVE+LAnMoGHRODxkoD/
         +elkRQF0jK3Elge0IlWZoW56E6w+BH+2pqxx5FAaZ+gX8V1JnpYDhFNqnotK5PxntcYH
         2UkGRb10jY0HePJ5vlM/7Y7qiTLILv+cfEzFXCuVZNn7cOd+N7ZQTG2hdP66BX8117rG
         e/7HRrJ4n4k+T5g8svZlGZWupFX6RMLxUxGuZEnW6c3KtwB7N0iI1A2vWSDLzBx5IBeq
         aQVwU68Tykgeh7a4pUgEggii/svdhvZ66UxSgztUNg0FxunAqfDRLZFNz/e7RT5/plkk
         TjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFLH7+ub3ObfytHgE2Ee+bN3A/w3a4kRKQY70xH8uu01zBBCoVL6bSt36qczZQXboG6AsJesUtqrl5iyPnjyILJ3Y=@vger.kernel.org, AJvYcCXaratiI/9IRsQ3oQLQO7gEBlZ3Gtl+ftf2M8SQoAo5mWS+F+PbtqG0YMnR8w0EEdtyyJYC4KHgxgENfNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENORX6EuEXCUH4K7V7LWBySAQ9iaCL71LzYQxrTGkj3BLlnTz
	664udkSNLXlTmdAs9P7iELH8j70CfJ0/PmPLZ1T2aFQwe1Yu5qHb8JxLUIwQKelv
X-Gm-Gg: ASbGncswrZ1CKI8Bk9EemrG0TC9Gy7hIsGEvMpxUtBihqPEUaCuG2O+wabjnCb8t4ct
	ScGtBxUK7TYw/zfp112bwalkQtHtDYVpcPFu8H4OIRBQk7Um/DomVgE6PaBBu6qbmiGDnItR2z7
	fN5KLJ4VGNmG3l09gV8kamT8pbeGXs2KZHNM0KQH7mxibSdfrR1fNTi3WG5JzAKyE6cZGwbdlNP
	GZLqHtKXvDvNj8veLwn6wR0yQcIsvF508bbPx1sflGFQ3U7UZX2QGt+9OfwKkP9p5A6x84IJ6o6
	cMvbKH1/eJUe6FqYuYpGBN2gL3n2/g8jG/N3dIrLEd31lXLBskN+1pFHU15mR+QQKlbCZnescHW
	yHtbTh7CFqpHRbtX6Ppwe0HEo3zbT
X-Google-Smtp-Source: AGHT+IFgbDL2y78nrVNCrt8lfRU3lO0Eebi9Se4vm5C1Ei+O65jjz9xotGB7TiZy4sXHkUe2K7+Uew==
X-Received: by 2002:a05:6122:9002:b0:531:19ee:93e9 with SMTP id 71dfb90a1353d-5341c544f6dmr2542790e0c.2.1751376694414;
        Tue, 01 Jul 2025 06:31:34 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bf1bdsm1726700e0c.23.2025.07.01.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:31:32 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5315972826dso3546526e0c.1;
        Tue, 01 Jul 2025 06:31:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7JWXstrUl73niqMmoNOdgM5ix5j7nMl/IzUNKqXY3Qr6N2YR7cfSyPlKXJX7e5TQMdz8PIOffgwGJozzk42kliK8=@vger.kernel.org, AJvYcCVshIcT/lw8LImjxcyxhYJUFpoM4cg6/FFpWfZ/Q8k5h0xvHUOdyR+mixmPt7y91X+aYdIlIDAZuYSz1MA=@vger.kernel.org
X-Received: by 2002:a05:6122:311c:b0:52d:cc6f:81a2 with SMTP id
 71dfb90a1353d-534256115admr2267428e0c.6.1751376692001; Tue, 01 Jul 2025
 06:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com> <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:31:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmQTbXYvZXi+1MGxfgEL1=JKVCehm37OYPVAo=dnJgoQ@mail.gmail.com>
X-Gm-Features: Ac12FXxg0c3Tvb5Xd7h_l51_d8L50Cpq3cEZgNBKA60f6RhP9PcpNZoeo04WdGQ
Message-ID: <CAMuHMdXmQTbXYvZXi+1MGxfgEL1=JKVCehm37OYPVAo=dnJgoQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable the RZ/V2H(P) RSPI driver
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 21:23, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Enable the Renesas RZ/V2H(P) RSPI driver for the benefit of
> RZ/V2H(P) based platforms.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17, pending acceptance of
the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

