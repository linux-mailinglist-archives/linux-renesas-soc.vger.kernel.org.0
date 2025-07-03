Return-Path: <linux-renesas-soc+bounces-19061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB72AF6A8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 08:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BDC77A5ABB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 06:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B5628FFEC;
	Thu,  3 Jul 2025 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QTpi9sN6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B881C291C24
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524931; cv=none; b=XprIMFZn9Pfipwt3Z2fMSGRfcDwp+7AhRYEgf0zJ+NFv2sI0O7VoLJ8XgpMKY1S6nTKOaipMuZiYh/fdUmUu1cunzCVHYYpX3xfIj33vq4cVAvfJvCEWOppWM9kOQFWmkk+0iOswVkqljW9G7rnhJKgaJWLe0Y72j9r4n2y4Nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524931; c=relaxed/simple;
	bh=t7IwxIdwhdXgWj5Xo9wKoG6FM4lwfWYHW83i2BPFpbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=st9hJFc47KKPySPSfBzMZ0ePZwRfi2tgQZtfnwB5Knxq22rivJ/PB2gkHQjk6ffKAlKB/mW5cgGBkBLknCDYkc5VbAeV/YLvBGrLjwOaGxBEoEpm84HWr2V+XYiXQa0Fv7t5w/dZ0bJHO4vV1EL4JmUQI0u7qwHPd5WNHHFbjHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QTpi9sN6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N+t+
	R2tbEvS8iPGpTfOUgvUBhLFV48JiJQy6YPMese0=; b=QTpi9sN66IUiSkPkBADA
	ZjwjoONxTbnb1is5b5SCV9XA/Qcek135MbVUHQLK0X4dLxdv8SkGztIaz9l9JThy
	TvKHHMnKk1FOijwtsZNdxV99JaOk3VS0SqKFYC29+Kdn6F8bBLy/grayflE8dIeE
	CJSTEfnl9v91UMXgdQxaS1IWx75D6ce4FQINfk2g9q21ESMhhbZHHn3iljersEKD
	Pd3EVWoW5wOwHL4SDvIcWXBsHk47L4/uhHKIbfFpqzIjBfmKso0zg5vCpstUq41C
	LP8ZGItcBJsEfOprUCmqOdTe0uL7Jcyd72NHQOKQlapwpp1ODerxlETNJ46YcVQh
	hg==
Received: (qmail 3755582 invoked from network); 3 Jul 2025 08:41:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2025 08:41:57 +0200
X-UD-Smtp-Session: l3s3148p1@H/F8rAA5kskgAwDPXyUmAP5FmBXRrw7R
Date: Thu, 3 Jul 2025 08:41:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Frank Li <Frank.li@nxp.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aGYmL9CpZHUtEm85@shikoro>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
 <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>

Hi Joshua,

> I'm use `MMC5633` to test out the HDR-DDR functionality master functionality.
> The patch can be accepted as some controller might not support HDR.

May I read this as an Acked-by? Then, I would add it when sending v2.

Happy hacking,

   Wolfram


