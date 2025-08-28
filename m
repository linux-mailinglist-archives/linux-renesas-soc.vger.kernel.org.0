Return-Path: <linux-renesas-soc+bounces-21020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DFB3A4E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 17:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE73D1C81CA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 15:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF1424A051;
	Thu, 28 Aug 2025 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e5TFz+es";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K9T4V8hr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12B13C8E8;
	Thu, 28 Aug 2025 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396056; cv=none; b=rsXqhiUyHelZhuQaqgPtRs+khpcAWzK8Qvm8vL6JSeiRzzW5WGymCtBIa7MSzbjF/dpJmlvw3YQVJSj1F4aHa7OgGv/l3bRlkRw7R9/ajDiD15gWjVh7I4qr32Prjz6hXcRfptTLEe76qSrREqGqsYLzYUhNlKewhWr+JPlEXEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396056; c=relaxed/simple;
	bh=2r8JuaQhwU3JQVqoVpA5EK1c+0/BR4u5T9wwerVzMJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BxosJibRWgX7MeCNNGmrNplHWPk0ubOwA1gt0lpC4XPCWTNJnCikTXsfYAiiatYZ2576SuPu0Rw+k3iUVBe6i+6T4dR07dHuXWoB/wRa/DBLQ/j/KTHGpDSyIpSfM2hsrRmvbmZiB4o0NHQIoQIdMq9Oc4z7jucYhyc0DdGxpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e5TFz+es; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K9T4V8hr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cCQl24qzvz9t27;
	Thu, 28 Aug 2025 17:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756396046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WadXZL4xRyYkG9x7mH4IyqdTnF/zmwImPo5Ep8A2GS8=;
	b=e5TFz+esyDDl8FsR9REAo2FDXD8erHIhmjeFTRYYViNPPvjUJDeTY5RTeCXQxftWoazkSI
	zknaeBGn20XYb7j/wi0bsHC1V8qCFeJ97n72zl1MmoNh51yfeJ/JxwHdFcSXfNl5hkxzPG
	ieFAqcDC/3oETZC53lTNN/LUW95USyyxJssU232fW81GjXIZcQfg5M2a91PrVfd1Q1+NYW
	2YGm/e5GCW3+bQne+Ze1E2F1c5EjAoSFG5m5bxUReQYuRMauIvE2oq8mG0tM16CZcKUMvf
	QjAfl1xfW7wYMkyV33UAcj6RxOYMXulltuvI0OCgvoLbzqXQWeEjQCKbMMhc+w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=K9T4V8hr;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <3ace8875-3288-4498-bac7-0fab1769a248@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756396044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WadXZL4xRyYkG9x7mH4IyqdTnF/zmwImPo5Ep8A2GS8=;
	b=K9T4V8hrNi7K1vpFzvByrvt3YMIQaAsfi5Livr4xk1HBKlPIfhgtgnF/T86xLbA1vONewV
	/pWD1JX/Zi+KqC1rwzbM/b+DJs1n4/dXiBUu3VxCeKNCARzZnQPGfIm75Uu27Xt98tslkz
	YfXt5J0eel0T8lBK9wn+Ma0g4MK/aWbSJGCu/bFujHgUXgrhmn+rU0+56BnYNKHywlLLzT
	/S++XoLBCl1MDObFlVKDhOxpyyX0L3jy+aT14DRQCKUbNz2MahGXK6hYlKrzN+3XB7Napb
	1oSCiPnMKVsvUJKKDBab2QQE9g7aJ/tmVOrskxKie61KRWJmJX1Oz/ZfIhb9AA==
Date: Thu, 28 Aug 2025 17:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
 <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7754e297abe6cfc53e7
X-MBO-RS-META: wsc18webdw8uqp3e1s1nq3kgytro8sgp
X-Rspamd-Queue-Id: 4cCQl24qzvz9t27

On 8/28/25 12:14 AM, Niklas Söderlund wrote:

Nitpicks only, see below.

[...]

> +&{/} {
> +	clk_cam_j1: clk_cam_j1 {

-clk_cam_j1: clk_cam_j1
+clk_cam_j1: clk-cam-j1
                 ^   ^

The nodes in Sparrow Hawk root node use - instead of _ in their node names.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	/* Page 29 / CSI_IF_CN / J1 */
> +	reg_cam_j1: reg_cam_j1 {

Here as well.

> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1";

Is the "reg_" prefix needed ? Maybe "cam-J1" would be better ?

> +		enable-active-high;
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +	};
> +};
[...]

