Return-Path: <linux-renesas-soc+bounces-831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A129B808CE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 17:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D229A1C209B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 16:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD8546543;
	Thu,  7 Dec 2023 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6QGxksJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318743309C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Dec 2023 16:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D823FC433C8;
	Thu,  7 Dec 2023 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701965200;
	bh=FBJvAEAbr7Tg96IRQc1imOKvy3AdpIu8tsK4kMd2bAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t6QGxksJwY0eLffJN02ME3wxzyXwUPudPHqvWDn5oFpoR5Vh4741Ik6Y+oc/wuqEe
	 4QfNSvh5v1NEWGmW8N4e8iJcE2wcFINlTgeA54Z8EdXQ3qPCIUvEi5jcaTut5ffMVr
	 SdqhW5r/P1lUcsJeEFwhs6/+dlJ2UenwepkzbzdxqlNkyOaM5ijNe/CHPsVmvNBnr1
	 NRpm/BJVXaSzr9nLiHdtZqVgLFltPwJTB0g/zdzQWzhZ4BRr1Cc7g/kekUnuukbouF
	 qDoe/IRGyHsLPo62RwrDV2ZZZrQoWG8vehZFmNURKpCExYSdYin3ZJWPmZFulZrTmZ
	 WSeGfl659WQ5A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20231204124507.124758-1-biju.das.jz@bp.renesas.com>
References: <20231204124507.124758-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH] mfd: da9062: Simplify obtaining I2C match
 data
Message-Id: <170196519861.119127.9849768170399321667.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 16:06:38 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 04 Dec 2023 12:45:07 +0000, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().
> 
> Some minor cleanups:
>  * Remove the trailing comma in the terminator entry for the ID
>    table making code robust against (theoretical) misrebases or other
>    similar things where the new entry goes _after_ the termination without
>    the compiler noticing.
>  * Move OF table near to the user.
> 
> [...]

Applied, thanks!

[1/1] mfd: da9062: Simplify obtaining I2C match data
      commit: 9b413e3c07d251191410976d669260079b48e7b1

--
Lee Jones [李琼斯]


