Return-Path: <linux-renesas-soc+bounces-18534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3290AE05C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2830188B3B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8787F24DCFE;
	Thu, 19 Jun 2025 12:25:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD82459EA;
	Thu, 19 Jun 2025 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335959; cv=none; b=XuVkt40SAHKTMu6vNFFywebodY63fXSfnbfvZDQxrLo2zHyy3AjYX3dZdpOcpX/DvU54hnDozUq6Vu+g5sJyAarO/ob0BMvHOwM8CcNdUvU5NXEpnQYqRcqsxEfBA23BqG4B6wNowX90PbwXkWtHiM5gMQwEeaPPyNoaBoDgeik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335959; c=relaxed/simple;
	bh=nw+6paORmE3fJuO8ylVKNY7c0AcGWBN96GycDaN9lNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgL9UFzYmj8/gaI0vgb1x+e02frUfHTD44u22RQN0VR4TSITktCouBGyOXydHF01oBZZ+LkCHfFDRaVV7Ty0cSC8jiSDYuQEJmpV0EW8Inc8PIBjCw6BWl2XP85NTy0fw9hII64Cul6UOsgRrcRQie3bQtv46S/JxweT1paC90s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7efae1bfdso171558137.3;
        Thu, 19 Jun 2025 05:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335955; x=1750940755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRKDQT8PZNuVIkxqQQfCZ0RpWeCez8dwdZEAe8PYgYg=;
        b=e8Yvs3asvys8i3HZxxcbjba8wuzJXWw4WTURm7wwBVdvPuTTlydRBPsGaFs4KUlM7v
         SxvpzKF9dg7YKsRLtS2qmaXStk423xsUm95SA5wrl48/0TlNqCAAhde6eRU6Xh5myuCe
         DYQyOmlTnAjq4rFTnLXQVCVZ2A8N8/ypxlCLh8OYxs9aa2EHLtv8+FIHShSV+yxqDdcz
         Xqa+sFHp555z3GPgsR2LlrYUYvhlcWXtOVDL1DPiB86PePUIYfQDGOW8DvjHnEDnbsPN
         Hp3/yuQIIhJ70Cpjge/A2X1PXUX/DsU34WmTVyw+Y5Q+QIZ2/RA5ALjykObmKU9eo1uK
         u6KA==
X-Forwarded-Encrypted: i=1; AJvYcCVTVzI3H9CD4fss36FE0tD+tJI5gyVrzw1WfHfJulWYrNJN4I4DJDEqHDa+Y9pMHnf7A1HoaEz0LwVm@vger.kernel.org, AJvYcCW1P1faC5NLgd5kNYaEoofg0fby5HXfTn8LkYak4xLM5gSYnS+4zNm9EnToXXwlgTxPpdadajjUwYNxw4YF@vger.kernel.org, AJvYcCXcX3rXYZs5bfgHkJDHvFQajyhERLXlyHmo7atxn2B+7CSMQgFI3/rSM7cRSObvsBb50U0rabUaGBhg5ENYa561CzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjJv462B1O7dByovK5siQzJozk5rmGXG7wT5r6RxMYwwdE/87
	TBiGC5EeAn46SpiRTXxvkkPbRArLeVgvu3ElFWgFVT3uaKHDSXPJ6VNC+mF5u0ko
X-Gm-Gg: ASbGncsU2KdahPraKD1e87KCkX1X2aCAspeef49QqX9GWS1FP7Cl006+mgz2VqeF4iz
	qt9C8t2ZRN1gzIYgPZCKYZKoYn48BPb1WI1c23ivhTQkmgEiRB2+brMcmk1+VKPt2JcyS3Hp/Hp
	9Kb4lZPYafvSvVOco2K3JS0N1vyOZdgNrTkgpDpiY1I2TzATSECB3QgQsO1eKTE52f8ERCsm0KA
	HAIt9YbNHHgKFtf5fjGkGAJTaiEEdoUkojgoUEbuvFFFre7NB6fBLNIXfoKAjurEarkRY3WmVsP
	kkN0UnvaMpoa5terWknO2RkmiHB50V64SRxmLfV2hEN51yDlrRHoxJeiPWMDcD9SWQCya9e9hzm
	+Alhe4wyj7rjuv1FtoqOtFbWU
X-Google-Smtp-Source: AGHT+IFyz5Yg/uTDzTv8rfupdZi+qtm6CmvCpnHtM1ea362AW4aA8J10dv8uyvJW7PcELXnOZyTqng==
X-Received: by 2002:a05:6102:4b8c:b0:4e6:d94f:c197 with SMTP id ada2fe7eead31-4e7f62629b7mr15996686137.23.1750335955041;
        Thu, 19 Jun 2025 05:25:55 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0fb27703sm2278914241.18.2025.06.19.05.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:25:54 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87f26496daeso160231241.2;
        Thu, 19 Jun 2025 05:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+AabZIe0s+K9Q4z8PgHwM2AOzsmjvsLfaKv4z6uk+QSCY9I8d49xePm9N2PVSELuRJ59X32dRENdC@vger.kernel.org, AJvYcCWWVSCU9MF87N1zSe9xWawJeatLw2QH93VU73yaP0U0JCCpnsS+r9fZ2p0o7U4POnfhDd1nF3evX33rKAfx@vger.kernel.org, AJvYcCWus4rHjQWWTvv5eL2t/o9UyqLQzUiZC2P/m+Rjv0eD0khEwedwstesG1qOy6kLMdLsIYvhTjNnnybP4zxUmT1Wyus=@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4e5:59ce:4717 with SMTP id
 ada2fe7eead31-4e7f614b8femr15344553137.9.1750335954100; Thu, 19 Jun 2025
 05:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250613135614.154100-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250613135614.154100-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:25:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3ScFxjDbyV8Bv6q_DiA1URX_vjMgEm7vHVTtt6CC5vg@mail.gmail.com>
X-Gm-Features: Ac12FXzTevVT1F9nmwPwzvFo3iv8JFfZZuEc_a8tX7ch1cGzxu9PI7Dt0EFhBXE
Message-ID: <CAMuHMdW3ScFxjDbyV8Bv6q_DiA1URX_vjMgEm7vHVTtt6CC5vg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Remove
 GIC_CPU_MASK_SIMPLE() from timer node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 17:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H SoC uses GICv3, which does not require a CPU mask in the
> `interrupts-extended` property of the ARMv8 timer node. The CPU mask
> macro `GIC_CPU_MASK_SIMPLE()` is only applicable to pre-GICv3 systems.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

JFTR
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

