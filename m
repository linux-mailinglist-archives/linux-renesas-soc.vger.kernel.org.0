Return-Path: <linux-renesas-soc+bounces-11805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE4A00A08
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 14:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEE8F7A1D7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F41F9EDF;
	Fri,  3 Jan 2025 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3CsB2dx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3735D1CD208;
	Fri,  3 Jan 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735912181; cv=none; b=EnoezuYBtPYY1QDO/pVgv31WOJCS6RWWT48v9DVLu43ijlyQFxWmYTwaDVVag6OD1PLByjwKdxX1xd8MbVbHqZXj5D7DCqUMvSwNIdWdzgk1bFkC7m5RoPRxhsx2jeXEHVlz8C4aefwMowhfGeJHi1Q5pYLBcOl+HoNjEVL2yxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735912181; c=relaxed/simple;
	bh=bo1NwnVb4FmdyvAIRrI42DT9ndX7T3GYn2xjvNRac7w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsRw+3VZZKv3JPYej2vL4cSbDkbrotgFpCyXsmkU4dzmbAzsFkDx8K4ioCQJ0rHxHoA96iUHJTjA4CsSi7CqtLChQbYGd9sYXLftpg0mONrnSM77G97cotj7K6rd8Q1OtKIrVjqYup1VKj7jaZESAD+VMgoSL0j0Ia4rtwLSm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3CsB2dx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43635796b48so74502015e9.0;
        Fri, 03 Jan 2025 05:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735912177; x=1736516977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWlo2tx3RQuY5NiWKrciw+TDEi2b8UAJjPattwWp+t4=;
        b=X3CsB2dxlxYppmtcRinJ8I7aHbasTX2DZiOb15I7QhPYcqmgtnzTppgTyjIrH5R1uL
         IBhhwsKAPl0+n1jAgerWxYw3juwsj4wzuUHA/ruPSxZY2vKO4KBw/2EtgR87RWiFC+75
         Hj4vi0Vl1vD7A0chcOPbNxODkrK/BK+04cMGsUKZdFgG4e4DRKwY7k6vXdA2QgBySMFG
         d4hv+ZuyYmflz+iYrx+P65lwlGpF6m7F/Fzlf/LN9uRjdq+Fr2SxiFBajeTtugCwXCyv
         xVcoFmZq2CeaBYbs9QXr453fVcW3A3lUAAUiON7OR3JQrTXa1AqU78+1X1xURUpUdMgA
         Aw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735912177; x=1736516977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWlo2tx3RQuY5NiWKrciw+TDEi2b8UAJjPattwWp+t4=;
        b=dB7EHwYJUrSKXwQEsMWWJLscJfeWNjwgMPxBKJVpAooi9S2V6RMO91SKLGomzZMzx7
         gemTHCLRoX7+L7iayYIuEZOL96SATQ07iCoByUYlWd0H9CDwDiKIrh0eBYAdPDJG/zEV
         +Tgg9sBOja3K1O0kle6kuZ79CWiPt/nSWFDdRb1bPZfPRAqQlh1tJA7XbAHq07cqpaKt
         0Hvf9St4uYULoZYJdCw3vfWjBv8ws6rU4tc9IaWhkjslJHFM1og23iOfpOMRlHhxQeoH
         9cVMqEkqELxX80chM6n6za355iWwjVL6UhqpiytYBKRfniY1ePIv7conWeE5s4ITAaGd
         pJsg==
X-Forwarded-Encrypted: i=1; AJvYcCV5rGZK1j50+Yo8f88Iikou8ZxCi61cwiR9+6TsNEpMHF9KGCOX8LKmwYZH+KNguKua6bQlwp6EhQxSSGM=@vger.kernel.org, AJvYcCXsQ4qOCHof5u4ILO2f3bHc8PnL2CMxGL7qD0UM37s+0dJLzl3qyN5Lmr8FW75OeyRMpRPUXbVfAcVW/G4HlAaWndw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT94K+IzCa4HrMWbZY+O6AP/dg/pZrpqUPWx3pgsIrf7mCGRm7
	8HRCB+5BRWwi1kzcGKHA+apzultuRTbZx1cs+39Tp3D/z97+J6W8
X-Gm-Gg: ASbGncvo41jI3Zk/2cR2+6h1I7yznBIy1JsX0VfTrHpjPTephGngFNPXQz1DIBanlKd
	yw+CXSBbEJ5Qq1qwzG/cDIVAUcUHjxqkxkVL216fUQyi0dsDDY3E5BCuLqIXDz+BtjwBUCnMuZT
	5KdlMbKzbWsECYillx//NgES0jo7OZ9+UbTRV5sMlwLqP4M1Ac2X4CA3PigQvOcVO+/MexgQi7y
	Vbh27w1hY0Uak0TbOVdt8AVK5syO5RSzMpesi799qvZNgNPs7fDAMxZuT+3sZE+DR91GCRumkoA
	Cx8ki/RKlmrZtciOf2I=
X-Google-Smtp-Source: AGHT+IGQoPUjVc425O0ZTEfBoKZJu+kwBbdbuw98rAoUNrTeffve2qyhaYQgtHvhqh/LwU5H41Ctaw==
X-Received: by 2002:a05:600c:1d12:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-436699ffa31mr429281475e9.7.1735912177281;
        Fri, 03 Jan 2025 05:49:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm40220961f8f.92.2025.01.03.05.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 05:49:36 -0800 (PST)
Date: Fri, 3 Jan 2025 13:49:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250103134935.2a341ce0@pumpkin>
In-Reply-To: <Z3e1tuAR5GsEhYLz@shikoro>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
	<20250101121431.05d831c7@dsl-u17-10>
	<Z3ZV_D5AIUxFR1Bw@shikoro>
	<20250102185109.0862cae6@dsl-u17-10>
	<Z3e1tuAR5GsEhYLz@shikoro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 3 Jan 2025 11:02:30 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > > > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);    
> 
> ...
> 
> > The old code is:  
> > > -static inline bool dynaddr_parity(unsigned int addr)
> > > -{
> > > -	addr |= 1 << 7;
> > > -	addr += addr >> 4;
> > > -	addr += addr >> 2;
> > > -	addr += addr >> 1;
> > > -	return (addr & 1);
> > > -}  
> > 
> > So:
> > 1) it always sets 0x80.  
> 
> Right, this is why the arguments of the ternary operator above are
> exchanged. The old function was basically 'is_odd'.

Provided the high bit isn't already set - which it may not be.

> > 2) it uses addition not exclusive or.  
> 
> True, but it will work nonetheless because we are only interested in bit
> 0 of the result. For one bit, XOR and addition are interchangable. The
> overflow to other bits is not important.

add: 00010001 => xxxx0010 => xx10 => x1
xor: 00010001 => xxxx0000 => 00xx => x0

> 
> > So just not the same definition of 'parity'.  
> 
> I think it is. I mean, I3C wants odd parity, otherwise it will not work.
> And Jarkko kindly confirmed it still works.

I bet the target isn't checking...

So you might be fixing a bug.

	David



