Return-Path: <linux-renesas-soc+bounces-19063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF2AF6B48
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD9C4A30CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 07:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A3629898C;
	Thu,  3 Jul 2025 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LGrtT5q+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAE233712
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527102; cv=none; b=EDMNfi36JZS8kBNbxVC8+CWbwTCq+kExWgE1ohimNdu+nZzQ0Lfn4A/+m/Hqln5Lz/pU5NOYy182RDjS43UpAtyUrGuxcccLWQ7+vS3XN+5hBvjbVW6rp6Tf7YmzGHT8lhZysZKm5pzU6Od/e5Ofctp8C8cQdbLUmheqKF/rpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527102; c=relaxed/simple;
	bh=NtvvhoPmrDm8cmTlFneao49lCG/qnDBf71DXGz9r4oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG8KpluNhsUevVO8bEJxT9gSntTjsI5K/hhQyRLsXLYFjrVhNDFSGHxVzmXzIPu6rIruY9wPmr8DmIVZcz6fM1eRHtT8u9XDKWXeMHEMZbRDcqzHADiWdiSZ7PxQF0eyKnM/yh7fvMktOiDZGSrACdbaOV7btA9NgjTpCT6Ll7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LGrtT5q+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YoGB
	mC4R1su2gB7oaxjTFaEPBQ9RE/7hlEOYR31rees=; b=LGrtT5q+y5h8Nv2ZwMUu
	SFwhMYl7oTQP8+BuSJRMuI6kjhtoEhcXdwNczHcT6ZRvCNFXU3wrsfBfi5Pw556Q
	Yb+wejME7aRqSodfZT+FsoWsi7Zqsa5ZdUZW7Vb6vVosOYKMsgw1vSb6YKv2nGhb
	OzpaChOEqhfRFTsWxTrj4Tkh5OTiwC1Ses1NRbNt5kYwvxlWuG8AE9Z0F7C/thOQ
	PLWRLLOOzdTveqM1RQe7XBv6yKToNQ78jufJqjGwG/WxZG4meOCFDgf3jVu5nKhw
	BGirVeNSKGhDIDFd43LQGmhtr0+8flOpwFKUCkGKTEwzDSCIXgWkTo1fyiIaiocj
	1Q==
Received: (qmail 3767328 invoked from network); 3 Jul 2025 09:18:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2025 09:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@NEoeLgE5fMAgAwDPXyUmAP5FmBXRrw7R
Date: Thu, 3 Jul 2025 09:18:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aGYus1HSIkSK9mRm@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <20250625200709.GA2125481-robh@kernel.org>
 <aGLo1mlrHT_IZHQv@shikoro>
 <bedabd80-ba9e-4f70-9f75-655ce90d2b8b@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bedabd80-ba9e-4f70-9f75-655ce90d2b8b@bp.renesas.com>


...

>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g047-i3c
>     then:
>       properties:
>         clocks:
>           minItems: 3
>         clock-names:
>           minItems: 3
>         interrupts:
>           maxItems: 16
>         interrupt-names:
>           maxItems: 16
> 
> Right?
> Please correct me if I'm missing somenthing.

LGTM. I will send it out like this in the v1 version.


