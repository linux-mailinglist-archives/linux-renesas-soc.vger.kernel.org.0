Return-Path: <linux-renesas-soc+bounces-19617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5DB0E419
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 21:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A981C284E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 19:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FDB283FDE;
	Tue, 22 Jul 2025 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lKDGyjdP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A5283FE6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212382; cv=none; b=tRLgOz2aHgjzQPuMmzA29P9UULrTAPjg0mQJSKSIfnib4087o0D5DwnN121u6aVhk4tA1dsstfCz8ikcad1i+jHF3iKTIXBdDU8gEhdfKqza++V7LqcR+ttUVe1GsBB7xuArEGhiCN//pOoOWu/mxPTb62n6QI2XJTDwDUbIhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212382; c=relaxed/simple;
	bh=dxMQwNjNwzRhUSvhimBZ1Q/JMtxBTofMMPd98MUcQvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQ493TAXMOcGt7d9DW7NdwHWUx1/6RIL6t7MJB0J8VoVWnGjOe7j/dniXycD5DB/rbVgITO3rWEuApfNPE3v/Z4D9HjhR+EaC6tTr+BLwOyeW2ZBrWAMdvN9F0Da9Jaq44YbbdUlDDd+t/MA9J6/qmeU0VVJLdaoc/HHASq34Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lKDGyjdP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rYk9
	I9gVAkRSEjGXPVkcMdBh82xiuucLAhvAuAp4BpY=; b=lKDGyjdPDe6H8ZDNCtl4
	1+7tX1HOE8Wo3nc5eNymBT7neYfJV75nPA+Msaqcj3HZR3hJgMb6+XMNQ/kiPLHm
	P9h4zA5DgKveSH5TsZuGkBFLLCUnuiaRRWAGwsGSsuOdkRxxbuQiMUDJ33c6S82G
	558YOmkMgDxVc5oeyY2QfXD2xzVmNFXxix2a7Rj4vtSPdMM2Ytcq706gEAug3GHd
	Y9aRtfi/ykJkuruSNStmRcKuRwc4o07dMxcg+j4Eqt2anGrD3soVV9noXZyrYB9b
	JWItpnqqEQ2SyEkvXH/6Y9eGwo8mJPVSnKgv8YSrUG/CnmAvAjXIyByA3BVmdGN+
	Jw==
Received: (qmail 1431414 invoked from network); 22 Jul 2025 21:26:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:26:18 +0200
X-UD-Smtp-Session: l3s3148p1@2ZUHkYk6kqcgAwDPXyBWAATEinPyanBm
Date: Tue, 22 Jul 2025 21:26:18 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Message-ID: <aH_l2r0xRPCHM2aK@shikoro>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
 <202507010308.KUbUR1fM-lkp@intel.com>
 <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aH4jnz0RPssZ7SfF@shikoro>
 <TY3PR01MB11346D7F43A7073160EBE6BA5865DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346D7F43A7073160EBE6BA5865DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


> > Maybe just use 64BIT as the guard? Seems a tad more precise to me.
> > 
> > Other than that, looks good to me:
> > 
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > Wasn't able to test this yet, though, sorry. I hope for tomorrow, but no promises.
> 
> Ok, will guard like this in next version.
> 
> #ifdef CONFIG_64BIT
> static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
> 				      u64 *buf, int count)
> {
> 	ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
> }

Hmm, I wonder if it is not acceptable in this case to guard the new code
block in tmio_mmc_transfer_data() with #ifdef CONFIG_64BIT. This will
remove the whole code. Your suggestion leaves some code as left overs
which might be confusing.

I found other traces in the kernel also protecting whole code blocks:

tty/serial/8250/8250_dw.c, line 230
mtd/nand/raw/cadence-nand-controller.c, line 1186

What do you think?


