Return-Path: <linux-renesas-soc+bounces-21943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D979B59BF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057941884D61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8726C30C624;
	Tue, 16 Sep 2025 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZsVVx8N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686231B124
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758036149; cv=none; b=mbqR23ZKp7YDXNSAef8cSdD4ZOZV1IwvnRk7UUxDmf5kSaU3/KmYg/XNV7GuppJR2hzWCTMGIADRTc2OqbVM8yNeR6waki0Vnd6DIZum3gVbnRZRIf/nArz3+1ImXV0Gli3/8SByLJ+RaY5AOFZS/rTlQQOHQ2d6klEWtVhNKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758036149; c=relaxed/simple;
	bh=/nF0wezrX8HC8RMqyG0TPBedh2UdBlIuZpHXidTvNEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMDHxnV8aJ7zHmEJOTI3Jlt++jv5vTbFab1n4xq3qV2ztGwhN94lTR8SDcTjHvTySGzFhRtNaDj5aGHm+5gBfJn6IREJBhK9z1hKZKx00BjI4FOeU8FuENTtY4zA3b7u1pgMX9SX0tEuvoE2Fc+TeYi5d/5HB1aCH0xOy/mYYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZsVVx8N; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d5fe46572so59973547b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758036146; x=1758640946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+hqoJDq2BiqHsGbYM9yfS1OJ2MwVQ9DaOjGAY9kFSg=;
        b=gZsVVx8NIrUct+1P6pQhxMVaRXhq/3yWrNvjWQ0xXKaNhXHjpqgS39vl2mgx1G123E
         K1v3dx5tDlvJol7U6WOM/YxPb+kdY/MMCSxfTBRSPnmg01wrOIkaWpkCuYFmo5y4ZGVz
         9mK6SKtr9peQgfIYRmpjZZUu3oOsoooe7n6uHYnhdXi7+9j99HecqYiLxv22LxOdPHqR
         AC8KaY/x+X+sz0ASvrhs/dtCO/G4blZprszP6vcI5s1Hj8eOcKyXAHC46FSv602Hpj0P
         VNf1oaLBFJd0Sju2yQ3lFdD6jC5u2n+5aurL4oVYs48MO1TH489Q6Gpy4cjOxCwNuUep
         hLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758036146; x=1758640946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+hqoJDq2BiqHsGbYM9yfS1OJ2MwVQ9DaOjGAY9kFSg=;
        b=ndudC+oHwyvBIqQgcuWwlNBGJdMMsCcv6QWsZ1tLlBz+367tTHMGcZnEkPG5OOMJOv
         ePV+fi2rS2zyaJNUbI+5pqxegE50f2i+jBlJFrnhky1jI6MHoFEYus8yH/cutuBj/n7W
         9qgo/ITnUzVf9TqtnYh+sHHXLo0oYgYjENaFgBpt5z3duKWZHNRVU9PP+GPqNap5Z+bF
         Oc3X47piiXS1FwcvChyiE8D1ZYwgSTVwM4eUwLG6kTD40KCuHZLrK/4eoRgJlkRAhfPL
         59s20hR2Vp/Ty38QT7PzjOEGoylBUgwFlbPVkK5uyy4R3hWMWYMvC1vsCAlnBYuRMvf1
         fR/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJUi6QDsPqHszwqPXsJ3PXFYPHpx4NjZrVuUj9Pt4YdzXzrk5ciE2hgNq9c3XGE8q6eouXceEp0rGEtocIMnKwbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTG28zCCHheSq1A4+Qp8jJcDCJjVlsITe5TMetngYm9+iK3W/
	f8hsRluttva2p0JjruunLNG5FvoxHuCf678R35lRBmB6vHbLD2buf3yB
X-Gm-Gg: ASbGncvjcxxg+1S79R4Qk8iTcIm5AjAO9ATqXGSgagCxcXTAWOKpA7Gw1WjjIo3PL2o
	7lexa7s11XdIs1kHvndDXCCgdK7vvKhVybkGx8bFBws9FOmkyB4tf7xhlp5KCa7L9tcfh1VamGB
	zdxfvvkCiVPsYZkg+Ztlw1NN53SJIAZ2oJ8u0PmZNbhKBxZDJCyp+m4AMgxrcPrviw4g/NcIrBf
	9n6gZWAE5OfofsOIJJ/ZgOB+pjgi4EBQVBRd8PjKHp2Nb3AubHxIqkxyaN8BG9s4fXT94eJsapX
	ofqTueZ1NtMGkfe3fWwEF7i1LmrcTKw7uOJOQcjJ4R4ADDyV3vGCFXkj30bSJmqnbAZK+WiwQWj
	gdnuqym5z3ICHLcyyksDcM9XA8DFMp08WleQHTtJ06g4DdVcpsjQOi0Kc0Q==
X-Google-Smtp-Source: AGHT+IGEQKbP+B42Bg/27Wc17/GObfW61wqyEbvLsQiwRRh94WgAv42a8XeuGZEAMbaGhW4UkoCMiw==
X-Received: by 2002:a05:690c:7203:b0:735:7d28:8ab6 with SMTP id 00721157ae682-73721985290mr23298597b3.27.1758036145766;
        Tue, 16 Sep 2025 08:22:25 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76238392sm41603507b3.1.2025.09.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:22:23 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:22:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:
Message-ID: <aMmArVuPadJhn4c-@yury>
References: <20250915195231.403865-1-yury.norov@gmail.com>
 <20250916144813.GG224143@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916144813.GG224143@horms.kernel.org>

On Tue, Sep 16, 2025 at 03:48:13PM +0100, Simon Horman wrote:
> On Mon, Sep 15, 2025 at 03:52:31PM -0400, Yury Norov (NVIDIA) wrote:
> > Subject: [PATCH net-next v2] net: renesas: rswitch: simplify rswitch_stop()
> > 
> > rswitch_stop() opencodes for_each_set_bit().
> > 
> > CC: Simon Horman <horms@kernel.org>
> > Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> > v1: https://lore.kernel.org/all/20250913181345.204344-1-yury.norov@gmail.com/
> > v2: Rebase on top of net-next/main
> > 
> >  drivers/net/ethernet/renesas/rswitch_main.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Hi Yury,
> 
> I see this marked as Changes Requested in Patchwork.
> But no response on the netdev ML. So I'll provide one.
> 
> Unfortunately it seems that the posting is slightly mangled,

Yeah, bad luck.

> there was no Subject in the header (or an empty one), and what
> was supposed to be the Subject ended up at the top of the body.
> 
> I'm wondering if you could repost with that addressed,
> being sure to observe the 24h delay between postings.

Sure, will do shortly.

