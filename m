Return-Path: <linux-renesas-soc+bounces-25368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D6BC93DA1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 13:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AA533448A0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 12:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27463090E5;
	Sat, 29 Nov 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gca1UDQD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCC278F3A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420200; cv=none; b=OyHge7B3Se0irZZa2cwOIfL2+VYd1NfU53Q+Y4Epnn0Ky46KXYHO03TBY9fN0xbg30SQnh1fjEAkJk554ZIBZlffR20oF0ARMDUGdEe/+JxHAIP4C6vfDZ+WMY6zZ9niMjjbfnlPh6rYl2LBhyUG6dxhjeoiSRSAa3Tv+dcKphE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420200; c=relaxed/simple;
	bh=9A2AqwKdovakvlLO6/Zmop5/nx6YR7w/FapYYosxexY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDlEyDn2wWZLhVqactBkrtkTOndNVsGHIz8SNn1FL1gqWjm8lVnL3TrrLEtOKYeiHlZ3Cj+sRvbtyLVeKQlNFHxa4IaX9NO7suOFSzsqGI4qoPEw78/ZVT1LpGuhx2pQbM+35mkedwTwpu1DvCUYIOarwDDLTrdemrF44dgPcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gca1UDQD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C653D4E41971;
	Sat, 29 Nov 2025 12:43:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96D1860706;
	Sat, 29 Nov 2025 12:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98574119105D5;
	Sat, 29 Nov 2025 13:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cF495nBrHIfBkXL9oefmRkF3Pc1dbM6yG5KSpqEMViY=;
	b=Gca1UDQD7TLeq7Qici/VXubYij2/T7ZJQ8kHwuHV87ckdU2QUgNlNdDI+dQkTY74JN+pN4
	Z06KlC/cw+DNA8ZJcyZmUlMLha2KqbjAhBvoruND8CAmP7yCA/26NA3tnfRfZ/Sj5E27qF
	0b/zV/++7loCQQhgvL9MvLH9Vlzgi20hs6a8GYObuNPYXEpqL8RLmpZ/pmh3R6NtuBN9mQ
	RT1c6xUSRcWtXiJ40CGg3PIepV33+1Fz++nG/PKT0T2QkzKhfA/KIKw0Y2eWK61+UhIjBQ
	ltSFuOWMlrQKD9qhbASuHATRzdhZs9aCj8Yvp1HxXVE/sdAhsr0IV360FFK//Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at,
	vigneshr@ti.com,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
Date: Sat, 29 Nov 2025 13:43:07 +0100
Message-ID: <176442014544.45479.15790176921184531760.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251123163551.1781-1-vulab@iscas.ac.cn>
References: <20251123163551.1781-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 24 Nov 2025 00:35:51 +0800, Haotian Zhang wrote:
> devm_pm_runtime_enable() can fail due to memory allocation failures.
> The current code ignores its return value and proceeds with
> pm_runtime_resume_and_get(), which may operate on incorrectly
> initialized runtime PM state.
> 
> Check the return value of devm_pm_runtime_enable() and return the
> error code if it fails.
> 
> [...]

Applied to nand/next after fixing the spacing, thanks!

[1/1] mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
      commit: a3623e1ae1ed6be4d49b2ccb9996a9d2b65c1828

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

