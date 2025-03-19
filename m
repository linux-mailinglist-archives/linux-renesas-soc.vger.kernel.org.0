Return-Path: <linux-renesas-soc+bounces-14646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86146A69ABF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 22:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7BA3189BD04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 21:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3132E2135DE;
	Wed, 19 Mar 2025 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsRbTkXh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0419259E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Mar 2025 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419323; cv=none; b=tCXcr3ZIWkmcs7vnPG1chRQFHD3uMeFAaVWdbwjpnhxkdhevduMtMtPk8TKc7/BtUg7huFK6Z5i0Dbohb4DCHaakKiTpTqGpoZHYFmW+fUOUISwrrgOZmvgZyF7BnQv4d3WWhbNOm0o+KgQU5G3eKUe7Zz9JqbwNFiJQUfJztF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419323; c=relaxed/simple;
	bh=e04yedQXmFV0fUEoy3MX7U7nXzBv7zCj3PD8JoIkGng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzFCFsqWDT/X9R/Ik2EHfEkTrzTJzIfZ2NujfP4C6vZ557ralkRELSGcB7mI9QgmHO4wXLba5MF7ivqCo6+4Vtu3FtYV4HxSPOkgdMaDOM/FBGkBUtQYBO6ne2mBwo3/dY9YchA37rJhRqxxXB648QPCkYLU49PmyKO8kXE1sZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsRbTkXh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742419320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDWNLxb1CzYSCvOOKpH+bW9L/oTxpk65TwCMBk+ej2A=;
	b=WsRbTkXhg2r70SIJj/keiW2QlSxdbOvCgUWgZNFwkCizx08Z1FQtOZibh7lNRFP15f/X5B
	no6ADqIWnyhw85DAqbPG2f3j1GM4dpJkYWoRoEAWkC/8OU61OM5VO4jzD+RMvt+QjbWZSj
	gjxsuhZgqavecdgFulJgsFyA/DeEuvA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-yTVfymr_MKW_WxI40KDTHQ-1; Wed, 19 Mar 2025 17:21:59 -0400
X-MC-Unique: yTVfymr_MKW_WxI40KDTHQ-1
X-Mimecast-MFC-AGG-ID: yTVfymr_MKW_WxI40KDTHQ_1742419318
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39143311936so28218f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Mar 2025 14:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419318; x=1743024118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDWNLxb1CzYSCvOOKpH+bW9L/oTxpk65TwCMBk+ej2A=;
        b=wBCJDly72ntL9rf4SemITmathug4HiBrrmiOjphVtYYITRHc9FEBmCAnhFCvcRun+V
         DnwthmgP6aRwH8C5hOw78QcAI+X46F7ftLXSmPaDhgQCNUNcKkegdfyd5E+NTgThyOnS
         uyhiit3J4QR+KX2HpbXWTpf7wS7fSo7640Fv+5AC3TAib2HrdsteQ158HvUky2UWAWC8
         zVviXyUrHTWNPUkI7nxrraSvL9y4cdbeHzMNf+yMxyxe4tFoETfMu7RtCdyucvDwPV6q
         k51HgOcDbtZQ9kkuzsb3m+Nil6YfEt/z+/TAEFI8AocJWrVqDaYeIHnm+0TFxidl0DWu
         r+sg==
X-Forwarded-Encrypted: i=1; AJvYcCULTfbT4g8GBvFdmWB3BWFAvfL6MNVA0djmAr7gfNF9H5wglGMWVuph8DuMW3tkSnlU0GdBPB2KjDnV8tJoh8lPUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydsp5uy0o/jgDmm6ni6Yz58ZT9OtkgrY8ItLxbmxxj4rVHPKG/
	4esslDCn2pWq5f7161dB2NBbHghHv5GaTjTRXtGMnuTHSMXZ14z5HBEPC96BqZRT+yHLu0EmEDT
	UVxKTjoeCmjMaShIyQ5SRZJKsiZL9lRF9pfXIc3Uie8F42MuAIf5g1Lc96sjxw3H96GTJ
X-Gm-Gg: ASbGncu8pv8727/ahxZ9I7wo5odhRzmSm0+oj3awTgHfD/vsMkWFVoXCjN9JAc2mMYv
	HIJEnl/2tLYJomH3Gwil57TDURmzNlVvUuuQCGNtNh5QM/FTGi2CN2KlENA0VvyIYyr2P+9QAXZ
	Pgnp4T6pWlEFx7IzDsJ2ncM/ekG6qGv3tuxVcg2XuWzxhudwOgta0yFXFThoraeuJtMWoNPAxO4
	h80vtAIkYLyJt74a+IacfehEjltTbR3nCbaEeCZcjvTEtvj9ZE71jm/Yl9WYceW0B4t8tDIsXAc
	JwLj2oafktLGxMtKwLNmA0MyhjkDX5s1QT3Qx94H+3A+WA==
X-Received: by 2002:a5d:47af:0:b0:391:10c5:d1a8 with SMTP id ffacd0b85a97d-399739b4417mr4041374f8f.6.1742419317810;
        Wed, 19 Mar 2025 14:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaLSnhNgHajpagGDMQ1+5o7+6Po7P4WxyuDoDHztzaTcHpWdvzD63DxuxxFMe7m0VyNcvBCQ==
X-Received: by 2002:a5d:47af:0:b0:391:10c5:d1a8 with SMTP id ffacd0b85a97d-399739b4417mr4041347f8f.6.1742419317363;
        Wed, 19 Mar 2025 14:21:57 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7e9f8asm21826669f8f.81.2025.03.19.14.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 14:21:56 -0700 (PDT)
Message-ID: <4cfeb80e-8799-44dc-9b8b-7b7e0e329541@redhat.com>
Date: Wed, 19 Mar 2025 22:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/5] net: ptp: fix egregious supported flag checks
To: Jacob Keller <jacob.e.keller@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Lasse Johnsen <l@ssejohnsen.me>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/25 11:15 PM, Jacob Keller wrote:
> In preparation for adding .supported_extts_flags and
> .supported_perout_flags to the ptp_clock_info structure, fix a couple of
> places where drivers get existing flag gets grossly incorrect.
> 
> The igb driver claims 82580 supports strictly validating PTP_RISING_EDGE
> and PTP_FALLING_EDGE, but doesn't actually check the flags. Fix the driver
> to require that the request match both edges, as this is implied by the
> datasheet description.
> 
> The renesas driver also claims to support strict flag checking, but does
> not actually check the flags either. I do not have the data sheet for this
> device, so I do not know what edge it timestamps. For simplicity, just
> reject all requests with PTP_STRICT_FLAGS. This essentially prevents the
> PTP_EXTTS_REQUEST2 ioctl from working. Updating to correctly validate the
> flags will require someone who has the hardware to confirm the behavior.
> 
> The lan743x driver supports (and strictly validates) that the request is
> either PTP_RISING_EDGE or PTP_FALLING_EDGE but not both. However, it does
> not check the flags are one of the known valid flags. Thus, requests for
> PTP_EXT_OFF (and any future flag) will be accepted and misinterpreted. Add
> the appropriate check to reject unsupported PTP_EXT_OFF requests and future
> proof against new flags.
> 
> The broadcom PHY driver checks that PTP_PEROUT_PHASE is not set. This
> appears to be an attempt at rejecting unsupported flags. It is not robust
> against flag additions such as the PTP_PEROUT_ONE_SHOT, or anything added
> in the future. Fix this by instead checking against the negation of the
> supported PTP_PEROUT_DUTY_CYCLE instead.
> 
> The ptp_ocp driver supports PTP_PEROUT_PHASE and PTP_PEROUT_DUTY_CYCLE, but
> does not check unsupported flags. Add the appropriate check to ensure
> PTP_PEROUT_ONE_SHOT and any future flags are rejected as unsupported.
> 
> These are changes compile-tested, but I do not have hardware to validate the
> behavior.
> 
> There are a number of other drivers which enable periodic output or
> external timestamp requests, but which do not check flags at all. We could
> go through each of these drivers one-by-one and meticulously add a flag
> check. Instead, these drivers will be covered only by the upcoming
> .supported_extts_flags and .supported_perout_flags checks in a net-next
> series.
> 
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

I admit I'm the most significant source of latency, but this series is
IMHO a bit risky to land this late in the cycle in the net tree,
especially considering the lack of H/W testing for the BCM phy.

What about applying this to net-next instead?

Thanks,

Paolo


