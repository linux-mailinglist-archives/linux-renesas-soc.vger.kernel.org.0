Return-Path: <linux-renesas-soc+bounces-11756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D53ED9FF3FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 13:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7422188266E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0451E0E0B;
	Wed,  1 Jan 2025 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIwlXm8+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1F1E1C01;
	Wed,  1 Jan 2025 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735733676; cv=none; b=scSRywJmT6Ct6zn/cXKCneOnqcqLnEFWb8aisAG1etrJkmZfgUJw1plmaj62k74MeiugjMy4emeQR42DA04JgrUldtdd6aOq+Yo6dInSfJ58/TVVzo5JaO9Syq8vTepjEozbyHdwoYOVcfk92aWEmvbNOBdD9zwqCWtSYps8leQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735733676; c=relaxed/simple;
	bh=FFLqZ1GPTpGGIrHpFwB3JtV+52VcZyi0MHj1bqWGuX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBHnEiTxZzosNtOvM+Im2Xzoj/8xgTs/jXbD5SCedCj9AO/hn34KcPR9tSV4z52EW/p7pDYK3XXjWQaNQDdye6Yk7+E9CAPc/2XSf94Xm/5LnfpOu+g/LfIvdqTjvUEfZcETWt06BJHoGZiZtnXDB3ms9TNTYmDIIPsUmUngNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIwlXm8+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361c705434so77197595e9.3;
        Wed, 01 Jan 2025 04:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735733672; x=1736338472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NckL+WNrluzGcUG/VFfOwqvmRvEaEEtyaw7AvBaHHi0=;
        b=TIwlXm8+RWJWbrSZFv12VL/ZF9VNuQeg/BosZKQa46KSn/Y/3wB30kNJJsMJJmOdKb
         UqOeTBZEq8O8zBiua/EgN68XgaFuE9/5rj7fyH+wTjK2/d3+uKO/1VvrMhZgqK/xokE3
         OMOZTAMzPHnzXtvEHGdbqNDLKyioDO9eQ0DBS6EzWLBzbfhtgYFGCvmMI/IrxlT3cr6K
         XwSeFL2ae15jFl3yz7WTxL/hq0MV5NRK4wXaG0+kobgpQcPM2evjAUKOzAoxX6wVJELP
         dCj77Q5bfjq2NEtEGdUWtqR4H61tpjgeZWK0focnEN1CVaBTwsgtBkRmC2YgJQ9iioxO
         QN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735733672; x=1736338472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NckL+WNrluzGcUG/VFfOwqvmRvEaEEtyaw7AvBaHHi0=;
        b=hXCr3QKtRHNfHN8VpPS08axAW3mvKqzABKZuASZzNgKQkF+A2J3e/5A7f5hFJhMs9V
         jo/TxbhN1VmPRBP6FaSNWoWXMehPWC5nRA/U4LqJS5hmxAiSI7h1UE9GdhYu+mtqXZQ0
         ZlIu2ffyzrer6uWmH6+M+2V6JAstwekuWE0qq4k1NPUIhKDsmAT9a9wmyCM18rBExpd1
         3Yk8GNiT8pwbpiu8L1tRs+fkVPGU/qBCzzfDJkIWQiCojzXBxvS+hvQBNMJ8RsR08a9A
         +8/f4fQWFMEvvB/unQg4wtzb/akQ5IHVcHU3kEOyZYkY4HJ4lxCwvKavao34xEzJBS2e
         b4CA==
X-Forwarded-Encrypted: i=1; AJvYcCVGAJ7edwTj3LFnEZo1IH3Zm8NdrZ4dyTmWSOxhUJosQa/0s5qP21JK1sRjsEZ1a5eSp0ozqEqnfsw9GnKXHH5pc5U=@vger.kernel.org, AJvYcCXXvPn4ofKH2SJ2AMRIT5dfc34+PgcAA11dthDEWSV7Nv1VHEBNyWyQk2I9+Ui0c2w529fiCXKED1FcSLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06F3U46woVhETYi9+BUdxmEyewnU+fcPQs7a9GAs/nqwteZ3i
	29OPr12TW5G1z6sTvRL/xsoKCK8dkwbSA6AHyhcNqY4nRAj6/rIWfZt8RQ==
X-Gm-Gg: ASbGncuEiTA2x6rAJxyG4qmTgsz7kzdBrjKG9FN0kF9Gsw+2Gp99yVMZuZhHl0rKf3P
	OBkbBz2xZLc+aLL5XVo1MjsKzidZABhgJd2vH5rZgz7tmx0Zmc2vi/Y8VszMgRq10VK2NOY7jaB
	KItkg55B97pogPOMtMIO7rLWkgtn2qgmBapgADnK4HYtCyHCoFS0YbVWfnje5SOudNH+SG8Yj2r
	sARoFK8KGPXgomMczYWmx15a1hyhEp7hO/kw0XD65cGRYYR+vQnjwdzilLtePFB8JF7vvEeKZrI
	eONSmD0MDBOaeqyLfzol2sE=
X-Google-Smtp-Source: AGHT+IGfWjMYz1WvX4+BwJc8WyMd+k+9TXT4DGwNpNyApIAmqLHN1gK2fLzkAPC94lgoHZDfFuVLCg==
X-Received: by 2002:a05:600c:1ca7:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-43668b5e201mr327201715e9.26.1735733672407;
        Wed, 01 Jan 2025 04:14:32 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6ab1sm36187403f8f.87.2025.01.01.04.14.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 04:14:31 -0800 (PST)
Date: Wed, 1 Jan 2025 12:14:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250101121431.05d831c7@dsl-u17-10>
In-Reply-To: <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 29 Dec 2024 11:12:32 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * rebased to 6.13-rc4
> 
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

NAK - that isn't the same code at all.

	David

>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  


