Return-Path: <linux-renesas-soc+bounces-11879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96496A02622
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 14:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8634D16267E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5281DB943;
	Mon,  6 Jan 2025 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz/MO/Xa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD927726;
	Mon,  6 Jan 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736168819; cv=none; b=BF7vNbigxVY6cAtVJFpc3bxBeoXC3iLho3Y+Hz/rOeeOZSV19P/cm4NN9jnRzVtAcq54PNPHgZ72Z7Xv+7mJLA8fj6MOB+NYsVlTKIeWLrMrxhnLVdacuqJF/uktRGvBWJGsl0oVj9Z+EbyNsABpGq61KkEnx6fX517219C0/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736168819; c=relaxed/simple;
	bh=yBLmW85YUYBgQ9rCwSEKkNmrlGlSTP1JCx34FevlKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVz/drIdN/1hpNZwe0oPKXLmXPxqdvj8cZ4aqBnLnxk93N9qJpuG6nedhakZO96IVpZm8MAJu/RFoT29fgM/Cu+AKWgXq67osEKxe8fc7njiNZY7g3bKBaja2mTBQaMyQcpE629IjUoUqWgf71HzHAO4+5c+SG+1OSaInUj+jrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz/MO/Xa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385df53e559so11292669f8f.3;
        Mon, 06 Jan 2025 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736168815; x=1736773615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR/GknLwYbI9cGNF1TEcNc1etyW/R6QVg5TDhkMuTLI=;
        b=hz/MO/XaPNi8xxdGXGZ4VDVm478HacuiApkOiqUT5Mpevm+7Vdgv4NCncX9zSKpqPT
         YlYQp84yPreT5s8YBGMT7y+yZ5gFXK3jrvRE4AvmrSu8tGY24PGyZiGtkQ/UKrRQYVji
         xJACaHouCJjEfTRUL2/NcvDluY6CGfbMOg/QTA/gaBtp61T7LNqpIMcHloGQyh+F3YKV
         4HX3OoM1L5Cpqt9cHHBak+++wqTsLFkVdDejv1WB3JABm7+1RfL2CWQyasmexojvFEfQ
         0x9YN4PVme1i3/G6Kjk8dm5tsyDMc2q6iO6Y16e4dFGJ47TNztfT0wITcday7HJCo2rB
         4jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736168815; x=1736773615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR/GknLwYbI9cGNF1TEcNc1etyW/R6QVg5TDhkMuTLI=;
        b=nkZ+pe42AVfB3GRR5ebwTqgFnPwQRKN7eN8EG/PqkRJ43hrYRgL4lSb8O22prZ9bIE
         kHQPRs79KEOQsS2UbM8ghfqwHTBvN2c0sAey1LF5Qn0taLmbcVrcor1S6Ca12F4tJxqt
         lNprHPUrTn4O9sccggfUOGgk67Bd8oj46YuzXSl8eOO21Ol20xky8XYIWllwdCO8tvq5
         TFYrMgJd61DWfsS9DSnr546DLzA1/RH8Nd+YPeOp7avvgzyF/2gdSdrQl+pTGZjVd9bF
         mJk1l/G6rq4O+1ioHS86/2txipRtRPDRQc6bs/seLKnlnjR5WX7wj1k9lzeB9HvVtXRq
         sNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUsz4rA3RfmJDWl2HboVMcn1PNcGExM9fYzekEmjer+7L7OOzY5J86xy7H4c80rCrHQ6gfq7948vJQ24lQ=@vger.kernel.org, AJvYcCUtaQ1vkL0cc0xbwDl/YEKPd6qM4AXT5mUJTBMYrq1KhdQT3x/MgyaKxYI/5D1fW9hze1y5SGkEjh9B7+fRs92afjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYIcCkYbJPVpc2Nq4Evt0uSOT5P+MxbMCy39TkxCLyQrTmcWxZ
	Veitye6j4wlmj58SD2hu3gjfnpBF4jbO3eOVuWxbarsR/t07CBY9Am8Lxw==
X-Gm-Gg: ASbGncvnOuw/j6QGACGdXAhSaYv3GabTs1LYas4SVsio4qUyxD19x0lUqfp9dVmvRCe
	WrPM3bVH8ci+hcpMi/KSuJL+FEVbLf7CRLE2mjt+AuVW0ncLNlovTou7rAayZeueK56lqcf11PR
	qspEuoqhG5Vlx4EEZAPgE1VrkS02UXDVvbRlvesYYs3axqIRE490IyGTwiWDyXL+u7U1CGB9W1l
	NlT+UdKslAKrhZhLhfdufSCIG4WZt/MSiGEd7Iw7nSN5reShOlfwYTe/NfHW+v+be7SLNIon0Q4
	XyZJYrMrPvOAoAETO/w=
X-Google-Smtp-Source: AGHT+IH/LvJCLKxDG2Sz9qhe2NwCXYjjo9fR+gIgkFrd+/H+QCEE1YOZ7L3UGT/7nOlnnoqWiOeQkQ==
X-Received: by 2002:a05:6000:4816:b0:386:37af:dd9a with SMTP id ffacd0b85a97d-38a22201ac8mr53721304f8f.35.1736168815300;
        Mon, 06 Jan 2025 05:06:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4367086e40esm534085855e9.30.2025.01.06.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:06:54 -0800 (PST)
Date: Mon, 6 Jan 2025 13:06:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
Message-ID: <20250106130653.7fe81eae@pumpkin>
In-Reply-To: <20250106092725.22869-5-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
	<20250106092725.22869-5-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Jan 2025 10:27:22 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.

This need to explain that although the algorithm has changed the existing
code is wrong.

	David
 
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 47b9b4d4ed3f..85c4916972e4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -40,15 +40,6 @@
>  #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
>  #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
>  
> -static inline bool dynaddr_parity(unsigned int addr)
> -{
> -	addr |= 1 << 7;
> -	addr += addr >> 4;
> -	addr += addr >> 2;
> -	addr += addr >> 1;
> -	return (addr & 1);
> -}
> -
>  static int hci_dat_v1_init(struct i3c_hci *hci)
>  {
>  	unsigned int dat_idx;
> @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
>  	dat_w0 = dat_w0_read(dat_idx);
>  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
>  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  


