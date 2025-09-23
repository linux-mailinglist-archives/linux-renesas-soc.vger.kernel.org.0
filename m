Return-Path: <linux-renesas-soc+bounces-22199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF27B95251
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4E14821FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBB731E888;
	Tue, 23 Sep 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HMAF5w9u";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PK37n+hp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334E3203B2;
	Tue, 23 Sep 2025 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618508; cv=none; b=sqYEI7RXqP8eEnTvJuu4hd4isWW+pV7Ecyx8dkJp9p3bAGa2hQm/b1ME2sCgZssI+EcuF2Gm5wZtS//aHFCpfXJs/mUyFjWs8h0B50ZvK6nSXP5OJFUddtBSHDQWlvOqzcUDrjuf3nvp+stDaKKJxByBeLJqz2XNi961epdXg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618508; c=relaxed/simple;
	bh=dV6dkxSIgJIVDBjcMAUBchw7pIS41GHMU9a/Vh8z1nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCm4OcfM6S6zvdDM4vOUtrAPscBMEzm7CSn5DCFoX3PJw8vvCyXcReqcnzvjYXETdX55NlnPkCBCqIP2VFI7lu+aR3nFQtlrnvRPV2UIQ7DntbyAE2xd+QtcyJmTFlckW1Omw8PqfkOyk3Mcyh6a3arN5mq4ArHBpN3uAzJJrwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HMAF5w9u; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PK37n+hp; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWDfb4QCBz9t7F;
	Tue, 23 Sep 2025 11:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758618504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hfy179XI2ihTEF6wPEVdpaFbJQwQS69tfZ2sAasK7dQ=;
	b=HMAF5w9ugE0r+cJtzysgZeSoW5sv81kFQZ29dYV7mEy60hQZIvoMBOMw/oiyrF+cckf552
	h1OEULrbSnWUs7HaaYhfDCj1bTX0jEzod985rvnCLeNrMCalAQ6ao3CcVdQnJEeLY6QTd0
	KbEWtivO/WrHy3L734LaSB7biymMGIJm0+vPq3aKf71Xqx/Wnuvldc2W/IKgTqAdSHyE1f
	Z4Oz176PfoNull2wv1uWUQFNylWhJ5aMABG3vafPorsCQwzqi1fw1Q4Gk5P+SHjvttkmnC
	dvKvB4IcxAq/HsGCtyisYp6nkN+G479rojZC8WGmWuChJyN7QjFIsaNNwJVkYw==
Message-ID: <c6afd0b8-6613-45d1-936d-2d0265437316@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758618501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hfy179XI2ihTEF6wPEVdpaFbJQwQS69tfZ2sAasK7dQ=;
	b=PK37n+hpOEkt/gZsa2hL79YQW4xdz6dFj5GrA1uIapv4yNqUIfuuqIA89EpWJ/VMUGzAfH
	8ZgaCc3R7S1IXg4WAW432wVFgT+CRiBqLgaCk4NfUmBbncyua49dU+22ajDSmEzPKBouXs
	PMWaoIV6ezsDTiet21k1VHPKUVFdBR1HEB7QWpo9SE+/dHXar7h9CDDVPPa7MIKsZJBzxm
	hnOocMxfQxpZxso3I+YgQ2g7FGp8Bseg77NkZbN/X58alfrEQ4Ht/DFnugk5aDC9mw9Obv
	ES4gsH5u2mUPEg64498/1JUQu9ZQsS5ELUFEUsksjZFIu0JFfAUK5Y0CDxc6Tw==
Date: Tue, 23 Sep 2025 11:08:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
 <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
 <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f60f5ccde293632b0b5
X-MBO-RS-META: kau4yw1cz3xjmiodarfodk83kh9zpe4k

On 9/23/25 9:11 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>>     3. Reset release on RZ/T2H and RZ/N2H:
>>
>> Maybe T2H support is not yet upstream , even in next ?
> 
> My bad, that is still under review (and I didn't even have the latest
> version in my local tree). Latest version is
> "[PATCH v3] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H"
> https://lore.kernel.org/all/20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Let's see how the T2H/N2H reset fares and which patch lands first, then 
we can unify the accessors one way or the other ?

