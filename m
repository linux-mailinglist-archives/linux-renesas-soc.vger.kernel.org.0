Return-Path: <linux-renesas-soc+bounces-25013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97BC7BAEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9B8A348FE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 20:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D78330ACED;
	Fri, 21 Nov 2025 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDJjMLA4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81824308F3A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758121; cv=none; b=qU5Sbw0oVpuLxnFXS8l+vPHR1TepxzfRSOqZwm98CNL7aTjW2iHy1bD8IdfdWidXP1i2YQuTh5fb8esZHETLmBXZJzi0ZYGJon7gAFrrWCOish6zESSERBJ3CVTDyRc0HZlOdIbPfBcB3jTGZoLMioCF2KrSuH7Wv6aygr6EGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758121; c=relaxed/simple;
	bh=+4fVew2+4u+WlL4vnVXwzj+uge05xava6pxne1RN0Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PofL6s8qpw8LTzg/GLiOKNpBVvDZng0ZEEd442wAShFUKQ+c3i05pB0Bq/pAofQ5mPBjvxWi8yAuG0729AEWWkXLYDEuWtE3bs5JfWhS8Nzj/YqHzUiilYMaFcxxqVXMY2eLSdBITmrml2MnQWtfZLjyfvZ7jEZy+CaYt69uPsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDJjMLA4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b2dd19681so293962f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 12:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763758118; x=1764362918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pGOCAupp/j1gbqj8RASAzeEB0W1VfiDIcyH9885Q3ps=;
        b=EDJjMLA40wVDM9W+pER36MbGMbdF8dWL/IxR5thS/fbBSc8sfVvnYAUeupvkEEk86j
         bsuNP2hDxyc/siYw74fJ8xeZl6kj9uEWtFHbowveg8SpMPvGgHocIGeneRqLBCD1wedn
         6NZIcKfiKY08awJmW1FRmITisO49Ta/TllEIgdpBQhgSOhbSPpgrAByO301lbbzSHAhN
         n1wX6McoGhcjw3xodRaS6Wi0rOhmupXqoHwKYBJjLSYYpkeVLv0xwFI01g3Q79I0I9B4
         akDigIO4ItwuY3O6phvpS/2NwSdz5wT4zl2GZjo2cCzZZHE+QkjvFXZ78HJKR/Y5cdVN
         jD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763758118; x=1764362918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGOCAupp/j1gbqj8RASAzeEB0W1VfiDIcyH9885Q3ps=;
        b=Kv/O6S+wplvGXxZEMcGe6x/eUA05uYxYOdDQqM18Jf/PjbUGQ8xt98qqrw6kiFF873
         tsP62NUqFSM1CZ29PExT8lRujnFqh9bR+ekPRQ3VCmQsqW6tp3CrRghHJwhLK89/DNdk
         kGmvoKuKE9MQ00FrGzGqCQiZaCCGo4xFPMtMtBodVo0EbPV7LPFito32VJSG3wSvanBL
         2K9Pa/hfsdPDGMmVuzubSnl4O2tkv3cvm+Ictfi1lhicEwSRRGAanjVhLr2SpDtvsZA/
         Xh+sZnqjOAqXUPdxrRwF00ooqsN/4fegRMavVTZe2Q7FKHNrv6obv+IDHYbp8PuBrt73
         k9cA==
X-Forwarded-Encrypted: i=1; AJvYcCWK70AafK2/OsQ/w3wuNhcAeyGyyCwqR0E/bH2/8KJRnuLxRctUINqkcH25w1PjgfZcUsARNhH5m7hLX53DREJE9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ezqxf2Ak0Q1lAb4hDHPHjcGPcyJq2oOd6+vFGztfUafPTwz1
	b1mIbpldejZ4LeJTKIzWFFKYZkpRICq/TPpDA//tCwyBKFB9RS5Ez+L3
X-Gm-Gg: ASbGncvMFvDoy2QxAiP1mEa6v2tLUqLfI2oGVbdVgbW1qyQbu09Jl4pRvZ+evgzbxCA
	hkRHYajVz/VJElL46xjuB8w512FZ4hQCL9xMUaebWKOKSK0ZgsM1+5HP4RGhSGdP9tpXc7fzmZG
	ZaPJGtUmfq14CaM+fca15f3801IoFM9f79oN3IsJ0u2sHa6ZCc7QG0R8Y1sxox8/ePpvGTlE9pw
	hTLkyHWKkuAy7IjM/wM9XqdWzlXoe2GQjv9Yrc0TH/i+Yquzq2cCmzAY6HI8Wc8fTYSTMPH58m4
	GuMr+oRb0Wy/4GTrlgdTvDopX6N2CnDnWdab5GUGfBOJlcVBEGrvhN+9yVYurm8b9OtR7Jl6+8U
	mwV4ZU509DfNnmCOmONiqWp5Z6uWcS9bKs6sEf+p1ptG07jK0XwRunaqmV2aDl7CTqqq0N7IddH
	SqJfk=
X-Google-Smtp-Source: AGHT+IEiC/MfRTvQT3tA1MrA+Mzzqzp5R6aAOe9/0it1znq1L7sttK4oGWLscrmdtQKkr6uwAxSe9g==
X-Received: by 2002:a05:600c:3b9c:b0:475:d7b8:8505 with SMTP id 5b1f17b1804b1-477c01f4ab6mr23231215e9.7.1763758117718;
        Fri, 21 Nov 2025 12:48:37 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf227ae2sm60962265e9.9.2025.11.21.12.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:48:37 -0800 (PST)
Date: Fri, 21 Nov 2025 22:48:33 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 02/11] net: dsa: tag_rzn1_a5psw: Add RZ/T2H
 ETHSW tag protocol and register ethsw tag driver
Message-ID: <20251121204833.hu4jfq6bx2kdamd3@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121192700.3eg5h2eqk7bruxeu@skbuf>
 <CA+V-a8vyjt43TPUmu+1TFHFvQsBwYTzKFSQOQm=O3R0dpZWG_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vyjt43TPUmu+1TFHFvQsBwYTzKFSQOQm=O3R0dpZWG_w@mail.gmail.com>

On Fri, Nov 21, 2025 at 08:29:04PM +0000, Lad, Prabhakar wrote:
> On Fri, Nov 21, 2025 at 7:27 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > On Fri, Nov 21, 2025 at 11:35:28AM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add an explicit tag protocol for the RZ/T2H ETHSW and register a separate
> > > ethsw tag driver so the existing A5PSW tag implementation can be reused
> > > for RZ/T2H without code duplication.
> > >
> > > The ETHSW IP on RZ/T2H shares substantial commonality with the A5PSW IP on
> > > RZ/N1, and the current tag driver does not touch the register fields that
> > > differ between the two blocks.
> >
> > Tagging protocol drivers are specifically written to not deal with
> > register fields. I would like a clarification that this is a phrasing
> > mistake and you mean the packet header fields that differ between the
> > ETHSW and the A5PSW tag format.
> >
> Unlike the other drivers, tagging drivers don't have compatible
> strings to match against. For the ETHSW IP, the current driver is
> reused as-is. My intention with the comment was simply to point out
> that, if an issue ever arises that requires us to split the paths, we
> can future-proof things by using DSA_TAG_PROTO_* identifiers.

The tagging protocol's name uniquely defines the layout of the DSA
header and general interaction procedure required on RX and TX (for more
complex things such as PTP). It doesn't have to be further namespaced by
its users just because. In other words, two switch drivers using the
same tagging protocol with the same name is fine (even if due to a lack
of imagination, the tagging protocol's name comes just from its first
user), and introducing a new name for it would be unnecessary. For
example, felix_vsc9959.c, a switch different from ocelot_ext.c, uses
DSA_TAG_PROTO_OCELOT because the protocol is identical.

The exception would be when there exist packet headers which have
different layouts - then irrespective of whether those fields are
currently used or not, we should register a new driver.  This is the
only thing that matters.  I thought that you were saying that such
differences exist, but after your second reply, it seems not?

