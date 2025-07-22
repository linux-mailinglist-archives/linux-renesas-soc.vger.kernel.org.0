Return-Path: <linux-renesas-soc+bounces-19619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B7B0E420
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 21:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5E606C146F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 19:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352DD284B39;
	Tue, 22 Jul 2025 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LPa92Iwo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E4D28467D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212404; cv=none; b=jooT/ApJbmnQVSEcep1YeB5yO4m+j/3JdIWkUHMF4zQSIOcJpaep4/kLMkUfM0r0F3AEXzJHhhwrGlL9Q65GSwg7ooBNuOpWZ9LX2CVUki8Gyp2ycpb9Q7QRdXBQfRoNKtc9dAk1zR5JoAt9gnV62biyJjM7Ut+v1p0Hc4p66U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212404; c=relaxed/simple;
	bh=r8p8hVZxBnCsNpFZtA5U7in3wSETNlidi4caaOKWZmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfeUizLMgfEbq8L/cR8Qddv9X7QOEhY3f4bGezaSr9srqZ2MH1ona+CWI8QLLc7u2mRr9VHQXh3cpHoy8yEig7f0uh1NCegZfHz3dTdS5wSEue0mXd2/1k2AFKly7c+NJlUJpJ1DaYsspsGttV+rS0GInznrE9/lWtH7WUCTNhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LPa92Iwo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ehdr
	cvwFtwtG3b1bwdaFy5MfOsGxSF9HKb9WkVVO+s4=; b=LPa92IwoYuCHW59JDOW3
	2m+prX1sp+j+QHc5HL/yMUfiI4pHT5i/gsaCGwyoBAOlzbbmSmOYu6feXeT0/QRC
	VX8QVcW5FNZ/x7utTvnr/jgMj8FmpAYCOnHaCYb8bD1xgXtNesywbw/MgnkO/VKt
	oa5hPrkTyKHMCMaPlpDzXVB10xQAnE1VrmssoxQGnNZ0DBhbIqnc6isrletEEE4A
	WWOY5GLI8gLAjnfbnzG4l6eAw3lr5Ee+ie3E8iti95shIO4Sr5ETOFYMTfwytrmT
	zG5LBsMJZ3NnR1FYaHlgFR0Lr+3StjYwDJMAm1hRFqPwXNNMecZCbU+7Tq9kq8Ff
	Uw==
Received: (qmail 1431599 invoked from network); 22 Jul 2025 21:26:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:26:40 +0200
X-UD-Smtp-Session: l3s3148p1@sL5Pkok61M4gAwDPXyBWAATEinPyanBm
Date: Tue, 22 Jul 2025 21:26:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH RFC/RFT 2/2] mmc: renesas_sdhi: Enable 64-bit polling mode
Message-ID: <aH_l79VIoKFJhZm3@shikoro>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
 <20250630081315.33288-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630081315.33288-3-biju.das.jz@bp.renesas.com>

On Mon, Jun 30, 2025 at 09:13:11AM +0100, Biju Das wrote:
> Enable 64-bit polling mode for R-Car gen3 and RZ/G2L SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


