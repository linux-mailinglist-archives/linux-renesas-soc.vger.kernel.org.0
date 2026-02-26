Return-Path: <linux-renesas-soc+bounces-28506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOwFO5msoGlulgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 21:27:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5E1AF1A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 21:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 082753002305
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 20:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DDB42B73A;
	Thu, 26 Feb 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eMg7+MtH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F551C4A24
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137546; cv=none; b=s5Qu63g7PUFT0oYNHF+/Xe1N7zEJOy9SL9jvOxwsKBFgC/MNFGv8fsU7HZJ5nsG2rZSEAfsgDPg84R+kl2dnL6PAfArYd0s8s5e+gYDtk1ZaZvi3nk5KaNHk0Wnz3tTYx22lFV2icXZn64YXVwDfgYuu6EWePRj0o1eaJnqC93M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137546; c=relaxed/simple;
	bh=yVRIge80aimtKsnkGLeGz6lSpxDwFQm93O/qmf8x+8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laLznIMrRZAqIPX6mCBtF3NqtFo3RYqEXHTx5Gg+z9JhPzXUIAAxcSOoKoHK6/Ip+lDBeq4DDlue5v7EfpXazDDp/36AMZXUy+VWj1O8pSWKflu8RrzSyqHFDQ1Rl8zb+ArTIM+QA3OOKX+FC08tyjlWZvDd7eQnuh9C83iqyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eMg7+MtH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Sh/s
	3qFva466wglan6cTKI7jr/g9T3NqxFeeJ0K5Yn4=; b=eMg7+MtHs+JE+Ztk+rzN
	VSY/ldpbERoaSSIuYIUZSMCBmangRnBH8sGrk/8juZeBVaFQZ1QozPy0C175ad4j
	x7ypHFYbRbbX5mjfnqcNFhEgPpKfo556mDuQVHvmxuFcUbpevonMjOvuQ1VSjnpN
	SCnf704z3qXjkQj7PlMQjtDZRVw9r4dI1Yptj8XMzS8sgv1+MQb0Iha2yNMmnHJZ
	8EJaD7obXcg1j+A7x4Oi+8T6PpesKcXCLBiXEmGfTrqo3Ea6griUHvkFd+8MntTr
	ifLWvoo80DXPje+0DWRLh9Y9HmqZoK5oNu5325kVXPDGBbsz4vXjT1d7aEtKfV6D
	IA==
Received: (qmail 1210745 invoked from network); 26 Feb 2026 21:25:43 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2026 21:25:43 +0100
X-UD-Smtp-Session: l3s3148p1@SWC87L9L9JAujnuU
Date: Thu, 26 Feb 2026 21:25:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Hans Hu <hanshu@zhaoxin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/9] i2c: provide and use i2c_adapter_set_node()
Message-ID: <aaCsRr7eT3AA_5sq@ninjato>
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-28506-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9CC5E1AF1A0
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:08:18AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.
> 
> I2C drivers use device_set_node() to assign a firmware node directly to
> the struct device embedded in i2c_adapter. In order to hide the direct
> dereferencing: provide a dedicated interface that wraps the call to
> device_set_node() but takes the adapter as argument instead.
> 
> Link: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied to for-current, squashed...

> ---
> Changes in v2:
> - add patches replacing ACPI_COMPANION_SET() with i2c_adapter_set_node()
> - rebased on top of v7.0-rc1

... and resolved another merge conflict :/

But despite this minor hickup, thanks a ton for your work! Looking
forward to your follow-up patches.

Happy hacking!


