Return-Path: <linux-renesas-soc+bounces-7194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A77692B42A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 11:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55D51F23651
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 09:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0243155359;
	Tue,  9 Jul 2024 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceFVZXVe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033D155352;
	Tue,  9 Jul 2024 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518052; cv=none; b=Fw2uckTRq1nKszEjgk/zoc1QKExuIADRN0vrDXuKTXR3yhK26HhTdWf35P9lmCmr16wwkarFeqmD0z4uLowP1pN4Ml4ABUo8bOVvftG6Q53upKK5lgglY5Hzilq7f0fK+3ZwZC3okZOgDxzP+AT3ghp3U0s6n10kABKmDjS57CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518052; c=relaxed/simple;
	bh=ExuwZ0w0YA7YNtd4eMY8YetiULSv4XdpsMet/W+M/pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ip/T0/LPuw48MmM/bVweOy76RX7yXUpUiBoOjVZdzKUPuv/rrx9zNVRlIwxe0q6lQx9ArnHIHTJV0k0fneVC+T3QrYrEUjrR5dsvzfPX4H5BI95Ghe09aHmNNE6UjZ6lbOXc1ShuZ5RmE7bKunlqt3F9Zct7Fm6HJA2xOWXO2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceFVZXVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE75C3277B;
	Tue,  9 Jul 2024 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720518052;
	bh=ExuwZ0w0YA7YNtd4eMY8YetiULSv4XdpsMet/W+M/pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ceFVZXVeLFosmZBfkrmFR9YA8FCqvqaHEOfdiLPLvzb1jDua2Wp/tTTG2SUniuijl
	 TYuJSoz6SOYwwVkbwpgRh8yNxQ/CK0hJAhSl4JSoZLtMhtNyRH9FXwBYP/mfE0+WMX
	 Z9Hwk52YLol/1rbHrjDq9gLz7hbWj4F/ype42E3mIP0eZoH4rM5lHFbwVjfgcSWLww
	 4UyOJslV9IYkT/3opPQej7Dr0Ps8h4QyaEAq3iYGkkak2OjGDrRAZr5G+/Q+5Y+d5e
	 lklcsasJcMBQTQ2pOaX4iP6BS7fryNoeUHHyJKXbFzn9SIIsAJ69wWaWeGou3PJ0WT
	 oPSyqLZUs/bFA==
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-sh@vger.kernel.org
In-Reply-To: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to
 platform_data
Message-Id: <172051805084.1217090.8146208079593611090.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 10:40:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 13 Feb 2024 23:02:19 +0100, Wolfram Sang wrote:
> Changes since v1:
> 
> * rebased to rc4
> * collected all needed acks (Thanks!)
> * capitalized first letter in commit subject
> 
> The MFD parts of the TMIO have been removed by Arnd, so that only the
> SD/MMC related functionality is left. Remove the outdated remains in the
> public header file and then move it to platform_data as the data is now
> specific for the SD/MMC part.
> 
> [...]

Applied, thanks!

[1/6] mfd: tmio: Remove obsolete platform_data
      commit: ef6dfcbcbbf7d9a414feb44aa093d2d8592a2e20
[2/6] mfd: tmio: Remove obsolete io accessors
      commit: 6bec678b9872271ce2e0879c360ad7a1a524c7fa
[3/6] mmc: tmio/sdhi: Fix includes
      commit: 4377aef83d0db25efc928a633ee80698b8520c8e
[4/6] mfd: tmio: Update include files
      commit: d411ccbe103d665a31861987e2f1b36944ab63f2
[5/6] mfd: tmio: Sanitize comments
      commit: 763135b819ad3e3e0301b66094d50923e64092a7
[6/6] mfd: tmio: Move header to platform_data
      commit: 70b46487b1558eb25ea6e533c905131b10596dc0

--
Lee Jones [李琼斯]


