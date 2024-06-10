Return-Path: <linux-renesas-soc+bounces-6020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C6902A45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 22:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7102E28515E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 20:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1094E1DD;
	Mon, 10 Jun 2024 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDBskrnh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310D84D8BE;
	Mon, 10 Jun 2024 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718052848; cv=none; b=RSBwqTtT2qTgb0VK0MpgPEGsOGE4S2joWo16BUwP3Uqs81WdT89NCUsgSeDU7UXBTPr1+AY3+JziHoDyB6VvHYMP7VNXzSXMtPJ99cIR9+WoUh1IvDVi2mCWLkjJvbeb6NZQP6bUQVDgBulGuD87pipTYs3Yk7MTKDa3Fmx61wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718052848; c=relaxed/simple;
	bh=9DzOZmQjpktfQznnYQuj10wn3q7CxC2o+sBzzMxdbqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGaMrpo7w7WVSnGS1UtZKo1+IFAkiAPPRMUOva4WFzY6wxc8sNocEJ5ms7QhgZUzBY7WAf1ntw7lC8nMo15U33qwSTxQCIy+UYyAa2AXPVWzJGwOOtVTAeoifG/3wDCcmRAS9XMtFjz+ac4w34jRx5hKoR4ij6OEXnMNU0X3vWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDBskrnh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A66C2BBFC;
	Mon, 10 Jun 2024 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718052847;
	bh=9DzOZmQjpktfQznnYQuj10wn3q7CxC2o+sBzzMxdbqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDBskrnhFNvqFwfXM+aa/ZowHHnTtWHKgQdxfjMhzaoPTl7TgAdKYw4+f73vHsep7
	 kIWGn4yQD2icORVeX3VUc74+b+8LcbiI0BuwDEHHos2F2jNaPeF5MJsSkMQG2CxyGr
	 zZ1IZEHwrF8qcY7tB7lu6snnvldy59u0yR/IvjNmccx6qoE8GIXhgLeGW0S5tzbOo6
	 3Qcpj8mP6Id8yfA8ke8ac3OKoWlD0q9+AGhB051nWheRoAafDE4aCvZ9o7Tnopat9m
	 6OdefXbsLDzWkAnISa5DraaAN9DrwbvxFsyGRRVm6r72sOIFN0adblBlXueo7XbDxZ
	 YGQ1MTgbeho1g==
Date: Mon, 10 Jun 2024 14:54:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Make interrupt-names
 required
Message-ID: <171805284387.3066238.15673238620541550531.robh@kernel.org>
References: <65fdd0425be0cc1bae9e6f7996aceaa5ad34e510.1716985947.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fdd0425be0cc1bae9e6f7996aceaa5ad34e510.1716985947.git.geert+renesas@glider.be>


On Wed, 29 May 2024 14:32:32 +0200, Geert Uytterhoeven wrote:
> Now all in-tree users have been updated with interrupt-names properties
> according to commit 0076a37a426b6c85 ("dt-bindings: timer: renesas,tmu:
> Document input capture interrupt"), make interrupt-names required.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v2:
>   - Add Acked-by.
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


