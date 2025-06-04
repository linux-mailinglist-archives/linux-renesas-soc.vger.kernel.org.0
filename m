Return-Path: <linux-renesas-soc+bounces-17855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBFBACE3AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 19:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF6F41895137
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6D51F4C94;
	Wed,  4 Jun 2025 17:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzhMZbfn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6749181AC8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058277; cv=none; b=C9h52s6SQ0XVu2U6+x9CbHRBcRzsM6P7FDyyn5Ugs1vE3GfHFvB3FaT0P6rZlZ5ychnTcsMr/aH5nlDzMHFhdYkFXkVf41U1NS1STHLKSb5zy65kj9X5kv8mpZvizdVrV1Xfq0bO1nwZQyGa1/+PYtAme37OidCYXJmIXExWqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058277; c=relaxed/simple;
	bh=q3sM5ckkqu3S1pmAwhJML99ONUvr7j4/sHrWjEGrst4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO4s+9IutuE6cmpS4O9z1gA1GePye9M48RoL47Qh32KEyjkUVPbfNqqEU7/mY0ONuqk8RB4OJoQ3S0eo3H3tRMBauisC7LuqXLG7RghgR8dQDBAbusMKdHhtVHpSA1zmxy93i16GrljGgBfzg9X6V3Q0kb4GTuch4P9QiI4CXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzhMZbfn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e1d4cba0so927365ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jun 2025 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058273; x=1749663073; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=JzhMZbfnuYM+p039M/njIQ0ic2qUG/QZfO9DZZS7yP0TmyXg7knaNKGmUC11M4ZWMM
         iMb7psbuW29PNZR2Ekai5Y4wLJ3qCjI2dDD/i5IR5PknNt3uW7wRk4cu/GXz/Uxbm01k
         qK8QW0dKDejMbE1/FUNJmTDcEInqhO0unPHfkjvILPAwL2ktLpvxhQekeRSulqKWAzaO
         1dyKiQk1ah5ULVN6LhGsQdFpX+Gn0arGYCCSfaevyO4W1NFUARfD3GR+1mgoVNFRLOeO
         7sQWg6dJjTGI54eFoo1aZSp5zGMa93ZgA0eDnGTcl+Us/FZo0evtpcGY+oRQLVllNXD6
         M1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058273; x=1749663073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=SwvA2QSdKtQYC/H0J/QNmE733ri1jLK6UQvEZ4a5Uc5wuKAriIrwp4LcPG/eM+io++
         pbEK3zC7e+1TG+Vti5dc8klj+8CiGjGKcFQI4py2iTzo45ywYeeIsmoYpr8KmzZxERwa
         VQlLK5Ax6cZErx1dhdpoAARnXaxhUMCgopl8fUVR1U21wnAkOybme0hDs0tnxHgDJmZm
         lf0EtziszeTytp7aoM6S8r2qyIHPSTxSdnIyXstGEhRgcR8TrmnGZcekS4r4w2GkLSLX
         UXexxgheDbHqKq5SKpuflf9T/udC8W9NKmAC4eo4vFEuXZlRbHPU7o0xOdJyCNY3dJXe
         v9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0xcg43Gk7BvWghZaE6V8rgofgYYdMdzlInEsYZYqf8Rw220B7cpkoIOFVtfX/Co61O0lwu48qwE3pkTo+isl+bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY33QESgqoJEeiV3uqWMJ3y8MWpWv6E5yixvxSAaeq7MTtnW+d
	dPUfJScIoWgBilkxss3VkwRr7gpHTR+leO3T2JOXkIBMipWON20KYMgJo+uthze0Gg==
X-Gm-Gg: ASbGnct7RHWsLrYtyfNOGritqCJcJD8FlMKdKhnHXtasBLT650Ns7rYBDyDE0WkW5G9
	/tu2ZkuZIJfLt+7I5mMq9vmUDssnEeJ5ej+gS4xKkCruy8OYMuoi64TT+AUp0z665esqyyt0jjE
	S2t3VZrS748Dq3IDRrkrPP81bUTSEhX/MknT+HRi/dHyEcgXNt3Br9i1V0iJL1YVI6nEEFDYwej
	6ocSdEcZ9vL73bwaNUHw3I2ecUPumWn0lqcz0dblnWhJQ/AG9Y1ZwdnbrBZZK0ZcEqWH1v3TVbg
	du6KtwaLTuZMG2R3AuEmYdLjdR3OQi3S/R15ICaZX+3JZsCafuXuoTMTz7Z8ag==
X-Google-Smtp-Source: AGHT+IGIJbSx2qDc2q2Gt3qbCZCgqmWW4FPwxtFTdbgDTBwo3IdO7XqHuYRl/uF5BzOmzUrf40UoSQ==
X-Received: by 2002:a17:903:1c9:b0:235:6e7:8df2 with SMTP id d9443c01a7336-235e11fcb67mr57141715ad.41.1749058273586;
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf50c9sm106668185ad.162.2025.06.04.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:01:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split
 PCIe clock on V4H Sparrow Hawk
Message-ID: <egtsvxsfc5c2s4hrwucsqk3s5dv7xsi6ghrnf6jd3mvf3zvskb@z7hvehbd33t5>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>

On Wed, Jun 04, 2025 at 11:24:17AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> > bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> > Describe this split bus configuration in the board DT. The topology looks
> > as follows:
> >
> >  ____________                    _____________
> > | R-Car PCIe |                  | PCIe device |
> > |            |                  |             |
> > |    PCIe RX<|==================|>PCIe TX     |
> > |    PCIe TX<|==================|>PCIe RX     |
> > |            |                  |             |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> > '------------'      ||  ||      '-------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> > V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I understand this has a hard dependency on [PATCH v2 1/3] (and on
> enabling CONFIG_PCI_PWRCTRL_SLOT), so I cannot apply this before that
> patch is upstream?
> 

TBH, this patch is describing the binding properly. So even though the driver
change is necessary to make the device functional, I don't see it as a hard
dependency. But since people care about functionality, if both driver and DTS
changes go into the same release, it should be fine IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

