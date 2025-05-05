Return-Path: <linux-renesas-soc+bounces-16688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5745AA94D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E461D3AB481
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 13:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CAE2036EC;
	Mon,  5 May 2025 13:49:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081B2C859;
	Mon,  5 May 2025 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452961; cv=none; b=I4CbSP26n8knN3gmwb43S+GeL6899SHytWH5BgWBZYY0PkEqDaoa320KiANQatDTUUvrknu3w5GFGOCAx14MuSxzHQDlLwvJ4HEGD4DZwF+G5xDOFlRc/dJGk3Pr0qy6+fIWtihj06+60/PdxAk5duAj55xuJ0VEKLocS4OVRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452961; c=relaxed/simple;
	bh=d6wIFOZw3rS7r+G4fYWRgLIklt1AwzoqHzLh5H5AjQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFRZbuL8jXnrMeEHjs3QfnAIi5V+Z/BqzyCnDZBFzmdbROYRagTrcfsrS/80xWiQPwvLrRVzu5KSv33D2u8vFjBnEzWNWgReNSuE1kZOOcGs6uUTv2jtLp9Hi8k+AAJ18LFbnDLHsaOktL/NtKFwP3XGjwjw9u2HBCv2oWwfaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60657f417c4so2116075eaf.0;
        Mon, 05 May 2025 06:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746452958; x=1747057758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7alF+sKYy7bnnzEw8t9OCM3No00uhAXxAhvyf3qj+U=;
        b=tmSmQDSrH812+kU9whrrTBSXzZg2XmsW1vpgUs8eaCBNij0nojirXKXR4u2eX/BVR1
         OphQuk3hAg3pbVlTKKMhQI3Y2BYZlyy8qUm4My3cO236+ETZtJbZSZGvUNPXma5IQf2X
         CGwWYJcUQuPjDkasXjSQ9Vbz+QJ3jq7MEfZFm7DlKSWL6DO0DBP/pM2gsyAAe+TClM3T
         EyNKwKGM9WqmlngqDWVxGDleRPq3Fa3IR6Ppn5+MUdDTWCsJJ554HUX1nQ3JFZihHH9x
         681rbASx9PDM7Di4xFuyBOKLQGxIiGp1vzTv6bl5DZadDwPuuJNzIPphEgc6qqU+9r9o
         Pnbg==
X-Forwarded-Encrypted: i=1; AJvYcCVJVDLVcKhD1CWlhtEQu1W6g76BnidZ/+ZbRvLgupXAwPhcbXnlbGMc+OdPz1klyF32Gge76QJct83Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/vRZNYm9vHU4p83buGc36H7gNGlV1Ipm7xQquY3qli9WTAIl
	1HnrpdY8taQNOhMyrIedZYDzPUyLcbzp2v+8KEFVNQTHAGFmHgTIdcPmtlOn
X-Gm-Gg: ASbGncsyKnd4eoz8g4dX66hv/GU2C9PHgbdKUcZj99LgIWyPG/zdQs0YxD0KAnHEnRP
	c5HzxwVGtRbZyvPK/qzYj3C+Hl+2zlSDbfGu65v34UyZbEes3aMsZl5t4KX3JSf16OPdQS15yMa
	nSmHBg6Qkgqfs6tUZ7ekM4l4O9+HQUmJ4eyl6ck9/M7rPn6dzz2C/71SKHeGZyr0/fq8H7Cr/1I
	0Dxol2MAZwxokDhVDV7ByW6q2t2YUL49uJqB1QD2KfvR92Z3kH+XGJIR9hwo+oO8B7OjqSpKPPt
	59+iYP6me8dBT+G6iZG5kjVPdOMhztCNfgiRjrxR64MynNxOM/vUYsIutr+BfNIfRVHMO8LCXIb
	KlrY=
X-Google-Smtp-Source: AGHT+IHT32Hf/MYOywE36ysLjmDui4UJvtM4ki6Vx/FAHBjYi7ZiODV0zEq41zSBhakdgoSzzFV1Yg==
X-Received: by 2002:a05:6122:2020:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52b06857f56mr3248493e0c.2.1746452947700;
        Mon, 05 May 2025 06:49:07 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401eebfsm1592621e0c.18.2025.05.05.06.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:49:07 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4c3201d59ccso2849241137.1;
        Mon, 05 May 2025 06:49:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXPuOor8+nEM0R4/1fGIpqSnUToMjxSnOgBwfNUhWg1znsm6Og66ViTC0b1erefZJ3Hlp2s6SzErBV@vger.kernel.org
X-Received: by 2002:a05:6102:3e20:b0:4c1:8ebb:400e with SMTP id
 ada2fe7eead31-4db147d156fmr2873951137.8.1746452947340; Mon, 05 May 2025
 06:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com> <20250425100129.11942-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250425100129.11942-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 15:48:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTd+LQ75ScQLhDo+OBAWQKDouvkg7dE+wWmarTqhFHDg@mail.gmail.com>
X-Gm-Features: ATxdqUEpIRd97pZsdhm6ehJ02ZvbBPpb2AFAGkH-0nPQmtS4vudPsEe1wMU4NY4
Message-ID: <CAMuHMdWTd+LQ75ScQLhDo+OBAWQKDouvkg7dE+wWmarTqhFHDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032-rzn1d400-db: enable USB
 device port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 12:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Can be used via the microUSB connector CN9.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

