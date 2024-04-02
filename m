Return-Path: <linux-renesas-soc+bounces-4199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366D894EDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 11:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9135284B8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 09:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834E55788F;
	Tue,  2 Apr 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pz1LgfyC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44A9454
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050857; cv=none; b=ZWLq/EVlbF4wFAcZAmUQGWL6ohGgKh3ANA+FyDmkdIMq7IA9L5ECRfGOIR+dacU4Dto4PidXkmdEetSSl1fQqrcIAtLy7DghaZzHEKNiFbzAZNE3ZmN5wq9DPZ18JU2jsT49JHKbBhmuF7sDtiAYJ/OYG7rqDKR8D40olnaMmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050857; c=relaxed/simple;
	bh=6viB8Ra9GBhMcGeC/xbR06kVIAL+nlX/krtQnDHSn3s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=WehnZjJU9cXiPXeDQa7bbVrW/Zpl0dt7G8Zh5sFNdP5RgoGuSwzo1y1ZQJt6N+/uR27/Y6X4qPywuunRRE83MepPQf8qW3KOg+IMz381VFWJzCiK+DGVdctc/fJ4PR6sYl6ZgY0onzh6MLNvk0RT2ZBJWHal9I4cJDLIgpWqzN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pz1LgfyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9E49C433C7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712050856;
	bh=6viB8Ra9GBhMcGeC/xbR06kVIAL+nlX/krtQnDHSn3s=;
	h=Subject:From:Date:To:From;
	b=Pz1LgfyCLLGbq0ubx6A1zCaTxXE4ri/uKy8F/4KpCNPKq1qHXKduyV3Plw0Z4e6i6
	 JugRGRYs6jtBIkZstDvOOtledLy7f+czP+f2EHGA9xt6/tgym78xqy3AvhiVEO/OK/
	 qWlW6KC/8gJHgsQVA/y0ZFWIJ++Isc/dvEqu/a65u1J0Ys3fSvqZUz0OGDKrXOW/Op
	 4DlvQ2vTK6jI6z1mEp1BB9NOgLysiL1tA14hiZ5KoqvTCoZtZ/Z9IfGLullOzxSIYW
	 JpJkFfrxbNadP03irOq0k08MMkGEjFKwG+xs4KpD9ULLt3nfcRWcaljaP1O+auFW5K
	 KIYyMP8M/KI+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6138D9A155
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 09:40:56 +0000 (UTC)
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
 <171205085678.30110.2760504358914764907.git-patchwork-summary@kernel.org>
Date: Tue, 02 Apr 2024 09:40:56 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Add remaining serial ports
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=834559
  Lore link: https://lore.kernel.org/r/cover.1709741303.git.geert+renesas@glider.be
    Patches: [1/3] arm64: dts: renesas: r8a779h0: Add remaining HSCIF nodes
             [2/3] arm64: dts: renesas: r8a779h0: Add SCIF nodes
             [3/3] arm64: dts: renesas: gray-hawk-single: Add second debug serial port

Patch: [net] MAINTAINERS: split Renesas Ethernet drivers entry
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=837654
  Lore link: https://lore.kernel.org/r/de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



