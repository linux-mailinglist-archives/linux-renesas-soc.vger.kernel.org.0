Return-Path: <linux-renesas-soc+bounces-27256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AFLOSNtcWkPHAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 01:19:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5E5FE0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 01:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C5A436A5B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A89527E045;
	Thu, 22 Jan 2026 00:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkYowEi2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C34280317
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 00:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769041181; cv=none; b=Ylm61YLb3fz6+F+6g1TruArdUqLrfRxVqtMC5+YbdlwMij71/42TW7bDBbqrvSLqIO0pVBgSD6cqpY7vgwdGxY+qah4zHXYuw3J90FcYNcsey6uxTiOp2g+sPXYzTfPjzmI3OOd8LPOZBL3XU3U6eVlMyh3wZJjNryYIa9YTivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769041181; c=relaxed/simple;
	bh=toFRl0nd/GnmbDTIg/IXBPzUTdQ0PWBRGTaZB3JomAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx3i79o1MrVsPNx1g6KmrChJkfs1K10ZFCaZgqFK49rMVOz726HtDtpNXhiHsn+358VdG+Y5/h+0Q6Cw2wksRt2bGR2QatPiJl8QwiMyfyp8EXFUvfrS+J4ymer/MKHYmB5RQX4m0k5b6LcBE5OAUDZCaR/dstADbyJE/z9Ee90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkYowEi2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b70abe3417so874845eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 16:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769041178; x=1769645978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=my6oNj5dhoGNuHaCENdjfn2I7AS92QIvBlynj8gDnII=;
        b=OkYowEi21T/3wSOHMXcAWui3W89xbyktEDWBId1C7MqtYwKgxWayncCvcKuD/Nh1G6
         islSIRm+nDo0m0/DX0WxElMr+cL8bGoZRJh7Eh3S3+cMqmwQN4TmEJ2+lJJ2KqXOBYE2
         +WyX1jM/5Id7+6ir1peS/Te+EBlKTqz7J+224ZFxJijt2EHrVsLy1gI0kmjfGiH4vvaH
         TcgqxCgofRloR0PWpUr3HvCnxHh6XWVTip3Lbfp3n5g7A+ftg0X5w0kcXy/NRnRS7Pp1
         zhXCmJxhg6rFQYYRb/GZ0vdAQeT0bhHof/chG3z89rId2QOKJuiYz2oenoHnXnTdS7Qr
         B8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041178; x=1769645978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my6oNj5dhoGNuHaCENdjfn2I7AS92QIvBlynj8gDnII=;
        b=eKNkP3qHjhLxNySPxHC7Kdv+FF9xJHM+vyGYvhODbb+/BL4TBEhKfeYljoK/JuF2xR
         kqDwYah7sJ6UXOF/QYNz9892XVX24GYtjQ5QeN9aVrLLGlnqejBCVEOk+DwW3xgEfoiI
         4ZA0NjnoZF3CvdJTrFZBlrxA3shvd6+P5XfQ01MCtuzB9h/v6xM4ADX+HjiftEVTigCh
         PQYZBAxuNWNIO80US2ruI61YcXhxol8y+Xf3C9Z2jv7F8yB0LKPFbJ7Sy7S5Za6TUZ2N
         V6efjyVPv5rIm0Drub8z+SBkdrEFCFFBysyuy+EZAN4FQV73NSJITzi05K+4YldLwfp2
         RGjg==
X-Forwarded-Encrypted: i=1; AJvYcCX8PqDyTR1UqFy+LxveBHi4Z9l2Z+//iYHF+6aHFbu6d0Afsm+PntPTl/nO8/tYnI5Oz+h60rpGid4ov9xCw8gmnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTyihlHpXj+NYBavfNfanvcZvKJ4FfwWmNP84U1HZepEwwQ6S
	j4B6YhVPpz5mQ3/oYDaTgXDOik1FaRGWBVNgGkQdLrNX2FkAtLwpDD4j
X-Gm-Gg: AZuq6aJZ8ncU7cqpjkWh/NpIzAqCl9x1Wmyl5zK6mDT4yOP14MviLPMrQnAKJjlyZGA
	6yWLP9SS2RJSmK4MzKcqSCce24YK10gJZFdCimn0IIRj0qBBmZHsfXPK78pT+n0AlQigxZJPSKg
	xmbvESsm1HUHjbwErkSdWu7P7f7XE26nLxahYOlCZlnegYJv804ykEp8LYb0XEu+iLasG5Nc9o9
	IpipSqFEX9DMAwGM+1CC+3NsOH83/X9xUOYpFJRuRyh53LmD3gUyHEVPZ1inc1hmLubsmzNBDO7
	24EZ0uvqbhUKocJKObeffMifoDhsXzmPLXijzd8Tppkf5qesAtCVdKZTLj34w3ZnArt6fuzJX3o
	HcdQeViFg3/FIecSJ52BR71dJiYUuQO38jIxBBuniq5I51h/PQo98SyKnzxcO8/QBv6ESKdCq5L
	BrXAoR+t8dYLY0e6aiwtzL3mJtI3X4o1Zi54s+Jd9BgdP0Jo1c7iAX
X-Received: by 2002:a05:7300:7490:b0:2b7:2616:2dd7 with SMTP id 5a478bee46e88-2b72616353bmr713722eec.40.1769041177042;
        Wed, 21 Jan 2026 16:19:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:abb8:3a31:328a:3594])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d7f729bsm7107682eec.16.2026.01.21.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:19:36 -0800 (PST)
Date: Wed, 21 Jan 2026 16:19:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
Message-ID: <kzt3myrtfigzvtuw62eqts5tjfwvlueuzifk7dsm5jvawztsle@5wyzecmltldb>
References: <20260121230736.114623-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121230736.114623-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27256-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 8FC5E5FE0E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:06:46AM +0100, Marek Vasut wrote:
> The old Ilitek touch controllers V3 and V6 can operate without
> interrupt line, in polling mode. Drop the 'interrupts' property
> requirement for those four controllers. To avoid overloading the
> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
> into separate document.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied the lot, thank you.

-- 
Dmitry

