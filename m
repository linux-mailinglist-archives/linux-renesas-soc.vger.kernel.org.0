Return-Path: <linux-renesas-soc+bounces-17373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 563EFAC0BE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F110E7B18D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4239428A723;
	Thu, 22 May 2025 12:47:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F528A1F9;
	Thu, 22 May 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918049; cv=none; b=i6dnqlGTbAjnMwQtUZps3Fd2+cq8kASl8RT8N6j+1VOsE2JhWc92NBnWKQT6e7ZJnPcjdf4eosFXa09b+O7HcCZOlo4EBs+AxCjo6YLoa0vKpJQQpv66GQSZLIQ2nfvNPcfho1Cp9kSO2Di2Lcnpk5UOfzEiUY5jk59Y2F/TBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918049; c=relaxed/simple;
	bh=6BUeQ5mCJAhSRlEXKrghg3BzYEhgi6Dwe9Dt8tBK/yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrJIqHv33AEKJQW/k36A5D1kUH92WIk6AtgUC46z4wHvhSvK0Rxt1CHOU3oG0x5yPyXlfinYGkFODkpygd2lr3UZmDjIbwcTIl4zu6dipgxB6uXvgV5tjXQQNHzyrun4pH5rK1UbUTX4HtjHxIBPcEfYg325KgwDYPVmQoOUsac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1925516e0c.3;
        Thu, 22 May 2025 05:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918045; x=1748522845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VzHCluz4YCqUF9LSpBPQ5FQtl5D1f91oDJ1PYnk5mQ=;
        b=vdRYADq9gZoj94786qcylC/ijM3ecVNTHvy7Uj7q1RU0S/hkpA2XWc5O8RHUZ2xrQY
         9+gudhohn5ydDfX1SN1rMM+MD3qeVQ4kdreqAcbbljFn7x9jIvpJAjoPHIiaxDQvuICn
         AtmmsPRVVHlxLj0I76WoHkbvvmo2tOqwW2BkvGT+BI0C6k1ljQ8RrcRNNUHlVl9bytGC
         npONBovUelzMM8dVzVlL+GPd9I3AdcFpb2DDW6UPQS15sncPAE9blAV/wbQiZBd5yYkK
         Wbt1q+a1YBraF83/7cdHy8xtbab+M+Qe+RFPTZus+OxfL6Pp/YFChslohqmSHV2eYScd
         ciJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKOmh4fo3z0BWG+xOa6qGNrGdXtj7sQyi7PWwJgS4suegZcThdviVdXMM30UOVQbQ+5li9Z+/CZYn+M6VrdqOCJOk=@vger.kernel.org, AJvYcCVefv4JUrJGIjU11FgIq0pTMgWl3M4p4oSeVTTYoAXyydHGrg+UBVCpfCIeMiFS02W5RYufXkJ23phne0R+@vger.kernel.org, AJvYcCXiMO79r/XpaFU985TUaAjmv2m5zm4/e3kYgQCiu3517rZqdcHNBgnHM79OAyMq39b/RUDV1joGnLO2@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtEyzYBRWWzCzugWmIMNrtYKPbaHm4ijAyaOSkrjzbsG8AWqo
	KTHxaUk5XpamWfZYKgJDV3HK7SsLNzcAjDiSETytXas/+ZCnxiCYLVCEkdUYOenN
X-Gm-Gg: ASbGncvo49TSsYGuytfwbySKem2QGNY6uYbP8lrSjUynhaQDPnQW8YphD0PUzJQDKjw
	h9US92NcvYaRKcfTQAxyeMZ2dJYeLfSb6vPa8RmKaQ8Um6XWD4ZX5acNT5tHIbOkIUzS4oxkM53
	x6LPOlqYXL01saUTeKNEwtGeCsSvYt7lmVm2MvgcvgKOeIEqqVvJR4ZdGB9sJfoVcUPeJ3Yvrua
	dg1vk4KZ2ry1FC4UNmdoRR6leUIBIRHSsVTsm98+90yU2AqPKOoPvTz0ckAeHVb68MUeTpgmked
	yjYETpFVi8/P9MSK4QSVm7YnQ50NSj9AtQU7mZCC524qijcbG6br56qPY2rzF02OS91XgDAOjnf
	00HptWUrM/YePiG1J/Q==
X-Google-Smtp-Source: AGHT+IEqYYOTWJDZVgkEhhzHJKvKWBTfUO4AvYf17YSFgXZWkQAo3OdJTFza8ro/X4OK+CnO09lmzw==
X-Received: by 2002:a05:6122:792:b0:529:2644:9118 with SMTP id 71dfb90a1353d-52dbcde8621mr21413570e0c.9.1747918045627;
        Thu, 22 May 2025 05:47:25 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba967788sm11715267e0c.22.2025.05.22.05.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:47:25 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52dc131419cso1791002e0c.2;
        Thu, 22 May 2025 05:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDEr+meKFVWAu4TttQTdPEbttSmrxIA+ky3mVT+GyXDiGrRl+sG5iqanGqKLGW3yZR1rIv0EU2aN+P@vger.kernel.org, AJvYcCUph1I/eFN8zjEY8obZwLJw9vbEfo/ZoG6TjJposF0eKqfuz+PjbVfoHcVHBLIYcOkLd/XSVcjoQ1QQA3dD@vger.kernel.org, AJvYcCXG5MTY5VkPv0a51IRKAQY+AyGmrTRQ5g/7TxP+6sqbSJawjRh25H0U/eZfdJE/4fIwee1itsDH6clIwCstZ5vkKKg=@vger.kernel.org
X-Received: by 2002:a05:6122:3220:b0:528:f40f:347f with SMTP id
 71dfb90a1353d-52dbcc3a658mr22232453e0c.2.1747918045095; Thu, 22 May 2025
 05:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com> <20250514162422.910114-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250514162422.910114-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 14:47:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2oSNG41X5OeLG5XAYQFcgqsbqay+twDtumnC8MuqTdg@mail.gmail.com>
X-Gm-Features: AX0GCFt3jKZvQ5bc4ZwM9rx9avFQnva2lW_S5JXbaCou6ZJ0P6eZVbW0lVtwxW4
Message-ID: <CAMuHMdX2oSNG41X5OeLG5XAYQFcgqsbqay+twDtumnC8MuqTdg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 18:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable device I2C0 node for the RZ SMARC Carrier-II Board and set clock
> frequency to 400kHz.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

