Return-Path: <linux-renesas-soc+bounces-18685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D945AE7375
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 01:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D94944A02CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 23:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745E226B081;
	Tue, 24 Jun 2025 23:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NEm1SLbI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E72CCC1;
	Tue, 24 Jun 2025 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808925; cv=none; b=CD+BBHWoDxuHHWYL2gAjsj+wyGWARSMNNbIRqo85gIfbCnRJbe9g1zM7huM/Euo6j2YcV+loo8AnSMi7LkcE4JHwnweaJyH4t6A1Zp9/8uA9FaesfjsVIFR1PBazDKSu0SHSIsgVuOYQmomGu+pKMC2Q6tUi5KLAOP3xG2t92CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808925; c=relaxed/simple;
	bh=AxbrQgbI9Hp0lzSnXJ8VQEX0GBAeXjw4l4FNRJQO2nw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uiq5sx/G7gLZi+OgkWM6sYBl2UXu8GSosqqnAV31JvJ5BNes3LMgk1BmBS17f/1Tu7NW2iV1lZkCvbvU17TqzSHA8WaYy15dd3TusiOSmcCc4OiXcaGtzHZozlVYGKevtOG6bfS/bMa03jtZqlSJGaZ3eDYShIpRI4hsJMYGHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NEm1SLbI; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750808921;
	bh=AxbrQgbI9Hp0lzSnXJ8VQEX0GBAeXjw4l4FNRJQO2nw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NEm1SLbIZEjsx9Krx0+hgcKI6aHpzW9XZ4tgOiPgvSg+iO/oAYyxW7hL4fTTI7tPp
	 tH9Ks/nFlUv3hRMH/LxC2vD8ceGkBQwWMnvfBPB6tpZ6xAcfSxwdOGeCMmmMeCCYcx
	 I49F73Bthcw21cN1pswCmEh2Pio8p3xVy+YzI+oe1VyVpDr9UJ/38ws/CZi+Ss7kr0
	 Tpz2VzOe28Kwf3I9goMKhAEyrS/VqnTFBdVDwX1mrjNrukG/OqAUJd5T7xZVNz8ELH
	 S/ZdATsir6Szpk5H3p7Ye9WSWWpXurzJ2O+dwdGJm836rRne2aLBBxfrxMSsECZMRh
	 kCX1ENFJV+7GQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4057C640CD;
	Wed, 25 Jun 2025 07:48:40 +0800 (AWST)
Message-ID: <6a787dfc8bfdd56c564c4e2380ea7ca902bad090.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, Leo Wang
	 <leo.jt.wang@fii-foxconn.com>
Date: Wed, 25 Jun 2025 09:18:39 +0930
In-Reply-To: <20250623-add-support-for-meta-clemente-bmc-v3-2-c223ffcf46cf@fii-foxconn.com>
References: 
	<20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
	 <20250623-add-support-for-meta-clemente-bmc-v3-2-c223ffcf46cf@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-23 at 18:29 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
>=20
> Add linux device tree entry for Meta Clemente compute-tray
> BMC using AST2600 SoC.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Sorry, I missed that there was a v3. I left some comments on v2 that
are still applicable on brief inspection:

https://lore.kernel.org/all/0f495eec39fd25d71a59a56876f6142e6fe786f3.camel@=
codeconstruct.com.au/

Andrew

