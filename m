Return-Path: <linux-renesas-soc+bounces-22381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DA4BA03B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 17:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1281C25032
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 15:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756A2288C26;
	Thu, 25 Sep 2025 15:16:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A551D61A3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813406; cv=none; b=lvA/PDcPD2IoT7Uq9fBjSWlrRkmOzVW9mkOPxWxzr7TwklMjUuhDP85hZ4IrIOqgabmpcndyZEvxu/3jfi8ioWUVcPr415KhIPxyxYhqYNFJKaroROTUEuXug9rvlU16gAEAjg7f/r/VITwk69sPMBrS/axVCVAZ6iTEyiJyeTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813406; c=relaxed/simple;
	bh=m4v2PJnZTWFcPM4vwV03B+DdPrjczoMLEbCJNH11ExA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqOY0/tzLgYVI7ZWHwvt9EV4lMo1iIMIOt7+GdE+/GqC3kk71Ha1TB3KaPVKm8iQspwOtXqt1oVJTvat/wVEmEUfL2pRph1S/d6tRMlMUoYnsXc0OStAOinEVCcSoF1nkeaU1Q2lGQFeuNKu9z6rYIRTP0w4aiCwGatD9ij4pRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5a392946c4aso669643137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 08:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813403; x=1759418203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95UeH5Wrdj2nWFDACiTCmJA7K9iWHeQl32Wj8GxRyR4=;
        b=Y+Dqsok48iQc0Wxgrmzmz3G3S+scmEhKTdq+2f5d7oLt5Ww4AuMsscOTKoE1nNgJv5
         DtQwlCI727THiLqQKC8B6URb3q27GPhH0CechFEfLMx4EFKUmhhERlpjJMxocoUAy7Rs
         5Udf571TbgSgfLsAK0MuoBBgeGgdJvrZRaSvF6Qg+ayI5m1iaRRKPaRB/fOThcyV4SYR
         ryUcjfPsDGdkWnR+OvgAgU2Jz9h60uPf8EjHRJicY3Hc1OFJqOONZSYt7WhlGYKu/uf7
         lwYms8Mkm+zNAhSJ4w68oewkeDyxYPYxcOkfVVIqj1qhdOoLiBSaYcxmGvZC2CcenRxk
         n7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW36FY4A2TTrt0Xjj60TInQOCvX8ueEDumQtARNJyKAuvXV9do6vQA49mLqshh1/pZqMHFahTOS0Xac/Tro3/kTTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIbZOAxEywNlLVSZw1v+4gSaReSErUWeM9GVWSnOv/vQ3+HYe
	WxVJiNj3nCfvSw43zU1KZT+UZu+tDFYe5RSwml3e4Ba/ywyKM6epxOKwWbdWts2t
X-Gm-Gg: ASbGnctMrsX2EterofyfBZDObDePnSKnB3v/uwCaMLr2e+FqSC3rz64lTKeYbPyDHwb
	yQH3xkaDmcw5bLKmD/rBJcPic+Uw8KoqmMUXZtnjYVQ8GmT/vYlEnDl2y4A23NcP0hzXe8no8qG
	dOo2qKYYigBY47j4PtPH1Hbt9ZQ0V5Jz/0cOomatmrhcbx4UY6r2Ls3kTo/2R8mm6rCZ8xi2vuj
	0rMCN4DnV4KIwrYVPo/RGdljPkeV17CMh6KF1sktUyG5sgp4SxxN+dpBO3d9QvzwvOrCsCTNita
	G/iI9xb9WjzVhRh8kisT8opIoWEw4m2b9y+RDJMQkCe0T3QGhuiYtPdeGMHSmVwCNAuS27G/hnG
	Cfz5OwJbpmGqHTl0xLfJ5cJqPYnLENkn5rVN+z+IaMs23ywXink7r/Z7RtOBB
X-Google-Smtp-Source: AGHT+IEIXyQJOoY/OE+YtiNj//t+HI2fwjlvPOxn138+i6EabOQnrYoDSYHidJX3ygtjg+o4R7KcPw==
X-Received: by 2002:a05:6102:94f:b0:525:9f17:9e63 with SMTP id ada2fe7eead31-5accf6d82e1mr1802530137.29.1758813403261;
        Thu, 25 Sep 2025 08:16:43 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae31827c81sm608991137.5.2025.09.25.08.16.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:16:42 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a392946c4aso669617137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 08:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmibI4IyHMfVfCc1DKov+ClijszLNc+hOO0kGEzhvT8kGDn8uJdvU2SQO4W1GI66R80bLGfE/g/VbIIWEsOKBmEw==@vger.kernel.org
X-Received: by 2002:a05:6102:d90:b0:59c:5e29:dd8f with SMTP id
 ada2fe7eead31-5acce75ae4fmr1755148137.26.1758813393977; Thu, 25 Sep 2025
 08:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org> <aNVbEvSRCpQSXT4W@shikoro>
In-Reply-To: <aNVbEvSRCpQSXT4W@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 17:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9N-Q4uJXMKg095LD-mFvZv_yU_5jppZM6TZ3xh08zpw@mail.gmail.com>
X-Gm-Features: AS18NWDEqoQdloQzIjh0wjgWDVcokcQ2jeIfuog0D3JY4DANF_f6TtXyGtHRpVI
Message-ID: <CAMuHMdV9N-Q4uJXMKg095LD-mFvZv_yU_5jppZM6TZ3xh08zpw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 25 Sept 2025 at 17:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Sun, Sep 07, 2025 at 06:10:53PM +0200, Marek Vasut wrote:
> > Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> > Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> > been tested.
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> As the dependencies are in, can we have this patch in -next now, pretty
> please? :)

Only after v6.18-rc1...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

