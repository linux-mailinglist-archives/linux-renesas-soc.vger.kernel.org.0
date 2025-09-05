Return-Path: <linux-renesas-soc+bounces-21514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF33B46235
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CB8B5E0158
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A791271468;
	Fri,  5 Sep 2025 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dqkjjCxy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qiH5lh+T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F142226FA5E;
	Fri,  5 Sep 2025 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757096709; cv=none; b=outQ9Caoo7n0jzlsh9CbkRlfd343pUuzmYh0qoy3yvVTF3yJgkvq7TzxuzQ0OTVQrz+5bYFM4YSBTXPeKSKcw6Zb4NBkB0fHFE7iBA12IOCfgiu+QKWnzb5szpTA7DBj4ZeFKqh1Yr7QWBXQ9dgE25USx6VUPrLUeKM+Y9hUaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757096709; c=relaxed/simple;
	bh=OFQ/nAmHxenTNd4gIUlItbzWOwUP/FPr2psmSslZO6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCFEWwomG6sVNfrlZEIRc+aQIrVRn3ZjdNrnixJ5VPAhWKATezm9PqNjVkeE4RMREQVYPejJf5n8X9NDrLXebXRf1AbLsK+NpJK9EwUA3Z/xI5EzoBC0fz1gMJ7HKRcHCVZWqOYmwiuDWiuX7W+nusA5ph8PZD5LzcGOSG8zSsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dqkjjCxy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qiH5lh+T; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJPsD5ym5z9tB4;
	Fri,  5 Sep 2025 20:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757096704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gp4f3eHdfQ1nienqUYYJxpFqMyiWaotva3r4C/g2Mes=;
	b=dqkjjCxy5M18oj/8YlULNAcY9Djrf0XhsHzlm8/AQO7x03YtarRqEHj/ajVkl13JXF2Djh
	9iBw1dGQOtcr3yM+TATSdFQeLSr/TuSoIetiPxtV6Bj7ttw2PZHfAwabwi/aXGDledshcl
	7tC9Zx1c9kusFAF3Bv/iOpL9Z2P/o3RhoNfJd2Rzbv+iHSDRVNgGCCw6MR1zf3u/Vb2888
	jWfx3EU1HZn9zsdpNXIKxBR9mmEmqgwvTWLCVapaOlae0SZ3Aq37wrr4lpIn7uyaoiIcfy
	+bgH6GvRpX0vBeb1KXW97T3H50w6uyjIFjCDEC6IOS1IOsjg24Iv+L8RMeoVbw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qiH5lh+T;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <67648dce-379a-427e-8ea2-3eda7cefa024@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757096703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gp4f3eHdfQ1nienqUYYJxpFqMyiWaotva3r4C/g2Mes=;
	b=qiH5lh+TWr6uM3iR1xxhdiFV8E+h2/9MT0PUmexX+VuJ8qylgADLdm7A8W7WtMI9wOgBPM
	vc3JFRcNlSibj3u2fceQbCspsFaR1R3a0DyD/91D3dAAcqKgOwu87FMeMMtSRJR/ogau+z
	E5Kw0HoWSwCupIy931AXI0XmRG5EoaruP6CAIj6JZ7kAlW+xyT3SmXs8ycIk9ZkAuSN57C
	0lueYKbC5B8YYhHF6fZmdtxgPWNGtS/IKnGwchMQ6N/xYPVLb0tELJLydhwylTHR3YJbE6
	zbQj2sJ/mHC8zYLx4/XnVZ75xIO4LVjAo9aoWVjR4DU4Cit2RSGP6edTTFwawQ==
Date: Fri, 5 Sep 2025 20:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/panel: ilitek-ili9881c: Add configuration for
 5" Raspberry Pi 720x1280
To: Devarsh Thakkar <devarsht@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
 <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
 <c98e017d-5aa0-4b40-8ee1-5f58901b6c07@ti.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c98e017d-5aa0-4b40-8ee1-5f58901b6c07@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6add872de2e58f6446b
X-MBO-RS-META: rcqs7mmjq3ohca6dme9cmfznm3ut8g6c
X-Rspamd-Queue-Id: 4cJPsD5ym5z9tB4

On 9/5/25 3:18 PM, Devarsh Thakkar wrote:
> Hi Marek,

Hi,

> Thanks for the patch.
> 
> On 05/09/25 02:26, Marek Vasut wrote:
>> Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
>> based on ili9881. This uses 10px longer horizontal sync pulse
>> and 10px shorter HBP to avoid very short hsync pulse.
> 
> Is there a publicly available datasheet for the aforementioned ilitek 
> controller used in the panel, also does the same document also mention 
> the manufacturer specific DSC commands used in rpi_5inch_init[] ?

Maybe internet search engine produces some results from some display 
manufacturers ?

> Also is there a separate document mentioning timing parameters for porch 
> values and sync pulse widths that you are using here for Raspberry Pi 
> 720x1280 DSI panel ?
Nope, like most of those panel init sequences, this comes from display 
vendor or downstream kernel forks, in this case the rpi linux kernel 
fork. The timings are slightly adjusted to avoid this very narrow hsync.

