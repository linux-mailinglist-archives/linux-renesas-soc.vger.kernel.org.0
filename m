Return-Path: <linux-renesas-soc+bounces-21249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EAB41A64
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60CAE3B2265
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705F121A425;
	Wed,  3 Sep 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HcFGa0Tr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323512AE66
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Sep 2025 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892766; cv=none; b=W0HlJ37dVO7m04Qq5myd45eQnesc6yOpUSdrSFSo8LmFYucAcqf0h0vhCWpMoPMtQN54wy0jZEojdevPw164vvOoTBZXKULDvmzSUNw/Pst4c++uuTKecWFUqRYQgdFyyRjCU1p80jSFSD5CktM8pN/MZvtlT2XEvhPDKsplFkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892766; c=relaxed/simple;
	bh=mJEZezaaAvDWlpLgZGr6gvr2k1GiPwLmXdP8VleSAVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am8n5UPppOBBwztQn6HKc94ZmLDKZtDNHvIkKOBvxxO2RYFG3QnqQIPnaTmSZVBaQxY/HH1l7yG99QYT9cwffsrae38hEjDImQv0pUUEFiB+b1Jkc9qjy860pO0NmhnZUt3Crf5RdYsIkgHND/2Ar3JUT7Xw0AfHXANBUiZw/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HcFGa0Tr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qZD6
	3uFUUWm/vKdNbnOPDAIu7KIlkgvjimOu757PzOY=; b=HcFGa0Trj5A9lugbOuv7
	nAQ5a//v4VMybK49wDJ16RvfaBJRqz5Gc4hMYVLUwU4fuWIqXYNzIkB8ugrLOCuR
	zRzjJ1K3u4rhVCKCjFv5PQwxE80LdYfCT+wUcIsuXgRkMN6wdyVRshzoGBrkqb1h
	q1IkJQSdr90orGtWPU4blEZOluYp+t+7LbiaPcmzrI5JCI79F8GOZEjxg4BA8D8p
	LB1quYysEiyyu/lVvEM3mpR6jfRlUiYi23qPZCGy9yENwiFjmaMZhy3hvlWWCGUz
	HtOGfDjsQ7xCi6D/wTxJRgG3hlJm/Q+RmHDiPc2tZE6nIKS+/11l5NZr7zUWe2XP
	2Q==
Received: (qmail 3244023 invoked from network); 3 Sep 2025 11:45:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2025 11:45:53 +0200
X-UD-Smtp-Session: l3s3148p1@/45yeOI9IIMujnu+
Date: Wed, 3 Sep 2025 11:45:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain
 interrupts
Message-ID: <aLgOUGOp7Db0keZ-@ninjato>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>

On Tue, Sep 02, 2025 at 05:40:53PM +0200, Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Double checked with the original RZ/N1 docs:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


