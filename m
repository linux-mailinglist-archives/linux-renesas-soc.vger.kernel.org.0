Return-Path: <linux-renesas-soc+bounces-18894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00CAECCF3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 15:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21ED3A7D04
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 13:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AC3220680;
	Sun, 29 Jun 2025 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GMDMXBJc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OOsSovNB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0601E412A;
	Sun, 29 Jun 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751204465; cv=none; b=bw0kclK9601wosKde0vdtXhRXoVcyaMH9XtGpKeAjLqjDmVuvM71u9Id7pS4nMnfAkd+WJOWmAavSLQ6XcpW4lcXD7Ewdl77WswBmJrboL6C3wURYaLMs9tTta+yC/zTNQXdRHMYZGXWsYQaseQKfPbX18z1uZNK7M/lH/tz+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751204465; c=relaxed/simple;
	bh=ofylXM0bNhc+0Hn0xsheBNV5v7fT13QC41IvHArub2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fS4sfBpZsudRe2pbIVtfYz4cOzjRWlP2Tyy0GanqWPQu6rk6OpayjaOBcAmWJQLTo5pg5ubxXYW70v2h0pKLluXJsSNgNYCwDGg8iRzjOgbM8WcW3kwcWaT3OgoW9A9uWe/aFr0wdg20u3kjIfE0Y2fsiXCKNqboLfZCsHaBc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GMDMXBJc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OOsSovNB; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bVVmm3fKHz9ssQ;
	Sun, 29 Jun 2025 15:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751204456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLaYRknvNSB2sQwEoSd6wEhEpGLT7/N8YCWa8FD45fU=;
	b=GMDMXBJcxiLTbTv1/l69bTd2kUro3G4F7VjfiMnln3T2O5uXmNEFgOvIU1yph+1848uTvD
	TYOZUaDHGgnqtGQ2qSbjeh/NInOUg2kLdGLAp6n86AR8rpdQz3lOxwQKaMd+LWDs7sXmt8
	PUqeQG6GNDzykkWVHt9+jIIWSrhVO91A11VmFnRAF3VPOEw43yteq1o6aaOlk1sF9e9zSP
	qKBKzUTiaaDc+q+uqbmkX9JVnUOTgwqG2mkfh3ZqD95UixqsxyYKA2I5cm224QoXMLfi2E
	ZbbJJQ/ASdnTgF8efy46sDNoTOvdRbzkqUMdvgLz4sJMLEHQ6rbu7Y8vBWmPag==
Message-ID: <917fedbb-06f3-49a7-8d80-bf6834de055a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751204454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLaYRknvNSB2sQwEoSd6wEhEpGLT7/N8YCWa8FD45fU=;
	b=OOsSovNBiOVDZIXOC2LbKpQZYCY7J5yGHDmyBkHFyCaYUzXegwCgl6kghOhobIAYq8niq4
	18IoD/JjRWJTmBaNqHhnDMpzgpFDt/pvQktxi//heHqOqTUxYTw7HZY+9sOkBL9cncK6l4
	rIJRqhEL/tUK9zSOWRS8gjPlLwQrkfP/oIwoi/MGLffjpGHKlbtyo6Vs70ixyT+50gXzTD
	utUvj0yL4PYkYQvAwgwvHx8ZYb55GsU5DAhZKERJ29GbSlcs9fJ7FDDgTN9CEjciHodE0t
	YELQyxtvIOtPdF/bE0OF4gTVeKSjdd3g1m455PSSgJ3HcwdNAJHkk+4CFthO8Q==
Date: Sun, 29 Jun 2025 15:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
 <20250628215337.1688969-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250628215337.1688969-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 581c28c6208c7a9478e
X-MBO-RS-META: ftq54k1q7pezt3h8kkumprpox95d3qh7

On 6/28/25 11:53 PM, Niklas Söderlund wrote:

Hello Niklas,

> +&{/} {
> +	clk_cam_j1: clk_cam_j1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		status = "okay";
> +	};
> +
> +	/* Page 29 / CSI_IF_CN / J1 */
> +	reg_cam_j1: reg_cam_j1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1";
> +		enable-active-high;
> +		status = "okay";
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	reg_cam_j1_dummy: reg_cam_j1_dummy {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1_dummy";
> +		status = "okay";

Is the 'status = "okay"' property needed for these regulators ? I think 
'status = "okay"' is the default behavior if "status" property is not 
present , so 'status = "okay"' is superfluous here.

