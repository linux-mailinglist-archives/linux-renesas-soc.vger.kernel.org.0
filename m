Return-Path: <linux-renesas-soc+bounces-25286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2AC8F4C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4259934FF50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3447337B97;
	Thu, 27 Nov 2025 15:31:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11373336ED2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257506; cv=none; b=DYHOdZ4sP3lwLdmVekGetShoyEAc+M1Yjd020tREpcWtRoIOi9vcNH64wYm+kAw3jzT7bWDAamUXMDKzjhtAJrrFfCv1mQzsmPdxUdiU6j9NmTQgFAaJBoTPOxcqZuK565Y2vqrlgayMqXo8dRxNN4aFavCCjSfuPZfIyfm6SQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257506; c=relaxed/simple;
	bh=5LssjHCBdyOYX00Kp42YDjZkb/QKpvt2mnLjPvJZhgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSzsi9nv2cDyBShtxX0su5H7gZ2QtU/51Ou7RevfhSEuG47CWUprUu4zBTtRWbTkWcbRBvUAfsfk7XavxkeLlLGMAXKVxkp99GwE3DTEiLKnuxgBFniWV2zsEyAW++gAZFOsv0qdFzYqF8xpD5JOoeUPCNTjC41uEAaRF3uCSCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dfaceec8deso671578137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257504; x=1764862304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reaaXQppM7aTNDTI1IEDn8WDBg5CASf/0DVLYYtxHDY=;
        b=wM+gv74Jsmf4aaXepmnBl8wKmhn4zT0vnuRctNQIMwExeGdQtsip7uowoztN9hNJo9
         AUdjqjIoXMVBvrGgHGRNpgCM44Wqorc9S7L2TMz/4MkXXPPwTDX0aMhtGOxWAzSXhoA0
         d/w1M2Dy06G/Qz8iTSEbK38p1BiNOAPISP/b3715S1tcsiBRnZGy46296EkMQKKuwNRg
         GNe3Hn9KLLkeaJAEcs/tjRjBV36CEJlxx3bLFNdcaVBSJ0n4iqA/ZreRWQoNo1WgAYip
         L9e7Fm7gzl/LrV66TmGr3AQXiNhorKrFMjFYvbeiF+l1i2JaSVoVEeiIerN6tLhwxi3d
         0ucA==
X-Forwarded-Encrypted: i=1; AJvYcCXvvhifnaKzihtgOi4UForhPahnaPZ+SvKRSCRGJI7j2/a0IUAngDTvtSbNNK3Snl8FYbhnXnE/oomcDcMb/kG1OA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmay6189CS0xOsYoyJHf12T/P/2n/9FIP1B61t8WjCndyEa/1u
	iDWwnIjJMn+jxlNcGBIj6k1UTCyXs9zeb21P6w5UN7yg3WT3+eAHss4gKK9Kyo/o
X-Gm-Gg: ASbGncvQXW/RJtNiGmDhrFKbJecKRDTQzIqF8GZpuC9lbR8rJHhql5L5/YoEBlAgD/Z
	8fzOkNvStXgSWUVTRLQqU3iAyMmqaNgQ1jVCsxuQtIR4HU24c6Gb2I8AHratmcjq/B0R38xi3G9
	AhkO/xKUfvjgenn6YGfr6OHqYBifxpkv9s5EC6neV8U+Ru9sNkwaAq2ffG2FeGWBuqUNeZnw99N
	3ri9TnRJFnzgkwlwawsXFMX+dTAt2Y5mJxhokdxLixsoCbVqdI8gMAlLcg2ZIFAW4Grp9/6qSd/
	rMh097z9QuobKFmIwGR1aAlVXZOAs0eIY3Pexb94tzTsBBo/xFgGW3vNZmhDQ0TgrsSRZlw73Vg
	VtqT6QkB1Y42rOzRFF389/TU09TibcR1RLEqFw4b6DeSXeHhTcX/JH1irF/FaaEZ9egR6oUlLlq
	03EbxRkb+AFg/yx5FpiShetQqOLcTSy+kSOF8N39V8NJFyjQLN
X-Google-Smtp-Source: AGHT+IGw4Ll9Mce1NZMpg8IWIRHMJ5HzUlHfiW3qA/uRZYf7gq+UGAOPbLpDSoOI0sNFZ3llO0Il3g==
X-Received: by 2002:a05:6102:2c89:b0:5dd:8953:4c39 with SMTP id ada2fe7eead31-5e1dcc9502dmr10273846137.4.1764257503600;
        Thu, 27 Nov 2025 07:31:43 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd75f3948sm672199241.9.2025.11.27.07.31.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:31:42 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93725308c15so608349241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBgwGIfoA0VqJqyIsb4fiuTE2yzBNqLdqL8+/EAEIPdPqWV24slP9k0uQw93Dp8VpBnknvK36y9HPBLAqCFMls3w==@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:5db:1e4e:6b04 with SMTP id
 ada2fe7eead31-5e1dcfac0a0mr9944783137.18.1764257502521; Thu, 27 Nov 2025
 07:31:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119143523.977085-6-claudiu.beznea.uj@bp.renesas.com> <vrtz6pumfpjyis5sez7iia37yyruizl2wz3vb4ojafww5hrjev@pmy5uiknetre>
In-Reply-To: <vrtz6pumfpjyis5sez7iia37yyruizl2wz3vb4ojafww5hrjev@pmy5uiknetre>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 16:31:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSd1Bn0zU+nY8FW4XZQMeLyLQoNSdc6PdcFLq-7xVcqg@mail.gmail.com>
X-Gm-Features: AWmQ_bmQYBZvVFdH1jgBs9beHkHsNQ4PypBPAGFdHNRMUEACr9V2X_70026RVXA
Message-ID: <CAMuHMdXSd1Bn0zU+nY8FW4XZQMeLyLQoNSdc6PdcFLq-7xVcqg@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 06:55, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Wed, Nov 19, 2025 at 04:35:22PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
> > support.
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thx, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

