Return-Path: <linux-renesas-soc+bounces-18188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA8AD7273
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 008693B638D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5786724678F;
	Thu, 12 Jun 2025 13:42:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811F23C8A0;
	Thu, 12 Jun 2025 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735738; cv=none; b=A2jGMlxjXCFvHx4UKuDZu++mx6FFli7SlbdtYvHAfFQGLgmt0DQ+M2RhdTG31vW/R99YUDykY07QakZUCuLmgjpWqDLBiGcwjVCq21dGmWxXKVFe7P6zyV1ZOiyNxnPbalysgvg4kBQYleG8N8nZjXXlugPTO92bc9ueKCnRr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735738; c=relaxed/simple;
	bh=Q0nu4YxcMNQW01H3Q1lwz5o1gcVOmkGBM+m8coOpONQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEkmfmQQoHTvUqN5QKyyIsVi643MXVR26CqSj5I3bCP40HaCF6H6XqTpe+Fzj3jPCsW/RuDlQWIZmaWhFtEf/0xB6dEKP2uor/jregGrhwX+K0R5TKUS6JXBIr0In+m8/0rJmqCLiaqr/Lk60IEmQTTc6mKa6dbSPpAeVz5Jkaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7c7b6e5b6so272118137.0;
        Thu, 12 Jun 2025 06:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735734; x=1750340534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBSJcOpXxu8Nk2XaqOIUz/lrKkb5r1l+pE4x8iGOPKo=;
        b=d81V5c13Ph6v5TnG4DvGyfezYcVDZAvQjvYYdH7rAGHiX+yOtphRnpCp5cmOtBTO9+
         IHKjKNcy8v5xIQEvnxv9uhrGk67R9w3migwgDP3mrYXoMoZVesQzKGAm+l3yyn4FpuPK
         LIyFSGZfsZA6vhR6VhRZIZiMfO4fej6+o2N1SbZ9YOBGf0d0lr4V/ongc7Jpbn/+Ereo
         80UIhmMa1tKuQVEQA/6tzJdGXu4gJKXp/mdGVJW13iOF9npOuppbKVEgstswTKCvOV5y
         XgPU4eUWn/YdAW7KZKXtHqieZExSkHqY+pqHWkWN4i7L7hVIiBX6A3RIuMJk5zYdYCAb
         iV4g==
X-Forwarded-Encrypted: i=1; AJvYcCWmmapGlMVj2kdWxGqCxPd6Q/kLxheMHdgAkHQO/CEFMCoJRs/s/dRKAVCjam+4j55BmuLQLPHgHP/N@vger.kernel.org, AJvYcCX2iVouPk+4kdQXtpXpoSl8dKrF98cpuJETTgCDT7d06BJKLiqS5MJYHLy4IAqpvHGtUqk2A3sXcTaVyrgc8m82gK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRvYhWUymOJQiJqok3/hJHUsWDJCCGqEsQpOGwCb+/JBZCU1Pc
	5Lh9JjFF9hEL7ZT+ZxR9z0em+r0x9JMFAYKzwchJEMJzKEwO7hDS96Y8H0JozJi8
X-Gm-Gg: ASbGncs3hPfVewuFgRaO9J30Dz37Q0qtpgY4mdqhbQdy9XnaGsXoPtajGJ/NnU461BF
	vWGz3tyBoWVWflDuTNh9/yFBSHB40Ct6CDZvmtcIAiZI1t1U09q0SPz5g7R9LsOV90L1dhPEtyd
	7+Y4sM7qJDHVquo2Zb7zrYEgl3atC8marhUFtRTDZK3IxO3+qL4zEYUOaSJuVeqoiC1IRl+JaZj
	36kUAKg9gYT2PaTnpIpQn/29Ji6gjfWqliyXezYxypFwgIeAKEuyoicHvdpmV8g99R82yOdhnOK
	Q+aLwgzLJiQWW5qGjpU2UNN9mUJj14KKYIbm2KnjXnGOMPBVUXaR6nac7jvaIKuSTDB9cgZCxK6
	OBbIRAyYqae30dy/+UqyLV2V3
X-Google-Smtp-Source: AGHT+IHaZhAphu5CEghg6XZWSUY8REike0ard5YbjZe+Xz2bXIchsEEl7x62LsWc00tTu8slNyiUjg==
X-Received: by 2002:a05:6102:3e1f:b0:4e6:f7e9:c46c with SMTP id ada2fe7eead31-4e7bae735eamr8038148137.2.1749735734498;
        Thu, 12 Jun 2025 06:42:14 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d0997328sm232645137.28.2025.06.12.06.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:42:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7b52428bdso276563137.1;
        Thu, 12 Jun 2025 06:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVItnlqlwltl7IFTtu4wrxOYkWqs1macUswEDf1N31SneXdiRkd9VKVPSmeafM5u6wyYgNrai4qZaNkDl+zaL58mis=@vger.kernel.org, AJvYcCXVXq5TsAs8NbQB2X4qtPFvhlT/P7ynzXm77IPiMm/uDGSsOHeFOiQ3xLjX9NqUBOv/Ixu6x3d2nTPZ@vger.kernel.org
X-Received: by 2002:a05:6102:8003:b0:4e2:a5b9:df1d with SMTP id
 ada2fe7eead31-4e7baec76a6mr7321614137.8.1749735733720; Thu, 12 Jun 2025
 06:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:42:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWM=KazUzpaPvUDdJ-5qcgG-7ZD5BJPuKhNktBevZ--NQ@mail.gmail.com>
X-Gm-Features: AX0GCFveIMZ5PUkBzPLlVATe778amDQDvOgnEVFgoe_6ipYROtU2cjeE9uVnk5E
Message-ID: <CAMuHMdWM=KazUzpaPvUDdJ-5qcgG-7ZD5BJPuKhNktBevZ--NQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on
 R-Car Gen3
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Jun 2025 at 23:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add bootph-all property to sysinfo EEPROM on Renesas R-Car Gen3
> Salvator-X(S), ULCB, Condor, Ebisu, Draak boards. The sysinfo
> EEPROM is used by U-Boot early on, mark it using the bootph-all
> property. No functional change for the Linux kernel, this only
> reduces the divergence of DTs between U-Boot and Linux.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

