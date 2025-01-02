Return-Path: <linux-renesas-soc+bounces-11783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84C9FFED9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65D81883793
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B850013E03A;
	Thu,  2 Jan 2025 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN/CFfrB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B2E4431;
	Thu,  2 Jan 2025 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843875; cv=none; b=B/gm6Cn+KH55xdWHEctHkVnsqQdMXEr+0+EEdQ9zDIVUtwLY7hWIsu0aAev0xc+iVXAJuqOZzR7qKIIv9SO3sWF+niRUWxpNLKbMRRwdncgcy7MQA4/ulxP87DHcIvRK1SmGmyKvaddwJe+7zpnFo2wkW4aYQfBpDX1ONbnlOhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843875; c=relaxed/simple;
	bh=IP/jEQsuczhvkU5z7VbnI0n4hPSBWLFzkxH+B7EQUq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhGMuaK/7OW+amOKNv6Kjw095V1L75g32VlZES+z9eriAOk+DSoDXYDMRDs1LRxKrFii7wJD/dyXgH2oLoY/YlJdV51TX2PT8HE8hye4Ceo2NmOWoLBozOz1PnkDnV1RX6v4moo0O4ozCkwciQwg8RYXVKetBgpVKBmkhiy97qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TN/CFfrB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso9006026f8f.0;
        Thu, 02 Jan 2025 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843871; x=1736448671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57a1MiEtbo8S4K088lbZisrAhLcKykomSGmLmki4Hs8=;
        b=TN/CFfrB2FJpHelYmK7x32VsLOK3HeMZ9YmNvjZ5kf7g6+G7Po/cc+/lqG1FU+7Zwg
         vG6MGWlYN41jaK5mMXIldzJmx1BPWXoBDVGFgf6mKbdGLumf3v3IOV91MZdyjmGCGZfR
         BFUEFE8OD4pyKtupyGpeHdX2ldT6ely1gYHa0Fi2OcGX0awShzkA7sHadXJqvIAqPaRL
         XgfY/SlRssWqj19rynaQyKoNUkmM/nvUd/cbwjkDUvGL/UDJx5VJFXEb/9HpNbO0KCf4
         44DdaG98CFjnJkpmrweDNbiEzdOM7Kcos43CVkNZxshtzF/olazkNKMq3ulNn3Fji31y
         evXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843871; x=1736448671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57a1MiEtbo8S4K088lbZisrAhLcKykomSGmLmki4Hs8=;
        b=jdyTP8owmnwT38WSXfkHuTzhPUU0nZBGEaZO81lwHbTyAKm5CpRHYG+XLKPYuN1xeO
         qOlwswx/ixBdVBQm0r+vOCTRDTThBegJpQz+bNTFnoqCaEutUOD3JVwfNXNXBVcGyiue
         wr1ZpKbhkeOxkW7JQ6oo5AIi4acFlVqym39R5uReXnvGb7Ez4vIMcv7RgBo1i84RBZ7+
         B+zTXlCb+oFS4cHcgvxzmsLyPOMitTWHGyjctkt9y150rtP0xcIQCM1CQXLneeLjF0Kc
         csByHCt8G4KB5GO+Yc3oNjTDJ9Ca3sy+Sp8Y0jaszWRjBVnpXhTHTGUfiiVKJ3Ljxgze
         8r7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/TH1Wqe6mrwLAIE9JjDSVdwiolYMZwacA7k197VcSIA1PSKSTWobqYhlh+p96OSIVmV1XTsnpdnFGmR93VU1k7sI=@vger.kernel.org, AJvYcCXda3kJC3QzFnRulK3NKhFOnT/v+o+USkM09OdBRynWxarajLDkg42kY2UJHo1PjnyHvVisxl5pB+Rj/Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz138oQIbeVnv6Xbo3l3gdnTA7Tf5n7rHmp2Gcvj8z9fshEVest
	RXXTEB3ur/yueUnLkFAu5deg4OdF3rhjPSVllawLPIWZFvoF4ZjiBzKD1A==
X-Gm-Gg: ASbGncvY3BZixhsV2ZEfsvghmT7ug5/XEEcNig8VHhavFeAVbHdlSCkvBK7Pg5jQwUm
	KEhp9ejQ+FC9INkaEn21kFIbOP0GYmRoF8To00AleC/IrqNdLuzNGs4n4UmjbCPIEaKz2BvuSxN
	95XmV7vJhECc6KRnoCpwYgDUev+77wZhFydpn5hQE4LdDXwUK3GGG5LG6/oYgjOL+EXASyOAoJy
	4blIjv1TBaVxdR6qXFv/9oc7hjs1JpZOdeoz6A+6eP+6AFbsIAfL0wBZNJ9iW9LLqEedpZwoEzY
	ou9p8JjpbylsXxLgs33eajs=
X-Google-Smtp-Source: AGHT+IE2RkxHp877sm0DcGHXQgRYmP0kbp9aKFcV/65MDXSCqdsC+6SWJDQ8gzU2tDrAYedaFvqTUQ==
X-Received: by 2002:a5d:47c8:0:b0:386:33e3:853c with SMTP id ffacd0b85a97d-38a221e2394mr38117867f8f.12.1735843871215;
        Thu, 02 Jan 2025 10:51:11 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm38266690f8f.97.2025.01.02.10.51.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 10:51:10 -0800 (PST)
Date: Thu, 2 Jan 2025 18:51:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250102185109.0862cae6@dsl-u17-10>
In-Reply-To: <Z3ZV_D5AIUxFR1Bw@shikoro>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
	<20250101121431.05d831c7@dsl-u17-10>
	<Z3ZV_D5AIUxFR1Bw@shikoro>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jan 2025 10:01:48 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > > @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
> > >  	dat_w0 = dat_w0_read(dat_idx);
> > >  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
> > >  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);  
> > 
> > NAK - that isn't the same code at all.  
> 
> But the same algorithm? Please elaborate where you think the new code
> will fail compared to the old one. And frankly, are you aware of
> different parity calculations? Have you read the link which was in the
> kdocs of my new function?
> 

The old code is:
> -static inline bool dynaddr_parity(unsigned int addr)
> -{
> -	addr |= 1 << 7;
> -	addr += addr >> 4;
> -	addr += addr >> 2;
> -	addr += addr >> 1;
> -	return (addr & 1);
> -}

So:
1) it always sets 0x80.
2) it uses addition not exclusive or.

So just not the same definition of 'parity'.

	David

