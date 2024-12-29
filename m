Return-Path: <linux-renesas-soc+bounces-11744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8639FDEB3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 12:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F4016175D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926BE13AA35;
	Sun, 29 Dec 2024 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPvpxudF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB04D8A3;
	Sun, 29 Dec 2024 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470694; cv=none; b=efkjAm28YzZ9zqVPKRLfTQBx1ZXJRyNw3YwMz/DMRfKilFHOjAn6BoRaInNzCU7QrYfZw2sP0KcENehg1HT3WR9eS10OnyYAU4ZTHCqvSMqRHGK3thNcf/g68yqTQnpGqZxgXB/Af8GjQnBfqq5S6hFOgecw05Dubg5bJGTCitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470694; c=relaxed/simple;
	bh=N/MF9JcrwqueFfTaIfeLDDDxACJ8PRRwhoEuCxZysWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unCtdt21vf/EhAVI0unYRT1WlMWt9VWINTsxranLW2dB7vL60bNg8MhdVS+Io3uODTwF5arOdmcidrWcAKpvm4gRAQOq38KNaWSN6ZVyAFsnlGWyVWFDgvDKyxLToEJAuwh+SEG78kIuvLwZ6yoVprc8G5WSgMfOORG+YG7Yw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPvpxudF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43621d27adeso58051275e9.2;
        Sun, 29 Dec 2024 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470691; x=1736075491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alRavL5tqUSRZ2Yj2nXOybmnSzuCB0kWS+p4Y3N4Ayw=;
        b=aPvpxudFDX9GcSz4+2/ef0hT1CX6vBwJnhqB0RlaZjvqZSxKUMiikGzBTC5ulkm2Fl
         cGnMQzKGfCsjFINSL/5tmEDnVp5H7jsBH9rIHLFRRvqRMiObYmg0RQ1ASi4iEZ6qLEfp
         3h+nBd+OJTpKKRiBzvT56tnX3Nb3CWJvFr221pO6kLVvFGHjCwa+sL5Pvu8PoUu/WNVt
         Y0ey+oQ/vbP0JwfJdRsBTiFEPTrLU3c2QfaLKGt41sUvQFwIoPBA/Cg9EtSg1AeNra28
         lr0qGwTE10vbA/H6pPtzwd2NXQzBoxFCbDOWit8i2Ula3wSOC0fF+Isymanzp2hZLnKP
         ehYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470691; x=1736075491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alRavL5tqUSRZ2Yj2nXOybmnSzuCB0kWS+p4Y3N4Ayw=;
        b=QedPxzn1FBe2DY5JeBAvlHlFeQkdtem/3pdufe6GLez0TrWCA15uPHJ7scXumzzBTb
         4J/3xvlxNKh36sDvEDrdae53pKGRBATbomeTyt9Rnai2pMyqqZmaY99xGMzK2UklrVBe
         oH4EcMVw4SYX2SIPA4hXkEkCLwVPFGEmPS/7UlkkG95qsdiungLM00wUMc4d1O6mR1XG
         6uXrs4grQL58HfqenSh0a7Gie6aFbjW0a9UAj3Udl6QGj+FyejP9rPWv1DK/A8mr6ncW
         4Lmd4ug5+bEBuJvq4qfCxOXnoVaPO0M9gE9LBTH4t3kzBnYQY3aAq6XN1V0NHFOVOfRm
         hxlw==
X-Forwarded-Encrypted: i=1; AJvYcCVFjm8Yr8LXMtI3zESHkKfuyKNhNiA9K5OzU7XPGsnzNSgA2AotsFrsgbZgMiOawYYro+Yw87KGir1JZVCmGDguGEM=@vger.kernel.org, AJvYcCW0Xau98cWpQcl7LJ131EclEFUhuSP/plajyuKAzpbAU3PPeAa42VW4lWjri83LDJkxUikrXJuA/7NbkI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGR5spMv7TWRDRzCvzZcnDWegi4GQ5xv9NL/p3qUKERKCQaCCn
	CgbWSqKCdokmPgU3KvuIS9Kl3b+lmX0Cb4y45mKOn3M+XkFNjMtu
X-Gm-Gg: ASbGncsxchu9zhwneRGqC3G0Nx//tdAJaFC8zwpyus2USxG/qMM9JfkgpejqTmzBoMT
	flBJtwl64TN7HcC2ac/jKitOUeWZXUNAhDkDCAsF7vt/JF1tKYSlLyCaCaCAphmBMiNYKyUaD5I
	XtkFrSTvIAnk5+vc+n5mz26M6THel3CH6aBzL5wW+1Crfvg4hd8han45f25/a14xZAn6oVL7efg
	hyyhn+CJLzfYmMGWuHHwXroLxvJQAUg+pW+XYg+oQ4AN0F5sH8YRJtXo2YhO0Y8504KzVeMHpcn
	rAMx4/Zg/T9DUhgh3K6nfX8=
X-Google-Smtp-Source: AGHT+IEvhILNv+8E7cgm3HzPQ0J+dOVEEE4NtAmI7c7pIxR76OSySUaVBboe+cEy3lDBmcbs3nVwjg==
X-Received: by 2002:a05:600c:3110:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-43668b499e0mr235319465e9.25.1735470690932;
        Sun, 29 Dec 2024 03:11:30 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm323551715e9.43.2024.12.29.03.11.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 03:11:30 -0800 (PST)
Date: Sun, 29 Dec 2024 11:11:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Guenter Roeck <linux@roeck-us.net>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Yury Norov <yury.norov@gmail.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH RFT v2 1/5] bitops: add generic parity calculation for
 u8
Message-ID: <20241229111129.2602d219@dsl-u17-10>
In-Reply-To: <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-2-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 29 Dec 2024 11:12:29 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
> 
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Yury Norov <yury.norov@gmail.com>
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
> * rebased to 6.13-rc4
> 
>  include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index ba35bbf07798..c1cb53cf2f0f 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
>  	return (int)fls_long(--l);
>  }
>  
> +/**
> + * parity8 - get the parity of an u8 value
> + * @value: the value to be examined
> + *
> + * Determine the parity of the u8 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity

I think I'd return 0x80 for even and 0 for odd.
That just need the 'magic constant' changing and masking with 0x80.
Also rename to parity8_even() - since it returns non-zero for even parity.

> + *
> + * Note: This function informs you about the current parity. Example to bail
> + * out when parity is odd:
> + *
> + *	if (parity8(val) == 1)
> + *		return -EBADMSG;
> + *
> + * If you need to calculate a parity bit, you need to draw the conclusion from
> + * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> + *
> + *	if (parity8(val) == 0)
> + *		val ^= BIT(7);

That then becomes:
	val ^= parity8_even(val);
which is what a lot of the code seems to want to do.
With your definition you could do:
	val ^= (parity8(val) << 7) ^ 0x80;

(and I'm sorry, but IMHO 0x80 is better than BIT(7))

	David

> + */
> +static inline int parity8(u8 val)
> +{
> +	/*
> +	 * One explanation of this algorithm:
> +	 * https://funloop.org/codex/problem/parity/README.html
> +	 */
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word


