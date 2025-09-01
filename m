Return-Path: <linux-renesas-soc+bounces-21112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109DB3DFD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 12:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68803A5E98
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5492325BF13;
	Mon,  1 Sep 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vec88hCK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5A17BA3;
	Mon,  1 Sep 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721610; cv=none; b=bh5EfsQjxogt6oSafAfwfodaLoaYXo7igN88omwHXisbh+WvRL/q9zxHMCw01p2WF+oCYLBF1wkIdFfn4407aQlnFM9M+JJymb+8Go0FzZBaaMBGuqkeZAX7KU4ZhRir+99DxE19DHSTxJDQQUn7NHw5guuo1uQJuzZtCGD1hoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721610; c=relaxed/simple;
	bh=syflzeax5SIbtp1IYnQaLM1Nl5z86ON5FhzAAu1ylEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOl684f320i3bz/8QSk+zZCiBky6kiJ++CQj0Kz2+g9A9sCVzfJLXd/hOwAXS/Ik5bGqu2MP3J2dq0B038CrU86KjWVyV0KIv/o1TypJWf8e6Vk207BEyCY2oy0Q6EJil5OO0r0hoeywl6p99q/d3TD/x81LGpojJFZ2iYYT50E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vec88hCK; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cFl7g5W4vz9tpk;
	Mon,  1 Sep 2025 12:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756721599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEPqKsXcvXT/g24/oUJ+GoYNPppG4ZlMLpGam/YzKnY=;
	b=vec88hCKKDE7RbFUqpBJTsK9g2ifA9UrB4TgMAy3eJ1kpCt8uTgEdyYh62Wot4umwPkRD2
	ITAbFotnK4nEbrJcc3xPWIT89mEIzQtl8WcYLavBI7YxiIuWmTabbf+CA99cXJ4SqgfOFI
	iRXXGmG0Fgh+Y+ZpDQwS9wsZYiW4bCP2H8hzeVzyYvaJ6HFFsvxiZv86duNh8q/qEnlat8
	hYmHeSTZnJxS4s9/ARAAX+kvdnE4WOvaRzn0U/omo5ybmFt+Y9N4AfYw6jG3rmE7J1HCyE
	PopPHQbHmMH/Eh4izFTmp0Urv9CL3ZxnYercHSlzD8YXK3jNn2IFzqa1gf1i5w==
Message-ID: <9c7499e1-8386-45d2-b859-aba7b33387af@mailbox.org>
Date: Mon, 1 Sep 2025 12:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
 <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
 <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
 <e03c3fcb-7392-4ddc-80f1-8c104cd04e3c@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e03c3fcb-7392-4ddc-80f1-8c104cd04e3c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 12693b4806c0b95e2f9
X-MBO-RS-META: 1tqhofjo8unimw73ac5d1sc8b6esrkz7

On 9/1/25 11:22 AM, Tomi Valkeinen wrote:

Hello Tomi,

>> Would you like to pick this up via drm-misc , or shall I ?
> 
> I'll push to drm-misc. Thanks!

Thank you

-- 
Best regards,
Marek Vasut

