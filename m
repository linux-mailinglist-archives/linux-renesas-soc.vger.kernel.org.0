Return-Path: <linux-renesas-soc+bounces-24194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34620C3860D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD22E4EE387
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1302F39D0;
	Wed,  5 Nov 2025 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tw6ATdWP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB3FF50F;
	Wed,  5 Nov 2025 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385582; cv=none; b=UwlDVnPY5Jdd2mLiafy649Tr77vfJdDAmGMNBSeW5mR+ug0WEIrbHeQcT3OdT5xiJTcTUOs6QtVqo8gT9GiUlMBTOWenUmJqlOu7dHnTGZ6SYyP3qLaPpbINhQNC4+f28uhew2mA+LGIrCzCHnLyyZGdrGTTfWK79rWyI2kLfE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385582; c=relaxed/simple;
	bh=di5rYJy6ynDlABD3f2RailjYknykJu1afcugtm7tqWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UJboxwOv+7G2wbx230TLeUHR3v0CR8nK3f+PlHimDySw/7sckrhIAdyQqust+nyxcNzTH0bXvbEKqvkO7Ioh1tVyjLMZm/863go/QL0OThtzGQ+QlSbvD/jqeUJRxXKpmduwDjSIjpjwRelrIy5gL3bVn347mOiGdhG68MJlj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tw6ATdWP; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d21pD0BB8z9t5w;
	Thu,  6 Nov 2025 00:32:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762385572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/3RC/PHIN38FsdopzZNRq8haSMx0k2qjvsjxRjjjsU=;
	b=Tw6ATdWPh9ZyqNx0gVea2+ARD+hMbcTfT5gGqiYthg2I6/PSMEdpsOKv2qdq7etkiPGFn3
	R5mUsaQPSkWrvapPvfF2SH94GZRPgIn9fJlLDZrUa45/Kfeu0hxZ/2l4eUDh5kzuUAMrgp
	j2iEgPAY/STrLqgv9G/yIgelsM3JTTo0rSLQuyB9Pmg+NYQMmrvOyKQSG8joq2d+JD9A3D
	RiP1s6b1hsU4cwckovfG/JOTSeMenggNa9fkpZ84Sitai52G2KQtbeVIHfrlmpR1rEYDeJ
	9Huyeqjs89gxubuATVWH0ysFhmyCcLMlK67VVCiINAZQT4nZapK0YPqNDT0sQQ==
Message-ID: <72da91ef-7c99-4e77-8b4a-ad9486c517c5@mailbox.org>
Date: Thu, 6 Nov 2025 00:32:29 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c679615c2a273780b96
X-MBO-RS-META: g3f1r5hd8pzckf3yqgoeg4ya5r7omhde

On 11/6/25 12:27 AM, Niklas Söderlund wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

