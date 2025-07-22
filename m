Return-Path: <linux-renesas-soc+bounces-19618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D607B0E41D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 21:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3303A7A6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 19:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD4128541F;
	Tue, 22 Jul 2025 19:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="geTbU4dT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890E285061
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212399; cv=none; b=LCmY9Lym5idGYtDg5iVpoebTZbb+TL/IarO2s9yeXLF1BqN4glLWqDD2FLmmX5WnGn0Q8VqSk8yW3kA2rCpaWYTRj+lYb8JwneiS0O8QUQKLbhZ4RlqsIDVgfMr28jN4g/oXXuUzVkNLemsyRpHP5jsHv1nikiLvY7ljZxBT14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212399; c=relaxed/simple;
	bh=mzSoIsEKCwpH21W7Py+zSJvqzc3qFVqilRY8dGbc6Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMxFXKBkQloRvg/pTH+gd4sbHPatGSip1OZ5Y2nGTAkfz5IMmeyPruEX1uNhaFhXTrsWgMMrCzYtvQHN8cAwudpjKamH9Ncfh9Rwl28Bu/N6Oi1EmaCeyTci96nheDSoFDS6G2sZ4tQDl/l8QxwA6CAkZcjvnOMs9FIw1plwWFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=geTbU4dT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=r0se
	VXBzF/UCWTab8iJ+6lvymXg4AvFvgAxbeeeU86g=; b=geTbU4dT4f68eCT1s3Xg
	UAtlpbyUwx5/XC66rzgaunRLiBOuY7IOmhQHpRjuVfC0K6w1y8ONrkHtjhvQDmR6
	n3kzGMXQaQnbL56mZARXvHhAbiv/Ku7ihz81fwkEmEhmedST7stJUO+ntsjdUkCu
	/ARR3xJjSOeN5u7LVi9UnHf4LAGDdNNJOCtJfAiT2VFlHrU11Hb5tSY/7vNgoK7F
	3alohpgR6Nk2qRJgi9Ikn6/rQzfwHcg9clVVIarBj9fqiC/02KW7w3P3rbhTdfdK
	9ohG+Yw9BtXTZg+nW57g8ruXv3Qwo4WTs2rTzsQn2IXPT8ZAuJKNsiMy/oT/SY6H
	nQ==
Received: (qmail 1431530 invoked from network); 22 Jul 2025 21:26:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:26:34 +0200
X-UD-Smtp-Session: l3s3148p1@lMf5kYk6zM4gAwDPXyBWAATEinPyanBm
Date: Tue, 22 Jul 2025 21:26:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Message-ID: <aH_l6rGHPWROE0mG@shikoro>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
 <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>

On Mon, Jun 30, 2025 at 09:13:10AM +0100, Biju Das wrote:
> As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
> bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
> During testing it is found that, if the DMA buffer is not aligned to 128
> bit it fallback to PIO mode. In such cases, 64-bit access is much more
> efficient than the current 16-bit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


