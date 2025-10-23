Return-Path: <linux-renesas-soc+bounces-23511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC8C01840
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF18B3A350A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605621F8724;
	Thu, 23 Oct 2025 13:45:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18142309DA0;
	Thu, 23 Oct 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227147; cv=none; b=rvu5DzklQ9LlqcdtNCac8YkBcoEdb+PrnkMZWcfWH8qdpuTS5O/VJ60yD/jhKPICB8Z5Hw3zJvXmqUWzW8o2AqT/jOwfjahzLUDdnNap98dlfOl7S6MPZHw0g8MVzMmfjBVV52J5ujrUGrQrjQBGCZG9/5OUlFDIwn/MhQCgBF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227147; c=relaxed/simple;
	bh=EzB8z6SVOBFC7eftKCf8lx4Eqsytl0lKiORuv0MEcps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFhlFF6n33cpP+AfnXObqfrzV4osE3GZJW2qf8DYM9oe8ei2RhCrTcx6ugqJ9lFg4HogiK/D/9SNC6NduzmceMifk4l8f3LnBxkgAN20uLyNCsSwhUTrVcjHtdhy0y1uFakPdbM92IkLLxV8Bz2gFV/6jhwqLVlKNE48zY/UdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E8F1516;
	Thu, 23 Oct 2025 06:45:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF743F63F;
	Thu, 23 Oct 2025 06:45:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:45:32 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aPoxfH_TLrsMxMVQ@pluto>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>

On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.

Hi,

..indeed I was thinking a while ago about exposing the existing force-polling
switch but in my case it was purely a testing-scenario configuration, so a
no-no for the DT, things are different if you have to describe an HW that has
no completion IRQ also on the a2p channel...

...having said that, though, usually polling-mode is reserved to a few
selected commands in a few chosen scenarios (as you may have seen),
'carpet-polling' non-for-testing for all the commands on A2P seems a lot
inefficient and heavy...is it really a viable solution ? or these
systems use such a low rate of SCMI messages that polling after each and
every message is negligible ?

..just to understand the context...

> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
> 
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks,
Cristian

