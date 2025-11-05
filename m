Return-Path: <linux-renesas-soc+bounces-24193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3DC38607
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A48F4E6ECA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C268265629;
	Wed,  5 Nov 2025 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X9MfwtgB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BAF50F;
	Wed,  5 Nov 2025 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385580; cv=none; b=iSJn+clmj5yAMYGcBlW1q6uj64rVABopgaLYvvdU8B2pp/dfRNWxFQx0CKDQ0VJLdiJxN7VdPAVaKWgI4mjsdgP2wzZ2HLusMevYJlwdCcnjf7y3a2a/eXzT4vYKHiyvt3tG4BBi7uYRhzQobSEmhEJNkGJ2VYacqQHh/ULSEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385580; c=relaxed/simple;
	bh=XcirDM9lnRl9E23E0J7h37hYguMJdaUhrh7WCPETToo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j6U1kMLlSVVcO5THVhosne2JPEUq/4CQWxT3OMcbZ3ZVkYVbUUh/nrJ6B7cXLWsyx92O3Ss8Cc1EoHIjTY+C9QzuI5BGPfA/tgnWJuv/QGKbjnN9VKDTQIM3tgEZ7wPT5zoFd1dxCHBOxUMsgLrMEHmEMf0eIeByb0CRUDil37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X9MfwtgB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d21p906j6z9tQ8;
	Thu,  6 Nov 2025 00:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762385569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhjuXbnLPG7g8iLkmYybKKB6VGouxI2hx4THyw+BwkI=;
	b=X9MfwtgBORoHUchTfERdV9vm9kRcjEZSgBSNZcTfOTiUNevhmfuGq30ormGP+3QOo/A4We
	iGxq44zl0JzSzKWVWwK33PLnMkOXTCzTr4FZ+HNLWCFifYnnlB9Xch1Z60YxcOim6BBR55
	xJ9K5WsmrRgiLjLaFikuuZ29PVU7BWroPI2NEAej7wLfvNdyuQPFvHcTzeSImHzAWEQwyV
	ZfedZKDasNLfVsW5wMIy290y9qbj9NcHjIUy5NhkZFO8WJXIkEq/vS/h2v+k+oaWRRsYHA
	4CK8FBQ3TxQRkniLtTNxW+aaHtGPQmtAzeTXr4IobrZ+1qHizKttEIo/RagtMw==
Message-ID: <1c954c7c-e975-41fe-8af5-6e5517bae96d@mailbox.org>
Date: Thu, 6 Nov 2025 00:31:45 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
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
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fhkup4t3667wd5uw7hq3k8fmmzqjfsh7
X-MBO-RS-ID: 09589ff907d9f8a2b19

On 11/6/25 12:27 AM, Niklas Söderlund wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

