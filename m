Return-Path: <linux-renesas-soc+bounces-23152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CFBE3D0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 15:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A2953577CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 13:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3020933CEA2;
	Thu, 16 Oct 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lRmlgsaI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jOtp8sl1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E031D5CE8;
	Thu, 16 Oct 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622859; cv=none; b=bHF9BHCYNwzHIOAOghnoXq8G3FAWtdMIja/i1oaQxyOjD8RO1IAOZ6YFgt0vHr9ngeQFgPwdHlygs1xOizUurZL5kZGNyAHo23i4zxQCbn5t9+jK6Y3hb0B9+xzrINSNEOj9QR/w8mzM2WBOT88qnP17pOTmnUcS+7e7UYcE+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622859; c=relaxed/simple;
	bh=bFAAEHDnGSOFS3n77lQciKFEC53y8yC55pW3UEFK8K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzj0fZJnKenhfMWm0sGNMncdrXdiJDFHkJ25ScBpzrz0O94qwEDBGJGQDAIK6JqOjDVjxV5avfOYTCkT+YuPrnxxQfitH9YJzlinjmavaeEGlyAUi+U6S6zHoal0PkvZANTeDJjjUPg86qqYxYolkTXvBuNVb0jE0ocW3j3ltQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lRmlgsaI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jOtp8sl1; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cnTvp6PTqz9tvL;
	Thu, 16 Oct 2025 15:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760622854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2HBKK+lNCbKDrWcJdy0h2VpjcQUt9CTc3J7LrF5Qas=;
	b=lRmlgsaIa/7h8SINAhXmChUj2YB9wyXnIXLuJUbBvFcFtFM6Z1Qf6Ck4U4+udI3uUb/7fz
	8ONWRIYmV8fdx9MEiVpKgo+n/SVfzhuHvO0Sok43h66pERURMVlEZKzEzqgvQQshi8zjfB
	f5iXBs98Nr6B43arcIHvJOTLue4gizh+tViz450mnQFtbYILqpDO+EkqjMW3yYco6U6OOq
	xXllFwJ8wn2gERcJ9fcanS3sJ8aErTdQ9BTJ0ZtF4NzZGEFzATPHCvMJbDbpmfHmRKDWUA
	yrMHZZrvr+gtUXzMSQgOtsSCiJeDRxBNvXiadhOWES9Cmph8n97YUoDUOZoOVQ==
Message-ID: <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760622852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2HBKK+lNCbKDrWcJdy0h2VpjcQUt9CTc3J7LrF5Qas=;
	b=jOtp8sl18MgTut+Y4wgoDFc1XuCY33E7GaPGIe/NoeC2xV8GdPQEdfR+NvBrxfuCMLJjhy
	QhOW5zWW/QerYcQwy8nRoTIhnE5Gd+SioDM/Vfykk4rRTcRrNoh3xeSKcucM3OIrR6eogB
	N6Ty9Jb4HUIR35HgX/7+Rm+n4wsmGF6WUhZTpCkM77pQX9ffyNIP9ScBes6q4CesDjm6G+
	k/yiVdUjpJ/Bjo5WakxM/bifEh6N+rcLaXJ7U4aya7Qb1AjjP+P8YA/E09xDfhFaX3lCDS
	qH0utF7lY6fWWtgoMmcBZBabfX8zyuO2sfAlTVRaEmD+Bq2yKkwzCcIndOqA1g==
Date: Thu, 16 Oct 2025 15:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
 <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fac68e465852b1d1530
X-MBO-RS-META: x89kt9745ids3mra6uq13s18do64hp1c

On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> which are also never disabled, do we want to disable the GPU by default
>> and enable per-board ?
> 
> Yes please. We do the same with renesas,*-mali GPU nodes.
> The board may not even have graphical output.
> Or do you envision using the GPU for more general and headless operation?

The GPU does have GP-GPU compute shader, so even headless system can do 
compute on the GPU.

>> I would argue the GPU should be enabled by default, so the GPU driver
>> can do a proper power management of the GPU. If firmware is missing, at
>> least power it off on failed probe, if nothing else.
> 
> The *_PD_3DG_* domains are powered down anyway when unused.

If the driver was bound to the GPU node, then the domain would be surely 
powered down in control of the Linux kernel driver, without depending on 
the prior stage to leave it powered down.

I think it is in fact better to bind the GPU driver to the GPU IP and 
let the GPU driver power manage the GPU in a well defined manner, 
instead of depending on the prior stage to leave the GPU in some 
specific state ?

-- 
Best regards,
Marek Vasut

