Return-Path: <linux-renesas-soc+bounces-21070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46FB3B9E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 13:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372CF467375
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EC9311587;
	Fri, 29 Aug 2025 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QRu0kv63"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F62288CA3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466674; cv=none; b=ML+MLQ5aUyTXwbxD9H4QLZwV9pz3rf9Y2MVvB2Zlz93oaGEax1g+fOoUGDxDmp9IMi8WjMFfHSzhoLGjyT/Lp60TZ0pbdz8H6HE7vdz0QVswalY7+LGI3dQg+g9Mwutl6d6bVn5M6tNv2LpNqsJymzw2rEtW8tEJiuIp/or5INw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466674; c=relaxed/simple;
	bh=M1XUOz8ZuwEoVQ3iEZsYPE6aj3HEGwKeJI3p+vmW7uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI/Wr5IZgnTxIfeEsodItjj/eMXhjv2p8n9zDOavH0Ra0u0ISGEKzoSvHkSrmSGhd3Qv8DEfQGtZmfbFq3ZxYXmEkw3N4AH/Vq1x2eTWi/S5P3BJgxH1kwFlsWpVSIg7qpFxQljgJK4tgeGLw90oT5IdLE7075aXMiLLM5wwcu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QRu0kv63; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=M1XU
	Oz8ZuwEoVQ3iEZsYPE6aj3HEGwKeJI3p+vmW7uc=; b=QRu0kv63jK2xAGj+g2EX
	Zcb+TzpScIYimGk2DF6JQV8rjB6oHu5/rnU7uxMzb7eNcet2a6pXilR/dzxNK97w
	s7GCriCdJaHnjSR6s2USwGzkJQbLQBA1sBPPEV3Etepi79uT7cnJQpqGUwAQv5gE
	83q4SNg4YvQHqECOfnB8R14lCEe/32aYbIK7Oo1BIps9W6mzxw4Cr3FSSZixfggn
	HMBRyiPuU7likrcfr+WXjdAY9hKINTUMwKobF95ZhbJbzGVK8GTWCSdlbdycB9yJ
	pZqAoyC7YXO2ifeiMKQ9/ZLeOVg9NgopwCph5cEsoUXvZaGe8HEnRhlKCh27aFc0
	Qw==
Received: (qmail 1433455 invoked from network); 29 Aug 2025 13:24:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2025 13:24:30 +0200
X-UD-Smtp-Session: l3s3148p1@XOb3Q389suAgAwDPXwOZADQgI+b4m0Li
Date: Fri, 29 Aug 2025 13:24:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
Message-ID: <aLGN7ohswQ5FYdk1@shikoro>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
 <aLGAaKYucaW1vPCg@shikoro>
 <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>


> But this is set only on RZ/A1, so my question should be: are there
> any other SoCs where TMIO_MMC_32BIT_DATA_PORT should be set?

I can check if it makes a difference on R-Car boards I have.


