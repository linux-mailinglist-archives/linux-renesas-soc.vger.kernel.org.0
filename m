Return-Path: <linux-renesas-soc+bounces-25008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A0C7B906
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 20:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 515154E07E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB730214C;
	Fri, 21 Nov 2025 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPnUvd+g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C282E22BA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753991; cv=none; b=FByBADz2cJc5PYEE8cu+cSMX0NPbpxP+Us2zWba/gL50j+bqWua3sj7sSzh555nMBbRxKnl4cGaNHYosHKzAl7b0w6PQdJwso8Jik+/7otiOQfWDYU9Emn2HVPmi/Eaw1DEZh+TDBmYP8CMYHa/zYaUejtAj91P5gVSUWYCF6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753991; c=relaxed/simple;
	bh=/ORdsN9to51TeOs1BjW1wgj0a85OPhpdeTHQwv/1q2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0LYzAkj08ncwNw+LWj9iZ5RsvFGaSdZ/2N2Y3rblMUwUMBJmhwrhKwJmhbWfiyz4OpdzerPf2Zh5KkhL4Iz3dqHJ4Kg12j157wSl+7G5rZOC+EM+APJh052Nf8mvQLDzIV6+n72/iyPIJaX8vyJk9qJFzwRwo/+1lHes0sGJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPnUvd+g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477782a42a8so934465e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763753987; x=1764358787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGqbZP8+hvf7xeF3jbLslaQnJSoADTEWG1GIF5MUBRo=;
        b=MPnUvd+gTqEHKRS5dVAbX3j6bnHM7VXaeHq+8QzaGG8uWtQaKaF5o/qiQo8NjI59Q1
         3+wzKNW12jOdEUYDY55duhTp4GCT3F+bO4JpE4fIDt16JU/Z1wpsBlJWwIXSADHUzRYD
         HQls7BQC8ebXgEy+xq8Bcxnt8HKrV5TL1lgPSiSDIBSoqmc1OA+u4hJhlGV3diUvZ9JM
         kZq6RqVuQo1UyDtNYS3dai/j4Bpq0UyJZ3MhXlE3sIsQO5nHPYEcukhnHVakiTqbKiww
         wzxQl5yQkZa83S8MFkts5uYB0+hm2FxyyAXs8BwbEMGdnVPlmFH3VVq9sNymBY29xII1
         2vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753987; x=1764358787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGqbZP8+hvf7xeF3jbLslaQnJSoADTEWG1GIF5MUBRo=;
        b=AsDavgo7HYUkBtqcXR0rUUinZLLqaxyELzpVreXw438ByFPlHgkCe0ABGI5TjIkNvI
         lyq9eQMEebSp9KFaS/CMmPRbAy1sEBuFzo+XJdYdZ9u2xodAayZwGsSIVOf1GQbpf/kY
         5o2Q8e2eNhZH7eDnc71N+Gk/7XFk6FMrZQYJRjTgRQHwl10daxxTIeEV87Q/rsnJqG5b
         onjuMJgqQeB83ajNQ5fY78XPPT6uDLc5gyqIpif8j+DoPLx47Wc7gvQ4G0kW01NAMnkA
         8iTb+TrieIK/EZ/K/SM6cO68ZFv8KhUHHHciza9FTlDbmZWDxWTl35HqNjg1WuLKuxEW
         VRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiiPpFt+lUPvjZsmPnfZI3t6viZ2JgyZUFleGEFnOHoXLsQBrr4tEsw+AyhQdGd20GbWxpGWwnTLX60re6vjcK/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIq+zeWlmVnk/JFLiqY+u9mjzi2rKKL72G1Wku3mPsuFo3i2I
	ERUHkYM6izdy4I22f2M0QqzyZk+mJEXJfGSEjoo4VQowPSJVbfrgqjVk
X-Gm-Gg: ASbGncvLdFXa4j+YsNHwKUaaCqw/RrtoaofYo4aE+AHA1Ctvy/NTVOh/OqG+1e5GKQw
	rQP+zN36nljOOoAYsFzd8rdmI55nmG5/OkpAh29LdT54S8EyJDQJ/WkSLPbNWHy3dP5NM3rHLFm
	uf0kggSDPxB5M5eKRTw4S6nfLBYV+AsCMfLDRii4kGgC4eBIwjSdcjww9xdxPmOrXjnvZhnFa0Q
	e7gLpWvwRSPAhqq4Ku4lZwekMkvqtubYH62n+4Xwkyqh1lQdmKXqIXEie2XI38AXJsSogqTekSZ
	/UG5XBdhDwUSJ8OaCHJrmAc9vJHorcGgCdJUomLbhOGLvf3OVUDLJpYsUo1YIvr0QQElJYq0Fpy
	qRknfl73RD47GHNE78537ELHBLkSUXNclLfu0Kr4y/I/ArvagUCNIB4DivHwzFcesUDOq3dFFhX
	TsrNI=
X-Google-Smtp-Source: AGHT+IENFs6ZeqSSU+KjG9QyVSgBwvU+cDVIGAR8OjDvX7BWestdMZ6UnPS0+COQ/ad/NdSX8SYyYw==
X-Received: by 2002:a05:600c:3b96:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-477c315f86bmr17005775e9.3.1763753986770;
        Fri, 21 Nov 2025 11:39:46 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df3d5sm59104335e9.2.2025.11.21.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:39:46 -0800 (PST)
Date: Fri, 21 Nov 2025 21:39:42 +0200
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
Subject: Re: [PATCH net-next 06/11] net: dsa: rzn1-a5psw: Add support for
 optional timestamp clock
Message-ID: <20251121193942.gsogugfoa6nafwzf@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 21, 2025 at 11:35:32AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
> driver. Some SoC variants provide a dedicated clock source for
> timestamping or time synchronization features within the Ethernet
> switch IP.
> 
> Request and enable this clock during probe if defined in the device tree.
> If the clock is not present, the driver continues to operate normally.
> 
> This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
> the Ethernet switch includes a timestamp clock input.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

What is the impact to the current driver if you get the clock and
disable it? I'm trying to understand if it's possible to only enable it
when using a feature that requires it.

