Return-Path: <linux-renesas-soc+bounces-26887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47436D28067
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 20:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EF653084D41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 19:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D619D2F1FE7;
	Thu, 15 Jan 2026 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ggALHCEd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87782EC0A7;
	Thu, 15 Jan 2026 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504824; cv=none; b=qjmBQjqzw7Sd8aBdg+Y5pc3IeR0g1lItYszUNXP1ZDxKiS1Y+3zpJ5F2IdXuD8P1vSMwmRzS4MMkwUGFdOBDehlJbwLhjLb5LREj3UBX2ldwlzHXOKQW8qX12fjFrtYxM8d5yr7R/yX8IXIntomMn1YGs+lsFdEgIqmGmhPRInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504824; c=relaxed/simple;
	bh=QAaLGju36I3kZzHjDPheeHO6a3jwEpfOoV1vCT8kT/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=su+R2ym9y13ubyQrJ00pd/HgEdCUjDmduEkICC4qAZ6OiUVZz8M4wCFr6+aaB4tSBn/8qfVAtqXv+bBsC1shEryUXOAkLke2H9GB0n+KVlfEgSo0GS7gUmcVs5YntfwPuK9BkWvBaQ5Ur5Z4CyGtsiWvRKBlREYVyf7/wa5+1CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ggALHCEd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dsXr15RVQz9tDR;
	Thu, 15 Jan 2026 20:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768504817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4fJp9wbmRI1vmPAbrx5E9O/lqTVncJXTTCym1eiIps=;
	b=ggALHCEdtM7NcWEy/LIWICqAGbbnkDV3aCDwdbB+blQ58j9V1ZoauYI2fBb4Q21SxMKTfn
	eipkD+RBlBujcFWGe8yusmki5H31ndlFJUMRHwnUKstNuuv4Wza/A6nSL4Ux8Srtn9DXiC
	ptHSqFvKtMmkmJSu7DaNjK5HJCuUrqPQOg/Zf8hX4jVTZBpZ1LtOANWXRtcToRpP0nIJBM
	59iz2fcIVXZpP5IcHStCiH/nkvKJPzOisZlFdN865VphWsiOQY5Yjr43PTiL5poH110cXb
	NvmJUdImwHXq4/IJqhe86h+olYyyxQ0y+zF3RrM1KswR9vWNmFR7Vp22FelXOA==
Message-ID: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
Date: Thu, 15 Jan 2026 20:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260115174047.GA930768-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 744ec2472507d528058
X-MBO-RS-META: qcfhjoyang9zs5kdamujjdinfhhwheqm

On 1/15/26 6:40 PM, Rob Herring wrote:
> On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
>> Move the Waveshare panels description into separate document, so they
>> can be properly described with compatible = "waveshare,...", "panel-dpi"
>> and attached to "waveshare,dsi2dpi" bridge.
> 
> But why do we need "panel-dpi"? Adding that requires changing a DT.
> Can't you make the kernel handle these compatible strings as a
> "panel-dpi" without the compatible?
I can, but wouldn't we then miss the more specific compatible strings in 
the DT ?

compatible = "waveshare,13.3inch-panel", "panel-dpi";
              ^^^^^^^^^^^^^^^^^^^^^^^^^^
              this ... would be removed. Do we want that ?

The other option would be to add the timings into panel-simple driver, 
then we wouldn't have to change the bindings at all. Maybe that would be 
preferable ?

