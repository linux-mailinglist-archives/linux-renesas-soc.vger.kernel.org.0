Return-Path: <linux-renesas-soc+bounces-24024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15CC2BD18
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 13:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E127B3B70BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 12:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7732C325F;
	Mon,  3 Nov 2025 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="i140ABhj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="w/beTkws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02F30595B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762173707; cv=none; b=r/LX0IGi4hKsXr3wI4SFJfgxIyPv0CeZiu4Hv5sck8K/Jgr1zM4Yq4DowX2HRBaovqxlGZURZrFmRaDTge8MsKGfhClVaiVUXEAqOa9C+AYfp0cI1B8EU6Wb9C97nNNg4oAygqtHW3kViAvlSQheTqImsNMfS2jV6q1fBr1IEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762173707; c=relaxed/simple;
	bh=AX6lnLVKWCUC2i8OZJiwpKUGB4xJ9Kpo0nG9UComU14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGux9c0JKXGNu0mCpVfWv3yW6aV6SoVP3nNBaCQNOXj5g0Vf00/j66VJN9m4Cg2zxB7TKQfjbgYpEVch2x1NPQfw8jcPdsU2uQgtnViZyih9i1j/AXhIQ5TnvqsBBXrKrLn+qapBCO9nIGgziKc5253n9WuyABfbCMnJRTNaWfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=i140ABhj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=w/beTkws; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0WRq29Wjz9tDy;
	Mon,  3 Nov 2025 13:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762173703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2H1aGiNw5Da4wq5CBM5AFBjI+wBcWi8K6i1q6sCyMs=;
	b=i140ABhjZLKRRqPndBGIzrA6VLBXnugMJJzCqRSYnzLYje8xijskLVNv3lcrwzO94kfRXz
	xMv7V4cOZms0rRij8mf6janBijqUiBs9QqRJp6Op/PhT3ef2uu9QHrT7d3POUSjlaRAZUF
	bUIarCmzSS/GXv6tZ9x5x8JupfmKd7/w+rukbNxzkakd/y7ZVDsWSD9eqjEtq/h3H5jAXR
	RntUqMfvAJR9lTvbLlx+KHz1NcKFjx2TZ5oQHps374xeAhhlqflC08lL5y+lpqSxFmpA/D
	MIjveAS1ar+RHvsfZR2nOcLSDjYPpNwtnKmJDXjm1/ROi5r7DKhEVkum3m15uQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="w/beTkws";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <6281df4d-0389-42a8-8a40-cd5d09c591db@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762173701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2H1aGiNw5Da4wq5CBM5AFBjI+wBcWi8K6i1q6sCyMs=;
	b=w/beTkwsE9BzGglNX4zJXmqfPgbBl35GICQDilWTMpnb4nMnJqCyyI2hrv2ISg9sGcgqhg
	KGM7D6M9FTRIlCB1d1sjZcbMHZHoNtrGrzaHo4/azgX7wFxpz4nk4NdXL7m2g2coyAPjBX
	bGAVzzIN2ciwXv6NO6Kry4GJSjC3j8mP1bERyh/a4mLEZ7mre7N2mO3k488g/kwttPuzj+
	3GTuSryJvqN6RJDR60H7GGnKSZ5ioPHMKIRtBlWnkTcLUoN+MpyzeobtOv26+9XSy+n6eL
	DfDtF1qbU5zSbCYOZPKjcrJrnehysVgC8eVT5S0U/sAfDqbKSPYtyCDMaD4wnQ==
Date: Mon, 3 Nov 2025 13:41:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Depend on power sequencing
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
 <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b5d90a5daf3f635d002
X-MBO-RS-META: yyjzhofw6o361swna9gdd98nzt4upgm5
X-Rspamd-Queue-Id: 4d0WRq29Wjz9tDy

On 11/3/25 11:36 AM, Matt Coster wrote:

Hello Matt,

> On 02/11/2025 18:41, Marek Vasut wrote:
>> Since commit e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU
>> power management"), the driver calls power sequencing functions. Add
>> missing dependency on POWER_SEQUENCING, otherwise the kernel may fail
>> to build if the driver is built-in and POWER_SEQUENCING is a module
>> with these linker errors:
>>
>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_off_sequence_pwrseq':
>> pvr_power.c:(.text+0x70): undefined reference to `pwrseq_power_off'
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_on_sequence_pwrseq':
>> pvr_power.c:(.text+0x88): undefined reference to `pwrseq_power_on'
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_init_pwrseq':
>> pvr_power.c:(.text+0xb4): undefined reference to `devm_pwrseq_get'
> 
> Thanks for the fix! I did send a similar patch[1] last month in response
> to a test bot report[2], but it slipped my mind to chase an Rb for it so
> it's never been applied.
> 
> Do you mind if I take the earlier patch instead of this one, since it
> doesn't add a hard dependency on POWER_SEQUENCING?
Either fix is fine by me, thank you.

