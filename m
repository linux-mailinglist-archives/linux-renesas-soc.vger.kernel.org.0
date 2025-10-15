Return-Path: <linux-renesas-soc+bounces-23076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F1BDF172
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 996B23560D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A9C299927;
	Wed, 15 Oct 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I2lRGJfq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I/Fcsian"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E1295DA6;
	Wed, 15 Oct 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538817; cv=none; b=NYyzPuLuYLWpQcFPQOY7YoOx3CEioGRVZkMDmx2AtDPXeEZcDpyu8U1CHabLsqHpTfPMJUDPVmS7OJGaW5iPOzhoEcH387nIluFtZn9ku2nXpsOSOOudwAgbC+XhI7azJHxJabb9whIoEOX9Zne1aRAxwGQJdsgAjtOwyXBlAas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538817; c=relaxed/simple;
	bh=efBe5EDoJOkmAAbMIPruqDIB07/QgCmMZUCVpAOzTto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cc1hyfgKGF3MBDNftILL++LSGD3NIBzReeYBgR6PaVPn0PXDUZGCBghqFzt/s5WwrcVlqzB6ZRascxd/X9YTToFFZ/Osnn7U32hs4qVJCax1MC6vh7m5DBsB5lbN1bzkmfU9eXNB1zqZHjscwvA/ceX8Rzxh0PgXKdZdqODpm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I2lRGJfq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I/Fcsian; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmtqd6zFXz9tTj;
	Wed, 15 Oct 2025 16:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
	b=I2lRGJfqsloGT2SHdY2M8bMV7/q4Pr59f484nUVBeklXjYgpLKNPtR3atxbCXVW/1M6/d1
	//HA5XXVaNuD2b6Enca6KnfDPJxqBmUJVqa4NOLPhPFCNkGxeddmE1IsXzMp3cd3fDxZa9
	4Wf2yOBB5cqHG01UPn+ngvQ1D/DdhFnwzrgHDLLlrUCNHJ2+CF+eucPncmiU2dFK1Xd5zj
	1bqiFG5NNt+0uzUK50KJiBMdN5ZwIGz4mp4wdPyVgLVCJat/0ddlHGrXzVsca75CD+dH9o
	jexbeP8s6jXf3KHK5o6c3HwCeYSfw964x6dFHgdaUjHVmUad+JjZ9p3epDuIHA==
Message-ID: <78249155-c90a-4c33-8caa-d79d83171551@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
	b=I/FcsianBv0Nxyf1djQKC/ndDM6D04GOPsXWCbJsRR8sd9AASeOicPZ6iFlUcdZQ5lOzOD
	Ja5w1TTbFN+8hn/CISsFQbHxB7aDwsVIp1/ltJEvascotKjnWLppiDSkL0ALI5UeGqpeDJ
	VjQca0ofS305cN2uQPwlJRtSOCiviTS/QR5G0ui17dOZgAUEzdgfYD5NVntVYPWcw21Pz1
	6LzaB30f84Cgzsz1dU5n4QmbfXG9yQpY+e8Jtp/H2lEvSCoD+car8jueuek8SJfo4QkP1S
	Yqi8gLvqHlDHg9MF2IAX9amcKfIRtY0TXLBtsfkM2aIM04bBzGFYS5+lLWccYA==
Date: Wed, 15 Oct 2025 16:32:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
 <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
 <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: c1dy1jmb5s88yb7q9s43rwqiniopzzh7
X-MBO-RS-ID: fb5ef80d27592a90e0c

On 10/15/25 12:55 PM, Matt Coster wrote:

Hello Matt,

>>> I see this pattern used throughout
>>> the Renesas dts, but I'm just thinking how this will interact with the
>>> powervr driver. The reset line is optional since some hardware
>>> integrations manage it for us during the power-up/down sequences, which
>>> appears to be the case here with the MSTP control (from my brief dig
>>> through the Renesas TRM).
>>
>> As far as I can tell, the pvr_power.c toggles the IP reset after the
>> IP clock were already enabled, so the IP should be correctly reset.
>> What kind of problem do you expect ?
> 
> I think I'm just being paranoid about the weirdness (to me at least) of
> having one device be treated as both clock and reset line. Assuming this
> is tested as working, I'm okay with it, especially as it seems to be the
> norm for Renesas.

The combined clock/reset IP is not limited to renesas SoCs, there are 
other SoCs which do the same thing (Allwinner "ccu", Marvell PXA 
"soc_clocks" , nVidia Tegra "car", Qualcomm "gcc", Rockchip "cru", to 
name a few). Usually the registers which control clock and resets are 
shared in the same IP, but they control different (possibly related) 
signals in the SoC.

>>> Related, see my comments on the bindings patch (P1/3) about how clocks
>>> are wired up in this SoC.
>> I tried to reply to that one, hopefully it makes some sense.
> 
> Looks like we've figured it out there, thanks for your comments!

Likewise, thank you for sharing the clocking details.

-- 
Best regards,
Marek Vasut

