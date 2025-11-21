Return-Path: <linux-renesas-soc+bounces-25017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C2C7BB8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 22:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5953A7581
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA682F1FD0;
	Fri, 21 Nov 2025 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2KFO6Gb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D32836B5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759380; cv=none; b=tgp0GBDNzT4g/z0YlUtXXWO0QdAm40vESqY8crHc7VRg+29n458R5l8wIfp/kN3nVTlLcT4GtxN307b0iDjbDViUVU0QLo+6+j2YETLz2rePBz81Rj98qJdOiD4dsYWVSGUWh+6v0jir4SAuLkWOzeV6rn0hr0laJYXOx5LdAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759380; c=relaxed/simple;
	bh=pjRy1SEsLZJxI4LOty61Ye27Ei0/ipx3J1nq0iJzaHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql+uzFuyE0br5Zy1sTpcdnxtyXEOR3XUwai4T3+AJ5HbnQs57lAzeReGDzKr9IHFO3cfzrahiPzEc+Z7G7jFXS/ZFKCwi2cIA4Btw6lHrwTMTQq/ljUUTqOHFDq5X4/4EIvwM7DxJrFXhLyPcgJT8GImICKr8Vhp0vVP0D/N/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2KFO6Gb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c84bf326so196955f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763759377; x=1764364177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+St0oOO00YFrE/oeCGGrHEKEP9gDUq45OgfSWgKSac=;
        b=i2KFO6Gb7yw1w1MvIijYtVd5OFiZbgeKuoUZnNWteVRpTuAMixE4xzdzFaCNZt8EjX
         fl7rRtY+BddEdTq0ZC+LRkshZVJ0Ra85+1pSERORqV4qIitGHn6bfynbH5UMIDmQxXJh
         SASYMadhMjpAu7edxU2W5QvETYLiwxrrqLfjdhcfU370HHMtX0eOsS9G/uKT0MkMlkpd
         ishgKndlYCne7B9vR/113ViRmQzBgn75gy37vlGANJAm7axxzbLTSeocEtsC47Lqhtbd
         YYgdswem4TFp1k5W1VUBYn9SjUYI0WBALMjPQjXBsdE6Iv/EfbezX2+LlBIeljms8jke
         iaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763759377; x=1764364177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+St0oOO00YFrE/oeCGGrHEKEP9gDUq45OgfSWgKSac=;
        b=NhK45K8laOFJ1yA0nWsIREWA2OMP5xxaEizK2fjDd7NhnRcgRum7+97wp4i9znP2g4
         fiOzINOsQSRIWStR+5+jwEQUMW4Qty8SOFh20VoZd3o4dFvxaNsglG4Ov4ZRnLBPwb7p
         jlhdhWtmvp7RELQfe1xaPFREBCa41eBExK0z8+CNXHFnEddwS+6BGzcSa9Vz/Gqg/Qp8
         e08YaERxpaPWkXwDjgB69RrjG078uvb8Mz85m35sbjySpkKcuavc8gshIIoRiQtnmf+b
         +zQiw8ligQ9Gd5/H1pPYj1wwCisi8tfIC5rifTeuBAy7gsQ7Hzl+zibEZgpwF9EJ7oXl
         gxhw==
X-Forwarded-Encrypted: i=1; AJvYcCX2F1QfqbmCj/nEhMRHUNwYTB2c3vj1MiOuo6cLWRH3aiBpaAkqIRuOoPVGZBscI7QLEPf0ap5wRZ5aa3TGdPSMsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4L9lQVoUiBWNATP/vdpOJg0t565TcOt399zeOGm5fvijxYqrK
	CCmdXGVb++j09cA3nEwLmzYA+hAqB42Ei8XROaPPARpjTY3gCCWFIajI
X-Gm-Gg: ASbGncsVWJDbjlGDRTImCnLA9SvTmj9BiLQ+r23867GhkaCysW2pVz3BOhHsOCacUi9
	k+4X7JynucYl23TYpK5Sz5Rtzl9DOr3qlA+au80b06R0n2ze6Fwu0rOS1jy2b5e3t+KN0Hj+vBx
	PuuNEMX0651wxykBes943cIUQXdzlREI2lix0nChU4DQ69pI6flpvGb5LUow4S4sF5PRhdULBVg
	isAdmrsx71oi7gJwF2qa40KofdhKfVaru5GotlzG/ko+ul+ho3UfUcGmwNaW7rzl1IgFFsEThgK
	MwTEACeLIU1ubjrxIgb39vpYo4hvtCTVPuKe6dWKb1OEo2LdeD79TUjEyGgKaKvoX7HgF569/WA
	2du3YGyrIU4COd5A/5XmfP/wzCsTeozJqWhf8aOIVrojQZRSZhDx5eo7W056GPFAZEMPQcInfbE
	2ZvQw=
X-Google-Smtp-Source: AGHT+IFiaD4mpHrFN+tAaNq2FgvMpg4adybRd4aJ7oo2sEmIOOuFXgl3U576DxtLAMuPvA+rfainNg==
X-Received: by 2002:a05:600c:1c23:b0:477:5c70:e14e with SMTP id 5b1f17b1804b1-477c01d92cdmr25458805e9.5.1763759377158;
        Fri, 21 Nov 2025 13:09:37 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96aed1esm95730045e9.0.2025.11.21.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:09:36 -0800 (PST)
Date: Fri, 21 Nov 2025 23:09:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
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
Subject: Re: [PATCH net-next 11/11] net: dsa: Kconfig: Enable support for
 RZ/T2H and RZ/N2H SoCs
Message-ID: <20251121210932.hcte74sz6efa4vym@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121113553.2955854-12-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 21, 2025 at 11:35:37AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
> driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
> the driver to be built for other Renesas SoCs that integrate a similar
> Ethernet switch IP, such as RZ/T2H and RZ/N2H.
> 
> Also update the help text and prompt to reflect support for the ETHSW
> variant used on these SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

