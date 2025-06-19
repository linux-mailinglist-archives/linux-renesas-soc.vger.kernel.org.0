Return-Path: <linux-renesas-soc+bounces-18536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B755AE05C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ABF47A9AB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F81E230BF2;
	Thu, 19 Jun 2025 12:29:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9668BFF;
	Thu, 19 Jun 2025 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336187; cv=none; b=No3gtokMDd6Gf+sn+y0OTmoqPVVZb2yHYznCL7ZG8HQcgqvsg8meal0NnS5A5QH2qgtaeX5Gog/ZQUpTS4NNQIfONK2U0MvzaAcjQQh9+wcb5PHsX13jsSTg1IaxTtDS+585rjkj8Nhk0WEd+clgnjnLyxAw5wp5d6aYjEekfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336187; c=relaxed/simple;
	bh=Ly4ZqcR7RraG7tvEMyjh5wL8mbutUH1OZrzBye6fuW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuU06znSm1a7A9FhOlTYh9FFDwl4Jmu+xytukLXupK93whGSoOHI+6KKMegCK9SOQM4BUWIcw0JCnAISOeCKn2X0WjB+xsSMVuIJd0dxM7zV6asoOdNjFi8fno2eJ758uiFRibfjq5IgYt8zUWm8WNLBQC4D7DaJ/50F5i8V0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so581266137.2;
        Thu, 19 Jun 2025 05:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336184; x=1750940984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOxu/NQ2NbooSdZUNrR1rVTWyLIJTvg63yGMiJNMT/k=;
        b=SPr963jIB4ynEK7zC1iVS+pVe8uXFEySXC1MbCCdAnhv95KOBnnZDt6r+tHcON8Wor
         4Db5a1GX0qZt1Mi7mfRIj59XXPs/aZ/i7hrmTCAHTSRRXGcZvyK2PiFLW8iCRZQurSLE
         yuvh2cinnoty/8zyjT5xTSLxP99miT4cUXTN6N5ZnRsra3xP6DqBt0QQe+yZcPZHCeCi
         82ivWJYXNBSNm2VIcJ5yFtfgVGhnwuF/cZkEn1GHBDiKsq25isTI9DfCo5z8WRgGe+iY
         Gc8rdoLGb/AEVziHQFZN/r2sx5bDuiWsqa7FSIn3xL/k+BjZGJbhtz0dRZD3mcQzowrB
         WF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsRq1EdWDviGKar3u3sHTuppAVacdwS3hOa352IU+OuPobJ5Gmxx55X4F4/RFtdfBXJKR+jJc6jdc3L5zu@vger.kernel.org, AJvYcCWoLM9w+ylCHPJ8E8qYmtbRkcBLst9LAPqsgw32FkQ3q8+g5qEgx4QKVt3IM0I3K8n3SXC9W7bmEfew@vger.kernel.org, AJvYcCXQYIF4wgawN8G2ioWr+5Tz4OLdoGBhEWIxU+YNbgGNP2hGCrWcPMde1+70pZoVel/x3PkGw3Qnk1bMyt4HUD9gDBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eIx9zjgQbtDzpwEsQvE0r3iQcrPa5Y1L+sa9xne6uxsqM8nB
	kdWccLw4D7fTHg9j4f70F/Yfe5JbJ2X0viyxdJgGyMQkMzhpeb2BATMYsCKkm1fN
X-Gm-Gg: ASbGncu3QitOZ3kVpidlCfrMfm3JHZSD/rY1PXtAzklAeyFu98a1r7ICn59obOvVHBs
	ryJ1th+Iph7ZXZomWSSmlifq4CvocDI4fKilP0bzMnHkankyTVHuNR9WaxXe2cytgELQ3hcDJaN
	U8hC9q29QVsWXKivs6DaQuRjz+LL27N6FDswI3VAdkvDb99jiETvY2X7NEJ0oWaLrgtNkfmi1yp
	D5JHfEe3IqGlFZm60Vwfb3SkIDeoyiSaGsxAXH8emcGTPr/E2+Jm3/ZUInvomz/EOaQoNNJAapu
	19alJfLQebqRhkvhXnOPNJWb9MsP+evz9oMTJ2LKam16oJxZEUoVyAzKRdKl/3F3gorK1dhk26X
	XtzBx2AeQpwdLjRRuZnI4/EOH
X-Google-Smtp-Source: AGHT+IHw0vAN7DVvaQ/5yi3qZ57KYROmjFnGFtS3HxO8cPB/Eww5w4bGS4R3ygNlhr4HYzshKBB0Gg==
X-Received: by 2002:a05:6102:9d8:b0:4e5:9138:29ab with SMTP id ada2fe7eead31-4e7f61cec4cmr15693082137.15.1750336184136;
        Thu, 19 Jun 2025 05:29:44 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0f9cef4esm2354626241.5.2025.06.19.05.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:29:43 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e9a7bfb3c8so568561137.1;
        Thu, 19 Jun 2025 05:29:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPsv0fnGum5x822gGdeEYWIS7oRg10ImMg0FYbJEA7muNR8L0zWR1l/I94rTMBcT9yTvOu2Lpnhxxh@vger.kernel.org, AJvYcCUwSR33ENtqs4xJRYAxb/UX3S0woKyea69uFsAHSWM7qgSukjMSUDaKiZJSJLIbE6nm2WRLiHUsUSgRpBfp@vger.kernel.org, AJvYcCWsYso1om7M/E0B4LFEgXl/x1Esh6VEdQs1CvUW58xAR+WPaw/KU8CjbXZcWCeHdU/C7OiVzp7IIaQVw/8cqMUBEu4=@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:4e7:7146:a9e with SMTP id
 ada2fe7eead31-4e7f6118447mr13184041137.6.1750336183601; Thu, 19 Jun 2025
 05:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250613135614.154100-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250613135614.154100-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:29:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtEu6+NNZ12QgpVASNidMgxmBrc4Q_yW5qxuT=RpHf7Q@mail.gmail.com>
X-Gm-Features: Ac12FXwjac7lvbG9dfr9r5T_EWYDrgUU3Jv3FiViSM2_pMI9aG_Eg4kUY0ep55o
Message-ID: <CAMuHMdXtEu6+NNZ12QgpVASNidMgxmBrc4Q_yW5qxuT=RpHf7Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g077: Sort extal_clk node
 by name
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 17:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reorder the `extal_clk` node in the RZ/T2H SoC DTSI to maintain
> consistent sorting by node name.
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

