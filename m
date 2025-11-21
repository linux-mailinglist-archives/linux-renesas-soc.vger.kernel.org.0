Return-Path: <linux-renesas-soc+bounces-25014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBBEC7BB05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 396304E1BFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 20:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD1A2F6918;
	Fri, 21 Nov 2025 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h42BLlMM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979CA2EE617
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758553; cv=none; b=l//tOoXXQGp+Sx5mmQC0ll6cz2X8Kc0J9EypsSc9/MCwyED+JwOeWeFKS1CNNhh6vaD2rAWDe3NdYBmh32p2UMHzrSAZpfqBgOcY/RX2B0fNe/OBGNevYst/vnuxjFj2H/l05AmIvR8BwBzEk1Ef86CG+5deEWK2JNDVbPJdjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758553; c=relaxed/simple;
	bh=lYUK59Z9lErXRf5Bg+aGnzF3C82gccjJNbgCi2t10u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moBJ7GCAKm17XApsWTYk6g4+3VgE94zsH2Nx1EBRcIqn1PQiQY1QRhifFvJCTZ3I70BuLDwzqjcq3+MujOBHosQOjCgcW+3PKv8P3xHACWbWfIgIcEPgH4u0Y4bKM8/tnkFPb+ghHYL6a8AB+Y4KJMCvm9TBnpBVS7MUvgZMqWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h42BLlMM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b2de74838so206148f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763758550; x=1764363350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWLVJDOcbRGYcqao1ONr0boRiS6rHHZNiYodJCrm44Y=;
        b=h42BLlMMyKXqPMLsi4gNQ2+Ng3XSpkwmx0dC8ZAE2SnutTlyVFr9pY8+RilB9q+2d/
         HLxqtROSm0f1pebN7bNkNt6mHaYLXCkVEgAa9sL3UurrK4mIXrxbMsOxwEXrafDO9egE
         6suiAh9LszwJLTOOQayGxo49dWcQeGWLESyEXmTbhKRCVHW6w16KErywrUhFEY4o+EVs
         hKo+A+L87Fk5NmIC++Z7ox6IJ21nO/uSZQhYDw2ZEmWAtfWYr0grW/N+cP9ZmirQcPCf
         FeCJzutmNv/w9cdXxaoSDLwnRMCfQ2g6A4+lXPY3D+kf8LQEGaPk2MrsG1UAQDm0R4s3
         +nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763758550; x=1764363350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWLVJDOcbRGYcqao1ONr0boRiS6rHHZNiYodJCrm44Y=;
        b=PNcOlqYWDKeeuQ1d7z7QtUCwfnUc6sgQNcgivm0JL/frNMXzSrkGcFpZAxkv8t3LOA
         kxx+thiDRYXw7ETQYB+6T8SrRVySE43EhAR74yVmmTdf1IyU8FSShbkenYi2hmpZdN7l
         uJJA+/49A4j29zSYnl788j0QkCTOUqfvl/VxNEqvRcbRu6n1DGDnq23GAOLf9z2AJyQP
         lTJi9/353ttSXQKgcoYMa7vQCuEs88oegbpFyprdBwRTR3s25j1w8uLaUlZgELKbX4Ry
         UFM+6s9p6mRx3YI/hCG6X+iqlYVAf9zRDnETDjxHBypZPN3fRIwU6QEhBAIG7qkiy0rm
         7dNw==
X-Forwarded-Encrypted: i=1; AJvYcCVWCn9plCTP0Ks8ttNCzWp5TLIEhj6QfJtBSpt3YefT6jLUbzb3K5XBP0s7AC7oTN3rnkUTmlvYoEiEnK7z0j2SmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytKw56MhwqxkxxF7oJ9tvJtBvRQu62lj3uT6kM91ickU7e83HA
	LRPVef7ZK3V8zSw+IaDvDdOKecpJ16mKjNdwWPJw25K0Tj7zPuKWFuzj
X-Gm-Gg: ASbGncuddfJsfUtlBwY3Z1/ElwpbXC2GyVI9qDG6DilxyVkRReUgCibzCpP+4sDQRn5
	O6mgxdHug5sEs2k1xQ8TAK2pQIiaCUcxqkLhFzKH7beXf/acDjy+8a4TmCBU36+tv8K+3rXBAY0
	knmjUqkxOnEuCqgOVtdPQPYIy6JN2BrcoLl4B6eDfufNx3ZMcxhfQeHxc8g0Pz8O7E3lKrhlDte
	Y2i9a7T50CRN0xhITmjG90ZE0bmkWrIVvsEuE6kCelKOroAx6LPBQqQq15gzM6D7H2XOx7eu98F
	XSIqq+5vDbF6tJZfhUMpmtMoR1Cc2fZ0vmfMLDZrkkSDVb+dhJCNBMXW0AJFzsseeB7Bs2s3cs3
	kcYYqhrGlBlnb61gFeHWP08n+wHR+7Ti0WNI+KBo958FFEpTPIGNjI6ax6T8j2AK7Qoy6pRX/xg
	NKVsU=
X-Google-Smtp-Source: AGHT+IEpBti2Vot/ywXlhz/7XNq56k24q9qvbPMpnhnia8lGLDa9AtxVQGq2oXuumoaffzRpt9mvgQ==
X-Received: by 2002:a05:6000:1ac9:b0:429:c851:69bb with SMTP id ffacd0b85a97d-42cc3f99224mr1830789f8f.5.1763758549737;
        Fri, 21 Nov 2025 12:55:49 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e556sm12847859f8f.5.2025.11.21.12.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:55:48 -0800 (PST)
Date: Fri, 21 Nov 2025 22:55:46 +0200
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
Subject: Re: [PATCH net-next 08/11] net: dsa: rzn1-a5psw: Make DSA tag
 protocol configurable via OF data
Message-ID: <20251121205546.6bqpo2bn5sp3uxxu@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121113553.2955854-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 21, 2025 at 11:35:34AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the RZN1 A5PSW driver to obtain the DSA tag protocol from
> device-specific data instead of using a hard-coded value. Add a new
> `tag_proto` field to `struct a5psw_of_data` and use it in
> `a5psw_get_tag_protocol()` to return the appropriate protocol for
> each SoC.
> 
> This allows future SoCs such as RZ/T2H and RZ/N2H, which use the
> DSA_TAG_PROTO_RZT2H_ETHSW tag format, to share the same driver
> infrastructure without code duplication.

Again the twitching when reading the commit title. I thought this has
something to do with the "dsa-tag-protocol" property from
Documentation/devicetree/bindings/net/dsa/dsa-port.yaml. The tagger *is*
runtime-configurable if you implement the ds->ops->change_tag_protocol()
API, and it's also possible to trigger that API function from OF
properties. But this is not what the patch does, so it is confusing.

I think it would be more natural to say "choose tagging protocol based
on compatible string".

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Anyway I'm not reviewing this commit until the reason why you added a
new name for this tagger becomes completely clear.

