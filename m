Return-Path: <linux-renesas-soc+bounces-18870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92AAEC1FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 23:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 963817AE070
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 21:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7186272E6D;
	Fri, 27 Jun 2025 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIbR7wJx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AD272E65;
	Fri, 27 Jun 2025 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059427; cv=none; b=BlpaS7YDy2Oi/fVTVOaSnLWpH7NHr/7wEpeweqN+MR+jA6PKOOb9LrOzyM7mQUZYoBAO3hrrlvH/ng0wfm25YHs2p5QF0/LMMOms1lJ87qltFveJMeXCO3X5EyKQwhA/JFTJMpSAG+7EXnx76v3CoVXNiSjokZ4SIWJTgf0NVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059427; c=relaxed/simple;
	bh=fehMFCUH3KhEvqug73PruZYf0DWjeC5huA3vs4xluvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSnA2wyig8vVJiQVZmaK5QjpMC7gIZ4dzH5414pw3KyvymFSdU9icQUB7FxhHD6cnsN3PYd2C65MKVzc4++zqCPvWBjfBSRfoVYQvck9FwHfLsALd03K8PABMaKiEgHVGr3VOIqjH9TnngLKCWjnPEV0MPIoesQamcN5oiCsyhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIbR7wJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D36FC4CEED;
	Fri, 27 Jun 2025 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059427;
	bh=fehMFCUH3KhEvqug73PruZYf0DWjeC5huA3vs4xluvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIbR7wJxsoQ2rLO7sLKmjmIZZldXRZBpd87m1W75o5prHIx+izgNVU8bZEdbzHXBW
	 ZZUYGQDdAIzAuzzi0XEi9VaUTeeVExdf2IPFhB1Ge4Wdf3EDci/QLLCasu040YZwtu
	 DQgEGJYMjPwAHe7CdZBm+U+VeYgOIje//Aif6Nj9ziM+8vNih8PySLntqLX7Q9eoyh
	 PuIKXHQbCUgaQpzmE96lbs569yqxH0HxBN6XkdWkz5wRvyEW/Nay8y6hB43LSRgDBh
	 I+1HBRYDt+kSW0TS6byUQuQ8n7EAbDA6PKNXZqQB2O5+fENwExEpF7g9sTx+cpRWb4
	 AqLIUIjhKGc/w==
Date: Fri, 27 Jun 2025 16:23:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car V4M-7 Gray
 Hawk Single
Message-ID: <175105942561.167972.12432748886572793893.robh@kernel.org>
References: <cover.1750931027.git.geert+renesas@glider.be>
 <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>


On Thu, 26 Jun 2025 11:51:32 +0200, Geert Uytterhoeven wrote:
> Document the compatible values for the Renesas R-Car V4M-7
> (R8A779H2) SoC, as used on the Renesas Gray Hawk Single board.
> R-Car V4M-7 is an updated version of R-Car V4M (R8A779H0).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


