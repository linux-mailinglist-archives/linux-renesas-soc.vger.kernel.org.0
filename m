Return-Path: <linux-renesas-soc+bounces-7154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DD929DD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 10:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56ABDB23137
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AA625634;
	Mon,  8 Jul 2024 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kch/5nWd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B822086
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720425641; cv=none; b=FHBC+jDtdCqZyonTONmJy5D/sZft7W5RwF/qevh8jcA63IWSYAkiwMM1S7xVEvA76Nqg36kuTamddsCJWod4iI/NVvWoWrchcKZg3zIJd+BZJaNEI9W54o5DOl0Ucc17vN1mD0o0ienStYSMlZl73KMOlBLJ++Hx4YRX69cYqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720425641; c=relaxed/simple;
	bh=gXlOCiwPoIj7GHnfwPUOXAMFS+9CbyNiB+eR8L27SAo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=SrvdgNYyPkXzOLh1g+LO1cG0Vppt9az4qvnXXp9/EnPNmSXjfTtrC5ALDWW1S36AmvRKCaHesS4S5TqpdwHi+QoYkOLns0mlnvpFdHvtSKsg8Fys5yFtKegwJIIAPtToSlduua4sxKzOmTj0J8WQlrrQ45KE/Rt/Vcj6zeUEbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kch/5nWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12B3FC116B1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720425641;
	bh=gXlOCiwPoIj7GHnfwPUOXAMFS+9CbyNiB+eR8L27SAo=;
	h=Subject:From:Date:To:From;
	b=Kch/5nWdGrDW0aRC9fyvWHssyM31xmlXFv4xQfJsTNF2RQMDtZ0hQDZSQeQ2/4kkg
	 F+kochHi9MGM7DgRiIs0iw/rT/nBDR9ZiLGXKf5HmZGpvJoLtTpzOVxM7UczwyS0EY
	 JwZnFNAztj+A8WMZWOzpQOoBuVtJug07nlp/mGIINTgKN30GvHOuAQdJVx6w0n7+Le
	 rAz1QyKpqH992Z83zvGeB5x88v7Wb8fuwFz71czVBpgOGonSZwnpeoh65bvluMECoy
	 nBsek2khItABwkFS2HKKs5fx5MQMpp7FnW8q7pAutn3uq0TamXI2bK8+mOI1J1XP21
	 K2as217djOQPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F28B0DF370E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <172042564093.7936.938799342637611689.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jul 2024 08:00:40 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: net: rswitch: Avoid use-after-free in rswitch_poll()
  Submitter: Radu Rendec <rrendec@redhat.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867714
  Lore link: https://lore.kernel.org/r/20240702210838.2703228-1-rrendec@redhat.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



