Return-Path: <linux-renesas-soc+bounces-15395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC7A7BCD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 14:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 620297A6BC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB11DB363;
	Fri,  4 Apr 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opSZtBb+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25D415DBB3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770480; cv=none; b=ilYi4PKOoYfKxEVoKPK0aDhABtZXHJYcGvTqgDIKEZPABk8gnsrkgVCULC+ulqzs66vZ+ObXTgrh8p1qanIOI5G7u3p57YP8mcHgnzsmqWyVLi36hvZHULYU5ym0zz/Dqs67q4UJbgDYDe/Kiz+8yMxauHZQqDt56U86Q786ANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770480; c=relaxed/simple;
	bh=SmC03Civ1drXFWORiOgWGht6+RZAi4yIKpb6E3foSxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lWh7zI9IfGV/jPyn+mBLg+ChwIdIb2e3n7P1KYLMxijGOzlMkCk3ie3yii/f1/2G8HuA8mcR3ZxkO4rts1PobTezJHheL29xn3O5psJvMHnTNvz98ehcBRJu4OJkow+LhTBwah2Ec0cA1GXXp2YVgXZt1/TLbr0v5yVkUPGM8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opSZtBb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64662C4CEDD;
	Fri,  4 Apr 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770480;
	bh=SmC03Civ1drXFWORiOgWGht6+RZAi4yIKpb6E3foSxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=opSZtBb+j5RV7ymiPgr0VeuNWL5TuaNbtNNQ/Sz8NoJBzQFX6RwXGOJYm1FhAQkdw
	 zHjwSNe00Ib+0jEdm0mworsgOdJxHfTiikLK9/h5/H1ULSxGoF+FAMSJVTLcUcXJrT
	 BUp0mRCjYXuMRgj86rbvtyMZg88Tn8vqDCE6AxzZES3c1BG5aA4A7crsGSSdLgqZ1L
	 51TfWu/LcJrT3RIDnrHNGxm00ZHQP7F1lRk4lf0XOXMjW0Nj1MFGuUehNdNn8H1ZiC
	 Q+Jqe1j6UNr/o+WRJfmrCCYVKZB/n5gDL3EG0ZLbgdaiPiN55E9c5m23o+/ik5zq/e
	 KiRaKByeblmkg==
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lee Jones <lee@kernel.org>
In-Reply-To: <20250318091234.22170-1-wsa+renesas@sang-engineering.com>
References: <20250318091234.22170-1-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH RFT] mfd: tps65010: use per-client debugfs
 directory
Message-Id: <174377047915.309277.8277515236850902067.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 13:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 18 Mar 2025 10:12:12 +0100, Wolfram Sang wrote:
> The I2C core now provides a debugfs entry for each client. Let this
> driver use it instead of the root directory. Further improvements by
> this change: automatic support of multiple instances.
> 
> 

Applied, thanks!

[1/1] mfd: tps65010: use per-client debugfs directory
      commit: ce27c08ff3689e30367b275326cbcabed3b71041

--
Lee Jones [李琼斯]


