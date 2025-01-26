Return-Path: <linux-renesas-soc+bounces-12524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8DA1CD5C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 18:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4365E1884545
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 17:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF9941A8F;
	Sun, 26 Jan 2025 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Sq5XsV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977729476
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jan 2025 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737913581; cv=none; b=qbzTzj6TDdQSa8i7jHlmb4VY4NydQkNv+aSfQaqYk5wafr1RCjkMn7mBE8G4y5y3MC7sKXzCZneKrklm8hmGzWPVuqZFbv8ULIfDrEXE4iDPwt8HUY8XJqpsZ5sJzWGQ3VKDyjpNadNyPqKeLS5vOio21ASd+Xi7VAN7Fdy092U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737913581; c=relaxed/simple;
	bh=eMskTE926nzkvBOPe+0xNWGDURHDb3Ipk7aKj4KUnjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRNzjDfWZO8H0484654RYiSYxEOZvjttQqBoYElIecO6mjqM/rbW0rvr9tDu5kaLl1F7J/nLl+whCr80VVWrlJfXWU+PCbTzRyCU8k87FHsOUf9RrzUfdc/o8PRLDyRWJb8HHVLK+5Hy1NRrviIx60LQUo+yZ68Xc32ws5Fh7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Sq5XsV; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e398484b60bso5504496276.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jan 2025 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737913578; x=1738518378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwP6AmZtHOBgTFWNHWplhL+BYlJ0uLnqNJ1QKPcccSI=;
        b=d1Sq5XsVKj631NSRGmFw9rQSPwlzvNm6g2wcHzgj1HsRPrwt6S2lThCQaq792hsJbG
         hfJfvT80fyXO4ULbdI7F/Unc26gBCDPaqx/ffd80RIPYJtLXnoHy5TBxQ84GOgCERJMF
         /PXtDyIfEmuzmfNWnCRvKBAmqhYX1XvhY87BFy6lvdr5A50H9NFJ+p6u6li6m9tlinm/
         TRChCPAuS9VV5SvxA5NigkvwNC8f/jGp+0Z7jbTpfQmXgY2BHpfEi48p12A9xVBbIjIy
         FM1i1xCj2A9tDXD0+2WgiqTCGf/CawgBKBlrLXlcNtHbHy0Zt1hp+rzNJUL0yub0HSHb
         c8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737913578; x=1738518378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwP6AmZtHOBgTFWNHWplhL+BYlJ0uLnqNJ1QKPcccSI=;
        b=vLK72mIHvcN2jcZCq8+E1RRlPXA31FZuqMefer7a6Jf3cTlIPz+dbkPNiVg5HXKxNA
         K+NDdSrtmUCZnXETaOggmExt8Cn4Cwf5+qPOLU0j59ZYxejMtjPXYuWiYru9zkPJIaku
         /ClylWwIM5GLgIWt/gwGL09LgEn/WpGenshdSb6PrGvLRCRic+SuYOJMYsWMo6zvnGrM
         V0yAY6gZdColnPoaA+FALzBUofrMSjtSDht3yXP9d7g4XMZoqZtPpkNilBYSHp4HIAGI
         8RwY96/TuCVJ6uq9COL+jNBiLYCTSQXTCeko+DffKxR4TjdnEOr30C3rDD1n0fWRFQEr
         keeA==
X-Forwarded-Encrypted: i=1; AJvYcCX+A+SdkjuHteuSYmbEMgpsJ13QN4tyKa3aLwDD0sOnCup6AyNdACL98KmA7WyxE8D6UAD1hF8CZxqAa3tYViZ4gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DvLqjLcYlxkBYwQdIYkwu3W3HUnMNENX+RRImotcZxK5tQBp
	H/IqfSS6gT6mzEsAkxV/fiPS4Mkm5AeEMK5H87sQClwvcr4nvVen
X-Gm-Gg: ASbGncv8GD2xgrTC2slzQ1acnybNxelxCYPd8Tp+9Kx4IXh4nZ5z1//fSOhRHNkt517
	SwGjAgwUjJ/sX/0FbVbxrUjAkUIrt6t4c1g5Z/T77L7QTMu9wL5mzfJmdw45zdI5Nzv5Zf9weic
	d6J1nN6fD8LspwuGb0NFhkPp/3MBDx08X5HS6OH47cSyMKZX3mAeuwUSf8pygTtR91B/ADihmFt
	TilPsqSr1UBpRZKfnQgIcR2LWL45MJZcORTLUUK3y4SVXEhw8kDC22GoemwLESYFuZrV9ixZMo5
	yA5ph5l5+Kt+qbYqIwABn1OtitX/IrmqkyjSA3RS44okrsxJUAw=
X-Google-Smtp-Source: AGHT+IGO1xwVW2l1LTQ+o+lYbUxQvekVO4YA1p5kU65hCGKORVU3e+VmeRoBj3dBeymOr5vl4GWC3Q==
X-Received: by 2002:a05:690c:2008:b0:6f7:534b:560a with SMTP id 00721157ae682-6f7534b56aamr70501867b3.8.1737913578433;
        Sun, 26 Jan 2025 09:46:18 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f757a372fbsm11330997b3.117.2025.01.26.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 09:46:17 -0800 (PST)
Date: Sun, 26 Jan 2025 12:46:17 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5Z06WowFspmXby9@thinkpad>
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>

On Sat, Jan 25, 2025 at 04:10:36PM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> CC Linus (the funloop one ;-)
> 
> On Sat, Jan 25, 2025 at 2:03 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > During review, a concern was raised that the link explaining the
> > algorithm might get stale. Meanwhile, the site has been archived in the
> > WayBack machine. So, use their link which is hopefully more stable.
> >
> > Fixes: c320592f3f2a ("bitops: add generic parity calculation for u8")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks for your patch!
> 
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -254,7 +254,7 @@ static inline int parity8(u8 val)
> >  {
> >         /*
> >          * One explanation of this algorithm:
> > -        * https://funloop.org/codex/problem/parity/README.html
> > +        * http://web.archive.org/web/20250105093316/https://funloop.org/codex/problem/parity/README.html
> 
> Is the plan to replace all weblinks by webarchive links as a precaution?
> Even websites backed by big companies may disappear[1]...
> Putting the webarchive link here also impacts the funloop.org server
> statistics, downplaying its relevance, and possibly even causing an
> earlier shutdown.
> The URL can always be updated when the original site disappears.
> 
> >          */
> >         val ^= val >> 4;
> >         return (0x6996 >> (val & 0xf)) & 1;
> 
> [1] The "LessWatts.org" T-shirt I got from Intel survived the
>     corresponding website by many years ;-)

That was actually my concern. I used to think that kernel repository
should better be a self-contained thing. And the reason is that kernel
sources should be understandable even on an Atlantic flight.

But this days airliners have pretty good internet access. So I don't
want to look like a guy pushing 80-chars line limit, while we forgot
even the meaning of VGA acronym maybe 15 years ago.

Quick grepping says that the include/linux directory already has 235
'http' links. Even after excluding compiler linkage, we have 149 of them.

So...

If you guys feel that you can explain the algorithm you're employing
in a half-VGA-screen comment, it would be the best choice, and that's
enough.

If it's impossible or you think that external reference is really needed,
I trust you. But please refer the original source. In this case, it's:

        Warren, H. S. (2013). Hacker’s Delight (2nd ed), page 97.

If you think that pointing to a web-page with nice summary to the topic 
is helpful - please do. And if you would like to cache the link - I've
got nothing against it - as soon as you commit to maintain those links
up-to-date in the kernel sources.

Thanks,
Yury

