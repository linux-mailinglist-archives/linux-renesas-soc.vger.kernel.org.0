Return-Path: <linux-renesas-soc+bounces-28505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFK0IpWtoGnDlgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 21:31:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E05301AF28A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 21:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F6BB30F8537
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 20:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB05466B52;
	Thu, 26 Feb 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GVrEAhtd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02F3A4F48
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137472; cv=none; b=s1s+pCO38o2d8qpHeKW3CaoN6U2L2me324KCgBxSrZ2eO74X4PamzBM+jEjuAegbJsx1QWw1Gt0+jq4J57C+a83CJjNAonNdKIfpWUIiihFRsdjdPsJJuGb563eQ1Oc6jstjUgF0V0Nj/fSz1TpN6GBKBnkHqYwta3BaHYEBqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137472; c=relaxed/simple;
	bh=u5zuHuura3R86q7kqZK7Sy1gLUFFfMTZvxQ4hjN4vu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bosCYajC2OJzWa2XnwslS5YhTa8Z1Wan3gIuZNJKDU+pVaauLb4hsgf5VJo6sRHO7dstbdTwWKqLgdcDNImIHnI8R0aMeLMeedH/MUih9QoqFRzvaWnHrHPa4zBceFCldx0sMxqg7kCdh5Jp+064DPWg8v/geeluiAEDxBGljXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GVrEAhtd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=u5zu
	Huura3R86q7kqZK7Sy1gLUFFfMTZvxQ4hjN4vu0=; b=GVrEAhtdYMEOGY4fZRKW
	LKOCKlV4gbIh/uIuykbBz6zBmjFTMJnwBFWmEG3HHrW60MhIa2EzzCZTsaAO2DjY
	qccV51OVkl6rvDJw3mlcH5F9qnMhutw0a0FlpzPz3oTo7/tk5cncC58LUYsF3p7c
	ml0DlhDvZnWFb8qDwvrHvL2dAX/3MW1ojJ0An3GTa3cthmeDuIA0a0pDq1NTDkTv
	4yEsBfgQkPGu6QwO38JqdkX60Ul6ceuDZJHR7xIT762/i3Ho3YULH8lDiiO89p67
	ZJ1zVpVg84tOYbk8GDCRFF1cvUqvoSfOTl+F//w/YEoeJxMjePh3qoZC57WiQpR+
	Og==
Received: (qmail 1210264 invoked from network); 26 Feb 2026 21:24:29 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2026 21:24:29 +0100
X-UD-Smtp-Session: l3s3148p1@T4BW6L9LtrYujnuU
Date: Thu, 26 Feb 2026 21:24:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Hans Hu <hanshu@zhaoxin.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 8/9] i2c: designware-amdisp: use i2c_adapter_set_node()
Message-ID: <aaCr_ZITjmIkgxbZ@ninjato>
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
 <20260223-i2c-ada-dev-set-node-v2-8-77018c536610@oss.qualcomm.com>
 <aZw-MX4NvafqUVsy@smile.fi.intel.com>
 <CAMRc=Mf1==xy31_cf5sNS=GiGxhh8vXzZS1mgPzsro+BmsGEwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf1==xy31_cf5sNS=GiGxhh8vXzZS1mgPzsro+BmsGEwQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28505-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: E05301AF28A
X-Rspamd-Action: no action


> Gah, I folded this into this series but forgot to squash it into the
> original designware patch. It can be squashed in-tree by Wolfram or I
> can resend it.

Everything got squashed anyhow ;)


