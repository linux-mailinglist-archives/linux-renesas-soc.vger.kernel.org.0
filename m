Return-Path: <linux-renesas-soc+bounces-27142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJYBBJPlb2lhUQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:29:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DE4B4C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D148C9708D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 18:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6334657E8;
	Tue, 20 Jan 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+2bdaxq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8230AAB8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933518; cv=none; b=nvFV6dC/AxvWpQyzT++FF0qdNAUcFiTXlFGFW/u8hzZt92hszra7tNQISdVb1KjcBzt5PooWKG+tfoEawpXT5830RHAibhLe9NIl1A703WRNxR/lK5FbjZ8QN4t8baujj0aAxRaz2/kBMTlBVOttbYXjYnuMLYH+BPhWCziIx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933518; c=relaxed/simple;
	bh=/majb68NZLle+sZZ2y2oJqxlBq+JGPPCK5WcFsqxy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNqsPoaZvGiILUApmX7xh412BCU7pxtR7glBt3SqCN6sgxYkOIS4fyQPiguLJYmNzqVB4o5n+LN+1CeCLPK07aq8T1Td0Z/nOlCS+IpkP7dDuIOeOmP6JHvpeR1AU124nGfOCfkPe3IQPc1OrMyRwqtMhtFpLgj0+ycSJfKwdjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+2bdaxq; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso11690549eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768933515; x=1769538315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv2BCMRvJI4AEzFRhX5RI8tLqrofx98qgSkyulQwJX4=;
        b=X+2bdaxqFd+bqdlcm2jtfY9dVIxHMeviwkZ0UpBh2325SGKRU0hdZhuNPJ6VjF7clX
         ITZmCmvx/1Lam/HqKevzPs89loXDCwWFkhzM7ixikdK4sCbORColXIhkGcnBj/bRQCEa
         w0BPxwPthqzQ9qHR2Kz7ZBN+u+nC9BEVQGwnxZHbM1kGerO4ekyAXc2Gd8PRqpMiTvb7
         hO5xZV/kcIaN+iS/zZa7TiZ5LxMYh+o2TD9vtw/rSbAOnMTk0yDdahKzPuOHP9k/d6RI
         iiudHGj+6aOkF+qAnGP+Z9Od/5FFHlWwEqz5S1rXmlaGLL5a7wNRxtimXY0sMr1XlXA6
         oWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768933515; x=1769538315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv2BCMRvJI4AEzFRhX5RI8tLqrofx98qgSkyulQwJX4=;
        b=mBtp/oG92zMIkB3R/PLCBH8vcWT22IBX65b2dkza/G4C9BUjZUAToWKqZae2BLgnpk
         lbuMyyHbdZGu7ODmGqRshLmAyOoP236xrFsZ0Lh/Qqxj+8OIOCelCVQP4eeNg30qc8hW
         zcwGE4caadqFNvqmLvzbxvamkRKNu35AWJ2r9SWH5PG6/LST25Dwd0VTaAeGvyPciMRb
         x88bwieTl98Oqrlqra81bUW3CVWs212LvlsPGPQfSAMxlnUheUPVjw/bqjlXIGQRLX9W
         0BvwCxr1nQlURBz8X38hdyYpPGR1fL/ntYg6/GJ5Dl1YdkTz1ToroCzXXl2l/ZNgb6bv
         hgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtChU88PMp0IbKaob5XCm+VRvSABD+/5lQCmaiugw4ZbAmsZXf952Pwk1+s4h38qn1fiqZ2hQg2BJZZ7E4L4tg7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFG9Yhk5CYRijbWTEe2RaIuf2d/+R656kiPe/LKSCb1RSUb1JU
	2yPFtQzAc4cCbddxc5JISrgDRyheFz5j/+xZgpxB+KrIF+yOeQg88gKk
X-Gm-Gg: AZuq6aKoKThD4jN4F9cf4iTYaiIyjvyijYBVJiAZKrjjcmbU82kNpgSs7+9H4jMTeWD
	26TvZLvTxVDDcG7dIz1fp6kPOg/R2HtukO+j47Gxigwu31ZK6tvGNDhhexN7jP0Ir/hHi39phkh
	UIs8OH+4qaC7O2Q2B0YOt3Hi3WzXX2CpRBnznJ/YRTbEM1fRXjFAxcx2D0LwLdrsHx/gLHfGtkb
	mtTRTMG/xa9IOeSyd871gSjX6q18uzuTejfismBW2YDm6/1leBhqWGZYTchE/Lcl9iM/MfMRzFx
	1tf9WNX1RjlrbKlJlDRL60Cak5xF7g5KVUZQwDBm5MYU2OGYQ5wKCNuo7YZRcczAdwvvH16JNvP
	84Z8us/JVUlmih4czEWPc7mbPcBUUDCU0NQ3DWRXWzBsdduHLNamNGLSUmnckUqL3cndwXCiKiU
	Ao7/rD5/nT5n+9QRBMDzbrH+4O6RVzWDYNxGg91TNRAlBK1Mnw5Er3VZgps1M3Hr4=
X-Received: by 2002:a05:7300:6ca1:b0:2b0:59da:f798 with SMTP id 5a478bee46e88-2b6fdc7bff9mr2098244eec.21.1768933514943;
        Tue, 20 Jan 2026 10:25:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm17884404eec.23.2026.01.20.10.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:25:14 -0800 (PST)
Date: Tue, 20 Jan 2026 10:25:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
Message-ID: <fw7csyedd56txho4ccx2qmhxpqisvp4uz5ubofatcr6sbvu5hn@vekvo3k55kf6>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-27142-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: 743DE4B4C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Jan 17, 2026 at 01:12:03AM +0100, Marek Vasut wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied, thank you.

-- 
Dmitry

