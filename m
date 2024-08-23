Return-Path: <linux-renesas-soc+bounces-8189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC69A95D448
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 19:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7871E2841D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 17:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80EA18BBB2;
	Fri, 23 Aug 2024 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N1gFtg6z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF118BC0C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724434308; cv=none; b=p9Tzr1lhOtXDr/cyiD+iqukODPajTckgFjhOVa2ocOUGU4Txa52oANkJCtnOaLSrS3u1DvWuIdXpvLTq4SSGP+ekaQIuN/b4YqKiScMdUYvajCBpefKLIGnaydTGhaICTO2tAouNzcrrX0se+2K9iLJ2osm+nGKmwOsFC3cmzc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724434308; c=relaxed/simple;
	bh=/qnHbuqx2K+0VRNpqNvJm1cPnHSjjfhduiGNB+g1WHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsImioldbkhhrNzUDuSTdsa8bPkCeNoKJSX+exfRbI1mPoon7TSkuDXYyeRB7l2syXXS0At2vQShUsdjLCTZKaPibEmRmurYgPw4dH6kXcnhlQeB+i+IYuKhb3tHheYzXQ0XtOZckaAJuowqon/vm9N/A+qLtKAsG7rJQif0EYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N1gFtg6z; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A06AF1BF203;
	Fri, 23 Aug 2024 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nCb2apGA05N1blMpoknuj5Rjwtf/UFr9cA0iNBoI0ag=;
	b=N1gFtg6zCDqg97MqefECu8OYiYpjPFcLLww0EONJAoJKSgkuJ3b6xmJX9qcylQwUi7XuzO
	jL0BLb34DTHBP70Z28ou1Mpou1sK5UEsdA+6Iiq3VovEWamy9ppmQlWx0TNY/0EMJ8uWxL
	ED8qpgKz+q3nsREZwwdco4IfFv5Pgp57BHYgCyfYMawTLsj23619GG/llEuW3g6SvDrsFy
	lhsO/6idw1/rOz3/IHTgAT8o+B4d2POegcEfsFLhVELdSs3is7fQQQJPXAC+wjLhl29enl
	8E7a/ZmMbK9xhdxsS46f+f4k5WMn2QjKCZY/JsuPvmgWpfRa4Olm+2lKvPXRSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Date: Fri, 23 Aug 2024 19:31:43 +0200
Message-ID: <20240823173143.366150-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bd92c1e07beb2f85cbe977a8cb9910adf237d649'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 2024-07-31 at 08:08:40 UTC, Biju Das wrote:
> The rpc-if-hyperflash driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
> 
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

