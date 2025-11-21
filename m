Return-Path: <linux-renesas-soc+bounces-25007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09DC7B8E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 20:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62973A5408
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 19:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD6302159;
	Fri, 21 Nov 2025 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggqFK1/3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720D3016F0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753852; cv=none; b=qEVVF4uhxDunasZ+cwwGKApB0uUqtIUCneY34WipFBJToMW9k3tvGbQ5ofgmmd9Dr+o2uNhDAu3UOrqLomMbPMhv1/iYn9JA/qsqn5nLGH2pOvmJBHN4G+5zjmzMmfn5yZ69obkx+Ubnq2WKzkhG7df5IzyPNFTVeB7CtmgWl8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753852; c=relaxed/simple;
	bh=UgSKme/gXLmu4ztikSvSNsXda91TqjSZ+q1O4KdLtDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv2wl30TRRpKQAoXFF6dRnE6q5X/LksvqNAbmrzEYCJQu3qbr6Pg7xYc1Tef9sS3kRv+d4UZknMdzs8+epAObmSp1hDiD/R2XJYlVqMI91K/hfB6bhH1mJpLqPDYbovwimKOgBChDu8xzXmtju5ZaRH+FFEhCgRulBirj0doELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggqFK1/3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477aa91e75dso1625995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763753848; x=1764358648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJM1mZpGIoqjTJBi+7n1u/HmWUJqp4d9cJ4oHyspqrY=;
        b=ggqFK1/3NFUxooi9DrUFK4RKVfxIZXkvAptbyEqsHhd3oHk8T9uH2PGZD4k/SvJK4v
         RVfSgY96+bJwa4jhAm5Bid+duA2Zl5cKI8AsvaCNfswjNtE4BzfNm6LWihLFgYeyXogM
         oBRxMwna+KdkUyJ9oWiB8jzPkFo/MsFKtXAVxZ6FXh/CoVm+7rWGJR/uHd52G1pvPfAb
         5rSaUzXg208AyojoJqX8/kBRJk/iaFExb3rsByQyg5VLF1sdJqTafkpXgTPYOqdxZWFk
         1RfxkCMsqZ+GELGbWYKMjBb3JxusG09oejiCBLcZb4hwa37rfzT8ftLWSG+J+0+wlGCQ
         2bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753848; x=1764358648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJM1mZpGIoqjTJBi+7n1u/HmWUJqp4d9cJ4oHyspqrY=;
        b=Jo4iZikEAV02Homv/prExnqx/Nfvr3mQgKDPlFNfaEoy+9Lf/XyMrrkjsQcECj064L
         6uDYtoP9T2AhAm6R927JVmb3u4MzaLsP4SD8Z3fBrKMiW1iSe8tjAu6fe+lLDJQifvSl
         4LQm4/ZbyGqLVuGS9WIgP/uHe9dthAsEZzaRVr7DiTjPkNNilqq1N67WVkYD7UsstpgR
         SusBoYYcBVwZwgDYT2oAxWxQZeHTtaoKIChqiZpJDWV0u4dgJtT9jd45aTt+mfNp4+O3
         m4r6OK+xFXkt62ZBxFjjtAFJBqV3bR9z175HI+QnW2qSzeD08EUvVysprA/EvES9KBQ3
         CdjA==
X-Forwarded-Encrypted: i=1; AJvYcCWtI1gMGG3MNhb2RR06kCY+VpR/q6/38WfwG/UFMFN+5B1EQisY1aLQGGR3Wuxu2MKFcJFzy5tSfCcvtPA5t4w+wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8rJuOwhiHGAr7HZ210x89uTGqdqY9omMDn/cyUP7rU+02ObV
	A9rlUHeNaNcFRh4mlyJUbPFSKpgFWX1UPWm1U6Bp1FBiCeouj6ow2yoI
X-Gm-Gg: ASbGncsXphgsv474IR2ooV9JFMWZOUivdaNXOGqXlqfUsTGlQoW4ibFRUC1NZMp4Bn9
	/yIfIk5T/d4MMsoygRJCP3UmjPkpvAykZ6hmseVDDgtaTqZQzN2uZy5z3NuHRlqsPIfbs2SFjKy
	LoN+CaY4mZf9shJwaIJRWXjcgxuqQcMn7X5B0kpmU3zIHAQ1yACfcH8gbFWG2s0BBRsJx3yG0l9
	ucwOVDmEtsiOnUkCi7mllCVQe91AxNvzC4v695VcKoqI9Wj5VqEwn4YjfzbKoMiJXrOe9DsvKrC
	OZ2WufFQCR21nnj+KmgzkjP8VUWZS3uqC7xg+hgkK/MYwMULNGqoOsqmqUfZz1sK3wYaWNtsPHH
	gX2mVk7LGvsUQkcGU77gm2fwsqxEC4z31PY0QNlw5bE8k6eDNM4WcsYlgo7UBmuUJJr7/h86BOn
	QZ7nk=
X-Google-Smtp-Source: AGHT+IE3zswDLhAtOxPxtN3e0zQWCopDK2avgOY05M1JcEMvCUwdTqXrYP7mxELJXsHw+IAadTlULQ==
X-Received: by 2002:a05:600c:3514:b0:477:a450:7aa2 with SMTP id 5b1f17b1804b1-477c016c020mr19801875e9.1.1763753848160;
        Fri, 21 Nov 2025 11:37:28 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f3635bsm12773438f8f.17.2025.11.21.11.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:37:27 -0800 (PST)
Date: Fri, 21 Nov 2025 21:37:24 +0200
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
Subject: Re: [PATCH net-next 05/11] net: dsa: rzn1-a5psw: Add support for
 optional reset control
Message-ID: <20251121193724.djjtzqg3q3r3pl45@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 21, 2025 at 11:35:31AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for an optional reset control to the RZN1 A5PSW driver.
> Obtain the reset line using
> devm_reset_control_get_optional_exclusive_deasserted() during probe
> to ensure that the Ethernet switch (ETHSW) block is properly released
> from reset before initialization.
> 
> This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> SoCs, where the ETHSW IP block is connected to a dedicated reset line
> that must be controlled by software.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

