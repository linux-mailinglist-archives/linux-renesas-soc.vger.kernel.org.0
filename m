Return-Path: <linux-renesas-soc+bounces-12957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13374A2CA6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 18:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F06B188D029
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 17:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BB318FC92;
	Fri,  7 Feb 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4gCRQH3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34FC2A1D8;
	Fri,  7 Feb 2025 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950074; cv=none; b=oAR6T1SUqtkiinT+u0ExznjE4eYYD6SwuOoPhYDx6YCgp1lSmJ2g558NGemwQNNTyJz/iCX2s4ThMKcJ+lZIeHPUibcsSclonIikpuVf2sEutLYngjxtJLgkYmFp9JlhIvt309txgPZkxnp1YdXJzgUJ6Yq9wF6Cqs6vkLRqoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950074; c=relaxed/simple;
	bh=Xn77w4aBJFwCCNr0XS/c5Muj74MH6oiUnI01m0Esciw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmrGiB0PG5GzK6g6Jmkcdq/VNYAAh8Ps4QCSh1szcYpdZbuiDocbRFUnO8PLwVCW7AaQgPu/sPL9ae7kfvyLUPZdjNxxKSwOv6ZfAKL8b/GudjXrIGUd1t10SyDQep+YIiXg1YY+n1GoVbBOs3v4kzKZpOdbYfEnHK1jPoDuv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4gCRQH3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc0c5546aso98535f8f.1;
        Fri, 07 Feb 2025 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738950071; x=1739554871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q+ZnVbE1eVzMq3qC0UwrUCaQ9zd7oSIY7glJtsdthI=;
        b=C4gCRQH3xPqK93PIZrxELdHrWiZyjjOYAPrLkpx9Udy6VwRGuqq/pBqNh1ZMFS35ET
         0aVZrjXCQPkwkgG0Ve0puX8iqlwNNCmNeTkb7rL7bDoejYMp35kimvELIfzxtRT+1f8u
         JibUMZ2me7kqUvvNQuynBtIuPPCRsBc4uRJaCHhN3URcK4Mu3I8evVfGeBldwdhUVmiO
         p83olfVfYj6EarkgEg+GjDwz/51CZiHSnX7m9jSgGwT+gPHZBlcL4OjqTXG9Q6mwL6hp
         eGlC9/0kmzLMe4eY1R0AWFXJuZYZ2VZAyrs6VAuyTHNG0AO6ALo+aqP737nnhlbFcqXi
         VJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950071; x=1739554871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q+ZnVbE1eVzMq3qC0UwrUCaQ9zd7oSIY7glJtsdthI=;
        b=FyK5eDgWbk1+We/mZTY82qNMHH8fEEQdQlK7lr+BcBnHNDEtcHM+F6CD2WxfwSXeAr
         bmTbq/5lcs4rJcjGU7DvbfcFKkS6gUxEfTW1GI5H3DrixV+gzeJnR84B2VbYJTl53lwE
         ZTqOkX8zo/+klmEbLLkq/HMlDvjse7gWtMtmN4M8XjR2Xfr6bhCLvMVsmF1MybujHrqa
         a81Ue+NMXFE2yBYgwSF6Ny+cELyWlcSrjwnODFKumBS+Kt3l1Byw17air20LNJp6F6wc
         S9mz0Ghr4P9BMUxl8e5FfOZgASCS6in/EOb7FYJKC3bkgVKGYn88hSJJWoLLfneyN4B8
         3RhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxc1IizfzoAO40Ki7RkLpj0XY3i5H6SzSyo4ZH6+XPdTGxN5VuJET3ybOpeNvnKsiBj1Aop4jX19OqHT4EwYDZMg==@vger.kernel.org, AJvYcCWA7YHqP784JQuOovLxlBXsfpUMq9jJ3e1TGlEfPF+oGuQovHTvu7jMymtrOH/ztEF8QOORHLag@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJLKUZLh2pYsfvot6TF2DGbfFLz7vDsy/fZzX+qgfZmzE6URk
	xr1KdsrTdxk/TP5oxxcieJKbzjXGTvX43Ww6NL5p92EiZz1FPrGu
X-Gm-Gg: ASbGncvMNr4uVupy7hV3grtiXRNzWsDhVxYpiKGFcYrT9k/UyhbYFV+Uo3fFv0FtByo
	KhK5jz/Amd9oh3N/3J1uS4pc5wJou6Kxn6k7uSM+lBq2zIr7i77oY4s8DwUKs5wkCMx5itaUTfo
	j412x54tlqUpZ8wtLn2Cu+hxPTggSCJyFgZX9OXP0au6QIIdy0X2SegSjJJIOgeYNCTWKCD4p2+
	7UEX1cyOIIZa7ywd54CL5UD/FWALydLCRg3Ngz8vmFpU/4TuTlFnm3V3zdUW8jYupdYRCwm8p7e
	3Xc=
X-Google-Smtp-Source: AGHT+IHfq8cUnsf6uHYsmTvPy/WN3vJAhSzfibriEFaELW5QRffpx/a3TNT0WeqH7o2cjxvtCM0rjg==
X-Received: by 2002:a5d:6d84:0:b0:38d:b505:2cbd with SMTP id ffacd0b85a97d-38dc8dd589bmr1285167f8f.7.1738950071255;
        Fri, 07 Feb 2025 09:41:11 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd5c87csm5175102f8f.52.2025.02.07.09.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:41:10 -0800 (PST)
Date: Fri, 7 Feb 2025 19:41:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next v2 2/7] net: dsa: rzn1_a5psw: Use
 of_get_available_child_by_name()
Message-ID: <20250207174108.rg3km3byekqtw6p5@skbuf>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-3-biju.das.jz@bp.renesas.com>

On Wed, Feb 05, 2025 at 12:42:22PM +0000, Biju Das wrote:
> Simplify a5psw_probe() by using of_get_available_child_by_name().
> 
> While at it, move of_node_put(mdio) inside the if block to avoid code
> duplication.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

