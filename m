Return-Path: <linux-renesas-soc+bounces-24088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ADDC31CDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 16:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105961895F43
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 15:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F58256C71;
	Tue,  4 Nov 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AMQBiX6x";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DNTl9Vzb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76C2566E2;
	Tue,  4 Nov 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762269691; cv=none; b=Hei4jCmpQTONpfO8CgSWR0Xw8sIxdvQ/NnAgAGgrzm74npWMQ/+6Ln9oU4/+wGv4cKjjShD9kUHAq4m9MXl6WN9NkDId76+9l/sr/41dfql8vW4qUm54Fs07Llro/Xajnbk+3yN8EDXzS5BdHXnVoqQ3qPdMnlSKxYXJvKbbL1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762269691; c=relaxed/simple;
	bh=hAwQ+RV6pwUUPD+i9r5PmVExxMNB0uXYamh90bxbKiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkKHHXv9RboW9lw7E86exOjtrycMi639e/XJkHpNzVWrcPck4/ARQ4/+hhnYBxEAZXviXcZwA22DvfFgJiSzaucI6Y7c7wZmdA/VMOmseRZChJQMhow4qvOhStdSn/lskOeIj4IPVrxA0XCtYuTR08j/u96ZYSqmDy0tnL7Tef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AMQBiX6x; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DNTl9Vzb; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d1BxY5y00z9tsS;
	Tue,  4 Nov 2025 16:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762269681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
	b=AMQBiX6xFZmcOncbHcyQ7z5bWygUWTzLAQc9ScI5DoR8WB2yM7OVRybP4riyHquQeTzRrd
	mnNWOFAeyEOX1wrRHd0J9ZNlnghIuLmwFmQJNdNlftDV7nye3dGWJzAvqtrMy/igEDDSh8
	7awOjrvcYo5jGPEamJZq4VTs2p7qxIhk8VZyspINdyhWvhFDPzZsrxne9aQ52giWq26bP9
	aDkfm2DFbHBirF8aJq+rqeOm5eMzQYR42D+6DN4rvHFmb49lJMDPblJxCmiZUidac2pGQO
	yerbz7/AttZb+yUXo9KK70V6eSfeQ5iJpes4ltktGO0iSSIFN3xtzawuy1BJ1g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DNTl9Vzb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <d37adc12-4ba8-4f0d-aa9a-9071e153917f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762269679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
	b=DNTl9VzbnMDKEG5USWEmX8/muXmK0aVd1LEOgDS+SbEUWHnql/Ft1diJV4ig6Z0VoDwoQ/
	D0HWfETWpmc6NcmUeWfhyHV56Ls2or9E35CX9vQFRMp4AV190d703EuO8BPHB3bApp4I4y
	77HD78UA849bddwVTApTilR5PJ6bNsFwZlhzhHVOfEqTMLiJpf7rXTgWTbta+bvAmyIrcH
	NivudVHkKiKDhbBVwkt9Ojh2sMk1RjobQU6HnyCtqfvuUe2UVSDmUXvyU/dwHpPydvnAx2
	jk8COqU7wpQd8fwJL7/oa7DVwGVfwh1yWXTP+PZuaVNmJcFLOHcKB8jyIchnXQ==
Date: Tue, 4 Nov 2025 15:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
 <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fy383rnxybucsoo939z786g6im7yf389
X-MBO-RS-ID: 3280eb3815e7cec32ef
X-Rspamd-Queue-Id: 4d1BxY5y00z9tsS

On 11/4/25 3:06 PM, Matt Coster wrote:
> On 04/11/2025 13:56, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> 
> I'll take this and P1 via drm-misc-next later today.
Thank you

