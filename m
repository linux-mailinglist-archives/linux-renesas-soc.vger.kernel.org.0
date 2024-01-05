Return-Path: <linux-renesas-soc+bounces-1332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AE88254FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 15:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9A01F237AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 14:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE722D7A7;
	Fri,  5 Jan 2024 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9eM0dYY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703282DF63;
	Fri,  5 Jan 2024 14:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD01C433C7;
	Fri,  5 Jan 2024 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704464070;
	bh=8sdX6m71fFzh9gSYFAh8wP8JJmDv8NglLbphandtXZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V9eM0dYYMfSLIy8i7fdEcyuebQeQN+4jnHxnNP3qWILLLJrxZiOQg0hlGoYvFRv+w
	 A8UZuBpib2EyRBH1Oe+evL08uLwAJNgVkeTQkMGwcuAiZvqSEwO95Zf3Bbhjh4lccw
	 TlzW5jVp8/l9esEwgrRqEEV+0Yrc1jNxoV0BNe3YCSSG+lcJVuvEuof1m5z/gmBVGq
	 rzkEE3+vlBNJ7qSwJ9X/eKFAhxugQRJzvGuYaWLlCmGF5ScLG2h1GbQ0kFKuqIb6dX
	 zOsbq16FGaqW2JNZ+KOeJb69yfRyXxcGMA+F2bQM4FCm82r2OWziTPLJUGyfby226i
	 WGpiVdlQgZQkw==
Date: Fri, 5 Jan 2024 06:14:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Simon Horman
 <horms@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas
 Ethernet Switch driver
Message-ID: <20240105061429.45216de3@kernel.org>
In-Reply-To: <ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
	<20240103212822.GA48301@kernel.org>
	<8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
	<TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
	<ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 5 Jan 2024 13:46:32 +0300 Sergey Shtylyov wrote:
> > - RENESAS ETHERNET SWITCH DRIVER : For rswitch  
> 
>    No, this seems too much for these poor little couple files. :-)
> Listing them in each new MAINTAINERS entry should achieve the same
> goal and seems a biut cleaner...

+1, FWIW, you can add them to both or neither. Series purely changing
the Makefile / Kconfig are very rare.

