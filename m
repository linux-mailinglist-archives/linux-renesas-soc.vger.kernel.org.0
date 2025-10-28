Return-Path: <linux-renesas-soc+bounces-23736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52992C146A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3ED13524D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DC7307ADA;
	Tue, 28 Oct 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XgoTuCBP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87EF303A38;
	Tue, 28 Oct 2025 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651682; cv=none; b=HviiWf+fTK99LNsT984V00Zk3eqEZpolf9kHebaZcsBgQekOCpC2GZEOzuYluc8k42A/HQJSxY07fQp/lp978CPlvUPoxXXyspZninmMX8wb/1c7YJNaOEoL3toMerP2rc3ePXVeiYB1L5Oa9hIevRlL/5tXtCmB9cjrYMfJeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651682; c=relaxed/simple;
	bh=lIWN/uXXnZE+dReywDZ+dfXq6VnLncSyo8Te6h8L9T0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCwAeA/XYWAACo9fgW88Mn2kLOsyXCDBZBDYXFhyfwiTyJE+/BABfuptOHGTxtuvecGUsvzdZaQwmfiCKey8cSPxMonBx186eoX5esYpsZw36DTMmQ1DQs8cM9RUj1AxYHSJuoXV5Pxtt4Wasv/zs1fsrKl/QEZdLNbW1ABKuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XgoTuCBP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBDFC4E41392;
	Tue, 28 Oct 2025 11:41:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7CD8606AB;
	Tue, 28 Oct 2025 11:41:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90117102F250E;
	Tue, 28 Oct 2025 12:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761651677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L6ull9AD4o1okfpG3ooOsDENdDp5Rr6itgIS/m4js9w=;
	b=XgoTuCBPmINONXuItzm0D/pt4I/NfGx1p7Qrp4gAAjr8UFCzQwqe09avOM0JuJQYerRsg5
	6XTxIVGzrlFo4byQ5oy2og4gng4AuBfY6lI5fsz2A/AZ+/HPfVqq10t388FBNM59zPthdv
	tB3DVKVEa/J6bM/N46xjc22iNe2sLwLdUN/dTnDfx54Qv4gVHyZv8csLcZk4eJNplddIFZ
	pDBEehKqI8gZGq5gOmD8axOupsmjvTd9/RFhvcZVewjHPFHae3Nty/VQ3Msib/zRA2DjtH
	5NHsgmwlGU+yNhzL3rPUoYNoX3DFF/XDt82n7CA5ybdvaFiaqpevgFe1MggqYQ==
Date: Tue, 28 Oct 2025 12:41:09 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
Message-ID: <20251028124109.3fa9cb36@bootlin.com>
In-Reply-To: <aQCIJrKKM34FH3C3@ninjato>
References: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
	<20251020103529.0f948c67@bootlin.com>
	<aQCIJrKKM34FH3C3@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 28 Oct 2025 10:08:54 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Herve,
> 
> > This v5 iteration should impact modification done in this RFC.  
> 
> What do you mean with "impact"? The patch works fine with your v6
> series.

Oups,

s/should/should not/

Sorry for the noise.

Best regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

