Return-Path: <linux-renesas-soc+bounces-19802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C708FB16E27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 11:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CAC61C2025F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 09:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6331E28D8E1;
	Thu, 31 Jul 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="W0kfqLOG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76CC2557C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953031; cv=none; b=hAxTUkTFVYDS0qaqHeJnvVko3Q66IM1t4+8Rrs15TVlyhLJgsnUKtZDTMMjQhRPe/a7ZlJA+F7YeGAHNKKQTOA1OtPO9gCNEC9LnoGLUodL4Tex3Pup4ANFFRKC8Pzc2+RehkrJg5t0zdznQ1b6H/sLxnkp5yHN5UfZ6s6Lqwq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953031; c=relaxed/simple;
	bh=7rTd5utHW/nYGWvFA+hKNX+qT1MZxJuG4OTdOsOWhGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIHCxNq2v59rbL8A+LRYg9XptO/gVr8p8v+73ra7HFmu2XwwH1anY8TEqWAhCbfxkTca4LIUF8pn7XuhzHcC7kRPi8ZX+UhiuXQ2PX6L/jygTXz/qkRpUs+Qg8w0Z1BDUz2ofWVoRDc2GdmrH3hgPKpwSe6QBDrC7Oc0yzraLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=W0kfqLOG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mM0S
	YcEmH+rkhJTkbsCQEMP7KWgfNw+z0fXf7NRQTAE=; b=W0kfqLOGdhib0oRQitme
	iXr7j7Q70IQ0j7/21WXdldyhIEjz9Rx2pbDiP/svC3kYVtT4MUhQ/SKs7Dupem3n
	h204xsS+o22tgZgdZCJUVuoGLftWSnfVB1bF+J3FCqzcJe+DNdE4CB59RrA3NcBr
	YyxWQ2e6rz0Ubgc3kLnIKL5nfYpYuqgfYV/NqdzDOouObn3gRsqFogX7UTFZtwAE
	0RY/oxu05JP92JQTzLmC/w9fcsvGqZrlj1cmWKviWFTP4wgAmjdn70N6OTHM5IL7
	9+CLtqlQWxG94Vp8HE4qgZFLGtpHUjFNr6ltSlUkkdA8ZDWhatXvABTFWqF44ryc
	Vg==
Received: (qmail 276436 invoked from network); 31 Jul 2025 11:10:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2025 11:10:21 +0200
X-UD-Smtp-Session: l3s3148p1@6p7GAjY7vOYujnsl
Date: Thu, 31 Jul 2025 11:10:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced
 article
Message-ID: <aIsy_L5Jns8x-yXU@ninjato>
References: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>

On Thu, Jul 31, 2025 at 10:36:59AM +0200, Geert Uytterhoeven wrote:
> Move the article "the" before the full name of the board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


