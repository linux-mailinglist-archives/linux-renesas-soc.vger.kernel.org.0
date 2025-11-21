Return-Path: <linux-renesas-soc+bounces-24914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB2C78B60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 328D42D749
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BD6348456;
	Fri, 21 Nov 2025 11:12:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0434888A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723527; cv=none; b=HAap09YO8YSVeSIq3QvSlhKg5IM7FxqawxinTO7mcLQYITG3W+Yb89hpMsDJRcQR+sQ8lFsmgUFnmENeGYSxEuIAj82azPHD1aZi1tE0WlhnIRokmiDD8Z2nonA75/YKsPWfSQNPL/TNw3Kr3d3WIvAxNZk9OKkwNbkeoI0CjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723527; c=relaxed/simple;
	bh=jxb+itbVH2dTiDTYOdC3BavIvOa4wwWTs4TOMboUM3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7JdK/aSP2p8L0+6JGYYgzkW02NHK0C/j8evMso8A/CRI9XEGCU4O88YZKpHCkym30S8HLU65tMfn9dW3zj3gC18hEmcKyZbtKSltKKnE3wi3antOPtFLJXQ4CNjl1x0JzTL6HMbsJX6e10ztepbyW6HLo0spDynZ7VuZghW0vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93526e2842dso512233241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763723525; x=1764328325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3nrxvKnqxhW5sQVph+ix0KGm0P7f27OLumZSmSfLUQ=;
        b=Sgs1o94BpanMS4BKkr/m/XsKj7fU0OkEXpovej7GQqr5zifLW1vOO1OPkMuzNCrTfP
         2d+JxiUQJqsNvXrLK+gjlC6kkGfWyYcTDKKXgWp1oZEkyFp2hXAaiQQCPhxmRfLEr9zk
         +YEViFjH1ENkQk4+CkF5YJmgQ9894MQ6QcbJZrvyJsBi0Z7bZzj5yIq+KMYP/acukeKz
         l8hEzBzQLOd3VVuoEtAlQ10NpLL4vr4Fg2bOc8sRfGNES3/2ob3FKhUjEPMyLI1M4HJi
         7L29PuCVn+vrzo3NjogMeEWcJKAdowu2TSo2BT+ara/CXHcxKV+ZluRkfr25BPpck1fH
         gydA==
X-Forwarded-Encrypted: i=1; AJvYcCVt9ITVe+9pHJEwKkpVy2Oly0AR/x60jRBkl2tqdRAfbfL3RZ+6ofm0qeQwb6xKYyWGEhmhntK3uSULh0aj/Kvayw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXK1vmD5n21EK3BImunoTceiw+LytBnEHHGP8s8pddeF1ELzUi
	QhIKCIuOCUtWZuIHI4GZnCTXyJjcMqcvrfHn9A7EkxrQyO0vOinabIRMmG5r3sK6
X-Gm-Gg: ASbGnctHeEM/9qS4lzk1V2SV5SobeWF/dighOMRatsbHZfmQ4VC7Jukd5mbMdSMenK2
	qH6qyCKbRo9qQDosWGT9va1K03795Fqiw5fRGVNB6XU815NdYfTY7RaCSOObb5IhYFm5InsMWVF
	cypcV90x7dSSzV9lX6ezQtPXOjuWd7AyqlfgOTMEcHZgmktlhvJWpLc+iNVCjmipfOsldpd3Fjh
	5U1kT1x7YtX7sK0QuzZMh68+DkyBER99HjE6+MuOtoYI+daO+5/xgKNpT5AIZLKomX0gErQEGoL
	s6jgytEUI1rpjAEGeZYw64IAZQsK/jAuktZWr4LiS0OPzJainVCMifes2LmRK4fWLyUNFX4+0go
	IupsSh4cXXuWqIRYnC6ikfHIQ25JHVHDIF/OknTI6uaap0ybHdm+pTaEH+BJKCtnSccfRRBaCwV
	1nNQugmBJmbTVa8cBx6uFgFz7gU7GYgFc7dwed48LCq0EcUw2QNE+l
X-Google-Smtp-Source: AGHT+IE3lWJFfljJaBhEJiIQYUxOEfWVvDPMx/vYCChMyHs0axNci+/giXDIJMic9hdX8GrDCY3yQQ==
X-Received: by 2002:a05:6102:4b82:b0:522:86ea:42c with SMTP id ada2fe7eead31-5e1de195b11mr440715137.11.1763723524543;
        Fri, 21 Nov 2025 03:12:04 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1e3930fddsm381613137.12.2025.11.21.03.12.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:12:02 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55960aa131dso530778e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:12:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXL1tfaIz6FUh1h6CORVsm94vQ0uLpt5x9edCJ2yCu5KXXi2Dh11Wsqo2MSEwknIl+n80hojnoKJbX6awdTfOflgA==@vger.kernel.org
X-Received: by 2002:a05:6102:9d9:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5e1de1a0867mr343369137.18.1763723521800; Fri, 21 Nov 2025
 03:12:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com> <20251010-kakip_dts-v1-3-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-3-64f798ad43c9@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 12:11:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUU66uJce8n9mg+NgQ=kbMx097hQm2BAtP--QC_XjQnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bmQMhohJ2GYhhiLPCm3R815QyIL8HPupV7asma0bn7pHAzynSJr2uznrV4
Message-ID: <CAMuHMdUU66uJce8n9mg+NgQ=kbMx097hQm2BAtP--QC_XjQnDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your patch!

On Fri, 10 Oct 2025 at 12:51, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.

You are not really adding nodes.

    "Enable the device nodes for the ISP and IVC..."?

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -195,6 +195,14 @@ raa215300: pmic@12 {
>         };
>  };
>
> +&ivc {
> +       status = "okay";
> +};
> +
> +&isp {

Please preserve sort order (alphabetical).

> +       status = "okay";
> +};
> +
>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

