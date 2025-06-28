Return-Path: <linux-renesas-soc+bounces-18881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA2AEC9E5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CDF17CCBA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 19:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B473F9FB;
	Sat, 28 Jun 2025 19:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="W974P+j7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D52BCFB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138139; cv=none; b=Ms18TWy+TI44z7k5H+ZVt7DXEaRQZ1XDa2yrLim6HkdqnX8SJ7GjTS/kmTd+s5sVF/tLV7AofqEXS8vDZNVvrL+tdiL4hvqEh4of+TI+PZKkJxqHbRYwa3I7v3EKCq17QHxXfj0vqw/fzHggMW399ZkpGo9FeEgU748OftnvDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138139; c=relaxed/simple;
	bh=Fkk7E98e/fbbs2PdRizKyAdKT0nGv8jttbdjII+adKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARDsqN9nE2tGpZd2ic/3argY9nUMrplIXhO/Ec37V8JAisEahO/ybk/8s8p41BkKVbCG6JfFI8tkCOdmBFbrLvu2DvUKHt7G9YwSqJ63HWtBZRPTCQ+DBKhMMd+33O0P5PJU0Bu7YHJeyBGgc5UFMEj9tX2oT4O1tCorFewKn3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=W974P+j7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LjQo
	ok118qqN+bNtofIrtrY/iZTpUVDCUh2hirZj/sY=; b=W974P+j720wxswbNPI8v
	/LJllYcd6d2Qg2gPCyxWb+RLx+ixXGhx8tCEKSdPs1NsZs2l2NTz1Tu4gdPuDD35
	1gnHbU8LDDshOhM7KsEY4Jo7cXUq1922eRt48HllwbEoqlSGMvdlNLQcx0Dtv/3p
	NfL0ghhdfqHJCHMME+ZsYy1W0+3p7w4Di3InOth2lKJuiBPZ9h9mvTYXGokpvUsf
	N3WYM2zyxU2+OrscyHXzOl4hrs7uLtnnkj9ls5WIp2zddYWDnsUVRP8E94M9KYpC
	1dpiTxV55OSEpZLXHzZTj36ZogPP6zmNL/qX56Op+VDb02bI6hDec3V3fhklBQhq
	Mg==
Received: (qmail 1917549 invoked from network); 28 Jun 2025 21:15:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:15:28 +0200
X-UD-Smtp-Session: l3s3148p1@oxoKnqY4bsstnPBw
Date: Sat, 28 Jun 2025 21:15:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aGA_TxSFb3shGmnO@shikoro>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
 <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
 <aF_AE7H6H_Zb2W0L@shikoro>
 <aGA2DCfUfK5ZN4bR@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGA2DCfUfK5ZN4bR@lizhi-Precision-Tower-5810>


> I understand this. But the sentence "we never want this(ENOTSUPP) to slip to
> userspace" literal means (I understand at least).
> 
> we don't expect to export it to userspace at all.
> 
> Actually your means "we don't know if it will skip to user space in future"

Sorry, I simply don't understand what you mean here. But I think it is
not worth the time to discuss this further anyhow. I will just use your
suggested commit message. It is not that important.


